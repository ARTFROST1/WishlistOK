class Api::V1::HealthController < Api::V1::BaseController
  skip_before_action :authenticate_user!, only: [:show]
  skip_before_action :ensure_json_request, only: [:show]

  def show
    # Basic health check
    health_status = {
      status: 'healthy',
      timestamp: Time.current.iso8601,
      version: Rails.application.config.version || '0.1.0',
      environment: Rails.env,
      database: database_status,
      redis: redis_status,
      services: services_status
    }

    render_success(health_status)
  rescue StandardError => e
    render json: {
      status: 'unhealthy',
      timestamp: Time.current.iso8601,
      error: e.message
    }, status: :service_unavailable
  end

  private

  def database_status
    ActiveRecord::Base.connection.execute('SELECT 1')
    { status: 'connected', message: 'Database connection successful' }
  rescue StandardError => e
    { status: 'disconnected', message: e.message }
  end

  def redis_status
    Sidekiq.redis { |conn| conn.ping }
    { status: 'connected', message: 'Redis connection successful' }
  rescue StandardError => e
    { status: 'disconnected', message: e.message }
  end

  def services_status
    {
      sidekiq: sidekiq_status,
      storage: storage_status
    }
  end

  def sidekiq_status
    stats = Sidekiq::Stats.new
    {
      processed: stats.processed,
      failed: stats.failed,
      busy: stats.workers_size,
      enqueued: stats.enqueued,
      retries: stats.retry_size,
      scheduled: stats.scheduled_size,
      dead: stats.dead_size
    }
  rescue StandardError => e
    { error: e.message }
  end

  def storage_status
    # This will be implemented when Supabase storage is configured
    { status: 'not_configured', message: 'Storage service not yet configured' }
  end
end
