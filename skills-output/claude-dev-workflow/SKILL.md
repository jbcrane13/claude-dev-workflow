# Claude Dev Workflow - Phase-Based AI Development

**Version**: 3.1.0
**Skill Type**: Comprehensive Development Methodology
**Platform Support**: iOS, macOS, Web, Multi-platform

## When to Use This Skill

Invoke this skill when you need to:

1. **Start a New Project**
   - iOS/macOS/Web application development
   - Any project requiring multi-agent coordination
   - Phase-based incremental delivery required

2. **Enforce Development Standards**
   - SwiftUI/SwiftData mandatory standards (iOS/macOS)
   - Quality gates and phase gates enforcement
   - Pre-commit workflow validation

3. **Manage Complex Projects**
   - Multi-feature applications (3+ features)
   - Multi-file refactoring or architectural changes
   - Projects requiring parallel agent teams

4. **Quality & Testing**
   - Implementing quality gates before task completion
   - Running phase gates at phase boundaries
   - Managing technical debt and performance baselines

5. **Use Zen MCP Tools Effectively**
   - Code review (`codereview`), debugging (`debug`), analysis (`analyze`)
   - Tool chaining patterns for complex scenarios
   - Pre-commit validation workflows

6. **Architecture Decisions**
   - Creating Architecture Decision Records (ADRs)
   - Multi-model consensus building
   - Documenting major technical choices

---

## Core Workflow Philosophy

This workflow emphasizes:
- **Proactive Quality**: Prevent problems before they occur (phase gates, ADRs, debt tracking)
- **Parallel Execution**: Multiple specialized agents working simultaneously
- **Incremental Delivery**: Working features at every phase boundary
- **Session Continuity**: Context preservation across agent handoffs
- **Mandatory Standards**: Non-negotiable technical requirements

---

## ⚠️ MANDATORY REQUIREMENTS

### 1. Multi-Agent Team Deployment

**When to Deploy Teams:**

❓ **Is this an iOS/Android/Web project with 3+ features?**
- **YES** → ✅ **DEPLOY MULTI-AGENT TEAM**
- **NO** → Single agent acceptable for prototypes only

❓ **Complex bug fix affecting multiple files/systems?**
- **YES** → ✅ **DEPLOY MULTI-AGENT TEAM**

❓ **Major refactoring or architectural change?**
- **YES** → ✅ **DEPLOY MULTI-AGENT TEAM**

**DEFAULT**: If uncertain, deploy the team.

#### iOS/macOS Development Team (5 agents)

```yaml
Team Structure:
  Coordinator Agent:
    - Workflow management
    - Quality gate enforcement
    - Session continuity
    - Tools: planner, consensus, challenge

  Architecture Agent:
    - SwiftUI architecture
    - SwiftData models
    - Tools: analyze, thinkdeep, apilookup

  Feature Development Agents (2):
    - Parallel feature implementation
    - UI and business logic
    - Tools: codereview, debug, refactor

  Testing Agent:
    - Unit/UI tests
    - Quality verification
    - Tools: precommit, debug
```

#### Web Development Team (6 agents)

```yaml
Team Structure:
  Coordinator Agent:
    - Workflow orchestration
    - Quality enforcement

  Backend Agent:
    - API development
    - Database design
    - Tools: analyze, debug

  Frontend Agent:
    - UI implementation
    - State management
    - Tools: codereview, refactor

  UI/UX Agent:
    - Design system
    - Component library
    - Tools: analyze, challenge

  Database Agent:
    - Schema design
    - Query optimization
    - Tools: analyze, refactor

  Testing Agent:
    - Integration tests
    - E2E testing
    - Tools: precommit, debug
```

---

### 2. Platform Standards (iOS/macOS)

**MANDATORY Technologies:**

✅ **MUST Use:**
- **SwiftUI** (exclusively for UI) - iOS 17.0+ / macOS 14.0+
- **SwiftData** (data persistence only)
- **@Observable** (state management only)
- **async/await** (all async operations)
- **NavigationStack** (iOS) or **NavigationSplitView** (macOS)

