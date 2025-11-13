# Project Structure — WishApp (MVP)

This document defines the monorepo folder structure, file organization, module hierarchy, configuration locations, assets organization, build/deployment structure, and environment-specific configurations for WishApp.

Root repository is a multi-project workspace containing:
- `backend/` — Ruby on Rails 8 API-only service (SSR for public pages)
- `app/` — Flutter application (iOS/Android/Web)
- `extension/` — Browser Extension (MV3) built with Vite + TypeScript
- `infra/` — Infrastructure, Docker, CI, environment templates
- `Docs/` — Project documentation

---

## Root Directory

```
WishApp/
├── backend/
├── app/
├── extension/
├── infra/
├── Docs/
├── .editorconfig
├── .gitignore
├── CHANGELOG.md
└── README.md
```

- `CHANGELOG.md`: Version and dependency changes per policy (pin + rationale).
- `.editorconfig`: Consistent formatting across projects.
- `.gitignore`: Combined ignore rules for all subprojects.

---

## Backend — Rails API (`backend/`)

Rails 8 (API-only) providing JSON REST API and SSR for public list pages (`/p/:slug`).

```
backend/
├── app/
│   ├── controllers/
│   │   ├── api/
│   │   │   └── v1/
│   │   │       ├── auth/
│   │   │       │   ├── guests_controller.rb      # Guest Lite Mode
│   │   │       │   ├── registrations_controller.rb
│   │   │       │   └── sessions_controller.rb
│   │   │       ├── base_controller.rb
│   │   │       ├── claims_controller.rb          # Claim system
│   │   │       ├── health_controller.rb
│   │   │       ├── ideas_controller.rb           # Curated collections
│   │   │       ├── wishes_controller.rb          # Wish CRUD + parsing
│   │   │       └── wishlists_controller.rb       # Wishlist CRUD
│   │   ├── public/
│   │   │   └── wishlists_controller.rb           # SSR for /p/:slug
│   │   ├── application_controller.rb
│   │   └── concerns/
│   ├── jobs/
│   │   └── parse_wish_job.rb                     # Background URL parsing
│   ├── models/
│   │   ├── application_record.rb
│   │   ├── claim.rb                              # Claim system model
│   │   ├── guest.rb                              # Guest Lite Mode model
│   │   ├── jwt_denylist.rb                       # JWT security
│   │   ├── user.rb                               # User + guest logic
│   │   ├── wish.rb                               # Wish model with parsing
│   │   └── wishlist.rb                           # Wishlist with privacy
│   ├── serializers/
│   │   ├── claim_serializer.rb                   # Claim JSON responses
│   │   ├── guest_serializer.rb                   # Guest data serialization
│   │   ├── user_serializer.rb                    # User data serialization
│   │   ├── wish_serializer.rb                    # Wish with permissions
│   │   └── wishlist_serializer.rb                # Wishlist with metadata
│   ├── services/
│   │   └── wish_parser_service.rb                # OG data parsing service
│   ├── views/
│   │   ├── layouts/
│   │   │   └── public.html.erb                   # SSR layout with SEO
│   │   └── public/
│   │       └── wishlists/
│   │           └── show.html.erb                 # Public wishlist page
│   ├── helpers/
│   └── workers/              # (Reserved for future Sidekiq workers)
├── config/
│   ├── environments/
│   ├── initializers/
│   ├── application.rb
│   ├── database.yml
│   └── routes.rb             # Complete API + SSR routes
├── db/
│   └── migrate/
│       ├── 20251112000001_devise_create_users.rb
│       ├── 20251112000002_create_jwt_denylist.rb
│       ├── 20251113000003_create_wishlists.rb    # Wishlist schema
│       ├── 20251113000004_create_wishes.rb       # Wish schema
│       ├── 20251113000005_create_claims.rb       # Claim schema
│       └── 20251113000006_create_guests.rb       # Guest schema
├── spec/                     # (Reserved for RSpec tests)
├── lib/
├── Gemfile                   # Complete with all dependencies
├── Gemfile.lock
├── .ruby-version             # 3.3.6
├── .rubocop.yml
├── .rspec
├── Procfile.dev
├── .env                      # Local environment
├── .env.example
├── Rakefile
└── config.ru
```

