# WishApp — Tech Stack and Dependency Matrix (MVP)

Date: 2025-11-12
Owner: CTO
Scope: Backend (Rails API), Flutter App (iOS/Android/Web), Browser Extension (MV3), Infra

This document defines all core modules, libraries, and dependencies for WishApp MVP with a version policy aligned to “latest stable + verified compatibility” and recorded in a changelog.

Versioning policy
- Latest stable for each component, verified via Context7 docs and official sources at setup time.
- Exact versions pinned in lockfiles and recorded in CHANGELOG.md with rationale and upgrade notes.
- If conflicts arise, fall back to the last known-stable set noted below.

References used for versions (Context7)
- Ruby: /websites/ruby-lang_en_master (example shows ruby 3.3.6)
- Rails: /rails/rails (lists 7.2.2.1 and 8.0.0.1)
- PostgreSQL: /websites/postgresql-current (17.5 current), /websites/postgresql_17
- Redis: /redis/redis-doc, /redis/redis-rb
- Sidekiq: /sidekiq/sidekiq
- Flutter/Dart: /websites/flutter_dev, /websites/dart_dev
- TypeScript: /microsoft/typescript (v5.9.2)
- Vite: /vitejs/vite (v7.0.0)
- WebExtension Polyfill: /mozilla/webextension-polyfill


# Backend (Ruby on Rails API)

Runtime & Framework
- Ruby: 3.3.x (min 3.3.0; example docs show 3.3.6)
- Rails: 8.0.x (min 8.0.0.1), API-only mode
- Bundler: latest stable

Data & Background Processing
- PostgreSQL: 17.x (min 17.5)
- Redis: 7.x (min 7.0; Sidekiq 7 recommends Redis ≥ 6.2)
- Sidekiq: 7.x for background jobs (queues: parsing, image fetch, mailers, notifications)

HTTP/API & Security
- Rack: 3.x (included with Rails 8)
- CORS: rack-cors 2.x (API access from Flutter + extension)
- Rate limiting/abuse protection: rack-attack 6.x
- Logging: lograge 0.12.x (structured, low-noise logs)
- API schema/docs: rswag 2.x (OpenAPI 3)

AuthN/AuthZ
- Devise 4.9+ (users), Devise-JWT 0.12+ (stateless API tokens)
  - Alt (if needed): jwt_sessions 2.x
- Password reset + email confirmations via Action Mailer (provider TBD)

Parsing & Media pipeline
- HTTP client: Faraday 2.x (instrumentation-friendly) or HTTPX 1.x
- HTML parsing: Nokogiri 1.16+
- File download: Down 5.x
- Image processing (thumbnails, if needed): image_processing 1.12+ with mini_magick
- OG parsing policy (MVP per PRD & AppMap): OG image mandatory; OG title/price best-effort

Serialization & Rendering
- JSON rendering: Rails render (Jbuilder optional). Keep responses minimal and explicit.

Payments (MVP decision pending)
- CloudPayments (docs: /websites/developers_cloudpayments_ru-en) or YooKassa via REST API
- PCI scope avoidance: use provider widgets + server-side verification webhooks
- Money & currencies: money-rails optional if needed

Storage & CDN
- Supabase Storage as object store; signed URLs via server; Cloudflare CDN in front
  - Access from Rails via HTTP (no heavy SDK dependency)
  - Alt: Active Storage (S3-compatible) if pivot is needed

Email/Notifications
- Provider TBD (Postmark/Mailgun/SendGrid); premailer-rails if rich emails are needed

Testing & Quality
- rspec-rails 6.x, factory_bot_rails, faker
- RuboCop latest for linting (rails, performance, security cops)
- Brakeman in CI (advisory)

Known-stable fallback bundle (if latest conflicts)
- Ruby 3.3.x + Rails 7.2.2.1
- PostgreSQL 17.x, Redis 7.x, Sidekiq 7.x


# Flutter App (iOS / Android / Web)

Toolchain
- Flutter: stable channel (pin with FVM at init), target ≥ 3.24.x
- Dart: 3.x (paired with Flutter stable)