❌ **FORBIDDEN:**
- UIKit/AppKit (unless SwiftUI genuinely lacks capability)
- Core Data (use SwiftData)
- Combine / @Published / @ObservableObject / @StateObject
- Completion handler closures (use async/await)
- NavigationView (deprecated)

---

### 3. Quality Gates (Task/Feature Completion)

**Before marking ANY task complete:**

**Code Quality:**
- ✅ Follows platform guidelines
- ✅ Code review passed (`zen codereview`)
- ✅ Pre-commit checks passed (`zen precommit`) - **MANDATORY**
- ✅ No linting errors

**Functionality:**
- ✅ Feature works as specified
- ✅ **Screenshot evidence provided** (saved in `tracking/screenshots/`)
- ✅ No crashes or critical bugs
- ✅ Navigation flows verified

**Testing:**
- ✅ Unit tests written and passing
- ✅ Integration tests (where applicable)
- ✅ Minimum 70% code coverage

**Build:**
- ✅ Clean build with no errors
- ✅ Runs successfully on target platform
- ✅ Feature accessible and functional

---

### 4. Phase Gates (Phase Completion)

**At END of EVERY phase - MANDATORY sequence:**

```yaml
Phase Completion Checklist:

1. zen analyze (quality focus)
   → Establish quality baseline
   → Save continuation_id
   → Document in tracking/knowledge-base/phase-X-quality-report.md

2. zen refactor (codesmells)
   → Identify technical debt
   → Save continuation_id
   → Update tracking/technical-debt-log.md
   → Track trend: ⬆️ Increasing / ➡️ Stable / ⬇️ Decreasing

3. zen analyze (performance focus)
   → Measure platform-specific metrics
   → Save continuation_id
   → Update tracking/performance-baseline.md
   → Flag regressions >10%

4. Address ALL critical/high severity issues

5. Create phase-X-summary.md with all continuation IDs
```

**Time Investment**: 15-20 minutes per phase
**Value**: Prevents 50-70% of bugs from reaching later phases

---

## Phase-Based Development Structure

### Phase 0: Foundation

```yaml
Activities:
  - Create Product Requirements Document (PRD)
  - Project setup and tooling
  - Use zen planner with PRD
  - Define mock data strategy
  - Establish quality gates

Deliverables:
  - Complete PRD
  - Project scaffolding
  - Detailed project plan
  - Mock data registry
  - Quality gate definitions
```

### Phase 1: Core P1 Features

```yaml
Activities:
  - Minimal viable functionality
  - Essential user flows
  - Basic UI (fully functional)
  - Mock data implementation

Quality Gates:
  - ✅ Build + Run + Screenshot
  - ✅ Unit tests passing
  - ✅ zen precommit passed
  - ✅ zen codereview passed

Phase Gates:
  - ✅ analyze (quality)
  - ✅ refactor (debt)
  - ✅ analyze (performance)
```

### Phase 2+: Enhanced Features

```yaml
Activities:
  - P2 priority features
  - Improved UX
  - Real API integration (transition from mock data)
  - Performance optimization

Quality Gates:
  - ✅ All Phase 1 gates
  - ✅ Integration tests passing
  - ✅ 70% test coverage minimum

Phase Gates:
  - ✅ All mandatory phase gate analyses
  - ✅ Technical debt trend monitored
  - ✅ Performance regression checks
```

### Phase N: Polish & Launch

```yaml
Activities:
  - Performance optimization (zen refactor)
  - Comprehensive testing
  - Production readiness checks
  - Security review

Quality Gates:
  - ✅ All tests passing (unit + integration + E2E)
  - ✅ Production build succeeds
  - ✅ Accessibility standards met
  - ✅ Security reviewed

Phase Gates:
  - ✅ Final comprehensive analyze
  - ✅ Zero critical/high technical debt
  - ✅ Performance benchmarks met
```

---

## Proactive Quality System