- **Controllers**: `api/v1` (JSON), `public` (SSR pages for SEO).
- **Workers/Jobs**: Parsing URLs, downloading images, notifications.
- **Services**: Encapsulate business logic for parser, storage (Supabase), payments.
- **Security**: `rack-cors`, `rack-attack` initializers.
- **Logging**: `lograge` setup for structured logs.

Config & Env:
- Local env via `dotenv` (`.env`), production via platform secrets/credentials.
- Sidekiq config with Redis 7; queues: `parse`, `images`, `mailers`, `notifications`.
- DB: PostgreSQL 17; indexes for slug, foreign keys, common filters.

Build/Run:
- `docker-compose` (in `infra/`) with services: api, worker, db, redis, proxy.
- CI runs: RuboCop, RSpec, Brakeman, bundler-audit (advisory).

---

## Flutter App (`app/`)

Flutter stable (≥ 3.24), Dart 3.x, Riverpod 2.x, GoRouter 14.x.

```
app/
├── lib/
│   ├── core/
│   │   ├── config/           # env, api base, feature flags
│   │   ├── theme/            # Material 3 theme, colors, typography
│   │   ├── network/          # dio client, interceptors, auth token mgmt
│   │   └── widgets/          # shared UI components
│   ├── features/
│   │   ├── auth/
│   │   │   ├── data/         # models, repositories
│   │   │   ├── application/  # providers, notifiers
│   │   │   └── presentation/ # screens, widgets
│   │   ├── wishlists/
│   │   ├── wishes/
│   │   ├── claims/
│   │   ├── feed/
│   │   └── webview/
│   ├── router/
│   │   └── app_router.dart   # GoRouter setup, deep links
│   └── main.dart
├── assets/
│   ├── images/
│   ├── icons/
│   └── lottie/               # optional
├── test/
├── integration_test/
├── pubspec.yaml
├── analysis_options.yaml
├── .fvmrc                     # pin Flutter channel/version
└── .env.example
```

- **Features layering**: `data` (API models/repos), `application` (Riverpod providers), `presentation` (screens/widgets).
- **Networking**: `dio` with interceptors (auth headers, retries, logging in debug).
- **Theming**: Material 3 with light/dark; design tokens centralized in `core/theme/`.
- **Env**: Simple `.env` or flavors; API base URL per env.

Build/Run:
- `flutter test`, `integration_test` for critical flows.
- Web build optional for marketing/landing or simple public views.

---

## Browser Extension (MV3) (`extension/`)

Vite 7.0.0, TypeScript 5.9.2, MV3, webextension-polyfill.

```
extension/
├── src/
│   ├── background.ts         # auth bootstrap, token refresh
│   ├── content.ts            # DOM read of OG/product metadata
│   └── popup/
│       ├── index.html
│       └── popup.ts
├── public/
│   └── icons/
├── manifest.config.ts        # manifest factory (vite-plugin-web-extension)
├── vite.config.ts
├── tsconfig.json
├── package.json
├── pnpm-lock.yaml | yarn.lock | package-lock.json
├── .nvmrc
└── .env.example
```

- **Architecture**: Background SW, Content script, Popup UI; communicate via messaging.
- **HTTP**: axios or fetch; zod for runtime validation; jose optional for JWT.
- **Build**: `vite build` → `dist/` output; dev with HMR where supported.

---

## Infra (`infra/`)

Infrastructure, local dev, CI/CD.

```
infra/
├── docker/
│   ├── api.Dockerfile
│   ├── worker.Dockerfile
│   └── nginx.Dockerfile (optional)
├── docker-compose.yml
├── nginx/
│   └── default.conf (optional local SSL/reverse proxy)
├── ci/
│   └── workflows/            # templates for GitHub Actions
├── scripts/
│   ├── bootstrap.ps1
│   ├── bootstrap.sh
│   └── migrate_seed.sh
└── env/
    ├── backend.env.example
    ├── app.env.example
    └── extension.env.example
```

- **Compose services**: `api`, `worker`, `db` (postgres:17), `redis` (7), `proxy` (optional nginx).
- **CI**: Lint/test matrices for Ruby, Flutter; extension typecheck/build; Brakeman.
- **Secrets**: local via `.env` files; production via platform secret manager.

---

## Documentation (`Docs/`)

