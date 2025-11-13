# Configure lograge for structured logging
Rails.application.configure do
  config.lograge.enabled = true
  config.lograge.formatter = Lograge::Formatters::Json.new
  
  # Custom log data
  config.lograge.custom_options = lambda do |event|
    {
      time: event.time,
      remote_ip: event.payload[:remote_ip],
      user_agent: event.payload[:user_agent]
    }
  end

  # Include request ID for tracing
  config.lograge.custom_payload do |controller|
    {
      remote_ip: controller.request.remote_ip,
      user_agent: controller.request.user_agent
    }
  end

  # Log job processing
  config.lograge.keep_original_rails_log = false
  config.lograge.logger = ActiveSupport::Logger.new(Rails.root.join('log', "#{Rails.env}.json.log"))
end
