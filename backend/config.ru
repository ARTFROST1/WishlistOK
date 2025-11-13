# This file is used by Rack-based servers during the boot process.

require_relative "config/environment"

run Rails.application
Rails.application.load_server
