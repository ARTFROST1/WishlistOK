#!/bin/bash
# Bootstrap script for WishApp development environment (Unix/Linux/macOS)
# Run this script to set up the project for the first time

set -e

echo "🚀 Setting up WishApp development environment..."

# Check prerequisites
echo "📋 Checking prerequisites..."

# Check Docker
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker."
    exit 1
fi

# Check Docker Compose
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose."
    exit 1
fi

echo "✅ Docker and Docker Compose are available"

# Setup backend environment
echo "🔧 Setting up backend environment..."
cd ../backend

if [ ! -f ".env" ]; then
    cp .env.example .env
    echo "✅ Created backend .env file from template"
else
    echo "ℹ️ Backend .env file already exists"
fi

# Generate Rails master key if not exists
if [ ! -f "config/master.key" ]; then
    # This will need to be done after Ruby/Rails is installed
    echo "ℹ️ Rails master key will be generated when Rails is installed"
fi

cd ../infra

# Setup environment files for other services
echo "🔧 Setting up environment files..."

# Create .env files from templates
if [ -f "env/backend.env.example" ] && [ ! -f "../backend/.env" ]; then
    cp env/backend.env.example ../backend/.env
    echo "✅ Created ../backend/.env"
fi

if [ -f "env/app.env.example" ] && [ ! -f "../app/.env" ]; then
    cp env/app.env.example ../app/.env
    echo "✅ Created ../app/.env"
fi

if [ -f "env/extension.env.example" ] && [ ! -f "../extension/.env" ]; then
    cp env/extension.env.example ../extension/.env
    echo "✅ Created ../extension/.env"
fi

# Start Docker services
echo "🐳 Starting Docker services..."
docker-compose up -d db redis

echo "⏳ Waiting for services to be ready..."
sleep 10

# Check if services are running
if docker-compose ps db | grep -q "Up" && docker-compose ps redis | grep -q "Up"; then
    echo "✅ Database and Redis services are running"
else
    echo "❌ Some services failed to start. Check Docker logs."
    docker-compose logs
    exit 1
fi

echo "🎉 Bootstrap completed successfully!"
echo ""
echo "Next steps:"
echo "1. Install Ruby 3.3.6 and Rails 8"
echo "2. Install Flutter ≥3.24"
echo "3. Install Node.js 22 LTS"
echo "4. Run 'bundle install' in the backend directory"
echo "5. Run 'rails db:create db:migrate' to set up the database"
echo "6. Start the development servers with 'docker-compose up'"
