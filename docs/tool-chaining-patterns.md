# Tool Chaining Patterns

**Version**: 1.0
**Last Updated**: 2025-01-20
**Purpose**: Document effective sequences of Zen MCP tools for common scenarios

---

## Overview

Tool chaining means using multiple Zen tools in sequence, often reusing `continuation_id` for context preservation. This results in:
- **Deeper analysis** through cumulative reasoning
- **Context preservation** across tool calls
- **Better decisions** through multi-stage validation
- **Institutional knowledge** through documented tool sequences

---

## Core Principles

### 1. Continuation ID Reuse

**Always save and reuse continuation IDs** when tools are related:

```yaml
# Step 1: Initial analysis
Tool: consensus
continuation_id: null  # First call
Result: continuation_id = "abc123"

# Step 2: Deep dive (reuses context)
Tool: thinkdeep
continuation_id: "abc123"  # Reuses consensus context
Result: continuation_id = "abc123"  # Same ID

# Step 3: Challenge (still same context)
Tool: challenge
continuation_id: "abc123"  # Full context chain
```

### 2. Save Tool Outputs

**Document all tool outputs** for future reference:
- Save continuation_id in relevant tracking documents
- Save full tool output to `tracking/knowledge-base/`
- Reference in ADRs, session notes, phase reports

### 3. Chain by Purpose

**Match tool sequence to goal**:
- Decision Making → `challenge` → `consensus` → ADR
- Bug Investigation → `debug` → `thinkdeep` → fix
- Quality Assurance → `analyze` → `refactor` → `codereview`
- Architecture → `thinkdeep` → `challenge` → `consensus`

---

## Pattern Library

### Pattern 1: Major Architectural Decision

**When to Use**:
- Choosing state management approach
- Selecting data persistence strategy
- Deciding API architecture
- Selecting framework or major library

**Tool Chain**:
```yaml
Step 1: Question the Assumption
Tool: challenge
Input: "We should use [proposed approach]"
Purpose: Identify hidden assumptions, edge cases
Save: continuation_id

Step 2: Multi-Model Analysis
Tool: consensus
continuation_id: [from challenge]
Models:
  - model: "gemini-2.5-pro"
    stance: "for"
    stance_prompt: "Argue for [proposed approach]"
  - model: "gpt-5-pro"
    stance: "against"
    stance_prompt: "Argue for [alternative approach]"
  - model: "claude-sonnet-4-5"
    stance: "neutral"
    stance_prompt: "Provide balanced analysis"
Purpose: Explore perspectives, identify trade-offs
Save: continuation_id, all model responses

Step 3: Deep Investigation (if needed)
Tool: thinkdeep
continuation_id: [from consensus]
Step: "Investigate [specific concern raised in consensus]"
Purpose: Systematic exploration of complex aspects
Save: continuation_id, findings

Step 4: Document Decision
Tool: Manual - Create ADR
Content:
  - Include all continuation IDs
  - Reference challenge, consensus, thinkdeep outputs
  - Document decision + rationale
Location: docs/adr/ADR-NNN-title.md
```

**Example**:
```markdown
Decision: SwiftUI State Management (@Observable vs TCA)

1. challenge: "We should use @Observable for state"
   → Identified: iOS 17+ requirement, team learning curve

2. consensus (abc123):
   → For @Observable: Simple, modern, type-safe
   → Against @Observable: iOS 17+ only, less proven
   → Neutral: Consider team experience, project scope

3. Document in ADR-001-swiftui-state-management.md
   → Continuation ID: abc123
   → Decision: Use @Observable (trade-off iOS 17+ accepted)
```

---

### Pattern 2: Complex Bug Investigation

**When to Use**:
- Bug with unclear root cause
- Intermittent failures
- Performance regressions
- Mysterious crashes

**Tool Chain**:
```yaml
Step 1: Initial Investigation
Tool: debug
Input:
  - Error message, stack trace
  - Steps to reproduce
  - Initial observations
Purpose: Identify potential causes
Save: continuation_id, hypothesis, findings

Step 2: Deep Analysis (if root cause unclear)
Tool: thinkdeep
continuation_id: [from debug]
Step: "Investigate hypothesis: [from debug]"
Purpose: Systematic exploration, hypothesis testing
Save: continuation_id, confirmed hypothesis

Step 3: Validate Root Cause
Tool: challenge
continuation_id: [from thinkdeep]
Input: "Root cause is [hypothesis]"
Purpose: Question the diagnosis before implementing fix
Save: validation notes

Step 4: Implement + Review
Implement fix
Tool: codereview
Step: "Review bug fix for [issue]"
Purpose: Ensure fix is correct and complete

Step 5: Verify Fix
Tool: precommit
Step: "Verify bug fix before commit"
Purpose: Final validation
```

