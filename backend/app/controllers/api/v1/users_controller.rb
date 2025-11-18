class Api::V1::UsersController < Api::V1::BaseController
  # GET /api/v1/users/me
  # Returns the current authenticated user's profile
  def me
    render_success(
      {
        user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      },
      message: 'User profile retrieved successfully'
    )
  end
end
