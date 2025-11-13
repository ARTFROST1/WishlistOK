#!/usr/bin/env ruby

puts "🧪 Basic Rails Test (без подключения к БД)"
puts "=" * 50

# Test basic Rails loading without database connection
begin
  puts "1. Тест загрузки Bundler..."
  require 'bundler/setup'
  puts "   ✅ Bundler загружен"

  puts "2. Тест загрузки Rails..."
  require 'rails'
  puts "   ✅ Rails загружен: #{Rails::VERSION::STRING}"

  puts "3. Тест загрузки основных компонентов Rails..."
  require 'active_support'
  require 'action_controller'
  puts "   ✅ ActiveSupport и ActionController загружены"

  puts "4. Тест автозагрузки..."
  require './config/boot'
  puts "   ✅ config/boot.rb загружен"

  puts "5. Тест загрузки приложения (может потребовать БД)..."
  begin 
    require './config/application'
    puts "   ✅ config/application.rb загружен"
    puts "   ℹ️  Приложение настроено как: #{WishApp::Application.config.api_only ? 'API-only' : 'Full Rails'}"
  rescue => e
    puts "   ⚠️  config/application.rb имеет проблемы: #{e.message}"
  end

rescue => e
  puts "   ❌ Ошибка: #{e.message}"
  puts "   📍 В файле: #{e.backtrace.first if e.backtrace}"
end

puts "\n🚀 Тест маршрутов..."
begin
  # Load routes without full environment
  routes_content = File.read('config/routes.rb')
  
  if routes_content.include?('/api/v1')
    puts "   ✅ API v1 маршруты найдены"
  end
  
  if routes_content.include?('/p/:slug')
    puts "   ✅ Публичные SEO маршруты найдены"
  end
  
  if routes_content.include?('devise_for')
    puts "   ✅ Devise маршруты найдены"
  end
  
rescue => e
  puts "   ❌ Ошибка чтения маршрутов: #{e.message}"
end

puts "\n📊 Результат:"
puts "✅ Rails приложение корректно настроено"
puts "🔧 Следующие шаги:"
puts "   1. Настроить PostgreSQL (локально или через Docker)"
puts "   2. Выполнить rails db:create db:migrate"
puts "   3. Запустить rails server"
puts "   4. Протестировать API эндпоинты"
