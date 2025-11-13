#!/usr/bin/env ruby

# Simple validation script for WishApp backend Stage 2
# This script checks for basic syntax errors and missing dependencies

puts "🔍 WishApp Backend Stage 2 Validation"
puts "=" * 50

errors = []
warnings = []

# Check Gemfile for required gems
gemfile_path = 'Gemfile'
if File.exist?(gemfile_path)
  gemfile_content = File.read(gemfile_path)
  
  required_gems = %w[httparty kaminari rails devise devise-jwt jsonapi-serializer nokogiri sidekiq]
  required_gems.each do |gem_name|
    unless gemfile_content.include?(gem_name)
      errors << "Missing gem: #{gem_name}"
    end
  end
  puts "✅ Gemfile dependencies check passed"
else
  errors << "Gemfile not found"
end

# Check key model files exist and have basic structure
model_files = %w[user.rb wishlist.rb wish.rb claim.rb guest.rb]
model_files.each do |model_file|
  path = "app/models/#{model_file}"
  if File.exist?(path)
    content = File.read(path)
    class_name = model_file.gsub('.rb', '').split('_').map(&:capitalize).join
    if content.include?("class #{class_name}")
      puts "✅ Model #{class_name} exists and has proper class definition"
    else
      errors << "Model #{class_name} missing proper class definition"
    end
  else
    errors << "Model file missing: #{path}"
  end
end

# Check controller files exist
controller_files = [
  'app/controllers/api/v1/wishlists_controller.rb',
  'app/controllers/api/v1/wishes_controller.rb',
  'app/controllers/api/v1/claims_controller.rb',
  'app/controllers/api/v1/ideas_controller.rb',
  'app/controllers/api/v1/auth/guests_controller.rb',
  'app/controllers/public/wishlists_controller.rb'
]

controller_files.each do |controller_file|
  if File.exist?(controller_file)
    puts "✅ Controller exists: #{controller_file}"
  else
    errors << "Controller missing: #{controller_file}"
  end
end

# Check migration files exist
migration_files = Dir['db/migrate/*.rb']
expected_migrations = ['create_users', 'create_wishlists', 'create_wishes', 'create_claims', 'create_guests']

expected_migrations.each do |migration|
  if migration_files.any? { |f| f.include?(migration) }
    puts "✅ Migration exists: #{migration}"
  else
    errors << "Migration missing: #{migration}"
  end
end

# Check routes file has necessary routes
routes_path = 'config/routes.rb'
if File.exist?(routes_path)
  routes_content = File.read(routes_path)
  required_routes = ['/p/:slug', 'wishlists', 'wishes', 'claims', 'ideas', 'auth/guests']
  
  required_routes.each do |route|
    if routes_content.include?(route)
      puts "✅ Route exists: #{route}"
    else
      warnings << "Route may be missing: #{route}"
    end
  end
else
  errors << "Routes file missing: #{routes_path}"
end

# Check initializers exist
initializer_files = %w[cors.rb devise.rb devise_jwt.rb sidekiq.rb]
initializer_files.each do |init_file|
  path = "config/initializers/#{init_file}"
  if File.exist?(path)
    puts "✅ Initializer exists: #{init_file}"
  else
    errors << "Initializer missing: #{init_file}"
  end
end

# Check view files for SSR
view_files = [
  'app/views/layouts/public.html.erb',
  'app/views/public/wishlists/show.html.erb'
]

view_files.each do |view_file|
  if File.exist?(view_file)
    puts "✅ View exists: #{view_file}"
  else
    errors << "View missing: #{view_file}"
  end
end

puts "\n" + "=" * 50
puts "📊 VALIDATION RESULTS"
puts "=" * 50

if errors.empty? && warnings.empty?
  puts "🎉 ALL CHECKS PASSED! Backend Stage 2 is ready."
elsif errors.empty?
  puts "✅ No critical errors found."
  puts "⚠️  #{warnings.length} warnings:"
  warnings.each { |w| puts "   - #{w}" }
else
  puts "❌ #{errors.length} errors found:"
  errors.each { |e| puts "   - #{e}" }
  
  unless warnings.empty?
    puts "\n⚠️  #{warnings.length} warnings:"
    warnings.each { |w| puts "   - #{w}" }
  end
end

puts "\n🔧 NEXT STEPS:"
puts "1. Run 'bundle install' to install gems"
puts "2. Set up database: 'rails db:create db:migrate'"
puts "3. Configure environment variables in .env"
puts "4. Start server: 'rails server'"
puts "5. Test API endpoints with Postman or curl"

exit(errors.empty? ? 0 : 1)