### Tier 1: Mandatory (Every Project)

#### 1. Phase Gates
Run at every phase boundary (see Phase Gates section above)

#### 2. Architecture Decision Records (ADRs)

**For Major Decisions:**
```yaml
Decision Workflow:
1. zen challenge → Question assumptions
2. zen consensus → Multi-model analysis
   → Use 2-3 models with different stances (for/against/neutral)
   → Save continuation_id
3. (Optional) zen thinkdeep → Deep investigation
   → Reuse continuation_id for context
4. Create ADR → docs/adr/ADR-NNN-title.md
   → Include all continuation IDs
   → Document alternatives, rationale, trade-offs
```

**ADR-Worthy Decisions:**
- State management approach
- Data persistence strategy
- API architecture (REST vs GraphQL)
- Navigation patterns
- Major framework/library choices

**Time**: 20-30 minutes per decision
**Value**: Better decisions, preserved knowledge, future context

#### 3. Technical Debt Monitoring

**Every Phase End:**
```yaml
Debt Tracking:
1. zen refactor (part of phase gates)
2. Log debt count by severity in tracking/technical-debt-log.md
3. Compare to previous phase
4. If debt increasing ⬆️:
   → Budget 10-20% of next phase for debt reduction
   → Address CRITICAL immediately
```

**Time**: 10-15 minutes per phase (included in phase gates)
**Value**: Prevents debt snowball, makes debt visible

---

### Tier 2: High Value (Recommended)

#### 4. Performance Baseline & Regression Detection

**Platform-Specific Metrics:**

**iOS/macOS:**
- Build time
- Cold start time
- Memory usage
- Binary size

**Web:**
- Bundle size
- Time to Interactive (TTI)
- First Contentful Paint (FCP)
- Largest Contentful Paint (LCP)

**Backend:**
- API response times (p50/p95/p99)
- Throughput (requests/second)
- Database query performance

**Process:**
- Phase 1: Establish baseline
- Phase 2+: Compare and detect >10% regressions

#### 5. Tool Chaining Patterns

**Common Sequences:**

**Major Architectural Decision:**
```
challenge → consensus (save ID) → thinkdeep (reuse ID) → ADR
```

**Complex Bug Investigation:**
```
debug (step 1-3) → analyze (reuse ID) → refactor (fix)
```

**Phase Completion:**
```
analyze (quality) → refactor (debt) → analyze (performance) → summary
```

**Major Feature Addition:**
```
planner → consensus → codereview (incremental) → precommit
```

**Code Review + Improvement:**
```
codereview → refactor (issues) → codereview (verification)
```

**Performance Optimization:**
```
analyze (perf baseline) → refactor (optimize) → analyze (verify)
```

**Pre-Release Validation:**
```
precommit → codereview → analyze → consensus (go/no-go)
```

#### 6. Knowledge Base System

**Structure:**
```
tracking/knowledge-base/
├── architecture-decisions/  # ADR tool outputs
│   ├── ADR-001-state-management.md
│   └── consensus-continuation-ABC123.md
├── performance-analysis/     # analyze (perf) outputs
│   ├── phase-1-baseline.md
│   └── phase-2-comparison.md
├── technical-debt/           # refactor outputs
│   ├── phase-1-debt-analysis.md
│   └── phase-2-debt-analysis.md
└── retrospectives/           # Phase retrospectives
    ├── phase-1-retro.md
    └── phase-2-retro.md
```

**Purpose:**
- Preserve continuation IDs for context reuse
- Enable agent handoffs with full context
- Build institutional knowledge
- Reference tool chain patterns

---

## Zen MCP Tools Usage

### Throughout Development Lifecycle

