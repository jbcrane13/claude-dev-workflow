# Technical Debt Tracking Log

**Purpose**: Track technical debt accumulation and reduction trends across project phases

**Last Updated**: [Date]
**Current Debt Level**: [Total debt points or count]
**Trend**: ⬆️ Increasing / ➡️ Stable / ⬇️ Decreasing

---

## Overview

Technical debt is tracked at the end of each phase using the `refactor` tool. This log provides visibility into:
- Debt accumulation trends
- High-priority debt items
- Debt reduction progress
- Phase-by-phase debt evolution

---

## Debt Severity Classification

| Severity | Description | Action Required |
|----------|-------------|-----------------|
| **CRITICAL** | Code smells that will cause bugs/security issues | Fix immediately |
| **HIGH** | Significant maintainability issues, performance problems | Fix in current/next phase |
| **MEDIUM** | Moderate code smells, minor duplication | Budget for future phase |
| **LOW** | Style issues, minor improvements | Address when touching code |

---

## Phase-by-Phase Debt Tracking

### Phase 0: Foundation

**Date**: [Date]
**Refactor Tool Used**: Yes / No
**Continuation ID**: [continuation_id from refactor tool]

| Severity | Count | Change from Previous | Notes |
|----------|-------|----------------------|-------|
| CRITICAL | 0 | N/A (baseline) | N/A |
| HIGH | 0 | N/A (baseline) | N/A |
| MEDIUM | 0 | N/A (baseline) | N/A |
| LOW | 0 | N/A (baseline) | N/A |
| **TOTAL** | **0** | **N/A** | |

**Debt Items**:
- None (new project)

**Analysis Summary**:
[Summary from refactor tool]

---

### Phase 1: [Phase Name]

**Date**: [Date]
**Refactor Tool Used**: Yes / No
**Continuation ID**: [continuation_id from refactor tool]
**Files Analyzed**: [Number of files]

| Severity | Count | Change from Phase 0 | Trend | Notes |
|----------|-------|---------------------|-------|-------|
| CRITICAL | X | +X / -X / ±0 | ⬆️/➡️/⬇️ | [Notes] |
| HIGH | X | +X / -X / ±0 | ⬆️/➡️/⬇️ | [Notes] |
| MEDIUM | X | +X / -X / ±0 | ⬆️/➡️/⬇️ | [Notes] |
| LOW | X | +X / -X / ±0 | ⬆️/➡️/⬇️ | [Notes] |
| **TOTAL** | **X** | **±X** | **⬆️/➡️/⬇️** | |

**New Debt Items (High Priority)**:

