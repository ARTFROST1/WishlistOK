# WishApp MVP

WishApp is a wishlist management platform that allows users to create, share, and manage wishlists for events like birthdays, weddings, and holidays.

## Architecture

This is a monorepo containing:

- **backend/** - Ruby on Rails 8 API service with SSR for public pages
- **app/** - Flutter application (iOS/Android/Web)
- **extension/** - Browser Extension (MV3) built with Vite + TypeScript
- **infra/** - Infrastructure, Docker, CI, environment templates
- **Docs/** - Project documentation

## Tech Stack

### Backend
- Ruby 3.3.x + Rails 8.0.x (API-only)
- PostgreSQL 17.x
- Redis 7.x + Sidekiq 7.x
- Devise + JWT authentication

### Frontend
- Flutter ≥3.24 with Dart 3.x
- Riverpod 2.x for state management
- GoRouter 14.x for navigation
- Material 3 design system

### Extension
- Node 22 LTS
- Vite 7.0.0 + TypeScript 5.9.2
- Manifest V3

### Infrastructure
- Docker + Docker Compose
- Supabase Storage + Cloudflare CDN
- GitHub Actions CI/CD

## Quick Start

### Prerequisites
- Ruby 3.3.x
- Node 22 LTS
- Flutter ≥3.24
- Docker Desktop
- PostgreSQL 17
- Redis 7

### Setup
1. Clone the repository
2. Run the bootstrap script: `./infra/scripts/bootstrap.sh` (Unix) or `./infra/scripts/bootstrap.ps1` (Windows)
3. Start services: `docker-compose -f infra/docker-compose.yml up`

## Documentation

See the `Docs/` directory for detailed documentation:
- [Implementation Plan](Docs/Implementation.md)
- [Project Structure](Docs/project_structure.md)
- [UI/UX Guidelines](Docs/UI_UX_doc.md)

## Contributing

1. Follow the established project structure
2. Run tests before committing
3. Update CHANGELOG.md for version changes
4. Follow the coding standards defined in each project

## License

TBD