| Phase | Primary Tools | Purpose |
|-------|--------------|---------|
| **Planning** | `planner`, `thinkdeep` | Break down project, identify dependencies |
| **Architecture** | `analyze`, `thinkdeep`, `consensus` | Design decisions, pattern selection |
| **Development** | `chat`, `apilookup` | Implementation support, API docs |
| **Code Review** | `codereview`, `challenge` | Quality assurance, critical review |
| **Debugging** | `debug`, `analyze` | Issue resolution, root cause analysis |
| **Pre-Commit** | `precommit`, `codereview` | MANDATORY validation before commit |
| **Refactoring** | `refactor`, `consensus` | Code improvement, team alignment |

### Key Tool Characteristics

**`planner`**
- Sequential planning with revision/branching
- Use with PRD for project breakdown
- Creates phase structure

**`consensus`**
- Multi-model debate (for/against/neutral stances)
- 2-3 models minimum
- Preserves continuation_id

**`analyze`**
- Architecture, performance, security, quality analysis
- Step-by-step investigation
- Focus areas: architecture, performance, security, general

**`refactor`**
- Code smell detection
- Decomposition planning
- Modernization opportunities
- Types: codesmells, decompose, modernize, organization

**`codereview`**
- Systematic code review
- Quality, security, performance, architecture
- Review types: full, security, performance, quick

**`debug`**
- Root cause analysis
- Hypothesis testing
- Evidence gathering

**`precommit`**
- Git change validation
- MANDATORY before every commit
- Multi-repository support

**`challenge`**
- Critical thinking enforcer
- Questions assumptions
- Use before major decisions

**`thinkdeep`**
- Complex problem analysis
- Multi-stage reasoning
- Evidence-based investigation

---

## Session Management

### Every Session Start

1. **Load Context**
   ```yaml
   zen chat:
     continuation_id: [previous session ID]
     prompt: "Resume work on [project/feature]"
   ```

2. **Review State**
   - Check `tracking/phase-status.md`
   - Review `tracking/session-state.md`
   - Verify mock data registry

3. **Check Phase**
   - Current phase number
   - Remaining tasks
   - Blockers

### During Work

1. **Update Regularly**
   - Session state documentation
   - Phase progress
   - Mock data transitions

2. **Document Decisions**
   - Create ADRs for major choices
   - Save continuation IDs
   - Track tool chains

3. **Track Dependencies**
   - Blocker identification
   - Cross-agent dependencies
   - API integration status

### Session Handoff

1. **State Documentation**
   ```markdown
   ## Handoff Summary

   **Date**: [timestamp]
   **From**: [Agent Name/Role]
   **To**: [Next Agent/Role]
   **Phase**: [Current Phase]

   ### Completed
   - [Task 1]
   - [Task 2]

   ### In Progress
   - [Task with details]

   ### Blockers
   - [Blocker description]

   ### Continuation IDs
   - analyze: ABC123
   - consensus: DEF456

   ### Next Steps
   1. [Clear action item]
   2. [Clear action item]
   ```

2. **Context Preservation**
   - All continuation IDs documented
   - Tool chain sequences noted
   - Decision rationale captured

### Before ANY Commit

**MANDATORY Pre-Commit Workflow:**

```yaml
1. Stage Changes:
   git add [files]
   git status

2. Run zen precommit (NO EXCEPTIONS):
   Tool: zen:precommit
   Parameters:
     path: "/absolute/path/to/repo"
     include_staged: true
     include_unstaged: false
     model: "gemini-2.5-pro" # or preferred
     step_number: 1
     total_steps: 3
     next_step_required: true

3. Address ALL Findings:
   - Fix CRITICAL immediately
   - Fix HIGH priority
   - Document or fix MEDIUM/LOW
   - Re-run if changes made

4. Commit ONLY After Passing:
   git commit -m "feat: description

   Details...

   Zen precommit: PASSED ✅"

5. Verify:
   - Build passes
   - Tests pass
   - No new issues
```

---

## Mock Data Strategy

### Principles

**Track Everything:**
- Which components use mock data
- Mock data structure and location
- Target real API endpoint
- Migration priority and timeline

**Transition Early:**
- **Phase 1**: Mock data acceptable for P1 features
- **Phase 2**: Begin real API integration
- **Phase 3**: All mock data replaced (except tests)