**Example**:
```markdown
Bug: App crashes when deleting task with category

1. debug (def456):
   → Hypothesis: Missing cascade delete rule
   → Files: Task.swift, Category.swift, TaskStore.swift

2. thinkdeep (def456):
   → Confirmed: SwiftData relationship missing delete rule
   → Additional finding: Similar issue in other relationships

3. challenge: "Fix is to add .cascade delete rule"
   → Validated: Correct approach
   → Warning: Verify all relationships

4. Implement fix + add test
5. codereview: Passes
6. precommit: Passes
7. Commit with continuation_id reference
```

---

### Pattern 3: Phase Completion (Phase Gates)

**When to Use**:
- At end of every phase
- Before marking phase complete
- Required by quality gates

**Tool Chain**:
```yaml
Step 1: Quality Analysis
Tool: analyze
Input: Entire codebase or phase changes
Parameters:
  analysis_type: "general" or "quality"
Purpose: Establish quality baseline
Save: continuation_id, quality score, issues

Step 2: Technical Debt Analysis
Tool: refactor
Input: All files modified in phase
Parameters:
  refactor_type: "codesmells"
Purpose: Identify debt accumulation
Save: continuation_id, debt count by severity

Step 3: Performance Analysis
Tool: analyze
Parameters:
  analysis_type: "performance"
Purpose: Detect performance regressions
Save: continuation_id, performance metrics

Step 4: Document Findings
Update:
  - tracking/technical-debt-log.md
  - tracking/performance-baseline.md
  - tracking/knowledge-base/phase-X-quality-report.md
Include all continuation IDs for future reference

Step 5: Address CRITICAL Issues
If CRITICAL issues found:
  - Use debug to investigate
  - Fix immediately
  - Re-run analyze/refactor to verify
```

**Example**:
```markdown
Phase 2 Completion

1. analyze (ghi789) - general:
   → Quality Score: 85/100
   → 2 HIGH issues, 5 MEDIUM issues

2. refactor (jkl012):
   → CRITICAL: 0
   → HIGH: 2 (same as analyze found)
   → MEDIUM: 4
   → Total debt: +6 from Phase 1 (trend: increasing ⬆️)

3. analyze (mno345) - performance:
   → Build time: +5% (acceptable)
   → App launch: +12% (REGRESSION - investigate)

4. debug (pqr678) - for launch regression:
   → Root cause: N+1 query in dashboard
   → Fix implemented
   → Re-test: Launch time back to baseline

5. Document all findings, continuation IDs
6. Phase 2 COMPLETE ✅
```

---

### Pattern 4: Major Feature Addition

**When to Use**:
- Adding significant new functionality
- Complex feature spanning multiple files
- User-facing feature requiring UI

**Tool Chain**:
```yaml
Step 1: Planning
Tool: planner
Input: Feature requirements from PRD
Purpose: Break down into tasks with dependencies
Save: continuation_id, task breakdown

Step 2: Architecture (if significant)
Tool: thinkdeep
continuation_id: [from planner]
Step: "Architect [feature] following project patterns"
Purpose: Design before coding
Save: continuation_id, architecture decisions

If architectural decisions significant:
  Tool: challenge + consensus
  continuation_id: [from thinkdeep]
  Purpose: Validate architecture
  Document: Create ADR

Step 3: Implementation
Implement feature following plan
Follow normal development workflow

Step 4: Pre-Completion Review
Tool: codereview
Input: All feature files
Purpose: Quality check before marking complete
Save: continuation_id, findings

If codereview finds issues → refactor
Tool: refactor
Purpose: Get recommendations for improvements
Save: continuation_id

Step 5: Pre-Commit Validation
Tool: precommit
Purpose: Final check (MANDATORY)
Save: continuation_id

Step 6: Capture Evidence
Screenshots (if UI feature)
Test results (unit + integration)
Document in tracking/screenshots/ or tracking/evidence/
```

**Example**:
```markdown
Feature: Add Dark Mode Support

1. planner (stu901):
   → Task 1: Add theme state management
   → Task 2: Create theme toggle UI
   → Task 3: Update all views for theme support
   → Task 4: Add persistence
   → Dependency: Task 1 before 2-4

2. thinkdeep (stu901):
   → Architecture: Use @AppStorage for theme
   → Use environment value for theme propagation
   → Create ThemeManager @Observable class

3. Implement (3 commits for tasks 1-4)

4. codereview (vwx234):
   → Quality: 90/100
   → Finding: Extract color constants
   → Fixed: Created Colors enum

5. precommit (yz 567):
   → PASSED ✅

6. Screenshot: tracking/screenshots/phase-2-dark-mode.png
7. Feature COMPLETE ✅
```

---

### Pattern 5: Code Review + Improvement Cycle

**When to Use**:
- After implementing complex logic
- Before committing significant changes
- When code feels messy

