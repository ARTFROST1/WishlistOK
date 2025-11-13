# Bug Tracking - WishApp

Date: 2025-11-13
Status: Stage 1 - Foundation & Setup

---

## Resolved Issues

### Issue #001: Docker Compose version warning
**Date**: 2025-11-13  
**Stage**: Stage 1  
**Severity**: Low  
**Description**: Docker Compose shows warning about obsolete `version` attribute in docker-compose.yml  
**Root Cause**: Docker Compose v2 no longer requires version attribute  
**Resolution**: Warning is cosmetic, does not affect functionality. Can be resolved by removing `version: '3.8'` line from docker-compose.yml  
**Status**: ✅ Documented - Low priority, fix in Stage 4 polish  

### Issue #002: Ruby/Bundle not available locally on Windows
**Date**: 2025-11-13  
**Stage**: Stage 1  
**Severity**: Expected  
**Description**: `bundle check` command fails on Windows host  
**Root Cause**: Ruby environment not installed locally - by design  
**Resolution**: Project is designed to run via Docker containers, local Ruby not required  
**Status**: ✅ Expected behavior - No action needed  

---

## Open Issues

### Issue #003: Missing extension icons
**Date**: 2025-11-13  
**Stage**: Stage 1  
**Severity**: Medium  
**Description**: Extension manifest references icon files that don't exist  
**Root Cause**: Placeholder icons not created yet  
**Next Steps**: Create or generate placeholder icons (16x16, 32x32, 48x48, 128x128) for extension  
**Status**: 🔄 Tracked for Stage 2  

### Issue #004: Flutter app .env file not created
**Date**: 2025-11-13  
**Stage**: Stage 1  
**Severity**: Low  
**Description**: Flutter app needs actual .env file (only .env.example exists)  
**Root Cause**: .env file is gitignored, needs to be created locally  
**Next Steps**: Copy .env.example to .env in app/ directory during development setup  
**Status**: 🔄 Tracked for Stage 2  

---

## Notes for Future Stages

- **Stage 2**: Will need to create actual models and database migrations
- **Stage 3**: Extension will require proper API integration testing
- **Stage 4**: Comprehensive testing will likely reveal additional issues

---

## Issue Template

```
### Issue #XXX: [Brief description]
**Date**: YYYY-MM-DD  
**Stage**: Stage X  
**Severity**: Critical/High/Medium/Low  
**Description**: [Detailed description]  
**Root Cause**: [Analysis of why this happened]  
**Resolution**: [How it was fixed] OR **Next Steps**: [What needs to be done]  
**Status**: ✅ Resolved / 🔄 In Progress / ❌ Blocked  
```