### Mock Data Registry

**Location**: `tracking/mock-data-registry.md`

**Format:**
```markdown
| Component | Mock Data | Real Endpoint | Priority | Phase | Status |
|-----------|-----------|---------------|----------|-------|--------|
| UserList | users.json | /api/users | P1 | 2 | Migrated |
| Products | products.json | /api/products | P2 | 3 | Pending |
```

**Process:**
1. Document all mock data in Phase 0
2. Plan migration timeline
3. Update status as real APIs integrate
4. Keep test mocks permanently

---

## Project Structure

```
project-root/
├── claude.md                          # Master workflow index
├── docs/
│   ├── PRD.md                         # Product requirements
│   ├── agent-deployment.md            # Team structures
│   ├── project-management.md          # Phase planning
│   ├── session-management.md          # Continuity
│   ├── ios-development.md             # iOS standards
│   ├── mac-development.md             # macOS standards
│   ├── testing-guidelines.md          # Testing requirements
│   ├── zen-tools-guide.md             # Zen MCP usage
│   ├── tool-chaining-patterns.md      # Tool sequences
│   ├── mock-data-strategy.md          # Data strategy
│   ├── quality-gates.md               # Completion criteria
│   └── adr/
│       ├── README.md                  # ADR guide
│       ├── template.md                # ADR template
│       └── ADR-NNN-title.md           # Individual ADRs
├── tracking/
│   ├── phase-status.md                # Current phase
│   ├── session-state.md               # Session context
│   ├── mock-data-registry.md          # Mock data tracking
│   ├── technical-debt-log.md          # Debt monitoring
│   ├── performance-baseline.md        # Performance metrics
│   ├── screenshots/                   # Feature evidence
│   └── knowledge-base/
│       ├── architecture-decisions/    # ADRs & consensus
│       ├── performance-analysis/      # Performance reports
│       ├── technical-debt/            # Refactor outputs
│       └── retrospectives/            # Phase retros
├── project/
│   ├── [App].xcodeproj               # iOS/macOS
│   └── [App]/
│       ├── App/
│       ├── Models/
│       ├── Views/
│       ├── Stores/
│       └── Tests/
└── README.md
```

---

## Quick Start Workflow

### For New iOS/macOS Projects

```yaml
Phase 0: Setup
  1. Review this skill completely
  2. Create PRD (docs/PRD.md)
  3. Review agent deployment patterns
  4. Review platform-specific standards (iOS or macOS)
  5. Use zen planner with PRD
  6. Deploy 5-agent team (Coordinator + Arch + Features + Testing)

Phase 1: Core Features
  1. Coordinator assigns P1 tasks to agents
  2. Parallel feature implementation
  3. Mock data for all external dependencies
  4. Quality gates before task completion
  5. Phase gates at phase end
  6. Screenshot all features

Phase 2+: Enhancement
  1. P2+ features
  2. Migrate mock → real APIs
  3. Performance optimization
  4. Continuous testing
  5. Phase gates mandatory

Phase N: Polish
  1. zen refactor (optimization)
  2. Comprehensive testing
  3. Production build
  4. Security review
  5. Final phase gates
  6. Ready for deployment
```

### For Web Projects

```yaml
Phase 0: Setup
  1-5: Same as iOS/macOS
  6. Deploy 6-agent team (Coordinator + Backend + Frontend + UI + DB + Testing)

Phase 1-N: Similar to iOS but with:
  - Backend/Frontend parallel development
  - Database design and optimization
  - Cross-browser testing
  - Bundle size monitoring
```

---

## Success Criteria

### Project Complete When:

**All Phases Delivered:**
- ✅ P1 features fully functional
- ✅ P2+ features implemented
- ✅ All quality gates passed
- ✅ All phase gates completed

**Quality Standards Met:**
- ✅ All tests passing
- ✅ Code reviews completed
- ✅ Pre-commit checks green
- ✅ No critical bugs
- ✅ 70%+ test coverage

