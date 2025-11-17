# CLAUDE.md - AI Assistant Guide for WishApp

This document provides comprehensive guidance for AI assistants working with the WishApp codebase.

## Project Overview

WishApp is a wishlist management platform that allows users to create, share, and manage wishlists for events like birthdays, weddings, and holidays. The project is organized as a **monorepo** with three main components:

- **Backend**: Ruby on Rails 8 API service with SSR for public pages
- **App**: Flutter cross-platform application (iOS/Android/Web)
- **Extension**: Browser extension (Manifest V3) for quick wish capture

**Current Stage**: Stage 2 complete (core backend + basic Flutter app structure)

## Technology Stack

### Backend
- Ruby 3.3.x + Rails 8.0.x (API-only mode)
- PostgreSQL 17.x (primary database)
- Redis 7.x + Sidekiq 7.x (background jobs)
- Devise + JWT (authentication)
- RSpec (testing)

### Flutter App
- Flutter ≥3.24 with Dart 3.x
- Riverpod 2.x (state management)
- GoRouter 14.x (navigation)
- Freezed (immutable models)
- Dio 5.x (HTTP client)

### Extension
- Node 22 LTS
- Vite 7.0.0 + TypeScript 5.9.2
- Manifest V3 (browser extension standard)

### Infrastructure
- Docker + Docker Compose (multi-service orchestration)
- Nginx (reverse proxy)
- Supabase Storage + Cloudflare CDN

## Codebase Structure

```
WishlistOK/
├── backend/              # Rails 8 API
│   ├── app/
│   │   ├── controllers/
│   │   │   ├── api/v1/  # Versioned JSON API
│   │   │   └── public/  # SSR controllers
│   │   ├── models/      # ActiveRecord domain models
│   │   ├── serializers/ # JSONAPI response formatting
│   │   ├── services/    # Business logic (e.g., WishParserService)
│   │   ├── jobs/        # Sidekiq background jobs
│   │   └── views/       # SSR templates
│   ├── config/
│   │   ├── routes.rb    # API + public routes
│   │   ├── initializers/ # App configuration
│   │   └── environments/ # Env-specific settings
│   ├── db/
│   │   └── migrate/     # Database migrations
│   ├── spec/            # RSpec test suite
│   └── Gemfile          # Ruby dependencies
│
├── app/                 # Flutter application
│   ├── lib/
│   │   ├── core/        # Shared infrastructure
│   │   │   ├── config/  # Constants, feature flags
│   │   │   ├── theme/   # Material 3 theming
│   │   │   ├── network/ # API client (Dio)
│   │   │   ├── models/  # Freezed data models
│   │   │   └── widgets/ # Reusable UI components
│   │   ├── features/    # Feature modules (domain-driven)
│   │   │   ├── auth/
│   │   │   ├── wishlists/
│   │   │   ├── wishes/
│   │   │   ├── feed/
│   │   │   └── profile/
│   │   ├── router/      # GoRouter configuration
│   │   └── main.dart    # App entry point
│   ├── assets/          # Images, icons
│   ├── test/            # Unit/widget tests
│   └── pubspec.yaml     # Flutter dependencies
│
├── extension/           # Browser extension
│   ├── src/
│   │   ├── background.ts # Service worker
│   │   ├── content.ts   # DOM scraping
│   │   ├── popup/       # Extension UI
│   │   └── manifest.config.ts
│   ├── package.json     # Node dependencies
│   └── tsconfig.json    # TypeScript config
│
├── infra/               # Infrastructure
│   ├── docker/          # Dockerfiles
│   ├── docker-compose.yml
│   ├── nginx/           # Reverse proxy config
│   ├── env/             # Environment templates
│   └── scripts/         # Setup scripts
│
└── Docs/                # Documentation
    ├── Implementation.md
    ├── project_structure.md
    ├── PRD_WishApp.md
    └── UI_UX_doc.md
```

