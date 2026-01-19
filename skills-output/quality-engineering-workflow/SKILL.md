# Quality Engineering Workflow - Proactive Quality System

**Version**: 3.1.0
**Focus**: Quality Gates, Phase Gates, Testing, Technical Debt, Performance
**Philosophy**: Prevent problems before they occur

## When to Use This Skill

Invoke this skill when you need:

1. **Quality Gate Enforcement**
   - Verify completion criteria before marking tasks done
   - Ensure pre-commit validation runs
   - Screenshot evidence requirements
   - Build and test verification

2. **Phase Gate Implementation**
   - Run mandatory phase boundary analyses
   - Track technical debt trends
   - Monitor performance baselines
   - Document quality metrics

3. **Proactive Quality Practices**
   - Architecture Decision Records (ADRs)
   - Technical debt monitoring
   - Performance regression detection
   - Continuous quality improvement

4. **Testing Strategy**
   - Unit testing guidelines
   - Integration testing patterns
   - Test coverage requirements
   - Platform-specific testing (iOS, macOS, Web)

5. **Zen Tools for Quality**
   - `precommit` mandatory workflow
   - `codereview` systematic review
   - `analyze` quality assessment
   - `refactor` debt identification

---

## Quality Philosophy

### Reactive → Proactive Shift

**Before** (Reactive):
- Fix bugs when they happen
- Review code before completion
- Refactor when code smells obvious

**Now** (Proactive):
- **Phase Gates**: Mandatory quality checks at every phase boundary
- **ADRs**: Document decisions before implementation
- **Continuous Monitoring**: Track quality/debt/performance trends

**Result**: 50-70% fewer bugs reach later phases

---

## ⚠️ MANDATORY: Quality Gates

### Before Marking ANY Task/Feature Complete

#### Code Quality Checklist

- [ ] **Follows project guidelines** (platform-specific: iOS/macOS/Web)
- [ ] **Code review passed** (`zen codereview`)
- [ ] **Pre-commit checks passed** (`zen precommit`) - **NO EXCEPTIONS**
- [ ] **No linting errors or warnings**
- [ ] **Code comments** for complex logic
- [ ] **No debug code** (console.logs, print statements, etc.)

#### Functionality Checklist

- [ ] **Feature works as specified** (PRD requirements met)
- [ ] **Screenshot evidence provided** (saved in `tracking/screenshots/`)
- [ ] **No crashes or critical bugs**
- [ ] **Navigation/user flows verified**
- [ ] **Error handling implemented**
- [ ] **Loading states handled**

#### Testing Checklist

- [ ] **Unit tests written and passing**
- [ ] **Integration tests** (where applicable)
- [ ] **70% minimum test coverage**
- [ ] **Edge cases covered**
- [ ] **Error scenarios tested**

#### Build Verification Checklist

- [ ] **Clean build with zero errors**
- [ ] **Zero warnings** (treat warnings as errors)
- [ ] **Runs successfully on target platform**
- [ ] **Feature accessible and functional**
- [ ] **No performance regressions**

#### Documentation Checklist

- [ ] **Code commented** (why, not what)
- [ ] **README updated** (if needed)
- [ ] **API docs updated** (if applicable)
- [ ] **Mock data registry updated**

#### Pre-Commit Verification (MANDATORY)

- [ ] **`zen precommit` executed successfully**
- [ ] **All precommit findings addressed**
- [ ] **No critical or high severity issues**
- [ ] **Build passes after all changes**
- [ ] **Tests pass after all changes**

---

## ⚠️ MANDATORY: Phase Gates

### At END of EVERY Phase

Phase gates are **mandatory** quality checkpoints run at phase boundaries.

#### Phase Completion Sequence

