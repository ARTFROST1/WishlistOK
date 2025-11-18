class Api::V1::Auth::GuestsController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:create, :upgrade]

  # POST /api/v1/auth/guests
  # Auto-provision guest user for Lite Mode
  def create
    guest = Guest.find_or_create_for_claim(
      ip_address: request.remote_ip,
      user_agent: request.user_agent
    )

    if guest.persisted?
      # Generate JWT token directly without session
      token, _payload = Warden::JWTAuth::UserEncoder.new.call(guest.user, :user, nil)

      render_success(
        {
          user: UserSerializer.new(guest.user).serializable_hash[:data][:attributes],
          guest: GuestSerializer.new(guest).serializable_hash[:data][:attributes],
          token: token
        },
        message: 'Guest account created successfully'
      )
    else
      render_error(
        'Failed to create guest account',
        details: guest.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  rescue StandardError => e
    Rails.logger.error("Guest creation failed: #{e.message}")
    render_error('Internal server error', status: :internal_server_error)
  end

  # PUT /api/v1/auth/guests/upgrade
  # Convert guest to regular user
  def upgrade
    unless current_user&.guest?
      render_error('Not a guest user', status: :forbidden)
      return
    end

    guest = current_user.guest
    unless guest
      render_error('Guest record not found', status: :not_found)
      return
    end

    if guest.convert_to_regular_user!(
      email: upgrade_params[:email],
      password: upgrade_params[:password],
      password_confirmation: upgrade_params[:password_confirmation],
      first_name: upgrade_params[:first_name],
      last_name: upgrade_params[:last_name]
    )
      # Generate new JWT token for the upgraded user
      token, _payload = Warden::JWTAuth::UserEncoder.new.call(current_user.reload, :user, nil)

      render_success(
        {
          user: UserSerializer.new(current_user).serializable_hash[:data][:attributes],
          token: token
        },
        message: 'Account upgraded successfully'
      )
    else
      render_error(
        'Failed to upgrade account',
        details: current_user.errors.full_messages,
        status: :unprocessable_entity
      )
    end
  end

  # GET /api/v1/auth/guests/status
  # Check if current user is a guest and get guest info  
  def status
    unless current_user
      render_error('Not authenticated', status: :unauthorized)
      return
    end

    if current_user.guest?
      guest = current_user.guest
      render_success({
        is_guest: true,
        guest: guest ? GuestSerializer.new(guest).serializable_hash[:data][:attributes] : nil,
        can_upgrade: true
      })
    else
      render_success({
        is_guest: false,
        can_upgrade: false
      })
    end
  end

  private

  def upgrade_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name)
  end
end