## Architecture Patterns

### Backend (Rails)

**MVC + Services Pattern**:
- **Controllers** (`app/controllers/api/v1/`): Thin controllers that delegate to models/services
  - Base: `Api::V1::BaseController` provides shared helpers (`render_success`, `render_error`, pagination)
  - Namespaced under `/api/v1/` for versioning
  - Public SSR controllers in `public/` namespace
- **Models** (`app/models/`): Rich domain models with business logic
  - Associations, validations, enums, scopes, callbacks
  - Counter caches for performance (e.g., `wishes_count`)
- **Services** (`app/services/`): Complex business operations
  - Example: `WishParserService` (296 lines) handles URL parsing, OG metadata extraction
- **Serializers** (`app/serializers/`): JSONAPI-style response formatting
  - Conditional attributes based on context
  - Computed properties for UI (e.g., `days_until_event`, `progress_percentage`)
- **Jobs** (`app/jobs/`): Background processing with Sidekiq
  - Multiple queues: `critical`, `high`, `default`, `low`, `parse`, `images`, `mailers`, `notifications`

**Important Files**:
- `app/controllers/api/v1/base_controller.rb:1`: Shared controller helpers
- `app/services/wish_parser_service.rb:1`: URL parsing service
- `config/routes.rb:1`: API route definitions

### Flutter App

**Feature-First + Clean Architecture**:

```
features/
└── feature_name/
    ├── data/
    │   └── repositories/    # API communication
    ├── application/         # Riverpod providers & state
    └── presentation/        # Screens & widgets
```

**Layers**:
1. **Core Layer** (`lib/core/`): Shared infrastructure
   - `config/app_config.dart:1`: Constants, API URLs, feature flags
   - `theme/app_theme.dart:1`: Material 3 theming (light/dark modes)
   - `network/api_client.dart:1`: Dio HTTP client with auth interceptors
   - `models/`: Freezed immutable models with JSON serialization
   - `widgets/`: Reusable UI components

2. **Features Layer** (`lib/features/`): Per-feature modules
   - `data/`: Repositories (API communication)
   - `application/`: Riverpod providers and state notifiers
   - `presentation/`: Screens and widgets

3. **Router Layer** (`lib/router/`):
   - `app_router.dart:1`: GoRouter configuration with shell routes

**State Management (Riverpod 2.x)**:
- **Provider**: Immutable dependencies (repositories, derived state)
- **FutureProvider**: Async data fetching with automatic caching
- **StateNotifierProvider**: Complex mutable state (e.g., auth)
- **FutureProvider.family**: Parameterized async providers

**Important Files**:
- `lib/core/network/api_client.dart:1`: API client with auth
- `lib/features/auth/application/auth_provider.dart:1`: Auth state management
- `lib/router/app_router.dart:1`: Navigation configuration

### Extension

**Manifest V3 Architecture**:
- `src/background.ts:1`: Service worker (global state, auth)
- `src/content.ts:1`: DOM scraping (OG metadata extraction)
- `src/popup/`: Minimal UI for quick actions
- Browser runtime messaging for component communication

## Database Schema

### Core Tables

**users**:
- Authentication: Devise fields (email, encrypted_password)
- Profile: first_name, last_name, bio, avatar_url
- Type: user_type enum (regular=0, guest=1, admin=2)
- Metadata: preferences (JSON), last_active_at
- Indexes: email (unique), user_type, created_at

**wishlists**:
- Relations: belongs_to :user
- Core: title, description, event_date, slug (unique)
- Privacy: visibility enum (private=0, link_only=1, public=2)
- Display: theme_color, metadata (JSON)
- Counters: wishes_count, claimed_wishes_count (cache)
- Indexes: user_id, slug (unique), visibility, event_date

