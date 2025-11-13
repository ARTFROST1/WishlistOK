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
│   │   └── public/
│   ├── models/
│   ├── views/
│   │   └── public/           # SSR templates for SEO pages
│   ├── jobs/                 # ActiveJob wrappers (Sidekiq adapter)
│   ├── workers/              # Sidekiq workers (parse, images, mailers)
│   ├── services/             # PORO services (parsing, storage, payments)
│   ├── serializers/          # JSON serializers (if used)
│   └── helpers/
├── config/
│   ├── environments/
│   ├── initializers/
│   ├── credentials.yml.enc   # or rails credentials per env
│   ├── database.yml
│   └── routes.rb
├── db/
│   ├── migrate/
│   └── schema.rb
├── spec/                     # rspec-rails tests
├── lib/
├── Gemfile
├── Gemfile.lock
├── .ruby-version             # e.g., 3.3.x
├── .rubocop.yml
├── .rspec
├── Procfile.dev              # foreman/overmind dev processes (puma, sidekiq)
└── .env.example              # local env template
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
├── Implementation.md
├── project_structure.md
└── UI_UX_doc.md
```

- `Implementation.md`: Implementation plan, stages, dependencies, resource links.
- `UI_UX_doc.md`: Design system, flows, accessibility, responsive rules.

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

## Notes

- Aligns with PRD (`PRD_WishApp.md`) and AppMap (`AppMap_WishApp.md`) plus `tech_stack_WishApp.md` version policy.
- Public SEO page SSR at `/p/:slug` in `backend/app/views/public/`.
- Parser scope: OG image required; title/price best-effort; handled by workers for reliability.
