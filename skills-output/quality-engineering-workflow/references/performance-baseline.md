# Performance Baseline & Regression Tracking

**Purpose**: Track performance metrics across phases to detect regressions early

**Last Updated**: [Date]
**Baseline Established**: [Phase number when baseline was set]
**Current Performance Status**: ✅ No regressions / ⚠️ Minor regression / 🚨 Significant regression

---

## Overview

Performance is tracked using the `analyze` tool with performance focus at the end of each phase. This log provides:
- Baseline performance metrics (Phase 1 completion)
- Phase-by-phase performance evolution
- Regression detection and investigation
- Performance improvement tracking

**Regression Threshold**: >10% slower than baseline triggers investigation

---

## Performance Metrics by Platform

### iOS Application

**Key Metrics**:
1. **Build Time**: Time from clean build to completion
2. **App Launch Time**: Cold start time (app not in memory)
3. **UI Responsiveness**: Time to first interaction
4. **Key Operations**: Critical user flows (3-5 most important)
5. **Memory Usage**: Peak memory during typical usage
6. **Binary Size**: Final .ipa size

### Android Application

**Key Metrics**:
1. **Build Time**: Gradle build time (clean build)
2. **App Launch Time**: Cold start time
3. **UI Frame Rate**: Jank-free frames percentage
4. **Key Operations**: Critical user flows
5. **Memory Usage**: Peak memory
6. **APK Size**: Final .apk size

### Web Application

**Key Metrics**:
1. **Build Time**: Production build time
2. **Page Load Time**: Time to interactive (TTI)
3. **First Contentful Paint**: FCP metric
4. **Largest Contentful Paint**: LCP metric
5. **Bundle Size**: Total JavaScript bundle size
6. **API Response Times**: Critical endpoints (p50, p95, p99)

### Backend API

**Key Metrics**:
1. **Build Time**: Compilation time
2. **Startup Time**: Time to ready state
3. **API Endpoint Performance**: Response times (p50, p95, p99)
4. **Database Query Performance**: Slow query log
5. **Memory Usage**: Peak memory under load
6. **Throughput**: Requests per second

---

## Phase 1 Baseline (Initial)

**Date**: [Date]
**Analyze Tool Used**: Yes / No
**Continuation ID**: [continuation_id from analyze tool]
**Platform**: [iOS / Android / Web / Backend]

### Build Metrics

| Metric | Value | Notes |
|--------|-------|-------|
| Clean Build Time | [X seconds] | [Build environment details] |
| Incremental Build Time | [X seconds] | [Average of 5 builds] |
| Binary/Bundle Size | [X MB] | [Before/after compression] |

### Runtime Metrics

| Metric | Value | Measurement Method | Device/Environment |
|--------|-------|-------------------|-------------------|
| App Launch (Cold Start) | [X ms] | [How measured] | [Device/browser] |
| Time to Interactive | [X ms] | [How measured] | [Device/browser] |
| Memory Usage (Peak) | [X MB] | [Typical usage scenario] | [Device/browser] |

### Critical User Flows

#### Flow 1: [Flow Name, e.g., "User Login"]
| Metric | Value | Notes |
|--------|-------|-------|
| Time to Complete | [X ms] | [From start to success] |
| Network Requests | [X count] | [Number of API calls] |
| Total Data Transferred | [X KB] | [Upload + download] |

#### Flow 2: [Flow Name, e.g., "Load Dashboard"]
| Metric | Value | Notes |
|--------|-------|-------|
| Time to Complete | [X ms] | [From tap to fully loaded] |
| Network Requests | [X count] | [Number of API calls] |
| Total Data Transferred | [X KB] | [Upload + download] |

#### Flow 3: [Flow Name, e.g., "Submit Form"]
| Metric | Value | Notes |
|--------|-------|-------|
| Time to Complete | [X ms] | [From submit to confirmation] |
| Network Requests | [X count] | [Number of API calls] |
| Total Data Transferred | [X KB] | [Upload + download] |

### Baseline Summary

**Overall Assessment**: [Summary from analyze tool]
**Performance Strengths**:
- [Strength 1]
- [Strength 2]

**Performance Concerns**:
- [Concern 1]
- [Concern 2]

**Full Analysis**: See `tracking/knowledge-base/performance-analysis/phase-1-baseline.md`

---

## Phase 2: [Phase Name]

**Date**: [Date]
**Analyze Tool Used**: Yes / No
**Continuation ID**: [continuation_id from analyze tool]

### Build Metrics Comparison