```yaml
1. zen analyze (quality focus)
   Purpose: Establish quality baseline
   Focus Areas:
     - Code quality and maintainability
     - Architecture consistency
     - Design patterns
     - Security considerations

   Actions:
     - Run analysis
     - Save continuation_id
     - Document findings in tracking/knowledge-base/phase-X-quality-report.md

2. zen refactor (codesmells)
   Purpose: Identify technical debt
   Focus Areas:
     - Code smells
     - Decomposition opportunities
     - Modernization needs
     - Organization improvements

   Actions:
     - Run refactor analysis
     - Save continuation_id
     - Update tracking/technical-debt-log.md
     - Calculate debt trend: ⬆️ Increasing / ➡️ Stable / ⬇️ Decreasing

3. zen analyze (performance focus)
   Purpose: Measure performance metrics
   Platform-Specific Metrics:
     iOS/macOS: Build time, cold start, memory, binary size
     Web: Bundle size, TTI, FCP, LCP
     Backend: API response times (p50/p95/p99), throughput

   Actions:
     - Run performance analysis
     - Save continuation_id
     - Update tracking/performance-baseline.md
     - Flag regressions >10%

4. Address Critical/High Issues
   - Fix ALL critical severity issues
   - Fix ALL high severity issues
   - Document or schedule medium/low issues

5. Create Phase Summary
   - Document all continuation IDs
   - Summarize key findings
   - Track quality trends
   - Save as tracking/knowledge-base/phase-X-summary.md
```

**Time Investment**: 15-20 minutes per phase
**Value**: Prevents 50-70% of bugs from reaching later phases

---

## Pre-Commit Workflow (MANDATORY)

### ⚠️ CRITICAL: NO Commits Without Precommit

**Rule**: NO commits are allowed without successfully running `zen precommit` first.

### Pre-Commit Checklist

#### 1. Stage Changes

```bash
git add [files]
git status  # Verify staged changes
```

#### 2. Run zen precommit (MANDATORY)

```yaml
Tool: zen:precommit
Parameters:
  model: "gemini-2.5-pro"  # or preferred model
  step: "Verify changes ready for commit: [brief description]"
  findings: "All features implemented, tests passing"
  path: "/absolute/path/to/repo"
  include_staged: true
  include_unstaged: false  # Only check what will be committed
  relevant_files:
    - [list all modified files - absolute paths]
  step_number: 1
  total_steps: 3
  next_step_required: true
  precommit_type: "external"  # or "internal" for local-only
```

#### 3. Address ALL Findings

- ✅ **Fix critical issues immediately**
- ✅ **Fix high priority issues**
- ✅ **Document or fix medium/low issues**
- ✅ **Re-run precommit if changes made**
- ❌ **Do NOT commit with unresolved critical/high issues**

#### 4. Commit ONLY After Passing

```bash
git commit -m "feat: descriptive message

- Detail 1
- Detail 2
- Detail 3

Zen precommit: PASSED ✅"
```

#### 5. Post-Commit Verification

- ✅ Build still passes after commit
- ✅ Tests still pass after commit
- ✅ No new issues introduced

### When to Run Precommit

**Required** (MANDATORY):
- ✅ Before EVERY git commit
- ✅ Before marking any task complete
- ✅ Before marking any phase complete
- ✅ Before any handoff to another agent
- ✅ After fixing any bugs/issues

**Optional** (Recommended):
- Before major refactoring
- After merging branches
- Before starting new work (verify clean state)

---

## Proactive Quality System

### Tier 1: Mandatory (Every Project)

#### 1. Phase Gates
- Run at every phase boundary
- See Phase Gates section above
- Track quality/debt/performance trends
- Document all findings

#### 2. Architecture Decision Records (ADRs)

**For Major Decisions**:
```yaml
Decision Workflow:
1. zen challenge
   → Question assumptions
   → Identify alternatives
   → Save continuation_id

2. zen consensus
   → Multi-model analysis (for/against/neutral)
   → Use 2-3 models with different stances
   → Save continuation_id

3. (Optional) zen thinkdeep
   → Deep investigation if complex
   → Reuse continuation_id for context
   → Save continuation_id

4. Create ADR
   → docs/adr/ADR-NNN-title.md
   → Include all continuation IDs
   → Document alternatives, rationale, trade-offs
```

**ADR-Worthy Decisions**:
- State management approach
- Data persistence strategy
- API architecture (REST vs GraphQL)
- Navigation patterns
- Major framework/library choices
- Security architecture
- Deployment strategy

