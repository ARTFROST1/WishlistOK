# Bootstrap script for WishApp development environment (Windows)
# Run this script to set up the project for the first time

Write-Host "🚀 Setting up WishApp development environment..." -ForegroundColor Green

# Check prerequisites
Write-Host "📋 Checking prerequisites..." -ForegroundColor Yellow

# Check Docker
if (!(Get-Command docker -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker is not installed. Please install Docker Desktop." -ForegroundColor Red
    exit 1
}

# Check Docker Compose
if (!(Get-Command docker-compose -ErrorAction SilentlyContinue)) {
    Write-Host "❌ Docker Compose is not installed. Please install Docker Compose." -ForegroundColor Red
    exit 1
}

Write-Host "✅ Docker and Docker Compose are available" -ForegroundColor Green

# Setup backend environment
Write-Host "🔧 Setting up backend environment..." -ForegroundColor Yellow
Set-Location "../backend"

if (!(Test-Path ".env")) {
    Copy-Item ".env.example" ".env"
    Write-Host "✅ Created backend .env file from template" -ForegroundColor Green
} else {
    Write-Host "ℹ️ Backend .env file already exists" -ForegroundColor Blue
}

# Generate Rails master key if not exists
if (!(Test-Path "config/master.key")) {
    # This will need to be done after Ruby/Rails is installed
    Write-Host "ℹ️ Rails master key will be generated when Rails is installed" -ForegroundColor Blue
}

Set-Location "../infra"

# Setup environment files for other services
Write-Host "🔧 Setting up environment files..." -ForegroundColor Yellow

# Create .env files from templates
$envFiles = @(
    @{source = "env/backend.env.example"; dest = "../backend/.env"},
    @{source = "env/app.env.example"; dest = "../app/.env"},
    @{source = "env/extension.env.example"; dest = "../extension/.env"}
)

foreach ($env in $envFiles) {
    if ((Test-Path $env.source) -and !(Test-Path $env.dest)) {
        Copy-Item $env.source $env.dest
        Write-Host "✅ Created $($env.dest)" -ForegroundColor Green
    }
}

# Start Docker services
Write-Host "🐳 Starting Docker services..." -ForegroundColor Yellow
docker-compose up -d db redis

Write-Host "⏳ Waiting for services to be ready..." -ForegroundColor Yellow
Start-Sleep -Seconds 10

# Check if services are running
$dbStatus = docker-compose ps db | Select-String "Up"
$redisStatus = docker-compose ps redis | Select-String "Up"

if ($dbStatus -and $redisStatus) {
    Write-Host "✅ Database and Redis services are running" -ForegroundColor Green
} else {
    Write-Host "❌ Some services failed to start. Check Docker logs." -ForegroundColor Red
    docker-compose logs
    exit 1
}

Write-Host "🎉 Bootstrap completed successfully!" -ForegroundColor Green
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Install Ruby 3.3.6 and Rails 8" -ForegroundColor White
Write-Host "2. Install Flutter ≥3.24" -ForegroundColor White
Write-Host "3. Install Node.js 22 LTS" -ForegroundColor White
Write-Host "4. Run 'bundle install' in the backend directory" -ForegroundColor White
Write-Host "5. Run 'rails db:create db:migrate' to set up the database" -ForegroundColor White
Write-Host "6. Start the development servers with 'docker-compose up'" -ForegroundColor White