**wishes**:
- Relations: belongs_to :wishlist
- Core: title, description, url, image_url
- Price: price (decimal 10,2), currency
- Status: status enum (available=0, claimed=1, purchased=2)
- Priority: priority enum (low=0, medium=1, high=2)
- Product: brand, category, images (JSON), metadata (JSON)
- Indexes: wishlist_id, status, priority, category

**claims**:
- Relations: belongs_to :wish, belongs_to :user
- Status: status enum (claimed=0, purchased=1, cancelled=2)
- Group gifts: contribution_amount
- Privacy: is_surprise (hidden from owner), note
- Indexes: wish_id, user_id, status, [wish_id, user_id] (unique)

**guests**:
- Relations: belongs_to :user (one-to-one)
- Identity: identifier (guest_{uuid}), session_token
- Conversion: converted_to_regular, converted_at
- Indexes: identifier (unique), session_token (unique)

### Migration Conventions
- Sequential timestamps: `20251112000001_`, `20251112000002_`, etc.
- Foreign keys: `t.references :model, null: false, foreign_key: true`
- Strategic indexes on foreign keys, enums, search fields
- Integer-backed enums defined in models
- JSON columns for flexible metadata

## API Structure

### Routes

**Base path**: `/api/v1/` for JSON API, `/p/` or `/public/wishlists/` for SSR

**Authentication** (`/api/v1/auth/*`):
```
POST   /auth/sign_up              # Registration
POST   /auth/sign_in              # Login
DELETE /auth/sign_out             # Logout
POST   /auth/guests               # Create guest user
PUT    /auth/guests/upgrade       # Convert guest to regular
GET    /auth/guests/status        # Check guest status
```

**Wishlists**:
```
GET    /wishlists                 # List user's wishlists
POST   /wishlists                 # Create wishlist
GET    /wishlists/:id             # Show wishlist
PUT    /wishlists/:id             # Update wishlist
DELETE /wishlists/:id             # Delete wishlist
GET    /wishlists/:id/share_link  # Get share URL
GET    /wishlists/by_slug/:slug   # Public access by slug
GET    /wishlists/shared/:id      # Link-only access with token
```

**Wishes** (nested + standalone):
```
POST   /wishlists/:id/wishes           # Create wish
GET    /wishlists/:id/wishes/:wish_id  # Show wish
PUT    /wishlists/:id/wishes/:wish_id  # Update wish
DELETE /wishlists/:id/wishes/:wish_id  # Delete wish
POST   /wishes/parse                   # Parse URL for wish data
```

**Claims** (nested):
```
POST   /wishlists/:wid/wishes/:wid/claims            # Create claim
PUT    /wishlists/:wid/wishes/:wid/claims/:id        # Update claim
DELETE /wishlists/:wid/wishes/:wid/claims/:id        # Delete claim
POST   /wishlists/:wid/wishes/:wid/claims/:id/mark_purchased
GET    /users/:user_id/claims                        # User's claims
```

**Ideas Feed**:
```
GET    /ideas                     # List curated ideas
GET    /ideas/:id                 # Show idea
GET    /ideas/categories          # List categories
GET    /ideas/featured            # Featured ideas
GET    /ideas/trending            # Trending ideas
```

**Public SSR**:
```
GET    /public/wishlists/:slug    # Public wishlist page (SSR)
GET    /p/:slug                   # Shorter alias
```

**Health**:
```
GET    /api/v1/health             # API health status
GET    /up                        # Rails health check
```

### Response Format

**Success**:
```json
{
  "success": true,
  "timestamp": "2025-11-17T19:00:00Z",
  "message": "Optional message",
  "data": { /* response data */ },
  "meta": { /* optional metadata (pagination, etc.) */ }
}
```

**Error**:
```json
{
  "success": false,
  "error": {
    "message": "Error message",
    "timestamp": "2025-11-17T19:00:00Z",
    "code": "OPTIONAL_ERROR_CODE",
    "details": ["Validation error 1", "Validation error 2"]
  }
}
```