| Metric | Phase 1 (Baseline) | Phase 2 | Change | Trend | Status |
|--------|-------------------|---------|--------|-------|--------|
| Clean Build Time | [X s] | [Y s] | [+/-N s] ([+/-N%]) | ⬆️/➡️/⬇️ | ✅/⚠️/🚨 |
| Incremental Build | [X s] | [Y s] | [+/-N s] ([+/-N%]) | ⬆️/➡️/⬇️ | ✅/⚠️/🚨 |
| Binary Size | [X MB] | [Y MB] | [+/-N MB] ([+/-N%]) | ⬆️/➡️/⬇️ | ✅/⚠️/🚨 |

**Status Key**:
- ✅ No regression (<5% increase)
- ⚠️ Minor regression (5-10% increase)
- 🚨 Significant regression (>10% increase - requires investigation)

### Runtime Metrics Comparison

| Metric | Phase 1 (Baseline) | Phase 2 | Change | Trend | Status |
|--------|-------------------|---------|--------|-------|--------|
| App Launch | [X ms] | [Y ms] | [+/-N ms] ([+/-N%]) | ⬆️/➡️/⬇️ | ✅/⚠️/🚨 |
| Time to Interactive | [X ms] | [Y ms] | [+/-N ms] ([+/-N%]) | ⬆️/➡️/⬇️ | ✅/⚠️/🚨 |
| Memory Usage | [X MB] | [Y MB] | [+/-N MB] ([+/-N%]) | ⬆️/➡️/⬇️ | ✅/⚠️/🚨 |

### Critical Flow Comparison

| Flow | Phase 1 | Phase 2 | Change | Status | Notes |
|------|---------|---------|--------|--------|-------|
| User Login | [X ms] | [Y ms] | [+/-N%] | ✅/⚠️/🚨 | [Reason for change] |
| Load Dashboard | [X ms] | [Y ms] | [+/-N%] | ✅/⚠️/🚨 | [Reason for change] |
| Submit Form | [X ms] | [Y ms] | [+/-N%] | ✅/⚠️/🚨 | [Reason for change] |

### Performance Changes

**Improvements**:
- [Improvement 1: What improved and why]
- [Improvement 2: What improved and why]

**Regressions**:
- [Regression 1: What regressed and why]
- [Regression 2: What regressed and why]

**Root Cause Analysis** (if regressions detected):
- Investigation: [Summary]
- Tool Used: `debug` or `thinkdeep`
- Continuation ID: [continuation_id]
- Findings: [Key findings]
- Remediation Plan: [Plan to address]

**Full Analysis**: See `tracking/knowledge-base/performance-analysis/phase-2-comparison.md`

---

## Phase 3: [Phase Name]

[Repeat template above]

---

## Performance Trend Analysis

### Overall Trend Chart

| Phase | Build Time | App Launch | Memory | Binary Size | Overall Status |
|-------|------------|------------|--------|-------------|----------------|
| Phase 1 (Baseline) | [X s] | [Y ms] | [Z MB] | [A MB] | ✅ Baseline |
| Phase 2 | [X s] | [Y ms] | [Z MB] | [A MB] | ✅/⚠️/🚨 |
| Phase 3 | [X s] | [Y ms] | [Z MB] | [A MB] | ✅/⚠️/🚨 |

**Target**: Maintain or improve performance each phase

**Current Trend**:
- ✅ Performance improving or stable (good!)
- ⚠️ Minor regressions (monitor closely)
- 🚨 Significant regressions (action required)

---

## Regression Investigation Log

### Regression #1: [Description]

**Detected**: [Phase number and date]
**Severity**: Minor / Significant / Critical
**Impact**: [What user experience is affected]

**Metrics Affected**:
- [Metric 1]: [Baseline] → [Current] ([+N%])
- [Metric 2]: [Baseline] → [Current] ([+N%])

**Investigation**:
- Tool Used: `debug` / `thinkdeep` / `analyze`
- Continuation ID: [continuation_id]
- Root Cause: [What caused the regression]
- Related Code Changes: [Commits/features that introduced regression]

**Remediation**:
- Plan: [How to fix]
- Assigned To: [Phase or sprint]
- Status: 🔴 Open / 🟡 In Progress / 🟢 Fixed

**Verification** (after fix):
- Metric After Fix: [Value]
- Improvement: [%]
- Status: ✅ Resolved

---

## Performance Optimization Backlog

**Items Requiring Attention**:

