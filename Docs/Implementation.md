# Implementation Plan for WishApp (MVP)

Date: 2025-11-12
Owner: CTO / Tech Lead
Scope: Backend (Rails API), Flutter App (iOS/Android/Web), Browser Extension (MV3), Infra/CI/CD

---

## Feature Analysis

### Identified Features
- **Wishlist CRUD**: Create, update, delete, and view wishlists for events (birthday, wedding, etc.).
- **Add Wish (Manual)**: Owner can add a wish with title, image, link, price, and note.
- **Add Wish (Paste URL → Parse)**: Server parses metadata (Open Graph image required, title/price best-effort) from any store URL and pre-fills fields.
- **Share/Deep Links**: Generate shareable links for lists; public SEO pages for public lists.
- **Claim System**: Guests can claim a wish; owner sees item as claimed (no identity revealed in surprise mode). Claimer can mark as purchased.
- **Guest Lite Mode**: Auto-provision `guest_{uuid}` accounts on first claim/contribution; upgrade path to full account.
- **Privacy Controls**: Public / Link-only (default) / Private lists.
- **Donations / Group Gifts**: Ability to contribute money toward a gift (provider integration or MVP stub with happy-path).
- **Ideas Feed**: Curated collections, categories carousel, brand/promo slots (core for monetization).
- **In-App Browser + Auto-Parse**: Open popular stores in an internal WebView with floating “+ Add to Wishlist” that parses URL/title/price/image.
- **Browser Extension (MV3)**: Parse product page metadata and save to selected wishlist.
- **SEO Pages**: Server-rendered public list page at `/p/:slug` for indexing.
- **Auth**: Email + JWT for MVP; OAuth (Google/Apple) later.
- **Theming**: Minimalistic, Pinterest-like grid, light/dark themes.

### Feature Categorization
- **Must-Have Features**
  - Wishlist CRUD
  - Add Wish (Manual + Paste URL → Server Parse)
  - Claim System with Guest Lite Mode
  - Privacy Controls (Public / Link-only / Private)
  - SEO Public Pages (`/p/:slug`, SSR)
  - Email + JWT Auth
  - Ideas Feed (initial curated content)
- **Should-Have Features**
  - Donations / Group Gifts (happy-path provider or stub)
  - In-App Browser Auto-Parse (minimal MVP)
  - Browser Extension (minimal MV3 build)
  - Observability (Sentry)
- **Nice-to-Have Features**
  - OAuth providers (Google/Apple; VK/Yandex later)
  - Advanced SEO (rich snippets), sitemap
  - Admin CMS for curated feed (initially seed via fixtures)

### Technical Requirements & Constraints
- **Backend**: Ruby 3.3.x, Rails 8.0.x (API-only), PostgreSQL 17.x, Redis 7.x, Sidekiq 7.x.
- **Frontend**: Flutter stable ≥ 3.24 with Dart 3.x, Riverpod 2.x, GoRouter 14.x, dio 5.x, freezed/json_serializable.
- **Extension**: Node 22 LTS, Vite 7.0.0, TypeScript 5.9.2, MV3, webextension-polyfill.
- **Storage/CDN**: Supabase Storage with Cloudflare CDN in front (signed URLs via server).
- **Parser Policy**: OG image is mandatory; title/price best-effort; image gallery optional later.
- **SSR SEO**: Rails serves `/p/:slug` for public lists.
- **Security**: JWT auth, CORS, rate limiting, secure storage for tokens on device.
- **Performance**: Background jobs for parsing, image fetch, and notifications.

### Integrations & Dependencies
- **Payments**: CloudPayments or YooKassa (happy-path integration + webhooks) or a stub in MVP.
- **Email**: Provider TBD (Postmark/Mailgun/SendGrid) via Action Mailer.
- **Observability**: Sentry (Flutter + Rails) optional but recommended.
- **CDN/Storage**: Supabase Storage + Cloudflare CDN.

---

## Recommended Tech Stack

### Frontend (Flutter)
- **Framework**: Flutter (Material 3) — single codebase for iOS/Android/Web; high-quality UI and animations.
- **Docs**: https://docs.flutter.dev
- **Routing**: GoRouter — declarative routing and deep links.
  - Docs: https://pub.dev/packages/go_router
- **State**: Riverpod 2.x — testable, DI-friendly state management.
  - Docs: https://riverpod.dev
- **HTTP**: dio — interceptors, retries, file uploads.
  - Docs: https://pub.dev/packages/dio