**Tool Chain**:
```yaml
Step 1: Initial Review
Tool: codereview
Input: Files to review
Parameters:
  review_type: "full" or "quick"
Purpose: Identify issues and opportunities
Save: continuation_id, findings by severity

Step 2: Get Refactor Recommendations (if issues found)
Tool: refactor
Input: Same files as codereview
Parameters:
  refactor_type: "codesmells" or "decompose"
Purpose: Get concrete improvement suggestions
Save: continuation_id, recommendations

Step 3: Validate Approach (if major refactor)
Tool: consensus
continuation_id: [from refactor]
Input: "Should we refactor [X] to [Y]?"
Models: 2-3 with different perspectives
Purpose: Ensure refactor is worthwhile
Save: continuation_id, decision

Step 4: Implement Improvements
Apply refactorings
Test thoroughly

Step 5: Verify Improvement
Tool: codereview
Input: Refactored files
Purpose: Verify quality improved
Compare: Before score vs After score
```

**Example**:
```markdown
Code Review Cycle: TaskStore.swift

1. codereview (abc123):
   → Score: 70/100
   → HIGH: God class (too many responsibilities)
   → MEDIUM: Complex method (deleteTask)

2. refactor (abc123):
   → Recommendation: Extract TaskValidator
   → Recommendation: Extract TaskNotificationService
   → Recommendation: Simplify deleteTask with helper methods

3. consensus (abc123):
   → Decision: Extract services
   → All models agree: Improves testability + maintainability

4. Implement refactor:
   → Created TaskValidator.swift
   → Created TaskNotificationService.swift
   → Simplified TaskStore.swift

5. codereview (def456) - verify:
   → Score: 92/100 (improvement: +22)
   → All issues resolved ✅
```

---

### Pattern 6: Performance Optimization

**When to Use**:
- Performance regression detected
- Optimizing slow feature
- Proactive optimization

**Tool Chain**:
```yaml
Step 1: Baseline Analysis
Tool: analyze
Parameters:
  analysis_type: "performance"
Purpose: Identify bottlenecks
Save: continuation_id, performance metrics, slow areas

Step 2: Root Cause Investigation
Tool: thinkdeep
continuation_id: [from analyze]
Step: "Investigate performance bottleneck in [component]"
Purpose: Understand why it's slow
Save: continuation_id, root causes

Step 3: Optimization Strategy
Tool: consensus
continuation_id: [from thinkdeep]
Input: "How to optimize [bottleneck]?"
Models: Performance-focused analysis
Purpose: Explore optimization approaches
Save: continuation_id, chosen strategy

Step 4: Implement Optimizations
Apply improvements
Benchmark before/after

Step 5: Verify Improvement
Tool: analyze
Parameters:
  analysis_type: "performance"
Purpose: Measure improvement
Compare: Before metrics vs After metrics
Document: % improvement in performance-baseline.md
```

**Example**:
```markdown
Performance: Dashboard Load Time Slow

1. analyze (ghi789) - performance:
   → Dashboard load: 2.3 seconds (target: <1s)
   → Bottleneck: fetchData() making 15 sequential API calls

2. thinkdeep (ghi789):
   → Root cause: N+1 query pattern
   → Also: No caching, loading indicators missing

3. consensus (ghi789):
   → Strategy: Batch API calls + add caching
   → All models agree: Use single batch endpoint

4. Implement:
   → New API endpoint: /dashboard/batch
   → Client-side cache (5 min TTL)
   → Loading indicators

5. analyze (jkl012) - verify:
   → Dashboard load: 0.7 seconds
   → Improvement: -70% (2.3s → 0.7s) ✅

6. Document in performance-baseline.md
```

---

### Pattern 7: Pre-Release Validation

**When to Use**:
- Before shipping to production
- Before major demo
- End of final phase

**Tool Chain**:
```yaml
Step 1: Comprehensive Code Review
Tool: codereview
Parameters:
  review_type: "full"
Input: Entire codebase or all changes since last release
Purpose: Final quality check
Save: continuation_id, all findings

Step 2: Architecture Validation
Tool: analyze
Parameters:
  analysis_type: "architecture"
Purpose: Ensure architectural integrity
Save: continuation_id, architecture issues

Step 3: Security Review
Tool: analyze
Parameters:
  analysis_type: "security"
Purpose: Identify security concerns
Save: continuation_id, security findings

Step 4: Performance Validation
Tool: analyze
Parameters:
  analysis_type: "performance"
Purpose: Ensure performance acceptable
Compare: To performance budgets
Save: continuation_id, final metrics

Step 5: Pre-Commit All Changes
Tool: precommit
Purpose: Final validation before release commit
Save: continuation_id

Step 6: Release Documentation
Document:
  - All continuation IDs
  - All findings and resolutions
  - Performance metrics
  - Known issues (if any)
Location: tracking/releases/release-X.X.X.md
```