### API Conventions
- **Authentication**: JWT in `Authorization: Bearer <token>` header
- **Content-Type**: `application/json` required for POST/PUT/PATCH
- **Pagination**: Query params `page` and `per_page` (max 100)
- **Filtering**: Query params (e.g., `visibility=public`, `status=available`)
- **Includes**: Nested resources via serializer params

## Development Workflows

### Initial Setup

**Prerequisites**:
- Ruby 3.3.x
- Node 22 LTS
- Flutter ≥3.24
- Docker Desktop
- PostgreSQL 17
- Redis 7

**Quick Start**:
```bash
# Option 1: Bootstrap script (recommended for first-time setup)
./infra/scripts/bootstrap.sh  # Unix/Linux/macOS
./infra/scripts/bootstrap.ps1 # Windows

# Option 2: Manual setup
# Backend
cd backend
bundle install
cp ../infra/env/backend.env.example .env
# Edit .env with your configuration
rails db:create db:migrate db:seed
rails server

# Flutter
cd app
flutter pub get
dart run build_runner build --delete-conflicting-outputs
cp ../infra/env/app.env.example .env
flutter run

# Extension
cd extension
npm install
cp ../infra/env/extension.env.example .env
npm run dev

# Docker (full stack)
cd infra
docker-compose up
```

### Common Development Tasks

#### Backend

**Running the server**:
```bash
cd backend
rails server                    # Development server (port 3000)
foreman start                   # Puma + Sidekiq (uses Procfile.dev)
```

**Database operations**:
```bash
rails db:create                 # Create database
rails db:migrate                # Run migrations
rails db:rollback               # Rollback last migration
rails db:seed                   # Seed data
rails db:reset                  # Drop, create, migrate, seed
```

**Creating migrations**:
```bash
rails generate migration AddFieldToModel field:type
# Edit migration file in db/migrate/
rails db:migrate
```

**Console**:
```bash
rails console                   # Interactive Ruby console with app loaded
```

**Tests**:
```bash
bundle exec rspec               # Run all tests
bundle exec rspec spec/models/  # Run model tests
bundle exec rspec spec/requests/api/v1/wishlists_spec.rb  # Specific file
```

**Linting**:
```bash
bundle exec rubocop             # Check code style
bundle exec rubocop -a          # Auto-fix issues
```

#### Flutter

**Running the app**:
```bash
cd app
flutter run                     # Default device
flutter run -d chrome           # Web browser
flutter run -d ios              # iOS simulator
flutter run -d android          # Android emulator
```

**Code generation** (after model changes):
```bash
dart run build_runner build --delete-conflicting-outputs
# Or watch mode:
dart run build_runner watch --delete-conflicting-outputs
```

**Tests**:
```bash
flutter test                    # Run all tests
flutter test test/models/       # Specific directory
```

**Linting**:
```bash
flutter analyze                 # Static analysis
dart format lib/                # Format code
```

**Build**:
```bash
flutter build apk               # Android APK
flutter build ios               # iOS (requires macOS)
flutter build web               # Web app
```

#### Extension

**Development**:
```bash
cd extension
npm run dev                     # Watch mode (outputs to dist/)
npm run build                   # Production build
npm run type-check              # TypeScript checking
```

**Loading in browser**:
1. Run `npm run dev`
2. Open Chrome/Edge → Extensions → Developer mode
3. "Load unpacked" → Select `extension/dist/` directory

#### Docker

**Full stack**:
```bash
cd infra
docker-compose up               # Start all services
docker-compose up -d            # Detached mode
docker-compose down             # Stop all services
docker-compose logs -f api      # Follow API logs
docker-compose exec api rails console  # Rails console in container
```

**Database migrations in Docker**:
```bash
docker-compose exec api rails db:migrate
docker-compose exec api rails db:seed
```

### Environment Configuration

