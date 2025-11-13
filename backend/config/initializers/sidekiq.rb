# Sidekiq configuration
require 'sidekiq'

Sidekiq.configure_server do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0'),
    pool_size: ENV.fetch('SIDEKIQ_CONCURRENCY', 5).to_i + 5
  }

  # Configure queues with priorities
  config.queues = %w[critical high default low parse images mailers notifications]
end

Sidekiq.configure_client do |config|
  config.redis = {
    url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/0'),
    pool_size: ENV.fetch('RAILS_MAX_THREADS', 5).to_i
  }
end

# Job retry configuration
Sidekiq.default_job_options = {
  'backtrace' => true,
  'retry' => 3
}

# Custom queue configurations
class ParseQueue
  QUEUE = 'parse'
  RETRY_LIMIT = 5
end

class ImageQueue  
  QUEUE = 'images'
  RETRY_LIMIT = 3
end

class MailerQueue
  QUEUE = 'mailers' 
  RETRY_LIMIT = 5
end

class NotificationQueue
  QUEUE = 'notifications'
  RETRY_LIMIT = 3
end