---

## Platform-Specific Patterns

### iOS Development

**Pattern: SwiftUI View Performance**
```yaml
1. analyze (performance) → Identify expensive views
2. thinkdeep → Understand re-render causes
3. refactor → Get optimization recommendations
4. Implement → Add @State carefully, use let when possible
5. analyze (performance) → Verify improvement
```

**Pattern: SwiftData Relationship Issues**
```yaml
1. debug → Investigate crash/data issue
2. thinkdeep → Understand relationship lifecycle
3. challenge → "Is this the right relationship structure?"
4. Fix + test
5. codereview → Verify relationship patterns correct
```

### Web Development

**Pattern: Bundle Size Optimization**
```yaml
1. analyze (performance) → Measure bundle size
2. thinkdeep → Identify heavy dependencies
3. consensus → "Should we replace [large lib] with lighter alternative?"
4. Implement → Replace or code-split
5. analyze (performance) → Measure improvement
```

**Pattern: React Re-render Optimization**
```yaml
1. analyze (performance) → Identify unnecessary re-renders
2. refactor → Get memoization recommendations
3. Implement → Add React.memo, useMemo, useCallback
4. analyze (performance) → Verify re-renders reduced
```

### Backend Development

**Pattern: API Performance Optimization**
```yaml
1. analyze (performance) → Identify slow endpoints
2. debug → Investigate database queries
3. thinkdeep → Understand N+1 queries or missing indexes
4. Implement → Add indexes, optimize queries
5. analyze (performance) → Verify endpoint speed
```

---

## Best Practices

### 1. Always Save Continuation IDs

**Where to save**:
- ✅ In ADRs (for architectural decisions)
- ✅ In technical-debt-log.md (for refactor analyses)
- ✅ In performance-baseline.md (for performance analyses)
- ✅ In session notes (for complex debugging)
- ✅ In tracking/knowledge-base/ (full tool outputs)

**Why it matters**:
- Future sessions can resume analysis
- Agent handoffs preserve context
- Builds institutional knowledge
- Enables context reuse

### 2. Chain Tools Purposefully

**Don't**:
- ❌ Run tools randomly hoping for insights
- ❌ Skip steps in validated patterns
- ❌ Ignore findings from earlier tools in chain

**Do**:
- ✅ Follow proven patterns for scenarios
- ✅ Reuse continuation IDs for context
- ✅ Document why you chose this chain
- ✅ Save all tool outputs

### 3. Document Tool Chains

**In ADRs**:
```markdown
## Validation Process

Tool Chain:
1. challenge → continuation_id: abc123
2. consensus → continuation_id: abc123
3. thinkdeep → continuation_id: abc123

See tracking/knowledge-base/architecture-decisions/ for full outputs
```

**In Session Notes**:
```markdown
## Bug Investigation

Tool Chain Used:
1. debug (def456) → hypothesis identified
2. thinkdeep (def456) → root cause confirmed
3. challenge → fix approach validated

Fix implemented, verified with precommit (ghi789)
```

### 4. Know When to Stop Chaining

**Stop when**:
- ✅ You have clear answer/decision
- ✅ Additional tools won't add value
- ✅ Confidence level is very_high or certain
- ✅ Diminishing returns

**Continue when**:
- ⚠️ Answer is unclear
- ⚠️ Multiple conflicting perspectives
- ⚠️ High complexity/risk
- ⚠️ Confidence level below high

---

## Continuation ID Management

### Tracking System

**Create**: `tracking/continuation-ids.md`

```markdown
# Continuation ID Reference

| ID | Tool Chain | Purpose | Created | Status | Location |
|----|------------|---------|---------|--------|----------|
| abc123 | challenge → consensus | SwiftUI state decision | 2025-01-15 | Complete | ADR-001 |
| def456 | debug → thinkdeep | Task deletion bug | 2025-01-16 | Resolved | Session notes |
| ghi789 | analyze (perf) | Phase 2 baseline | 2025-01-18 | Active | performance-baseline.md |
```

### Reuse Strategy

**When to reuse**:
- Next tool in planned chain
- Follow-up analysis in future session
- Agent handoff with context
- Building on previous decisions

**How to reuse**:
```yaml
Tool: thinkdeep
continuation_id: "abc123"  # From previous consensus
step: "Building on previous analysis..."
```

---

## Related Documentation

- [Zen Tools Guide](./zen-tools-guide.md) - Individual tool usage
- [ADR Template](./adr/template.md) - Decision documentation
- [Quality Gates](./quality-gates.md) - When to use tool chains
- [Session Management](./session-management.md) - Context preservation

---

**Last Updated**: 2025-01-20
**Version**: 1.0
**Maintained By**: Development Team