- **Models/Codegen**: freezed, json_serializable, build_runner.
  - Docs: https://pub.dev/packages/freezed | https://pub.dev/packages/json_serializable | https://pub.dev/packages/build_runner
- **Storage**: flutter_secure_storage, shared_preferences.
  - Docs: https://pub.dev/packages/flutter_secure_storage | https://pub.dev/packages/shared_preferences
- **WebView**: flutter_inappwebview (for in-app browser auto-parse).
  - Docs: https://inappwebview.dev/

### Backend (Rails API)
- **Framework**: Ruby on Rails 8 (API-only) — productive, batteries-included.
  - Ruby: https://www.ruby-lang.org/en/ | https://docs.ruby-lang.org/en/
  - Rails Guides: https://guides.rubyonrails.org/ | API: https://api.rubyonrails.org/
- **DB**: PostgreSQL 17 — robust relational database.
  - Docs: https://www.postgresql.org/docs/current/
- **Background Jobs**: Sidekiq 7 + Redis 7 — reliable job processing.
  - Sidekiq: https://sidekiq.org/ | https://github.com/sidekiq/sidekiq/wiki
  - Redis: https://redis.io/docs/
- **Auth**: Devise + devise-jwt — stateless token auth for API.
  - Devise: https://github.com/heartcombo/devise
  - Devise-JWT: https://github.com/waiting-for-dev/devise-jwt
- **API Docs**: rswag — OpenAPI 3 generation.
  - Docs: https://github.com/rswag/rswag
- **Security**: rack-cors, rack-attack.
  - rack-cors: https://github.com/cyu/rack-cors
  - rack-attack: https://github.com/rack/rack-attack
- **Logging**: lograge — structured logs.
  - Docs: https://github.com/roidrage/lograge
- **Parsing**: Faraday/HTTPX, Nokogiri, Down, image_processing.
  - Nokogiri: https://nokogiri.org/

### Browser Extension (MV3)
- **Tooling**: Node 22 LTS, Vite 7.0.0, TypeScript 5.9.2, Manifest v3.
  - Vite: https://vitejs.dev/ | TS: https://www.typescriptlang.org/
  - MV3: https://developer.chrome.com/docs/extensions/mv3/
- **Libs**: vite-plugin-web-extension, webextension-polyfill, axios, zod, jose (optional for JWT utils).
  - Plugin: https://github.com/samrum/vite-plugin-web-extension
  - Polyfill: https://github.com/mozilla/webextension-polyfill
  - axios: https://axios-http.com/ | zod: https://zod.dev | jose: https://github.com/panva/jose

### Storage/CDN & Observability
- **Storage**: Supabase Storage — signed URLs from backend.
  - Docs: https://supabase.com/docs/guides/storage
- **CDN**: Cloudflare CDN — edge caching for public images.
  - Docs: https://developers.cloudflare.com/cdn/
- **Observability**: Sentry (Flutter + Ruby).
  - Docs: https://docs.sentry.io/platforms/flutter/ | https://docs.sentry.io/platforms/ruby/

---

## Implementation Stages

### Stage 1: Foundation & Setup
**Dependencies:** None

#### Sub-steps
- [x] Initialize monorepo structure (`backend/`, `app/`, `extension/`, `infra/`, `Docs/`).
- [x] Backend bootstrap: Ruby 3.3.x, Rails 8 API-only, Bundler; configure RSpec, RuboCop, Brakeman, Lograge.
- [x] DB/Cache setup: Postgres 17, Redis 7; Docker Compose services.
- [x] Sidekiq setup: queues (parse, images, mailers, notifications), Redis connection.
- [x] Auth skeleton: Devise + devise-jwt (JWT strategy, refresh), rack-cors, rack-attack.
- [x] API scaffolding: versioned namespace (`/api/v1`), error handling, pagination basics.
- [x] Storage: Supabase Storage client (HTTP), signed URL helper, Cloudflare CDN config notes.
- [x] Flutter app bootstrap: Riverpod, GoRouter, themes, env config, dio client with interceptors.
- [x] Extension workspace bootstrap: Vite + TS + MV3 manifest, polyfill wiring.
- [x] CI: GitHub Actions (Ruby lint/spec, Flutter build/test, Extension typecheck/build), Brakeman.
- [x] Env/Secrets: `.env` templates; document variables; add `.fvmrc`, `.ruby-version`, `.nvmrc`.
- [x] CHANGELOG.md initialized with pinned versions (per versioning policy).