**Backend** (`.env` in `backend/`):
```bash
# Database
POSTGRES_HOST=localhost
POSTGRES_PORT=5432
POSTGRES_USER=wishapp
POSTGRES_PASSWORD=password
POSTGRES_DB=wishapp_development

# Redis
REDIS_URL=redis://localhost:6379/0

# Rails
RAILS_ENV=development
SECRET_KEY_BASE=generate_with_rails_secret
JWT_SECRET_KEY=generate_random_secret

# CORS
ALLOWED_ORIGINS=http://localhost:3000,http://localhost:8080

# Storage (optional for development)
SUPABASE_URL=your_supabase_url
SUPABASE_ANON_KEY=your_anon_key
SUPABASE_SERVICE_KEY=your_service_key
```

**Flutter** (`.env` in `app/`):
```bash
API_BASE_URL=http://localhost:3001/api/v1
ENVIRONMENT=development
ENABLE_DEBUG_TOOLS=true
ENABLE_CRASH_REPORTING=false
ENABLE_ANALYTICS=false
```

**Extension** (`.env` in `extension/`):
```bash
VITE_API_BASE_URL=http://localhost:3001/api/v1
VITE_ENVIRONMENT=development
VITE_DEBUG=true
```

## Coding Standards

### Backend (Ruby/Rails)

**Linting**: RuboCop with `rubocop-rails-omakase`
- Max line length: 120 characters
- Max method length: 15 lines (20 in specs)
- Max class length: 120 lines

**Naming**:
- Files: snake_case (e.g., `wish_parser_service.rb`)
- Classes: PascalCase (e.g., `WishParserService`)
- Methods: snake_case (e.g., `create_guest_user`)
- Constants: SCREAMING_SNAKE_CASE (e.g., `USER_AGENT`)

**Conventions**:
- Controllers: Thin, delegate to models/services
- Models: Rich domain models with business logic
- Services: PORO (Plain Old Ruby Objects) for complex operations
- Serializers: JSONAPI format with explicit attributes
- Jobs: Idempotent with retry strategies

**Testing**:
- Framework: RSpec with request specs (not controller specs)
- Factories: Use Factory Bot over fixtures
- Max 5 expectations per example
- Max 4 nested groups

### Flutter (Dart)

**Linting**: `flutter_lints` with strict mode
- Single quotes preferred
- Trailing commas required for better diffs
- Strict casts, inference, raw types

**Naming**:
- Files: snake_case (e.g., `wishlist_detail_screen.dart`)
- Classes: PascalCase (e.g., `WishlistDetailScreen`)
- Variables/methods: camelCase (e.g., `wishlistId`)
- Private: Prefix with underscore (e.g., `_dio`)

**Conventions**:
- Feature-first organization (group by feature, not type)
- Freezed for immutable models
- Riverpod for state management
- Small, single-responsibility widgets
- Screens in `presentation/screens/`, widgets in `presentation/widgets/`

### Extension (TypeScript)

**Linting**: ESLint 9 + TypeScript strict mode
- Target: ES2022
- Module: ESNext

**Naming**:
- Files: kebab-case (e.g., `background.ts`)
- Classes: PascalCase
- Variables/functions: camelCase
- Constants: SCREAMING_SNAKE_CASE (e.g., `API_BASE_URL`)

**Conventions**:
- Separate background/content/popup scripts
- Typed message contracts
- Zod schemas for runtime validation

### General

**EditorConfig**:
- UTF-8 encoding
- LF line endings (Unix-style)
- 2 spaces indentation
- Trailing newline required
- Trim trailing whitespace

**Git Commits**:
- Conventional Commits format (feat:, fix:, docs:, chore:, etc.)
- Branch naming: feature/, bugfix/, hotfix/ prefixes
- Semantic versioning: MAJOR.MINOR.PATCH

## Key Architectural Decisions