**Time**: 20-30 minutes per decision
**Value**: Better decisions, preserved knowledge, future context

**ADR Template**:
```markdown
# ADR-NNN: [Decision Title]

**Date**: YYYY-MM-DD
**Status**: [Proposed | Accepted | Deprecated | Superseded]

## Context
[What is the issue we're facing? What forces are at play?]

## Decision
[What decision have we made?]

## Alternatives Considered
1. **[Alternative 1]**
   - Pros: ...
   - Cons: ...

2. **[Alternative 2]**
   - Pros: ...
   - Cons: ...

## Rationale
[Why did we choose this over alternatives?]

## Consequences

**Positive**:
- [Benefit 1]
- [Benefit 2]

**Negative**:
- [Trade-off 1]
- [Trade-off 2]

## Tool Chain
- challenge continuation ID: ABC123
- consensus continuation ID: DEF456
- thinkdeep continuation ID: GHI789
```

#### 3. Technical Debt Monitoring

**Every Phase End**:
```yaml
Debt Tracking Process:
1. Run zen refactor (part of phase gates)
2. Count issues by severity
3. Log in tracking/technical-debt-log.md
4. Compare to previous phase
5. Calculate trend:
   ⬆️ Increasing: Debt growing (BAD)
   ➡️ Stable: Debt constant (NEUTRAL)
   ⬇️ Decreasing: Debt shrinking (GOOD)
6. If increasing ⬆️:
   → Budget 10-20% of next phase for debt reduction
   → Address CRITICAL immediately
```

**Technical Debt Log Format**:
```markdown
# Technical Debt Log

## Phase 1 (2025-01-20)
| Severity | Count | Examples |
|----------|-------|----------|
| Critical | 0 | - |
| High | 2 | Complex view hierarchy, duplicate logic |
| Medium | 5 | Missing error handling, no input validation |
| Low | 8 | Magic numbers, inconsistent naming |

**Trend**: ➡️ Baseline (first phase)

## Phase 2 (2025-01-25)
| Severity | Count | Examples |
|----------|-------|----------|
| Critical | 0 | - |
| High | 1 | Complex view hierarchy (fixed duplicate logic) |
| Medium | 6 | Added API error handling (new debt) |
| Low | 6 | Fixed magic numbers |

**Trend**: ⬇️ Decreasing (High: 2→1, Low: 8→6)
**Action**: Continue current pace
```

---

### Tier 2: High Value (Recommended)

#### 4. Performance Baseline & Regression Detection

**Phase 1**: Establish baseline
**Phase 2+**: Compare and detect regressions

**Platform-Specific Metrics**:

**iOS**:
- Build time (incremental)
- Cold start time
- Memory usage (idle)
- Binary size (.ipa)

**macOS**:
- Build time (incremental)
- Cold start time
- Memory usage (idle)
- App size (.app bundle)

**Web**:
- Bundle size (gzipped)
- Time to Interactive (TTI)
- First Contentful Paint (FCP)
- Largest Contentful Paint (LCP)

**Backend**:
- API response times (p50/p95/p99)
- Throughput (requests/second)
- Database query performance

**Performance Baseline Format**:
```markdown
# Performance Baseline

## iOS App

### Phase 1 Baseline (2025-01-20)
| Metric | Value | Target |
|--------|-------|--------|
| Build time | 28s | <30s |
| Cold start | 0.8s | <1s |
| Memory (idle) | 42MB | <50MB |
| Binary size | 15MB | <20MB |

### Phase 2 Comparison (2025-01-25)
| Metric | Phase 1 | Phase 2 | Change | Status |
|--------|---------|---------|--------|--------|
| Build time | 28s | 32s | +14% | ⚠️ Warning |
| Cold start | 0.8s | 0.9s | +13% | ✅ OK |
| Memory | 42MB | 45MB | +7% | ✅ OK |
| Binary size | 15MB | 16.5MB | +10% | ⚠️ Threshold |

**Regressions**: Build time increased 14%, investigate compilation bottlenecks
**Actions**: Profile build time, optimize slow modules
```

#### 5. Tool Chaining Patterns