#### Required resources
- Dev accounts: Supabase, Cloudflare, Email provider, Sentry (optional), Payment provider sandbox.
- Local: Docker Desktop, Ruby, Flutter (FVM), Node 22 LTS.

---

### Stage 2: Core Features
**Dependencies:** Stage 1 completion

#### Backend
- [x] Domain models & migrations: `users`, `wishlists` (title, event_date, visibility, slug), `wishes` (title, image_url, price, url, note, status), `claims` (wish_id, guest_id), `guests`.
- [x] Auth endpoints: register, login, refresh, revoke; Lite Mode auto-provision on claim.
- [x] Wishlist API: CRUD, privacy, slug generation, share link.
- [x] Wish API: CRUD; `POST /api/v1/wishes/parse` (URL) → enqueue parse job; return preview payload.
- [x] Claim API: `POST /api/v1/wishes/:id/claim`, `POST /api/v1/wishes/:id/unclaim`, `POST /api/v1/wishes/:id/mark_purchased`.
- [x] SSR Public page: `GET /p/:slug` (Rails view), canonical/meta tags (SEO), link to deep app routes.
- [x] Ideas Feed (MVP): endpoints to serve curated collections (seeded fixtures).

**Implementation Status**: ✅ **COMPLETED** (2025-11-13)
- All backend APIs implemented with proper authentication, authorization, and business logic
- Domain models with associations, validations, callbacks, and counter caches
- WishParserService with comprehensive OG data parsing (supports major e-commerce sites)
- SSR public pages with SEO optimization and responsive design
- Guest Lite Mode fully functional with auto-provisioning and upgrade paths
- Comprehensive API serializers with conditional attributes based on user permissions

#### Flutter app
- [x] App shell: tabs (Lists, Feed, Add, Profile) with GoRouter routes and deep links.
- [x] Auth screens (email); secure token storage; guest Lite Mode handling.
- [x] Lists: My Wishlists (grid), Create/Edit Wishlist.
- [x] Wishlist Detail: grouped items (Available / Claimed), share link button, add wish button.
- [x] Add Wish: Manual entry; Paste URL → call parse API → preview → select wishlist → save.
- [x] Claim flow (guest): claim, mark purchased; owner sees "claimed" without identity.
- [x] Feed: categories carousel + curated collections; item → add to list flow.
- [x] Theming: light/dark, base components (cards, buttons, modals), loading/empty/error states.

**Implementation Status**: ✅ **COMPLETED** (2025-11-17)
- Complete app architecture with feature-first structure and clean separation of concerns
- Riverpod 2.x state management with providers for all features
- GoRouter configuration with deep links and shell routes (bottom navigation)
- Material 3 theming with light/dark modes and brand colors
- Comprehensive auth flow with JWT + guest mode support (FlutterSecureStorage)
- Full CRUD UI for wishlists and wishes with mock data for development
- URL parsing flow with preview and manual entry tabs
- Feed screen with categories carousel, collections, and trending items
- Dio HTTP client with auth interceptors and error handling
- Freezed models with JSON serialization for all domain entities
- Repository pattern for data layer (auth, wishlists, wishes, feed)
- Reusable UI components (loading, error, async_value widgets)
- Empty states, loading states, and error handling throughout the app

#### Extension (optional in Stage 2)
- [ ] Basic popup UI: capture URL, parse via API, select wishlist, save.

#### Required resources
- Seed data for feed, fixtures for tests; UX assets (logo, colors, icons).

---

### Stage 3: Advanced Features
**Dependencies:** Stage 2 completion

#### Payments & Donations
- [ ] Implement provider (CloudPayments or YooKassa) happy-path for donations/group gifts.
- [ ] Webhooks: payment confirmation and contribution records; security validation.
- [ ] UI: donate modal, progress toward target price; owner can donate too.

#### In-App Browser Auto-Parse
- [ ] Integrate `flutter_inappwebview` with floating “+ Add to Wishlist” overlay.
- [ ] JS injection to extract URL, title, price, first image; send to preview → add flow.

#### Browser Extension (MV3)
- [ ] Content script: read-only DOM scrape of OG/product metadata.
- [ ] Background service worker: auth bootstrap/refresh.
- [ ] Popup UI: choose wishlist, preview, save; sync via user/guest token.

#### Platform & Ops
- [ ] Observability with Sentry (Flutter + Rails), error sampling.
- [ ] Rate limiting & abuse controls tuning.
- [ ] Performance: DB indexes, N+1 checks, cache hot paths.