### 1. Guest Mode
- Auto-provision guest users for anonymous claiming
- Guests can be upgraded to regular users
- One-to-one relationship: Guest → User
- Session token-based authentication for guests

### 2. Privacy Model
Three visibility levels for wishlists:
- **private**: Only owner can see
- **link_only**: Accessible via secure share link (includes token)
- **public**: Discoverable and accessible by slug

### 3. Surprise Mode
- Claims can be marked as `is_surprise: true`
- Hidden from wishlist owner until `purchased_at` is set
- Supports gift coordination without spoiling surprises

### 4. Wish Parsing
- `WishParserService` extracts metadata from URLs
- OG (Open Graph) image is mandatory
- Title and price are best-effort
- Async processing via `ParseWishJob`

### 5. State Management (Flutter)
- Riverpod 2.x for better async handling vs Provider
- Automatic caching with FutureProvider
- Invalidation-based cache refresh
- Separation: data layer (repositories) → application layer (providers) → presentation layer (screens)

### 6. API Versioning
- URL-based versioning (`/api/v1/`)
- Allows backward compatibility for future API changes
- Public SSR routes separate from API routes

## Common Gotchas & Important Notes

### Backend

1. **Counter Caches**: Wishlists have counter caches for `wishes_count` and `claimed_wishes_count`
   - Must be updated manually if bypassing ActiveRecord callbacks
   - Use `.increment!(:wishes_count)` or `.decrement!(:wishes_count)`

2. **N+1 Queries**: Use `.includes(:wishes)` when loading wishlists with wishes
   - Controllers already implement this in index actions

3. **Enum Values**: Enums are integer-backed
   - Use symbolic names in code: `wishlist.visibility = :public`
   - Database stores integers: 0, 1, 2

4. **JWT Revocation**: Tokens are revoked via `jwt_denylist` table
   - Sign out adds JWT ID (jti) to denylist
   - Devise-JWT middleware checks denylist on each request

5. **CORS**: Allowed origins configured in `config/initializers/cors.rb`
   - Add frontend URLs to `ALLOWED_ORIGINS` env var
   - Comma-separated list

6. **Background Jobs**: Sidekiq queues prioritized
   - `critical` > `high` > `default` > `low` > `parse` > `images` > `mailers` > `notifications`
   - Use appropriate queue for job type

7. **Image Processing**: Uses ActiveStorage with libvips
   - Requires libvips installed on system
   - Docker images include this dependency

### Flutter

1. **Code Generation**: Must run after model changes
   - `dart run build_runner build --delete-conflicting-outputs`
   - Use watch mode during active development

2. **API Client**: Interceptors handle auth automatically
   - Token stored in FlutterSecureStorage
   - Refreshed on 401 responses (if refresh token flow implemented)

3. **Riverpod Provider Scope**: Providers are global by default
   - Use `.family` for parameterized providers (e.g., `wishlistProvider(id)`)
   - Invalidate providers to refresh cache: `ref.invalidate(wishlistsProvider)`

4. **Routing**: GoRouter uses declarative routing
   - Deep links configured in `app_router.dart`
   - Protected routes check auth state

5. **Environment Variables**: Accessed via `AppConfig`
   - Compile-time configuration, not runtime
   - Rebuild app after `.env` changes

6. **Platform Channels**: Use for native functionality
   - Share functionality via `share_plus`
   - In-app browser via `flutter_inappwebview`

### Extension

1. **Manifest V3 Restrictions**:
   - No remote code execution
   - Service worker (background) is event-based, not persistent
   - Use chrome.storage for persistence

2. **Content Script Isolation**: Content scripts run in isolated world
   - Can access DOM but not page JavaScript variables
   - Use `window.postMessage` for page script communication if needed

3. **Permissions**: Request minimal permissions
   - `activeTab` for current tab access
   - `storage` for local data persistence

### Docker

1. **Volume Mounts**: Development uses bind mounts
   - Changes to code reflect immediately
   - Database persists in named volume `postgres_data`

