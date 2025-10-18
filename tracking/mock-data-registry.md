# Mock Data Registry

**Last Updated**: [Date]
**Current Phase**: [Phase Number]

---

## Overview

This registry tracks all mock data usage throughout the project, enabling systematic migration to real APIs.

---

## Active Mock Data Usage

### Component: [Component Name]
- **Location**: [File path]
- **Mock Data**: [Mock data source/variable name]
- **Mock Data Location**: [Where mock data is defined]
- **Real API Endpoint**: [Target API endpoint]
- **Migration Priority**: P0 / P1 / P2 / P3
- **Migration Status**: Not Started / In Progress / Complete
- **Notes**: [Any important context]

---

## Completed Migrations

### Component: [Component Name]
- **Migration Date**: [Date]
- **Migrated From**: [Mock data source]
- **Migrated To**: [Real API endpoint]
- **Verified By**: [Agent name]
- **Status**: ✅ Complete

---

## Mock Data Inventory

### [MockDataFile].swift / .ts / etc.
**Location**: [File path]

**Contains**:
- `mockVariable1`: [Description]
- `mockVariable2`: [Description]
- `mockVariable3`: [Description]

---

## Migration Schedule

### Phase 2 (Week 1)
- [ ] Migrate [Component A] to real API
- [ ] Migrate [Component B] to real API

### Phase 2 (Week 2)
- [ ] Migrate [Component C] to real API
- [ ] Migrate [Component D] to real API

### Phase 3
- [ ] Remove all remaining mock data from production code
- [ ] Verify no mock data in release builds
- [ ] Keep mock data in tests only

---

## Quality Gates

### Before Phase 2
- [ ] All mock data documented in this registry
- [ ] Migration priorities assigned
- [ ] Real API availability confirmed
- [ ] Migration plan created

### Before Phase 3
- [ ] All P0 migrations complete
- [ ] All P1 migrations complete
- [ ] P2 migrations in progress
- [ ] No mock data in production builds

### Before Production
- [ ] Zero mock data in production code
- [ ] All tests still pass with test mocks
- [ ] Build verification confirms no mocks
- [ ] Code review confirms clean state

---

## Statistics

**Total Components Using Mocks**: [X]
**Migrations Complete**: [Y]
**Migrations In Progress**: [Z]
**Migrations Pending**: [W]
**Completion Percentage**: [Y/X * 100]%

---

## Notes

### Phase 1 Approach
[Description of mock data strategy for Phase 1]

### Phase 2 Migration Strategy
[Description of how migrations will be prioritized and executed]

### Phase 3 Verification
[How we'll verify all mock data is removed from production]