```
Docs/
├── AppMap_WishApp.md          # UX/Architecture specification
├── Bug_tracking.md            # Implementation status & known issues
├── Implementation.md          # Implementation plan, stages, dependencies
├── PRD_WishApp.md            # Product Requirements Document
├── project_structure.md      # This file - project structure
├── tech_stack_WishApp.md     # Tech stack & version policy
└── UI_UX_doc.md              # Design system, flows, accessibility
```

- `Implementation.md`: Implementation plan, stages, dependencies, resource links.
- `UI_UX_doc.md`: Design system, flows, accessibility, responsive rules.
- `Bug_tracking.md`: **NEW** - Implementation status, known issues, and deployment notes.
- `AppMap_WishApp.md`: Complete UX/Architecture specification.
- `PRD_WishApp.md`: Product Requirements Document with MVP scope.
- `tech_stack_WishApp.md`: Technology stack with pinned versions and compatibility policy.

---

## Module/Component Hierarchy (Highlights)

- **Backend**: Services for parsing, storage, payments isolated from controllers; Sidekiq workers for long-running jobs; serializers enforce minimal explicit JSON.
- **Flutter**: Feature-first organization with clean separation (`data`/`application`/`presentation`), global reusable components in `core/widgets`.
- **Extension**: Segregate background/content/popup; configs isolated; schemas with zod.

---

## Configuration File Locations

- **Backend**: `config/initializers/*` (CORS, JWT, Sidekiq, lograge), `config/environments/*`, `config/database.yml`, credentials per-env.
- **Flutter**: `lib/core/config/` for env and flags; `analysis_options.yaml`; tokens via `flutter_secure_storage`.
- **Extension**: `.env` for API base; Vite define for build-time constants; `manifest.config.ts` to generate manifest.

---

## Assets Organization

- **Flutter**: `assets/images/`, `assets/icons/`; declare in `pubspec.yaml`.
- **Backend**: Public SSR templates; images stored in Supabase Storage (links only in DB).
- **Extension**: `public/icons/` for browser toolbar and store assets.

---

## Build & Deployment Structure

- **Backend**: Docker images for `api` and `worker`; deploy behind Cloudflare; migrations via CI/CD job; Sidekiq processes separate.
- **Flutter**: Build AAB/IPA via CI; Web build optional; use flavors or env files to switch endpoints.
- **Extension**: `vite build` → zip for store upload; version bump per release; MV3 compliance checks.

---

## Environment-Specific Configurations

- **Development**: `.env` files, debug logging, permissive CORS (localhost origins), seed data.
- **Staging**: Separate DB/Redis buckets, stricter CORS, Sentry enabled, feature flags for experimental UI.
- **Production**: Secrets via manager, rate limits tuned, SSL everywhere, Cloudflare CDN caching for public assets.

---

## Implementation Notes (Stage 2 Complete)

### ✅ Completed Features
- **Domain Models**: User, Wishlist, Wish, Claim, Guest with full business logic
- **Authentication**: Devise+JWT with Guest Lite Mode auto-provisioning
- **APIs**: Complete CRUD for wishlists, wishes, claims with proper authorization
- **URL Parsing**: WishParserService with comprehensive OG data extraction
- **SSR Pages**: SEO-optimized public wishlist pages at `/p/:slug`
- **Ideas Feed**: Curated collections API with sample data

### 🔧 Key Architecture Decisions
- **Guest System**: Auto-creates `guest_{uuid}` users on first claim/contribution
- **Privacy Model**: Public/link-only/private wishlists with secure share tokens
- **Surprise Mode**: Claims can be hidden from wishlist owners until purchased
- **Parser Policy**: OG image mandatory, title/price best-effort (per tech requirements)
- **Serialization**: Conditional attributes based on user permissions and privacy settings

### 📁 File Organization
- Models contain business logic and validation rules
- Controllers handle authorization and delegate to services
- Serializers provide permission-aware JSON responses
- Services encapsulate complex business operations
- Background jobs handle time-consuming operations

### 🚀 Ready for Stage 3
- Payment integration (donations/group gifts)
- Browser extension implementation
- Performance optimization and caching
- Comprehensive test suite

## Original Design Notes

- Aligns with PRD (`PRD_WishApp.md`) and AppMap (`AppMap_WishApp.md`) plus `tech_stack_WishApp.md` version policy.
- Public SEO page SSR at `/p/:slug` in `backend/app/views/public/`.
- Parser scope: OG image required; title/price best-effort; handled by workers for reliability.