2. **Health Checks**: Services have health checks configured
   - API checks `/up` endpoint
   - Database checks `pg_isready`
   - Wait for healthy status before starting dependent services

3. **Networking**: Services communicate via service names
   - Backend accesses database via `db:5432`
   - Frontend accesses backend via `api:3000` (in Docker) or `localhost:3001` (host)

## Testing Guidelines

### Backend (RSpec)

**Structure**:
```ruby
# spec/requests/api/v1/wishlists_spec.rb
require 'rails_helper'

RSpec.describe 'Api::V1::Wishlists', type: :request do
  describe 'GET /api/v1/wishlists' do
    context 'when authenticated' do
      it 'returns user wishlists' do
        # Test implementation
      end
    end

    context 'when unauthenticated' do
      it 'returns 401 unauthorized' do
        # Test implementation
      end
    end
  end
end
```

**Best Practices**:
- Use request specs for API testing (not controller specs)
- Use Factory Bot for test data
- Use `let` for lazy-loaded variables
- Use `before` for setup, `after` for cleanup
- Mock external API calls with WebMock
- Use VCR for recording HTTP interactions

### Flutter

**Structure**:
```dart
// test/features/wishlists/wishlist_repository_test.dart
void main() {
  group('WishlistsRepository', () {
    late MockDio mockDio;
    late WishlistsRepository repository;

    setUp(() {
      mockDio = MockDio();
      repository = WishlistsRepository(mockDio);
    });

    test('getWishlists returns list of wishlists', () async {
      // Test implementation
    });
  });
}
```

**Best Practices**:
- Use `mocktail` for mocking
- Test repositories separately from providers
- Use `pumpWidget` for widget tests
- Use `integration_test` for E2E tests
- Mock API client in provider tests

## Debugging Tips

### Backend

**Rails Console**:
```ruby
# Find records
User.find_by(email: 'user@example.com')
Wishlist.where(user_id: 1).first

# Test service
WishParserService.new('https://example.com/product').call

# Check associations
wishlist.wishes.reload

# Clear cache
Rails.cache.clear
```

**Logging**:
- Development logs: `tail -f log/development.log`
- Structured logs via lograge in production
- Sidekiq logs: `tail -f log/sidekiq.log`

### Flutter

**Debug Prints**:
```dart
debugPrint('Wishlist: $wishlist');
log('API response', name: 'WishlistsRepository');
```

**DevTools**:
- Run app with `flutter run`
- Open DevTools: `flutter pub global activate devtools && flutter pub global run devtools`
- Widget inspector, network monitor, performance profiling

**Riverpod Inspector**:
- Add `riverpod_dev_tools` for provider debugging
- See provider state, dependencies, rebuilds

### Extension

**Browser DevTools**:
- Background: chrome://extensions → "Service Worker" → Inspect
- Content: Right-click page → Inspect → Console (content script context)
- Popup: Right-click extension icon → Inspect popup

**Logging**:
```typescript
console.log('[Background]', 'Message');
console.log('[Content]', 'DOM data:', data);
```

## Security Considerations

### Backend

1. **SQL Injection**: Use ActiveRecord query methods, never raw SQL with user input
2. **XSS**: Rails auto-escapes ERB templates; use `sanitize` for rich text
3. **CSRF**: Disabled for API-only mode (JWT authentication)
4. **Rate Limiting**: Rack::Attack configured for brute-force protection
5. **Mass Assignment**: Use strong parameters in controllers
6. **Secret Management**: Never commit secrets; use env vars

### Flutter

1. **Secure Storage**: Use `flutter_secure_storage` for tokens
2. **HTTPS Only**: Enforce HTTPS in API client
3. **Input Validation**: Validate user input before API calls
4. **Deep Link Validation**: Sanitize deep link parameters

### Extension

