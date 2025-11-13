#!/bin/bash
# Database migration and seeding script for WishApp

set -e

echo "🗄️ Running database migrations and seeding..."

cd ../backend

# Check if Rails is available
if ! command -v rails &> /dev/null; then
    echo "❌ Rails is not installed. Please install Rails first."
    exit 1
fi

# Create database if it doesn't exist
echo "📊 Creating databases..."
bundle exec rails db:create

# Run migrations
echo "🔄 Running migrations..."
bundle exec rails db:migrate

# Run migrations for test environment
echo "🧪 Running test migrations..."
RAILS_ENV=test bundle exec rails db:migrate

# Seed database with initial data (when seed file is created)
if [ -f "db/seeds.rb" ]; then
    echo "🌱 Seeding database..."
    bundle exec rails db:seed
else
    echo "ℹ️ No seed file found, skipping seeding"
fi

echo "✅ Database setup completed successfully!"