**Documentation Complete:**
- ✅ User-facing documentation
- ✅ Technical documentation
- ✅ API documentation
- ✅ ADRs for major decisions

**Production Ready:**
- ✅ Performance acceptable
- ✅ Accessibility standards met
- ✅ Security reviewed
- ✅ Ready for deployment

---

## Common Pitfalls & Solutions

### Pitfall 1: Skipping Pre-Commit
**Problem**: Committing without `zen precommit`
**Solution**: NEVER commit without passing precommit. No exceptions.

### Pitfall 2: Solo Development on Complex Projects
**Problem**: One agent doing multi-feature work
**Solution**: Deploy multi-agent team per decision tree

### Pitfall 3: Violating Platform Standards
**Problem**: Using Core Data or UIKit on iOS
**Solution**: Strictly follow MANDATORY standards (SwiftUI/SwiftData)

### Pitfall 4: Skipping Phase Gates
**Problem**: Moving to next phase without running analyze/refactor
**Solution**: Run all three mandatory phase gate analyses

### Pitfall 5: No Screenshot Evidence
**Problem**: Marking features complete without screenshots
**Solution**: Always save screenshots to `tracking/screenshots/`

### Pitfall 6: Mock Data Lingering
**Problem**: Mock data still in use in Phase 3+
**Solution**: Plan migration in Phase 0, execute in Phase 2

### Pitfall 7: Lost Context on Handoffs
**Problem**: Next agent doesn't know what was done
**Solution**: Document continuation IDs and create handoff summary

### Pitfall 8: No ADRs for Major Decisions
**Problem**: Forgetting why technical choices were made
**Solution**: Use challenge → consensus → ADR workflow

---

## Platform-Specific Quick Reference

### iOS Development

**Mandatory Stack:**
- SwiftUI (iOS 17.0+)
- SwiftData
- @Observable
- async/await
- NavigationStack

**Forbidden:**
- UIKit, Core Data, Combine, NavigationView

**Phase Gates Metrics:**
- Build time
- Cold start
- Memory
- Binary size

### macOS Development

**Mandatory Stack:**
- SwiftUI (macOS 14.0+)
- SwiftData
- @Observable
- async/await
- NavigationSplitView (or NavigationStack for simple apps)

**Forbidden:**
- AppKit, Core Data, Combine, NavigationView

**Phase Gates Metrics:**
- Build time
- Cold start
- Memory
- App size

### Web Development

**Phase Gates Metrics:**
- Bundle size
- TTI, FCP, LCP
- API response times

---

## Version History

| Version | Date | Changes |
|---------|------|---------|
| 3.1.0 | 2025-01-30 | Added proactive quality system, phase gates, ADRs |
| 3.0.0 | 2025-01-25 | Added macOS support, expanded quality gates |
| 2.0.0 | 2025-01-20 | Complete modular workflow with Zen tools |
| 1.0.0 | 2025-01-20 | Initial iOS guidelines |

---

## Additional Resources

**Reference Documents** (included in skill):
- Detailed agent deployment patterns
- Platform-specific development guidelines (iOS, macOS)
- Comprehensive quality gates checklist
- Tool chaining pattern library
- ADR templates and examples
- Testing guidelines
- Session management best practices

**Use Cases:**
- Starting any new iOS/macOS/Web project
- Enforcing quality standards
- Managing multi-agent teams
- Debugging complex issues
- Making architectural decisions
- Tracking technical debt
- Optimizing performance

---

## Summary

This skill provides a complete phase-based development workflow with:
- **Mandatory standards** (multi-agent teams, platform tech stacks, quality gates, phase gates)
- **Proactive quality** (prevent problems before they occur)
- **Zen MCP integration** (leverage advanced AI collaboration tools)
- **Session continuity** (preserve context across handoffs)
- **Incremental delivery** (working features at every phase)

**Remember**: Nothing is complete until it builds, runs, has passing tests, passing precommit, screenshot proof, and all phase gates completed! 📸 ✅