#### CRITICAL Issues
1. **[Issue Title]**
   - Location: [File:Line or Component]
   - Description: [What's wrong]
   - Impact: [Why it matters]
   - Fix Estimate: [Time estimate]
   - Planned Fix: [Phase/Sprint]
   - Status: 🔴 Open / 🟡 In Progress / 🟢 Fixed

#### HIGH Issues
1. **[Issue Title]**
   - Location: [File:Line]
   - Description: [What's wrong]
   - Impact: [Why it matters]
   - Fix Estimate: [Time estimate]
   - Planned Fix: [Phase/Sprint]
   - Status: 🔴 Open / 🟡 In Progress / 🟢 Fixed

**Debt Reduced** (from previous phase):
- [Item fixed]
- [Item refactored]

**Analysis Summary**:
[Summary from refactor tool - key findings]

**Refactor Tool Output**: See `tracking/knowledge-base/technical-debt/phase-1-refactor.md`

---

### Phase 2: [Phase Name]

[Repeat template above]

---

## Debt Trend Analysis

### Overall Trend Chart

| Phase | CRITICAL | HIGH | MEDIUM | LOW | TOTAL | Trend |
|-------|----------|------|--------|-----|-------|-------|
| Phase 0 | 0 | 0 | 0 | 0 | 0 | Baseline |
| Phase 1 | X | X | X | X | X | ⬆️/➡️/⬇️ |
| Phase 2 | X | X | X | X | X | ⬆️/➡️/⬇️ |
| Phase 3 | X | X | X | X | X | ⬆️/➡️/⬇️ |

**Target**: Maintain or reduce total debt each phase

**Current Status**:
- ✅ Debt decreasing (good!)
- ⚠️ Debt stable (acceptable, but watch for accumulation)
- 🚨 Debt increasing (action required - budget debt reduction time)

---

## High-Priority Debt Backlog

**Items Requiring Attention** (CRITICAL + HIGH only):

| ID | Phase Added | Severity | Issue | Location | Impact | Estimate | Target Fix |
|----|-------------|----------|-------|----------|--------|----------|------------|
| TD-001 | Phase 1 | CRITICAL | [Description] | [File] | [Impact] | [Hours] | Phase X |
| TD-002 | Phase 1 | HIGH | [Description] | [File] | [Impact] | [Hours] | Phase X |
| TD-003 | Phase 2 | CRITICAL | [Description] | [File] | [Impact] | [Hours] | Phase X |

---

## Debt Reduction Strategy

### Phase-by-Phase Budget

**Phase 1**: Focus on new features, establish baseline
**Phase 2**: Budget 10-15% of time for debt reduction
**Phase 3**: Budget 15-20% if debt increasing, otherwise 10%
**Phase N**: Adjust based on trend

### Prioritization Rules

1. **CRITICAL**: Fix immediately, block other work if necessary
2. **HIGH**: Budget time in current or next phase
3. **MEDIUM**: Address opportunistically when touching related code
4. **LOW**: Fix only if time available

### Debt Prevention

**Proactive Measures**:
- Run `refactor` analysis BEFORE marking features complete
- Address debt in code review (`codereview` tool)
- Run `precommit` to catch issues early
- Allocate "refactor time" each phase

---

## Platform-Specific Debt Patterns

### iOS Development

**Common Debt Types**:
- Force unwrapping (`!`) without nil checks
- Retain cycles (weak/unowned missing)
- SwiftUI state management issues
- SwiftData relationship issues
- Massive View Controllers

**Tools to Use**:
- `refactor` with Swift-specific patterns
- `analyze` for architecture issues
- `codereview` for best practices

### Android Development

**Common Debt Types**:
- Memory leaks (Context leaks)
- Main thread violations
- Improper lifecycle handling
- God classes/activities

### Web Development

**Common Debt Types**:
- Prop drilling (React)
- Massive components
- Unused dependencies
- Performance anti-patterns (unnecessary re-renders)

### Backend Development

**Common Debt Types**:
- N+1 queries
- Missing error handling
- Improper resource cleanup
- Coupling between layers

---

## Refactor Tool Usage

### When to Run

**Required**:
- ✅ End of each phase (phase gate requirement)
- ✅ Before marking major features complete
- ✅ After significant refactoring (verify improvement)

**Optional (but recommended)**:
- When code smells are suspected
- Before starting new phase (understand current state)
- After adding new features

### How to Run

```yaml
Tool: zen:refactor
Parameters:
  model: "gemini-2.5-pro"
  step: "Analyze Phase X code for technical debt and refactoring opportunities"
  findings: "Phase X complete, identifying debt before closure"
  relevant_files: [all files modified in phase]
  refactor_type: "codesmells"  # or decompose, modernize, organization
  confidence: "complete"
  step_number: 1
  total_steps: 1
  next_step_required: false
```

### Document Results

1. Save continuation_id in this log
2. Save full output to `tracking/knowledge-base/technical-debt/phase-X-refactor.md`
3. Update debt counts in this log
4. Create TODO items for CRITICAL/HIGH debt
5. Budget time in next phase for debt reduction

---

## Lessons Learned

### What Causes Debt Accumulation

**Observed Patterns**:
- [Pattern 1: e.g., "Skipping code review for 'small' changes"]
- [Pattern 2: e.g., "Not running refactor tool until phase end"]
- [Pattern 3: e.g., "Delaying MEDIUM fixes indefinitely"]

### Prevention Strategies

**What Works**:
- ✅ Running `refactor` at phase boundaries
- ✅ Addressing CRITICAL immediately
- ✅ Budgeting debt reduction time
- ✅ Using `codereview` to catch debt early

**What Doesn't Work**:
- ❌ "We'll fix it later" mentality
- ❌ Ignoring MEDIUM debt indefinitely
- ❌ Not tracking debt trends

---

## Related Documentation

- [Quality Gates](../docs/quality-gates.md) - Phase completion requirements
- [Zen Tools Guide](../docs/zen-tools-guide.md) - How to use refactor tool
- [Project Management](../docs/project-management.md) - Phase planning

---

**Last Updated**: [Date]
**Next Review**: End of current phase
**Maintained By**: Coordinator Agent + Development Team

---

## Quick Reference

**Phase Gate Checklist** (copy to phase-status.md):
```markdown
Technical Debt Analysis:
- [ ] Run `refactor` tool on all phase files
- [ ] Document findings in technical-debt-log.md
- [ ] Save continuation_id and full output
- [ ] Update debt trend (increasing/stable/decreasing)
- [ ] Create TODOs for CRITICAL/HIGH items
- [ ] Budget debt reduction time in next phase (if increasing)
```