**Use proven sequences for common scenarios**:

**Major Architectural Decision**:
```
challenge → consensus (save ID) → thinkdeep (reuse ID) → ADR
```

**Complex Bug Investigation**:
```
debug (step 1-3) → analyze (reuse ID) → refactor (fix)
```

**Phase Completion** (MANDATORY):
```
analyze (quality) → refactor (debt) → analyze (performance) → summary
```

**Major Feature Addition**:
```
planner → consensus → codereview (incremental) → precommit
```

**Code Review + Improvement**:
```
codereview → refactor (issues) → codereview (verification)
```

**Performance Optimization**:
```
analyze (perf baseline) → refactor (optimize) → analyze (verify improvement)
```

**Pre-Release Validation**:
```
precommit → codereview → analyze → consensus (go/no-go decision)
```

#### 6. Knowledge Base System

**Structure**:
```
tracking/knowledge-base/
├── architecture-decisions/
│   ├── ADR-001-state-management.md
│   ├── ADR-002-data-persistence.md
│   └── consensus-continuation-ABC123.md
├── performance-analysis/
│   ├── phase-1-baseline.md
│   ├── phase-2-comparison.md
│   └── analyze-continuation-DEF456.md
├── technical-debt/
│   ├── phase-1-debt-analysis.md
│   ├── phase-2-debt-analysis.md
│   └── refactor-continuation-GHI789.md
└── retrospectives/
    ├── phase-1-retro.md
    └── phase-2-retro.md
```

**Purpose**:
- Preserve continuation IDs for context reuse
- Enable agent handoffs with full context
- Build institutional knowledge
- Reference tool chain patterns
- Track decision rationale over time

---

## Testing Guidelines

### Testing Philosophy

**Pyramid Model**:
```
      /\\
     /UI\\      (Few) - Slow, brittle, expensive
    /----\\
   /Integ\\     (Some) - Medium speed, moderate cost
  /--------\\
 /   Unit   \\  (Many) - Fast, reliable, cheap
/--------------\\
```

### Unit Testing

**What to Test**:
- Business logic
- Data transformations
- Validation rules
- State management
- Error handling

**What NOT to Test**:
- SwiftUI view rendering (use UI tests)
- Third-party library internals
- Simple getters/setters

**Unit Test Example** (iOS/macOS):
```swift
import XCTest
@testable import MyApp

final class UserStoreTests: XCTestCase {
    var store: UserStore!

    override func setUp() {
        super.setUp()
        store = UserStore()
    }

    func testLoadUsersSuccess() async throws {
        // Arrange
        let expectedCount = 5

        // Act
        await store.loadUsers()

        // Assert
        XCTAssertFalse(store.isLoading)
        XCTAssertEqual(store.users.count, expectedCount)
        XCTAssertNil(store.errorMessage)
    }

    func testLoadUsersError() async {
        // Test error handling
        // ...
    }

    func testUserValidation() {
        // Test validation logic
        // ...
    }
}
```

### Integration Testing

**What to Test**:
- API integration
- Database operations
- Multi-component interactions
- Navigation flows

**Integration Test Example**:
```swift
final class APIIntegrationTests: XCTestCase {
    func testFetchUsersFromAPI() async throws {
        let client = APIClient()

        let users = try await client.fetchUsers()

        XCTAssertFalse(users.isEmpty)
        XCTAssertNotNil(users.first?.id)
    }
}
```

### UI Testing

**What to Test**:
- Critical user flows
- Navigation sequences
- Form submissions
- Error state displays

**UI Test Example** (iOS/macOS):
```swift
final class MyAppUITests: XCTestCase {
    func testLoginFlow() throws {
        let app = XCUIApplication()
        app.launch()

        // Enter credentials
        let emailField = app.textFields["Email"]
        emailField.tap()
        emailField.typeText("user@example.com")

        let passwordField = app.secureTextFields["Password"]
        passwordField.tap()
        passwordField.typeText("password123")

        // Submit
        app.buttons["Log In"].tap()

        // Verify success
        XCTAssertTrue(app.navigationBars["Dashboard"].exists)
    }
}
```