| ID | Phase Added | Severity | Issue | Impact | Estimate | Target Fix |
|----|-------------|----------|-------|--------|----------|------------|
| PERF-001 | Phase 2 | 🚨 Significant | [Description] | [Impact] | [Hours] | Phase X |
| PERF-002 | Phase 2 | ⚠️ Minor | [Description] | [Impact] | [Hours] | Phase X |

---

## Performance Budgets (Platform-Specific)

### iOS Performance Budgets

| Metric | Budget (Target) | Current | Status |
|--------|----------------|---------|--------|
| Cold Start Time | < 1.0 second | [X ms] | ✅/❌ |
| Memory Usage | < 100 MB | [X MB] | ✅/❌ |
| Binary Size | < 50 MB | [X MB] | ✅/❌ |
| Critical Flow | < 500 ms | [X ms] | ✅/❌ |

### Web Performance Budgets

| Metric | Budget (Target) | Current | Status |
|--------|----------------|---------|--------|
| FCP | < 1.8 seconds | [X s] | ✅/❌ |
| LCP | < 2.5 seconds | [X s] | ✅/❌ |
| TTI | < 3.8 seconds | [X s] | ✅/❌ |
| Bundle Size | < 200 KB (gzipped) | [X KB] | ✅/❌ |

### Backend API Budgets

| Metric | Budget (Target) | Current | Status |
|--------|----------------|---------|--------|
| API p95 Response | < 200 ms | [X ms] | ✅/❌ |
| API p99 Response | < 500 ms | [X ms] | ✅/❌ |
| Database Query p95 | < 50 ms | [X ms] | ✅/❌ |

---

## Analyze Tool Usage

### When to Run

**Required**:
- ✅ Phase 1 completion (establish baseline)
- ✅ End of each subsequent phase (detect regressions)
- ✅ After significant performance optimizations (verify improvement)

**Optional (but recommended)**:
- Before releasing to production
- After adding resource-intensive features
- When users report slowness

### How to Run

```yaml
Tool: zen:analyze
Parameters:
  model: "gemini-2.5-pro"
  step: "Analyze Phase X performance and compare to baseline"
  findings: "Phase X complete, measuring performance metrics"
  relevant_files: [performance-critical files]
  analysis_type: "performance"
  step_number: 1
  total_steps: 1
  next_step_required: false
```

### Document Results

1. Save continuation_id in this log
2. Save full output to `tracking/knowledge-base/performance-analysis/phase-X-performance.md`
3. Update metrics in this log
4. Calculate % change from baseline
5. Flag regressions >10%
6. Investigate significant regressions immediately

---

## Best Practices

### Measurement Consistency

**To ensure accurate comparisons**:
- ✅ Use same device/environment for all measurements
- ✅ Measure multiple times (3-5 runs) and average
- ✅ Clear caches before cold start measurements
- ✅ Document measurement methodology
- ✅ Measure under same conditions (same time of day, same network, etc.)

### Regression Prevention

**Proactive Measures**:
- Run `analyze` (performance) at phase boundaries
- Set performance budgets and enforce them
- Profile before and after major changes
- Use `debug` for performance investigations
- Monitor trends, not just absolute values

### Platform-Specific Tips

**iOS**:
- Use Instruments for detailed profiling
- Monitor SwiftUI view body call frequency
- Check for retain cycles causing memory growth
- Profile on oldest supported device

**Web**:
- Use Lighthouse for comprehensive metrics
- Enable production build for accurate measurements
- Test on throttled networks (Fast 3G, Slow 3G)
- Monitor bundle size with bundlesize or size-limit

**Backend**:
- Use APM tools (New Relic, DataDog) for production metrics
- Monitor database query performance
- Profile under realistic load
- Watch for N+1 queries

---

## Related Documentation

- [Quality Gates](../docs/quality-gates.md) - Phase completion requirements
- [Zen Tools Guide](../docs/zen-tools-guide.md) - How to use analyze tool
- [Project Management](../docs/project-management.md) - Phase planning

---

**Last Updated**: [Date]
**Next Measurement**: End of current phase
**Maintained By**: Testing Agent + Development Team

---

## Quick Reference

**Phase Gate Checklist** (copy to phase-status.md):
```markdown
Performance Analysis:
- [ ] Run `analyze` tool (performance focus)
- [ ] Measure all baseline metrics
- [ ] Compare to previous phase (if not Phase 1)
- [ ] Calculate % change for each metric
- [ ] Flag regressions >10%
- [ ] Investigate significant regressions with `debug`
- [ ] Document findings in performance-baseline.md
- [ ] Save continuation_id and full output
- [ ] Update performance trend status
```