Core Packages
- State management: flutter_riverpod 2.x (or riverpod 2.x), hooks_riverpod optional
- Routing: go_router 14.x (deep links, nested routes)
- HTTP: dio 5.x (interceptors, cancelation, file upload)
- Models & JSON: freezed 2.x, json_serializable 6.x, build_runner 2.x, equatable 2.x
- Secure storage: flutter_secure_storage 9.x
- Preferences: shared_preferences 2.x
- Images: cached_network_image 3.x (with placeholders/error)
- Share & links: share_plus 10.x, url_launcher 6.x
- WebView / in-app browser: flutter_inappwebview 6.x (JS injection for auto-parse UX)
- Animations/Motion: flutter_animate 4.x
- Theming: Material 3, dynamic color support where available

Platform integrations
- package_info_plus, device_info_plus (optional)
- path_provider for file IO (if needed)

Testing & Lints
- flutter_test, integration_test, mocktail
- flutter_lints latest

Build outputs
- Mobile (AAB/IPA), Web (Flutter web for marketing/landing or simple public views)


# Browser Extension (MV3: Chrome + (Safari/Firefox with polyfill where possible))

Tooling
- Node: 22 LTS
- Vite: 7.0.0
- TypeScript: 5.9.2
- Manifest: v3

Packages
- vite-plugin-web-extension (samrum) for MV3 build
- webextension-polyfill 0.10+ (Promise-based browser.* API)
- axios 1.x (HTTP client) or native fetch
- zod 3.x (runtime schema validation)
- jose 5.x (JWT utilities, if needed client-side)

Architecture
- Background service worker: auth bootstrap, token refresh
- Content script: OG/metadata scraping (DOM read-only)
- Popup UI: minimal TS/HTML (no heavy framework for MVP)

Lint & formatting
- ESLint 9.x, Prettier 3.x


# Infra, Local Dev, and CI/CD

Containers & services
- Docker Compose (dev):
  - api: Rails API server
  - worker: Sidekiq
  - db: postgres:17
  - redis: 7
  - proxy: Nginx (optional, for local SSL)

Secrets & config
- dotenv for local env; production via platform secrets manager

CI (GitHub Actions proposal)
- Ruby matrix (lint + spec), Flutter build/test, Extension typecheck/build
- Security: Brakeman, bundler-audit (advisory)

Observability (optional for MVP)
- Sentry (sentry_flutter, sentry-ruby) for error tracking
- Structured logs (JSON) in API via lograge or rails_semantic_logger


# API Resource Naming (to align PRD + AppMap)

- wishlists: CRUD, privacy (public/link-only/private), slug for SEO
- wishes: items within wishlists; endpoints for parse-by-URL, claim/unclaim, donate stub
- public pages: GET /p/:slug (SSR in Rails for SEO), deep links to /wish/:id


# Compatibility Matrix (Key)

- Ruby 3.3.x + Rails 8.0.x
  - Devise-JWT 0.12+ compatible with rack 3 (Rails 8)
- Sidekiq 7.x requires Redis ≥ 6.2 (use Redis 7.x)
- PostgreSQL 17.x supported by Rails 8.0.x
- Flutter stable ≥ 3.24 with Dart 3.x
- Vite 7.0.0 requires Node ≥ 18 (use Node 22 LTS)
- WebExtension polyfill works across Chrome/Firefox; Safari requires testing (MV3)


# Install Checkpoints (at bootstrap)

Backend
- ruby --version (expect 3.3.x)
- rails -v (expect 8.0.x)
- psql --version (expect 17.x)
- redis-server --version (expect 7.x)
- bundle lock; bundle exec rspec; brakeman (advisory)

Flutter
- flutter --version (stable)
- dart --version (paired)
- flutter pub get; dart run build_runner build -d; flutter test

Extension
- node -v (expect 22.x)
- pnpm|yarn|npm install; vite build


# Notes & Pending Decisions

- Payments: enable happy-path provider (CloudPayments/YooKassa) in MVP or stub → confirm
- Parser scope: OG image (must), title+price best-effort; image gallery optional later
- In-app browser auto-parse: minimal MVP or post-MVP?
- Auth providers: Email+JWT MVP; add Google/Apple later; VK/Yandex post-MVP
- Lite Mode guest accounts: auto-provision on first claim/donation as per AppMap


# Change Management

- All resolved/pinned versions and notable config deltas must be appended to CHANGELOG.md at each setup and upgrade.
- Use Conventional Commits; tag releases with semver; maintain upgrade notes per component.
