#!/usr/bin/env ruby

puts "🧪 Testing WishApp Models Loading..."

begin
  # Test loading individual model files
  puts "Loading User model..."
  load 'app/models/application_record.rb'
  load 'app/models/user.rb'
  puts "✅ User model loaded"

  puts "Loading Wishlist model..." 
  load 'app/models/wishlist.rb'
  puts "✅ Wishlist model loaded"

  puts "Loading Wish model..."
  load 'app/models/wish.rb'
  puts "✅ Wish model loaded"

  puts "Loading Claim model..."
  load 'app/models/claim.rb'
  puts "✅ Claim model loaded"

  puts "Loading Guest model..."
  load 'app/models/guest.rb'
  puts "✅ Guest model loaded"

  puts "\n🎉 All models loaded successfully!"
  puts "✅ No syntax errors found in model files"
  
rescue => e
  puts "❌ Error loading models: #{e.message}"
  puts e.backtrace.first(5)
end

puts "\n🧪 Testing Service Classes..."

begin
  puts "Loading WishParserService..."
  load 'app/services/wish_parser_service.rb'
  puts "✅ WishParserService loaded"

  puts "Loading ParseWishJob..."
  load 'app/jobs/parse_wish_job.rb'
  puts "✅ ParseWishJob loaded"
  
rescue => e
  puts "❌ Error loading services: #{e.message}"
end

puts "\n📊 Model Loading Test Complete!"