### Test Coverage Requirements

**Minimum**: 70% overall coverage

**Target Coverage by Component**:
- Business logic / stores: 90%+
- Data models: 80%+
- Utilities / helpers: 85%+
- Views (SwiftUI): 30%+ (mostly integration/UI tests)
- Networking: 80%+

### Testing Best Practices

1. **AAA Pattern**: Arrange, Act, Assert
2. **One assertion concept per test**
3. **Descriptive test names**: `testLoadUsersHandlesNetworkError`
4. **Test edge cases**: empty lists, nil values, boundary conditions
5. **Mock external dependencies**: APIs, databases
6. **Fast tests**: Unit tests <100ms, integration <1s
7. **Independent tests**: No test depends on another
8. **Deterministic**: Same result every time

---

## Zen Tools for Quality

### zen precommit (MANDATORY)

**Purpose**: Validate git changes before commit
**When**: Before EVERY commit (no exceptions)

```yaml
Usage:
  Tool: zen:precommit
  Validates:
    - Code quality
    - Standards compliance
    - Build succeeds
    - Tests pass
    - No critical issues
```

**Workflow**:
1. Stage changes
2. Run `zen precommit`
3. Address ALL findings
4. Commit only after passing

### zen codereview

**Purpose**: Systematic code review
**When**: Before marking features complete, during development

```yaml
Usage:
  Tool: zen:codereview
  Review Types:
    - full: Complete review (quality, security, performance, architecture)
    - security: Security-focused
    - performance: Performance-focused
    - quick: Quick validation

  Focus Areas:
    - Code quality
    - Security vulnerabilities
    - Performance issues
    - Architecture consistency
```

**Workflow**:
1. Complete feature implementation
2. Run `zen codereview`
3. Address findings
4. Re-run if significant changes
5. Mark complete after passing

### zen analyze

**Purpose**: Comprehensive code analysis
**When**: Phase gates, major features, architectural review

```yaml
Usage:
  Tool: zen:analyze
  Analysis Types:
    - architecture: Design patterns, structure
    - performance: Performance characteristics
    - security: Security analysis
    - quality: Overall quality assessment
    - general: Comprehensive analysis
```

**Workflow**:
1. Complete phase or major feature
2. Run `zen analyze` (appropriate type)
3. Document findings
4. Save continuation_id
5. Create action items

### zen refactor

**Purpose**: Code smell detection, improvement opportunities
**When**: Phase gates, refactoring planning

```yaml
Usage:
  Tool: zen:refactor
  Refactor Types:
    - codesmells: Identify code smells
    - decompose: Decomposition opportunities
    - modernize: Modernization needs
    - organization: Code organization improvements
```

**Workflow**:
1. Run `zen refactor`
2. Review identified issues
3. Prioritize by severity
4. Create action items
5. Track in technical debt log

### zen debug

**Purpose**: Root cause analysis, bug investigation
**When**: Bugs, crashes, mysterious behavior

```yaml
Usage:
  Tool: zen:debug
  Process:
    - Hypothesis formation
    - Evidence gathering
    - Root cause identification
    - Fix validation
```

**Workflow**:
1. Describe issue
2. Run `zen debug` (step-by-step investigation)
3. Test hypothesis
4. Implement fix
5. Verify resolution

### zen challenge

**Purpose**: Critical thinking, assumption questioning
**When**: Before major decisions, when validating claims

```yaml
Usage:
  Tool: zen:challenge
  Purpose:
    - Question assumptions
    - Identify alternatives
    - Prevent reflexive agreement
```

**Workflow**:
1. State decision or claim
2. Run `zen challenge`
3. Review critical analysis
4. Use output for `consensus` or `thinkdeep`

### zen consensus

**Purpose**: Multi-model debate, decision validation
**When**: Major decisions, controversial choices

```yaml
Usage:
  Tool: zen:consensus
  Process:
    - 2-3 models minimum
    - Different stances (for/against/neutral)
    - Structured debate
    - Synthesis of perspectives
```

**Workflow**:
1. Define decision question
2. Run `zen consensus` (specify models and stances)
3. Review multi-model perspectives
4. Make informed decision
5. Create ADR with continuation_id