---

### Stage 4: Polish & Optimization
**Dependencies:** Stage 3 completion

#### Sub-steps
- [ ] Comprehensive testing: API specs (RSpec), Flutter unit/widget/integration tests; extension e2e smoke.
- [ ] Accessibility pass: contrast, semantics, screen reader basics.
- [ ] SEO polish: meta tags, sitemap for public lists, social preview images.
- [ ] UX: microinteractions, smooth transitions, empty/error states refinement.
- [ ] Deployment: production infra, CDN caching rules, secrets rotation, backup policies.

#### Required resources
- Staging & production environments, monitoring dashboards, incident playbook.

---

## Dependencies Between Tasks
- Stage 1 (setup) → prerequisite for all other stages.
- Auth, models, and migrations → required before lists/wishes/claims APIs.
- Parse service & jobs → required before Add Wish (Paste URL) flows on app/extension.
- SSR public pages → require wishlist slugs and visibility rules.
- Donations → depend on user + wish models and verified payment provider.
- In-app browser and extension → depend on parse API and auth token flows.

---

## Timeline (Indicative)
- **Stage 1**: 1.5–2 weeks
- **Stage 2**: 3–4 weeks
- **Stage 3**: 2–3 weeks (provider integration scope-dependent)
- **Stage 4**: 1–2 weeks

Total: ~7.5–11 weeks for MVP to production, assuming 2–3 engineers (full-stack + mobile) and 1 designer part-time.

---

## Required Resources
- **Accounts**: Supabase, Cloudflare, Email provider, Payment sandbox, Sentry (optional).
- **Tooling**: Ruby 3.3.x, Rails 8, Postgres 17, Redis 7, Sidekiq 7, Flutter ≥ 3.24, Node 22, Docker.
- **Documentation & Standards**: Coding standards, API style guide, UI kit specs.

---

## Resource Links
- **Flutter**: https://docs.flutter.dev
- **Dart**: https://dart.dev
- **Riverpod**: https://riverpod.dev
- **GoRouter**: https://pub.dev/packages/go_router
- **dio**: https://pub.dev/packages/dio
- **freezed**: https://pub.dev/packages/freezed
- **json_serializable**: https://pub.dev/packages/json_serializable
- **flutter_secure_storage**: https://pub.dev/packages/flutter_secure_storage
- **flutter_inappwebview**: https://inappwebview.dev/
- **Ruby**: https://www.ruby-lang.org/en/ | https://docs.ruby-lang.org/en/
- **Rails**: https://guides.rubyonrails.org/ | https://api.rubyonrails.org/
- **PostgreSQL**: https://www.postgresql.org/docs/current/
- **Redis**: https://redis.io/docs/
- **Sidekiq**: https://github.com/sidekiq/sidekiq/wiki
- **Devise**: https://github.com/heartcombo/devise
- **Devise-JWT**: https://github.com/waiting-for-dev/devise-jwt
- **rswag**: https://github.com/rswag/rswag
- **rack-cors**: https://github.com/cyu/rack-cors
- **rack-attack**: https://github.com/rack/rack-attack
- **lograge**: https://github.com/roidrage/lograge
- **Nokogiri**: https://nokogiri.org/
- **Vite**: https://vitejs.dev/
- **TypeScript**: https://www.typescriptlang.org/
- **MV3**: https://developer.chrome.com/docs/extensions/mv3/
- **vite-plugin-web-extension**: https://github.com/samrum/vite-plugin-web-extension
- **webextension-polyfill**: https://github.com/mozilla/webextension-polyfill
- **axios**: https://axios-http.com/
- **zod**: https://zod.dev
- **jose**: https://github.com/panva/jose
- **Supabase Storage**: https://supabase.com/docs/guides/storage
- **Cloudflare CDN**: https://developers.cloudflare.com/cdn/
- **Sentry (Flutter/Ruby)**: https://docs.sentry.io/platforms/flutter/ | https://docs.sentry.io/platforms/ruby/

---

## Notes & Policies
- Version policy: “latest stable + verified compatibility,” pinned in lockfiles and recorded in `CHANGELOG.md` with rationale.
- Parser scope per PRD/AppMap: OG image must; title/price best-effort; gallery optional later.
- Lite Mode: auto-provision guest on first claim/donation; upgrade to full account on privileged actions.
- SEO: public lists SSR via Rails; app deep links preserved.
