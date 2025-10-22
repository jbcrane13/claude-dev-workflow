# Phase [N] Retrospective

**Phase**: [Phase number and name]
**Date**: [Date of retrospective]
**Duration**: Phase [N] ([Start date] - [End date])
**Participants**: [Agents/team members involved]

---

## Phase Summary

**Objective**: [What was the goal of this phase?]

**Deliverables**:
- [Feature 1]
- [Feature 2]
- [Feature 3]

**Status**: ✅ Complete / ⚠️ Partial / ❌ Incomplete

---

## Metrics & Performance

### Quality Metrics

| Metric | Phase [N] | Previous Phase | Change | Trend |
|--------|-----------|----------------|--------|-------|
| Quality Score (analyze) | X/100 | Y/100 | ±Z | ⬆️/➡️/⬇️ |
| CRITICAL Issues | X | Y | ±Z | ⬆️/➡️/⬇️ |
| HIGH Issues | X | Y | ±Z | ⬆️/➡️/⬇️ |
| Test Coverage | X% | Y% | ±Z% | ⬆️/➡️/⬇️ |

### Technical Debt

| Severity | Phase [N] | Previous Phase | Change | Trend |
|----------|-----------|----------------|--------|-------|
| CRITICAL | X | Y | ±Z | ⬆️/➡️/⬇️ |
| HIGH | X | Y | ±Z | ⬆️/➡️/⬇️ |
| MEDIUM | X | Y | ±Z | ⬆️/➡️/⬇️ |
| LOW | X | Y | ±Z | ⬆️/➡️/⬇️ |
| **TOTAL** | **X** | **Y** | **±Z** | **⬆️/➡️/⬇️** |

**Debt Trend**: Increasing / Stable / Decreasing
**Action**: [Describe plan to address if increasing]

### Performance

| Metric | Phase [N] | Baseline | Change | Status |
|--------|-----------|----------|--------|--------|
| Build Time | X s | Y s | ±Z% | ✅/⚠️/🚨 |
| App Launch | X ms | Y ms | ±Z% | ✅/⚠️/🚨 |
| Memory Usage | X MB | Y MB | ±Z% | ✅/⚠️/🚨 |
| Binary/Bundle Size | X MB | Y MB | ±Z% | ✅/⚠️/🚨 |

**Performance Status**: No regressions / Minor regressions / Significant regressions

### Process Metrics

| Metric | Count | Notes |
|--------|-------|-------|
| Commits | X | |
| PRs/Feature Branches | X | |
| ADRs Created | X | |
| Tool Chains Used | X | |
| Phase Gate Validations | X | (should be 3: analyze, refactor, performance) |
| Precommit Compliance | X% | (target: 100%) |

---

## What Went Well ✅

**1. [Success Item 1]**
- Description: [What happened]
- Impact: [Why it matters]
- Continue: [How to keep this going]

**2. [Success Item 2]**
- Description: [What happened]
- Impact: [Why it matters]
- Continue: [How to keep this going]

**3. [Success Item 3]**
- Description: [What happened]
- Impact: [Why it matters]
- Continue: [How to keep this going]

**Tool Usage Highlights**:
- `[tool name]`: [How it helped, continuation_id if significant]
- `[tool name]`: [How it helped, continuation_id if significant]

---

## What Could Be Improved ⚠️