---

## Quality Metrics Tracking

### Quality Scorecard

Track these metrics across phases:

**Code Quality**:
- Linting errors: 0 (mandatory)
- Warnings: 0 (treat as errors)
- Code review pass rate: 100%
- Pre-commit pass rate: 100%

**Testing**:
- Test coverage: ≥70%
- Tests passing: 100%
- Test reliability: <1% flaky tests

**Technical Debt**:
- Critical issues: 0
- High issues: <5
- Debt trend: ⬇️ Decreasing or ➡️ Stable

**Performance**:
- Build time regression: <15%
- Runtime regression: <20%
- Memory regression: <25%
- Size regression: <10%

**Process Compliance**:
- Pre-commit usage: 100%
- Phase gates completed: 100%
- ADRs for major decisions: 100%
- Screenshot evidence: 100%

---

## Common Quality Pitfalls

### Pitfall 1: Skipping Pre-Commit
**Problem**: Committing without `zen precommit`
**Impact**: Bugs slip through, quality gates fail
**Solution**: NEVER commit without running precommit. No exceptions.

### Pitfall 2: Ignoring Phase Gates
**Problem**: Moving to next phase without running mandatory analyses
**Impact**: Technical debt accumulates, quality degrades
**Solution**: Run all three phase gate analyses. Address critical/high issues.

### Pitfall 3: No Screenshot Evidence
**Problem**: Marking features complete without visual proof
**Impact**: Features may not actually work, no audit trail
**Solution**: Always capture and save screenshots to `tracking/screenshots/`

### Pitfall 4: Low Test Coverage
**Problem**: <70% test coverage, critical paths untested
**Impact**: Bugs in production, regressions
**Solution**: Write tests first or alongside code. Aim for 80%+

### Pitfall 5: No ADRs for Major Decisions
**Problem**: Forgetting why decisions were made
**Impact**: Lost context, repeated debates, poor future decisions
**Solution**: Use challenge → consensus → ADR workflow for all major decisions

### Pitfall 6: Ignoring Technical Debt Trends
**Problem**: Debt increasing ⬆️ unchecked
**Impact**: Codebase becomes unmaintainable
**Solution**: Track debt every phase. Budget 10-20% for reduction if increasing.

### Pitfall 7: Not Addressing Precommit Findings
**Problem**: Committing with unresolved critical/high issues
**Impact**: Poor code quality, future bugs
**Solution**: Fix ALL critical/high issues before committing

### Pitfall 8: No Performance Baselines
**Problem**: Can't detect performance regressions
**Impact**: App becomes slow over time
**Solution**: Establish baseline in Phase 1, track every phase

---

## Quality Resources

**Included in Skill**:
- Complete quality gates checklist
- Phase gates implementation guide
- Pre-commit workflow (mandatory)
- Testing guidelines (unit, integration, UI)
- ADR templates and examples
- Technical debt tracking
- Performance baseline monitoring
- Tool chaining patterns for quality

**Use This Skill When**:
- Enforcing quality gates before task completion
- Running phase gates at phase boundaries
- Implementing mandatory pre-commit workflow
- Establishing testing strategy
- Tracking technical debt
- Monitoring performance
- Creating ADRs for major decisions
- Using Zen tools for quality assurance

---

## Summary

This skill provides a comprehensive quality engineering system with:
- **Quality Gates**: Mandatory checks before task completion
- **Phase Gates**: Three-step analysis at every phase boundary
- **Pre-Commit**: MANDATORY validation before every commit
- **Proactive Quality**: Prevent problems before they occur
- **ADRs**: Document architectural decisions systematically
- **Technical Debt**: Track and manage debt trends
- **Performance**: Baseline and regression detection
- **Testing**: Comprehensive testing strategy
- **Zen Tools**: Leverage AI for quality assurance

**Result**: 50-70% fewer bugs, better architecture decisions, visible quality trends, sustainable codebase.

**Remember**: Nothing is complete without passing quality gates, phase gates, precommit, tests, and screenshot evidence! 🚦 ✅