1. **CSP**: Content Security Policy enforced by MV3
2. **Permissions**: Request minimal necessary permissions
3. **Input Sanitization**: Validate scraped DOM data
4. **Storage Encryption**: Extension storage is not encrypted by default

## Performance Optimization

### Backend

1. **Database Indexes**: Already configured on foreign keys, enums, search fields
2. **Counter Caches**: Denormalized counts avoid COUNT queries
3. **Eager Loading**: Use `.includes()` to prevent N+1 queries
4. **Fragment Caching**: Cache expensive serializations
5. **Pagination**: Always paginate list endpoints
6. **Background Jobs**: Offload slow operations (parsing, image processing)

### Flutter

1. **Widget Rebuilds**: Use `const` constructors where possible
2. **Image Caching**: `cached_network_image` handles image caching
3. **List Performance**: Use ListView.builder for long lists
4. **State Management**: Riverpod automatically caches FutureProvider results
5. **Code Splitting**: Use deferred imports for large features

### Extension

1. **Debouncing**: Debounce DOM events to reduce processing
2. **Background Processing**: Use service worker for heavy operations
3. **Storage Limits**: chrome.storage.local has 10MB limit (use compression if needed)
4. **Message Batching**: Batch runtime messages to reduce overhead

## Deployment

### Backend

**Production Setup**:
- Use production-grade database (managed PostgreSQL)
- Configure Redis for Sidekiq
- Set `RAILS_ENV=production`
- Precompile assets if using SSR: `rails assets:precompile`
- Set secure `SECRET_KEY_BASE` and `JWT_SECRET_KEY`
- Configure SMTP for email delivery
- Enable SSL/TLS
- Set up monitoring (Sentry, New Relic, etc.)

**Docker Production**:
```bash
docker build -f infra/docker/api.Dockerfile -t wishapp-api .
docker run -p 3000:3000 --env-file .env.production wishapp-api
```

### Flutter

**Build for Production**:
```bash
# Android
flutter build apk --release
flutter build appbundle --release

# iOS (requires macOS)
flutter build ios --release

# Web
flutter build web --release --web-renderer canvaskit
```

**Environment Configuration**:
- Create `.env.production` with production API URL
- Use flavor builds for multi-environment support

### Extension

**Build for Production**:
```bash
npm run build
# Output in dist/
# Zip dist/ and upload to Chrome Web Store
```

## Support & Documentation

### Additional Documentation
- **Docs/Implementation.md**: Detailed implementation plan
- **Docs/project_structure.md**: Comprehensive project structure (335 lines)
- **Docs/PRD_WishApp.md**: Product requirements
- **Docs/UI_UX_doc.md**: Design system and UI guidelines
- **Docs/tech_stack_WishApp.md**: Technology stack rationale (210 lines)

### External Resources
- Rails Guides: https://guides.rubyonrails.org/
- Flutter Documentation: https://docs.flutter.dev/
- Riverpod Documentation: https://riverpod.dev/
- Chrome Extension Documentation: https://developer.chrome.com/docs/extensions/

## Version History

See `CHANGELOG.md` for detailed version history and rationale for changes.

---

**Last Updated**: 2025-11-17 (Stage 2 completion)
**Maintained By**: Development Team
**For Issues**: Create an issue in the repository

---

## Quick Reference Checklist for AI Assistants

When working on this codebase:

- [ ] Check which component you're working on (backend/app/extension)
- [ ] Review relevant architecture patterns above
- [ ] Follow coding standards for that component
- [ ] Run tests before committing
- [ ] Update models? Run code generation (Flutter) or migrations (Rails)
- [ ] New API endpoint? Update routes and test
- [ ] New feature? Follow feature-first structure (Flutter)
- [ ] Environment changes? Update `.env.example` files
- [ ] Breaking changes? Update CHANGELOG.md
- [ ] Security-sensitive? Review security considerations above
- [ ] Performance-critical? Review optimization guidelines
