# CHANGELOG

All notable changes to WishApp project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## Version Policy

We pin all major dependencies to specific versions for stability and security:
- **Backend**: Latest stable versions with proven compatibility
- **Frontend**: Flutter stable channel with compatible package ecosystem
- **Extension**: LTS Node with latest stable tooling
- **Infrastructure**: Latest stable versions for Docker, CI tools

## [Unreleased]

### Added
- Initial monorepo structure with backend/, app/, extension/, infra/, Docs/
- Project documentation and development guidelines
- Root configuration files (.editorconfig, .gitignore, README.md)
- Flutter app bootstrap with pubspec.yaml, .fvmrc, analysis_options.yaml
- Extension workspace with TypeScript, Vite, MV3 manifest configuration
- Basic popup, background, and content script structure for extension
- Environment templates for all components

## [0.1.0] - 2025-11-12

### Pinned Versions & Rationale

#### Backend Dependencies
- **Ruby**: 3.3.x - Latest stable with performance improvements and security updates
- **Rails**: 8.0.x - Latest with improved API capabilities and performance
- **PostgreSQL**: 17.x - Latest stable with enhanced JSON support and performance
- **Redis**: 7.x - Latest stable with ACL improvements and better memory efficiency
- **Sidekiq**: 7.x - Compatible with Redis 7.x, improved job processing

#### Frontend Dependencies
- **Flutter**: ≥3.24.0 - Stable channel with Material 3 support and performance improvements
- **Dart**: 3.x - Compatible with Flutter stable
- **Riverpod**: 2.x - Latest stable with improved async handling
- **GoRouter**: 14.x - Latest stable with enhanced deep linking
- **dio**: 5.x - Latest stable HTTP client with interceptor improvements

#### Extension Dependencies
- **Node**: 22.x LTS - Long-term support with best stability
- **Vite**: 7.0.0 - Latest stable build tool with improved HMR
- **TypeScript**: 5.9.2 - Latest stable with enhanced type inference
- **webextension-polyfill**: Latest - MV3 compatibility layer

#### Infrastructure
- **Docker**: Latest stable - Container runtime
- **Docker Compose**: Latest stable - Multi-container orchestration

### Infrastructure
- Created root monorepo structure
- Added cross-project configuration files
- Established version pinning policy