**1. [Improvement Area 1]**
- Issue: [What didn't go well]
- Impact: [Why it matters]
- Root Cause: [Why it happened]
- Action: [Specific improvement for next phase]

**2. [Improvement Area 2]**
- Issue: [What didn't go well]
- Impact: [Why it matters]
- Root Cause: [Why it happened]
- Action: [Specific improvement for next phase]

**3. [Improvement Area 3]**
- Issue: [What didn't go well]
- Impact: [Why it matters]
- Root Cause: [Why it happened]
- Action: [Specific improvement for next phase]

**Process Gaps**:
- [Gap 1]: [Description and plan to address]
- [Gap 2]: [Description and plan to address]

---

## Challenges Faced 🚧

### Challenge 1: [Challenge Title]
**Description**: [What was the challenge]
**Impact**: [How it affected the phase]
**Resolution**: [How it was resolved or workaround]
**Tool Used**: [If a Zen tool helped, name it and continuation_id]
**Prevention**: [How to avoid in future]

### Challenge 2: [Challenge Title]
**Description**: [What was the challenge]
**Impact**: [How it affected the phase]
**Resolution**: [How it was resolved or workaround]
**Tool Used**: [If a Zen tool helped, name it and continuation_id]
**Prevention**: [How to avoid in future]

---

## Architecture & Design Decisions

### ADRs Created This Phase

| ADR | Title | Status | Impact | Tool Chain Used |
|-----|-------|--------|--------|-----------------|
| ADR-NNN | [Title] | Accepted | [High/Medium/Low] | challenge → consensus |
| ADR-NNN | [Title] | Accepted | [High/Medium/Low] | thinkdeep → consensus |

**Major Decisions**:
1. [Decision 1]: [Brief description and rationale]
2. [Decision 2]: [Brief description and rationale]

**Deferred Decisions**:
1. [Decision]: [Why deferred, when to revisit]

---

## Tool Effectiveness Analysis

### Tools Used This Phase

| Tool | Times Used | Effectiveness | Impact | Notes |
|------|------------|---------------|--------|-------|
| `planner` | X | ⭐⭐⭐⭐⭐ | High | [How it helped] |
| `analyze` | X | ⭐⭐⭐⭐⭐ | High | [Phase gates, quality baseline] |
| `refactor` | X | ⭐⭐⭐⭐⭐ | High | [Debt tracking] |
| `codereview` | X | ⭐⭐⭐⭐ | Medium | [Quality checks] |
| `debug` | X | ⭐⭐⭐⭐ | Medium | [Bug investigations] |
| `precommit` | X | ⭐⭐⭐⭐⭐ | Critical | [MANDATORY - should be 100%] |
| `consensus` | X | ⭐⭐⭐⭐ | High | [Decision making] |
| `challenge` | X | ⭐⭐⭐ | Medium | [Assumption questioning] |
| `thinkdeep` | X | ⭐⭐⭐⭐ | High | [Complex analysis] |

### Tool Chain Patterns Used

**Pattern 1**: [Pattern name, e.g., "Major Decision Pattern"]
- Tools: challenge → consensus → ADR
- Effectiveness: [How well it worked]
- Continuation IDs: [List IDs if preserved]
- Outcome: [Result of using this pattern]

**Pattern 2**: [Pattern name, e.g., "Phase Gate Pattern"]
- Tools: analyze → refactor → analyze (performance)
- Effectiveness: [How well it worked]
- Continuation IDs: [List IDs]
- Outcome: [What was discovered/improved]

### Recommendations for Next Phase

**Continue Using**:
- [Tool/pattern]: [Why it's effective]

**Use More Often**:
- [Tool/pattern]: [Where it could help]

**Use Differently**:
- [Tool/pattern]: [How to improve usage]

---

## Key Learnings

### Technical Learnings

**1. [Learning 1]**
- What we learned: [Description]
- How we learned it: [Tool/process that revealed this]
- Application: [How to use this knowledge]

**2. [Learning 2]**
- What we learned: [Description]
- How we learned it: [Tool/process that revealed this]
- Application: [How to use this knowledge]

### Process Learnings

**1. [Learning 1]**
- What we learned: [Description]
- Impact: [How it affects workflow]
- Change: [What we'll do differently]

**2. [Learning 2]**
- What we learned: [Description]
- Impact: [How it affects workflow]
- Change: [What we'll do differently]

---

## Action Items for Next Phase

### High Priority

- [ ] **[Action 1]**: [Description]
  - Owner: [Agent/team]
  - Target: [When]
  - Reason: [Why this is important]

- [ ] **[Action 2]**: [Description]
  - Owner: [Agent/team]
  - Target: [When]
  - Reason: [Why this is important]

### Medium Priority

- [ ] **[Action 3]**: [Description]
  - Owner: [Agent/team]
  - Target: [When]
  - Reason: [Why this is important]

### Technical Debt Reduction

- [ ] **[Debt Item 1]**: [Fix CRITICAL/HIGH debt]
  - Current: [Description of debt]
  - Plan: [How to fix]
  - Estimate: [Time estimate]

### Process Improvements

- [ ] **[Improvement 1]**: [Description]
  - Current state: [What happens now]
  - Desired state: [What should happen]
  - Implementation: [How to change]

---

## Comparison to Project Goals

### Original Phase Goals

**Goal 1**: [Original goal]
- Status: ✅ Achieved / ⚠️ Partial / ❌ Not achieved
- Notes: [What happened]

**Goal 2**: [Original goal]
- Status: ✅ Achieved / ⚠️ Partial / ❌ Not achieved
- Notes: [What happened]

### Stretch Goals

**Stretch Goal 1**: [Goal]
- Status: ✅ Achieved / ❌ Not attempted / ⏸️ Deferred
- Notes: [What happened]

---

## Next Phase Preview

**Phase [N+1] Objectives**:
1. [Objective 1]
2. [Objective 2]
3. [Objective 3]

**Focus Areas**:
- [Focus area 1]: [Why this is priority]
- [Focus area 2]: [Why this is priority]

**Technical Debt Budget**: [X hours/% of phase]

**Performance Goals**:
- [Goal 1]: [Target metric]
- [Goal 2]: [Target metric]

**Quality Goals**:
- Quality score: [Target]
- Test coverage: [Target %]
- Zero CRITICAL/HIGH issues

**Risks**:
- [Risk 1]: [Description and mitigation]
- [Risk 2]: [Description and mitigation]

---

## Retrospective Tool Analysis

**Retrospective Conducted With**:
- Tool: [If using consensus for retro analysis]
- Continuation ID: [If applicable]
- Models Consulted: [If applicable]

**External Validation**:
- [If you ran this retrospective through a validation tool]
- Findings: [What external validation revealed]

---

## Appendix

### Continuation IDs Reference

| Purpose | Tool(s) | Continuation ID | Location |
|---------|---------|-----------------|----------|
| Phase [N] Quality Analysis | analyze | [ID] | tracking/knowledge-base/phase-X-quality-report.md |
| Technical Debt Analysis | refactor | [ID] | tracking/technical-debt-log.md |
| Performance Baseline | analyze | [ID] | tracking/performance-baseline.md |
| [ADR Title] | consensus | [ID] | docs/adr/ADR-NNN.md |
| [Bug Investigation] | debug → thinkdeep | [ID] | Session notes [date] |

### Links to Artifacts

**Documentation**:
- Phase Summary: [Link or filename]
- Quality Report: tracking/knowledge-base/phase-X-quality-report.md
- ADRs: docs/adr/ (ADR-NNN through ADR-MMM)

**Evidence**:
- Screenshots: tracking/screenshots/phase-X-*
- Test Results: [Location]
- Performance Reports: tracking/performance-baseline.md

---

**Retrospective Date**: [Date]
**Next Retrospective**: End of Phase [N+1]
**Version**: 1.0
