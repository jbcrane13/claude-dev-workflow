# Workflow Enforcement Implementation Guide

**Version**: 3.0
**Last Updated**: 2025-01-20
**Purpose**: Comprehensive guide for implementing quality gate workflow enforcement in any development project

**⚠️ CRITICAL UPDATE v3.0**: ZEN PRECOMMIT IS NOW ABSOLUTELY MANDATORY BEFORE ANY COMMIT - NO EXCEPTIONS

---

## Executive Summary

This guide documents a complete workflow enforcement system that ensures AI agents (and human developers) follow quality gates for every commit. The system was created after discovering that 5 commits were made without running required precommit and codereview validations, resulting in 0% quality gate compliance.

**Version 3.0 Update**: Added explicit enforcement of zen `precommit` tool as a **hard requirement** before ANY git commit. This requirement is now integrated throughout all workflow documentation and enforced at multiple levels.

**Results After Implementation**:
- Compliance improved from 33% → 81% in one session
- 3 CRITICAL issues found and fixed immediately
- 17 total issues identified through retroactive validation
- 100% compliance for all new commits

---

## Table of Contents

1. [Problem Statement](#problem-statement)
2. [⚠️ Zen Precommit: Mandatory Requirement](#-zen-precommit-mandatory-requirement) ← **NEW in v3.0**
3. [Solution Overview](#solution-overview)
4. [File Structure](#file-structure)
5. [SESSION-START-CHECKLIST.md](#session-start-checklistmd)
6. [tracking/quality-gates-log.md](#trackingquality-gates-logmd)
7. [CLAUDE.md Modifications](#claudemd-modifications)
8. [Workflow Integration](#workflow-integration)
9. [Usage Guidelines](#usage-guidelines)
10. [Retroactive Validation Process](#retroactive-validation-process)
11. [Templates and Examples](#templates-and-examples)

---

## Problem Statement

### Original Issue

**Discovery**: During Sprint 2, 5 commits were made without running required quality gates:
- 0/5 commits had precommit validation
- 0/5 commits had code review
- 2/5 commits missing evidence (screenshots)
- **Compliance Rate**: 33%

**Root Cause**: Quality gates were not integrated into the todo workflow. They were documented but not enforced, making them easy to skip.

**Impact**:
- Potential code quality issues undetected
- No validation before commits entered codebase
- Missing evidence for verification
- 3 CRITICAL bugs shipped to production

---

## ⚠️ Zen Precommit: Mandatory Requirement

### Critical Enforcement Rule (v3.0)

**NO GIT COMMITS ARE ALLOWED WITHOUT SUCCESSFULLY RUNNING ZEN PRECOMMIT FIRST.**

This is not a guideline, recommendation, or best practice. This is a **MANDATORY REQUIREMENT** with **NO EXCEPTIONS**.

### Why This Rule Exists

1. **Quality Assurance**: Catches issues before they enter version control
2. **Early Detection**: Identifies problems when they're easiest and cheapest to fix
3. **Consistency**: Ensures every commit meets minimum quality standards
4. **Team Protection**: Prevents broken code from affecting other developers/agents
5. **Production Safety**: Maintains deployable main branch at all times

### Enforcement Mechanisms

**Level 1**: Documentation (this guide, CLAUDE.md, quality-gates.md, zen-tools-guide.md)
**Level 2**: Session checklist (SESSION-START-CHECKLIST.md)
**Level 3**: Todo structure (explicit precommit steps)
**Level 4**: Commit message verification (must include "Zen precommit: PASSED ✅")
**Level 5**: Quality gates log (tracking/quality-gates-log.md)
**Level 6**: Coordinator agent oversight

### Consequences of Violation

- **Immediate**: Commit flagged for review
- **Assessment**: Impact analysis by coordinator
- **Remediation**: May require commit revert and rework
- **Documentation**: Violation logged in compliance tracking
- **Escalation**: Repeated violations lead to task reassignment

### The Rule in Practice

```
✅ CORRECT Workflow:
1. Write code
2. Test code
3. Build succeeds
4. Stage changes (git add)
5. RUN ZEN PRECOMMIT ← MANDATORY
6. Address ALL findings
7. Re-run precommit if changes made
8. ONLY THEN: git commit

❌ INCORRECT Workflow:
1. Write code
2. git commit ← VIOLATION: No precommit!
3. Run precommit after ← TOO LATE
```

---

## Solution Overview

### Three-Part System

1. **SESSION-START-CHECKLIST.md** (Mandatory Entry Point)
   - Read at the start of EVERY session
   - Forces acknowledgment of quality gate requirements
   - Provides session setup verification
   - Links to all key workflow documents

2. **tracking/quality-gates-log.md** (Accountability & Tracking)
   - Per-commit quality gate compliance tracking
   - Sprint-level compliance metrics
   - Retroactive validation documentation
   - Lessons learned and improvement tracking

3. **CLAUDE.md Updates** (Prominent Visibility)
   - Added CRITICAL QUALITY GATES section at top
   - Included in documentation structure table
   - Explicit todo structure requirements
   - No-exceptions policy clearly stated

### Key Principles

- **Mandatory, Not Optional**: Quality gates are requirements, not suggestions
- **Explicit, Not Implicit**: Every todo must include quality gate steps
- **Visible, Not Hidden**: Quality gates prominently placed in all workflow docs
- **Tracked, Not Forgotten**: Every commit logged with compliance status
- **Enforced, Not Suggested**: Session checklist must be completed before work begins

---

## File Structure

```
project-root/
├── SESSION-START-CHECKLIST.md          # NEW - Mandatory session startup
├── CLAUDE.md                            # MODIFIED - Added quality gates section
├── tracking/
│   ├── quality-gates-log.md            # NEW - Compliance tracking
│   ├── phase-status.md                 # EXISTING - Referenced by checklist
│   └── screenshots/                    # EXISTING - Evidence storage
└── docs/
    ├── quality-gates.md                # EXISTING - Detailed requirements
    └── session-management.md           # EXISTING - Context continuity
```

---

## SESSION-START-CHECKLIST.md

### Purpose

Mandatory checklist that MUST be read at the start of every session to ensure workflow compliance.

### Structure (146 lines total)

#### Section 1: Session Context Loading (Lines 9-22)
```markdown
## 1. Session Context Loading ✅

- [ ] **Load Previous Session State**
  - Review `tracking/phase-status.md` for current phase/sprint
  - Check `tracking/quality-gates-log.md` for compliance status
  - Review last session's git commits and open todos
  - Load any Zen continuation IDs if resuming complex work

- [ ] **Identify Current Work**
  - What sprint/phase are we in?
  - What tasks are in-progress vs pending?
  - Are there any blockers or dependencies?
  - What was accomplished in the last session?
```

**Key Points**:
- Maintains existing session context system
- Explicitly lists files to review
- Ensures continuity across sessions
- Checks for pending work and blockers

#### Section 2: Quality Gate Awareness (Lines 25-43)
```markdown
## 2. Quality Gate Awareness 🚨

**READ AND ACKNOWLEDGE BEFORE PROCEEDING:**

### Git Safety Protocol (MANDATORY)

- [ ] **I understand**: `precommit` validation MUST run BEFORE every commit
- [ ] **I understand**: `codereview` MUST run for significant code changes
- [ ] **I understand**: Build must succeed (zero errors/warnings) before commit
- [ ] **I understand**: Screenshot evidence required for UI changes

### Quality Gate Sequence

```
Code Change → Build Verify → precommit → codereview (if complex) → Commit → Push
```

**NO EXCEPTIONS. Skipping quality gates = Process Failure.**
```

**Key Points**:
- Uses "I understand" acknowledgments for each requirement
- Visual sequence diagram shows proper order
- Explicit "NO EXCEPTIONS" policy
- 🚨 emoji draws attention

#### Section 3: Todo List Structure (Lines 46-62)
```markdown
## 3. Todo List Structure 📋

When creating todos for commits, ALWAYS use this structure:

```markdown
CORRECT:
- [ ] Complete feature X implementation
- [ ] Run precommit validation for feature X
- [ ] Run codereview for feature X (if complex)
- [ ] Commit feature X (blocked until validations pass)

INCORRECT:
- [ ] Implement and commit feature X
```

**Quality gates must be explicit, separate todo items.**
```

**Key Points**:
- Shows CORRECT vs INCORRECT examples
- Makes quality gates explicit separate steps
- "Blocked until validations pass" language
- Prevents combining implementation + commit in one todo

#### Section 4: Session Setup Verification (Lines 65-81)
```markdown
## 4. Session Setup Verification ✅

- [ ] **Review CLAUDE.md Critical Quality Gates Section**
  - Location: `CLAUDE.md` → "🚨 CRITICAL QUALITY GATES 🚨"
  - Confirm understanding of precommit workflow
  - Confirm understanding of commit message requirements

- [ ] **Check for Pending Validations**
  - Review `tracking/quality-gates-log.md`
  - Are there any retroactive validations needed?
  - Are there any failed quality gates from previous sessions?

- [ ] **Verify Development Environment**
  - Xcode project builds successfully
  - No uncommitted changes (unless intentional)
  - Git branch is correct (`main` or feature branch)
```

**Key Points**:
- Links to CLAUDE.md quality gates section
- Checks for pending validations from previous sessions
- Verifies environment before starting work
- Project-specific (adapt "Xcode" to your build system)

#### Section 5: Session Goals & Planning (Lines 84-100)
```markdown
## 5. Session Goals & Planning 🎯

- [ ] **Define Session Objectives**
  - What specific tasks will be completed this session?
  - What quality gates will be required?
  - Are there any dependencies or blockers?

- [ ] **Create Todo List with Quality Gates**
  - Use TodoWrite to create task list
  - Include precommit/codereview steps for all commits
  - Estimate time for quality gate validations

- [ ] **Identify Success Criteria**
  - What deliverables mark session completion?
  - What evidence is needed (screenshots, test results)?
  - What documentation needs updating?
```

**Key Points**:
- Forces planning before work starts
- Requires estimating time for quality gates
- Identifies success criteria upfront
- Plans for evidence collection

#### Section 6: Workflow Reference (Lines 103-117)
```markdown
## 6. Workflow Reference 📚

**Key Documents**:
- `CLAUDE.md` - Master workflow index
- `docs/session-management.md` - Session continuity guidelines
- `docs/quality-gates.md` - Quality gate requirements
- `tracking/phase-status.md` - Current phase/sprint status
- `tracking/quality-gates-log.md` - Compliance tracking

**Zen Tools Workflow**:
- Planning: `planner`, `thinkdeep`
- Development: `chat`, `clink`, `apilookup`
- Quality: `codereview`, `precommit`, `debug`
- Validation: `analyze`, `challenge`
```

**Key Points**:
- Quick reference to all key documents
- Zen MCP tools organized by purpose
- Adapt tool names to your available tools
- Central navigation hub

#### Section 7: Session Start Confirmation (Lines 120-131)
```markdown
## 7. Session Start Confirmation ✅

**Before proceeding with work, confirm:**

- [ ] I have loaded previous session context
- [ ] I understand all quality gate requirements
- [ ] I have created todos with explicit quality gate steps
- [ ] I know what success looks like for this session
- [ ] I have reviewed the compliance log and know pending items

**If ANY checkbox is unchecked, STOP and complete it before proceeding.**
```

**Key Points**:
- Final confirmation before work begins
- All-or-nothing approach (ANY unchecked = STOP)
- Reinforces critical requirements
- Acts as gate to prevent skipping steps

#### Section 8: Checklist Compliance Log (Lines 134-139)
```markdown
## Checklist Compliance Log

| Session Date | Context Loaded? | Quality Gates Reviewed? | Todos Created? | Success Criteria Defined? |
|--------------|-----------------|------------------------|----------------|---------------------------|
| 2025-10-20   | ✅              | ✅                     | ✅             | ✅                        |
```

**Key Points**:
- Tracks checklist usage per session
- Provides accountability
- Easy to see if checklist was skipped
- Update date for each new session

### Implementation Notes

**File Location**: Root of project (same level as CLAUDE.md)

**Status Note** (Lines 5-6):
```markdown
**Status**: MANDATORY - Read this BEFORE starting any work in a new session.
```

**Footer** (Lines 142-147):
```markdown
**Last Updated**: 2025-10-20
**Version**: 1.0
**Status**: ACTIVE - Use this checklist at the start of EVERY session

**Next Session**: Start by reading this file top-to-bottom, then proceed with work.
```

**Customization Points**:
- File paths (adapt to your project structure)
- Tool names (Zen MCP vs other tools)
- Build system (Xcode vs npm/gradle/etc)
- Documentation structure
- Session context system (continuation IDs, phase tracking, etc)

---

## tracking/quality-gates-log.md

### Purpose

Track quality gate compliance for every commit, provide accountability, and document improvement over time.

### Structure (300+ lines with retroactive validation)

#### Header & Purpose (Lines 1-9)
```markdown
# Quality Gate Compliance Log

**Purpose**: Track quality gate compliance for all commits to ensure workflow adherence.

**Last Updated**: 2025-10-20
**Current Compliance Rate**: 81% (Sprint 2)
```

**Key Points**:
- Clear purpose statement
- Current compliance rate in header (update with each commit)
- Last updated date

#### Quality Gate Requirements (Lines 10-18)
```markdown
## Quality Gate Requirements

Every commit MUST complete these gates:

1. ✅ **Build Verification**: `xcodebuild` succeeds with zero errors/warnings
2. ✅ **Precommit Validation**: `mcp__zen__precommit` passes
3. ✅ **Code Review** (for complex changes): `mcp__zen__codereview` passes
4. ✅ **Evidence**: Screenshots for UI changes, test results for logic changes
```

**Key Points**:
- Numbered list of all required gates
- Tool-specific commands (adapt to your tools)
- Conditional gates noted (e.g., "for complex changes")
- Evidence requirements specified

#### Per-Commit Tracking Template (Lines 132-142)
```markdown
### Commit: [hash] - "[message]"

| Quality Gate | Status | Notes |
|--------------|--------|-------|
| Build Verification | ⏳ | Pending |
| Precommit | ⏳ | Pending |
| Codereview | ⏳ | Pending (if complex) |
| Evidence | ⏳ | Pending (if UI/behavior change) |

**Compliance**: 0/X gates (0%)
**Action Required**: Complete all gates before commit
```

**Status Symbols**:
- ✅ = Passed
- ❌ = Failed or Skipped
- ⏳ = Pending
- ⚠️ = Warning/Partial

**Example - Completed Commit**:
```markdown
### Commit: 93128ea - "fix: Address Sprint 2 expert review findings"

| Quality Gate | Status | Notes |
|--------------|--------|-------|
| Build Verification | ✅ | BUILD SUCCEEDED (zero errors/warnings) |
| Precommit | ✅ | **PASSED - Expert approved** |
| Codereview | N/A | Fixes from expert review |
| Evidence | ✅ | All 3 issues fixed and validated |

**Compliance**: 3/3 gates (100%) ✅

**Changes**:
- Fixed CRITICAL: ReportSubmissionView error handling
- Fixed HIGH: DashboardView silent fallback
- Fixed MEDIUM: Removed unused variable

**Expert Analysis**: "Excellent. All requested fixes for critical and high-severity issues have been correctly implemented."
```

**Example - Violation Documented**:
```markdown
### Commit: 216a9cb - "feat: Integrate DashboardView"

| Quality Gate | Status | Notes |
|--------------|--------|-------|
| Build Verification | ✅ | Build succeeded (verified) |
| Precommit | ❌ | **SKIPPED - Process violation** |
| Codereview | ❌ | **SKIPPED - Complex integration should be reviewed** |
| Evidence | ❌ | **MISSING - No screenshot of dashboard** |

**Compliance**: 1/4 gates (25%)
**Action Required**: Retroactive validation + screenshot evidence needed
```

#### Sprint Summary (Lines 93-110)
```markdown
## Sprint 2 Summary

**Total Commits**: 6
**Gates Passed**: 22/27 (81%)
**Gates Skipped**: 5/27 (19%)

**Breakdown**:
- Build Verification: 6/6 (100%) ✅
- Precommit Validation: 4/6 (67%) ⚠️
- Code Review: 4/6 (67%) ⚠️
- Evidence: 8/9 (89%) ⚠️

**Critical Findings**:
1. **Retroactive validation caught 3 CRITICAL issues**
2. Workflow enforcement improved compliance from 33% to 81%
3. All new commits (post-enforcement) at 100% compliance
```

**Key Points**:
- Total commits for sprint
- Overall compliance percentage
- Per-gate breakdown
- Critical findings highlighted
- Trend analysis

#### Retroactive Validation Section (Lines 146-253)
```markdown
## Retroactive Validation (October 20, 2025)

### Sprint 2 Commits - Validation Results

**Context**: Sprint 2 commits were made without precommit or codereview validation. Performed comprehensive retroactive quality gate validation.

#### Commit 93128ea - "fix: Address Sprint 2 expert review findings"
[...full commit details...]

#### Retroactive Validation: Commit 216a9cb - "feat: Integrate DashboardView"
[...full validation results with issues found...]

**Code Review Findings**:
- **HIGH (4 issues)**: Initial data loading, reputation race conditions, side effects, error handling
- **MEDIUM (4 issues)**: Business logic in view, hardcoded colors, etc.
- **LOW (2 issues)**: Explicit loading pattern, complex UUID generation

**Expert Analysis**: "Code Quality: 85/100. Well-structured but several important issues need attention."

**Action Items**:
- ⏳ Add .onAppear data loading to DashboardView
- ⏳ Implement atomic reputation updates
- ⏳ Refactor AlertLevelManager to use pure functions
[...etc...]
```

**Key Points**:
- Clear "Retroactive Validation" header
- Date of validation
- Context explaining why retroactive validation was needed
- Full issue breakdown by severity
- Expert analysis quotes
- Action items with status (⏳ pending, ✅ complete)

#### Compliance Tracking Table (Lines 256-272)
```markdown
## Compliance Tracking by Sprint

| Sprint | Commits | Gates Passed | Gates Skipped | Compliance Rate |
|--------|---------|--------------|---------------|-----------------|
| Sprint 1 | 8 | Unknown | Unknown | Unknown (pre-log) |
| Sprint 2 | 6 | 22/27 (81%) | 5/27 (19%) | 81% ⚠️ |
| Sprint 3 | 0 | 0/0 | 0/0 | N/A |

**Target Compliance Rate**: 100%
**Current Trend**: ✅ **Significant Improvement** (33% → 81% after retroactive validation)

**Sprint 2 Notes**:
- Original: 5 commits, 33% compliance (no precommit/codereview)
- Retroactive: Added validation for all commits, found 17 issues
- Fix Commit (93128ea): 100% compliance, fixed 3 CRITICAL issues
- **New Compliance**: 81% (22/27 gates passed)
- **Remaining**: 5 gates pending (documentation + screenshots)
```

**Key Points**:
- Sprint-by-sprint tracking
- Trend analysis
- Notes explain context
- Shows improvement over time

#### Lessons Learned (Lines 276-294)
```markdown
## Lessons Learned

### Sprint 2 Violations

**Root Cause**: Quality gates were not integrated into todo workflow

**Impact**:
- No precommit validation before commits
- No code review for complex changes
- Missing evidence for verification
- Potential code quality issues undetected

**Prevention**:
1. ✅ Created SESSION-START-CHECKLIST.md
2. ✅ Updated CLAUDE.md with prominent quality gate section
3. ✅ Implemented todo structure with explicit quality gate steps
4. ✅ **Completed retroactive validation** - found and fixed 3 CRITICAL issues
5. ✅ Compliance improved from 33% to 81%
```

**Key Points**:
- Root cause analysis
- Impact assessment
- Prevention measures documented
- Checkmarks show what's been done

#### Next Session Action Items (Lines 297-310)
```markdown
## Next Session Action Items

**Before First Commit**:
1. Read SESSION-START-CHECKLIST.md
2. Review this compliance log
3. Create todos with explicit quality gate steps
4. Run precommit BEFORE commit, not after

**During Session**:
1. Update this log after each commit
2. Include compliance status in commit message
3. Capture evidence as you work (screenshots, test results)

**Session End**:
1. Verify all commits have 100% gate compliance
2. Update compliance tracking table
3. Document any lessons learned
```

**Key Points**:
- Three phases: Before, During, End
- Specific actionable items
- Reinforces workflow

### Implementation Notes

**File Location**: `tracking/quality-gates-log.md`

**Update Frequency**: After EVERY commit

**Maintenance**:
- Update header compliance rate
- Add new commit entries immediately
- Update sprint summary at sprint end
- Add retroactive validation section if needed
- Document lessons learned when violations occur

---

## CLAUDE.md Modifications

### Changes Made

Added a new section at the very top of CLAUDE.md (before existing content) to make quality gates unmissable.

### Section Added (68 lines)

**Location**: Lines 1-68 (before "Overview" section)

```markdown
## 🚨 CRITICAL QUALITY GATES 🚨

**MANDATORY READING**: Every session MUST start with [SESSION-START-CHECKLIST.md](./SESSION-START-CHECKLIST.md)

### BEFORE EVERY COMMIT (NO EXCEPTIONS)

**Required Sequence**:
```
1. Code Change
2. Build Verification (xcodebuild succeeds, zero errors/warnings)
3. Precommit Validation (mcp__zen__precommit)
4. Code Review (mcp__zen__codereview for complex changes)
5. ONLY THEN: git commit + git push
```

**Quality Gate Rules**:
- ✅ `mcp__zen__precommit` MUST run before EVERY commit
- ✅ `mcp__zen__codereview` MUST run for significant code changes (>50 lines, complex logic, new features)
- ✅ Build MUST succeed with zero errors and zero warnings
- ✅ Screenshot evidence REQUIRED for UI changes
- ✅ Test evidence REQUIRED for logic changes

**Violation = Process Failure**

### BEFORE MARKING TASKS COMPLETE

**Completion Checklist**:
- ✅ Feature works as specified
- ✅ Screenshot evidence provided (for UI changes)
- ✅ Tests passing (unit + integration)
- ✅ Code reviewed (Zen `codereview` for complex changes)
- ✅ Build succeeds (zero errors/warnings)
- ✅ Quality gates logged in `tracking/quality-gates-log.md`

**Nothing is complete until ALL gates pass.**

### TODO STRUCTURE WITH QUALITY GATES

**CORRECT** (quality gates are explicit):
```markdown
- [ ] Complete feature X implementation
- [ ] Run precommit validation for feature X
- [ ] Run codereview for feature X (if complex)
- [ ] Commit feature X (blocked until validations pass)
- [ ] Capture screenshot evidence (if UI change)
```

**INCORRECT** (quality gates missing):
```markdown
- [ ] Implement and commit feature X
```

**Always break commits into multiple todo items with explicit quality gates.**

---
```

### Documentation Structure Table Update

**Location**: Existing "Documentation Structure" section

**Change**: Added SESSION-START-CHECKLIST.md as FIRST entry

```markdown
| Document | Purpose | When to Use |
|----------|---------|-------------|
| **[Session Start Checklist](./SESSION-START-CHECKLIST.md)** | **Mandatory session startup protocol** | **Start of EVERY session (READ FIRST)** |
| [PRD Template](./docs/PRD.md) | Product Requirements Document template | Phase 0 planning |
| [Agent Deployment](./docs/agent-deployment.md) | Multi-agent team structures | Project setup |
[...rest of table...]
```

**Key Points**:
- Bold formatting draws attention
- Explicit "READ FIRST" instruction
- Positioned as first entry
- Clear "EVERY session" language

### Implementation Notes

**Visual Prominence**:
- 🚨 emoji in section title
- "CRITICAL" in all caps
- "NO EXCEPTIONS" language
- "Violation = Process Failure" warning

**Customization**:
- Replace tool names (`mcp__zen__precommit` → your tool)
- Adapt build command (`xcodebuild` → your build system)
- Adjust complexity thresholds (">50 lines")
- Modify evidence requirements (screenshots, tests, etc)

---

## Workflow Integration

### TodoWrite Tool Integration

**Key Principle**: Every commit must have explicit quality gate steps in the todo list.

**Example Implementation**:
```markdown
# User: "Add dark mode toggle to settings"

# INCORRECT Todo List:
- [ ] Implement dark mode toggle in settings

# CORRECT Todo List:
- [ ] Implement dark mode toggle UI in settings
- [ ] Add dark mode state management
- [ ] Test dark mode on all screens
- [ ] Run build verification (zero errors/warnings)
- [ ] Run precommit validation for dark mode changes
- [ ] Run codereview for dark mode implementation
- [ ] Capture screenshots of dark mode (before/after)
- [ ] Commit dark mode toggle feature
```

**Pattern**:
1. Implementation tasks (broken down)
2. Testing tasks
3. Build verification
4. Precommit validation
5. Code review (if complex)
6. Evidence capture
7. Commit (last step, blocked on all above)

### Git Commit Message Template

**Format** (from CLAUDE.md):
```markdown
<type>: <description>

<detailed explanation if needed>

Quality Gates:
✅ Build Verification: <status>
✅ Precommit Validation: <status>
✅ Code Review: <status> (if applicable)
✅ Evidence: <status> (if applicable)

<expert analysis quote if available>

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

**Example**:
```markdown
fix: Address Sprint 2 expert review findings - error handling improvements

Fixes 3 issues identified in retroactive precommit validation:

CRITICAL: ReportSubmissionView silent failure
- Added error alert to inform users when report submission fails
- Prevents silent data loss by showing error instead of dismissing
- Users now receive clear feedback on submission failures

HIGH: DashboardView silent fallback
- Added error banner when live data fetch fails
- Informs users they're seeing calculated vs live data
- Replaced try? with do-catch for proper error handling

MEDIUM: Code cleanup
- Removed unused alertManager variable from ReportSubmissionView

Quality Gates:
✅ Build Verification: BUILD SUCCEEDED (zero errors/warnings)
✅ Precommit Validation: PASSED (expert review approved)
✅ Changes: +59 lines, -8 lines (2 files)

Expert Analysis: "Excellent. All requested fixes for critical and high-severity
issues have been correctly implemented with robust error handling and no new
issues introduced."

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

### Session Start Protocol

**Mandatory Sequence**:
1. Read SESSION-START-CHECKLIST.md completely
2. Load previous session context (phase-status.md, git log, etc)
3. Review quality-gates-log.md for pending items
4. Create todos with explicit quality gate steps
5. Verify build environment
6. Confirm all checklist items complete
7. ONLY THEN begin work

**Implementation in Session**:
```markdown
# First message in session should include:

Starting session following SESSION-START-CHECKLIST.md protocol:

✅ 1. Session Context Loading
   - Reviewed tracking/phase-status.md: Currently in Sprint 2
   - Reviewed tracking/quality-gates-log.md: 81% compliance, 14 pending issues
   - Git log: Last commit 93128ea (workflow enforcement fixes)
   - No continuation IDs to resume

✅ 2. Quality Gate Awareness
   - I understand: precommit MUST run before every commit
   - I understand: codereview MUST run for complex changes
   - I understand: Build must succeed before commit
   - I understand: Screenshot evidence required for UI changes

✅ 3. Todo Structure
   - Will create todos with explicit quality gate steps
   - Quality gates will be separate todo items

✅ 4. Session Setup Verification
   - Reviewed CLAUDE.md Critical Quality Gates section
   - Checked quality-gates-log.md: 14 pending action items from retroactive validation
   - Build environment verified

✅ 5. Session Goals & Planning
   - Objective: Address HIGH priority issues from code review
   - Quality gates needed: precommit + codereview for each fix
   - Dependencies: None
   - Success criteria: Issues fixed, build succeeds, quality gates pass

✅ 6. Workflow Reference
   - All key documents reviewed

✅ 7. Session Start Confirmation
   - All checkboxes verified
   - Ready to proceed

Creating todos with explicit quality gate steps...
```

---

## Usage Guidelines

### For AI Agents

**Session Start**:
1. ALWAYS read SESSION-START-CHECKLIST.md first
2. State completion of checklist in first message
3. Create todos with explicit quality gate steps
4. Reference quality-gates-log.md for pending items

**During Work**:
1. Update todos as tasks complete
2. Run build verification before commit
3. Run precommit validation before commit
4. Run codereview for complex changes
5. Capture evidence (screenshots, test results)

**Before Commit**:
1. Verify ALL quality gates passed
2. Update quality-gates-log.md with commit entry
3. Include quality gate status in commit message
4. Only commit if 100% compliance

**Session End**:
1. Update quality-gates-log.md with session summary
2. Update compliance tracking table
3. Document any lessons learned
4. Leave clear handoff notes

### For Human Developers

**Session Start**:
1. Read SESSION-START-CHECKLIST.md
2. Review quality-gates-log.md for compliance trends
3. Check for pending action items from previous sessions

**During Work**:
1. Follow quality gate sequence for every commit
2. Document evidence as you work
3. Update quality-gates-log.md after each commit

**Review Sessions**:
1. Periodically review compliance trends
2. Address pending action items
3. Update lessons learned if violations occur

### Common Pitfalls to Avoid

**❌ Don't**:
- Skip SESSION-START-CHECKLIST.md ("I remember the process")
- Combine implementation + commit in one todo
- Run quality gates after commit instead of before
- Skip quality gates for "small changes"
- Forget to update quality-gates-log.md

**✅ Do**:
- Read checklist every session (takes 2 minutes)
- Break todos into explicit steps with quality gates
- Run quality gates BEFORE commit
- Apply quality gates to ALL changes
- Update log immediately after commit

---

## Retroactive Validation Process

### When to Use

Retroactive validation should be performed when:
1. Commits were made without quality gate validation
2. Workflow enforcement was not in place
3. Compliance rate is below 100%
4. Previous sessions skipped quality gates

### Process Steps

**1. Identify Scope**
```markdown
# Determine which commits need validation
git log --oneline -20

# For each commit without quality gates:
- Note commit hash
- Note commit message
- Note files changed
```

**2. Run Precommit Validation**
```bash
# For retrospective commits, validate current state
# (includes all commits up to now)

mcp__zen__precommit
  step: "Retroactive validation for commits X, Y, Z"
  compare_to: "commit_before_violations"
  model: "gemini-2.5-pro"
```

**3. Run Code Review**
```bash
# For each significant commit

mcp__zen__codereview
  step: "Retroactive code review for commit ABC123"
  relevant_files: [changed files from that commit]
  model: "gemini-2.5-pro"
```

**4. Document Findings**

Add to quality-gates-log.md:
```markdown
## Retroactive Validation (Date)

### Sprint X Commits - Validation Results

**Context**: [Explain why retroactive validation was needed]

#### Commit ABC123 - "[message]"

| Quality Gate | Status | Notes |
|--------------|--------|-------|
| Build Verification | ✅ | Original commit built successfully |
| Precommit | ⚠️ | **RETROACTIVE - X issues found** |
| Codereview | ⚠️ | **RETROACTIVE - Y issues found** |
| Evidence | ❌ | **MISSING - [what evidence]** |

**Code Review Findings**:
- **CRITICAL (N issues)**: [list]
- **HIGH (N issues)**: [list]
- **MEDIUM (N issues)**: [list]
- **LOW (N issues)**: [list]

**Expert Analysis**: "[quote from expert review]"

**Action Items**:
- ⏳ [Issue 1 to fix]
- ⏳ [Issue 2 to fix]
- ✅ [Issue 3 fixed]
```

**5. Prioritize and Fix**

Priority order:
1. CRITICAL issues (fix immediately)
2. HIGH issues (fix in current session)
3. MEDIUM issues (schedule for next sprint)
4. LOW issues (add to backlog)

**6. Update Compliance Tracking**

Update the compliance table:
```markdown
**Sprint X Notes**:
- Original: Y commits, Z% compliance
- Retroactive: Added validation, found N issues
- Fix Commit: 100% compliance, fixed M CRITICAL issues
- **New Compliance**: Updated percentage
```

### Example Workflow

**Scenario**: 5 commits made without precommit/codereview

**Step 1**: Create todos
```markdown
- [ ] Run precommit validation on current repository state
- [ ] Run codereview for commit ABC (DashboardView)
- [ ] Run codereview for commit DEF (Notifications)
- [ ] Fix CRITICAL issues found
- [ ] Fix HIGH issues found
- [ ] Update quality-gates-log.md with findings
```

**Step 2**: Execute validations (use quality gate tools)

**Step 3**: Fix issues immediately
```markdown
# CRITICAL issues found:
- [ ] Fix error handling in ReportSubmissionView
- [ ] Fix silent fallback in DashboardView
- [ ] Run precommit on fixes
- [ ] Commit fixes with quality gates
```

**Step 4**: Document everything in quality-gates-log.md

**Step 5**: Update compliance metrics

---

## Templates and Examples

### SESSION-START-CHECKLIST.md Template

```markdown
# Session Start Checklist

**Purpose**: Ensure every session follows quality standards and maintains context continuity.

**Status**: MANDATORY - Read this BEFORE starting any work in a new session.

---

## 1. Session Context Loading ✅
[...checklist items...]

## 2. Quality Gate Awareness 🚨
[...acknowledgments...]

## 3. Todo List Structure 📋
[...correct/incorrect examples...]

## 4. Session Setup Verification ✅
[...verification items...]

## 5. Session Goals & Planning 🎯
[...planning items...]

## 6. Workflow Reference 📚
[...links to docs...]

## 7. Session Start Confirmation ✅
[...final confirmation...]

## Checklist Compliance Log
[...tracking table...]

---

**Last Updated**: [DATE]
**Version**: 1.0
**Status**: ACTIVE - Use this checklist at the start of EVERY session
```

### quality-gates-log.md Template

```markdown
# Quality Gate Compliance Log

**Purpose**: Track quality gate compliance for all commits to ensure workflow adherence.

**Last Updated**: [DATE]
**Current Compliance Rate**: [X%] (Sprint Y)

---

## Quality Gate Requirements

Every commit MUST complete these gates:

1. ✅ **Build Verification**: [build command] succeeds with zero errors/warnings
2. ✅ **Precommit Validation**: [precommit tool] passes
3. ✅ **Code Review** (for complex changes): [review tool] passes
4. ✅ **Evidence**: Screenshots for UI changes, test results for logic changes

---

## Sprint [N] Commits

### Commit: [hash] - "[message]"
[...tracking table...]

---

## Sprint [N] Summary
[...metrics...]

---

## Retroactive Validation (if needed)
[...validation results...]

---

## Compliance Tracking by Sprint
[...table...]

---

## Lessons Learned
[...root cause analysis...]

---

## Next Session Action Items
[...action items...]

---

**Last Updated**: [DATE]
**Next Update**: After next commit
**Maintained By**: Development team (AI + Human)
```

### Todo List Template with Quality Gates

```markdown
# Feature: [Feature Name]

## Implementation
- [ ] Implement [component A]
- [ ] Implement [component B]
- [ ] Add tests for [feature]

## Quality Gates
- [ ] Run build verification (zero errors/warnings)
- [ ] Run precommit validation for [feature]
- [ ] Run codereview for [feature] (if complex)
- [ ] Capture screenshot evidence (if UI change)
- [ ] Update quality-gates-log.md

## Commit
- [ ] Commit [feature] (blocked until all quality gates pass)
- [ ] Push to remote
```

### Commit Message Template

```markdown
[type]: [short description]

[Detailed explanation of changes and why they were made]

Quality Gates:
✅ Build Verification: [status and details]
✅ Precommit Validation: [status and details]
✅ Code Review: [status and details] (if applicable)
✅ Evidence: [screenshots/tests captured] (if applicable)

[Expert analysis quote if available]

🤖 Generated with [Claude Code](https://claude.com/claude-code)

Co-Authored-By: Claude <noreply@anthropic.com>
```

---

## Customization Guide

### Adapt to Your Project

**Replace These Elements**:

1. **Build System**:
   - `xcodebuild` → `npm run build`, `gradle build`, etc.
   - `Xcode project` → your build environment

2. **Quality Gate Tools**:
   - `mcp__zen__precommit` → your precommit tool
   - `mcp__zen__codereview` → your review tool
   - Zen tools → your available tools

3. **File Paths**:
   - `tracking/phase-status.md` → your tracking system
   - `docs/quality-gates.md` → your documentation structure

4. **Evidence Types**:
   - Screenshots → appropriate for your project
   - Test results → your testing framework

5. **Complexity Thresholds**:
   - ">50 lines" → your threshold for code review
   - "complex logic" → your definition

6. **Session Context System**:
   - Zen continuation IDs → your continuity mechanism
   - Phase tracking → your project management system

### Minimal Implementation

If you want to start small:

**Phase 1** (Minimum Viable Enforcement):
1. Create SESSION-START-CHECKLIST.md (sections 1, 2, 3, 7 only)
2. Add quality gates section to CLAUDE.md
3. Create basic quality-gates-log.md (template only)

**Phase 2** (Full System):
1. Add all sections to SESSION-START-CHECKLIST.md
2. Start tracking compliance in quality-gates-log.md
3. Implement todo structure requirements

**Phase 3** (Optimization):
1. Add retroactive validation capability
2. Add lessons learned tracking
3. Add sprint-level metrics

---

## Success Metrics

### How to Measure Effectiveness

**Compliance Rate**:
- Target: 100% for all commits
- Calculate: (gates passed / total gates) × 100
- Track per sprint

**Issue Detection**:
- Count: CRITICAL, HIGH, MEDIUM, LOW issues found
- Track: Issues found via precommit vs missed
- Goal: Catch all CRITICAL before commit

**Workflow Adherence**:
- Sessions starting with checklist: 100%
- Todos with explicit quality gates: 100%
- Quality gates run before commit: 100%

**Time Investment**:
- Checklist reading: ~2 minutes per session
- Precommit validation: ~5-10 minutes per commit
- Code review: ~10-20 minutes for complex changes
- Total overhead: ~15-30 minutes per commit
- **ROI**: Prevents hours of debugging and rework

### Expected Results

**Immediate** (Session 1):
- 100% compliance for new commits
- CRITICAL issues caught before commit
- Clear visibility into code quality

**Short-term** (Sprint 1):
- Compliance >80%
- Reduced bugs in production
- Better code review feedback

**Long-term** (3+ sprints):
- Compliance →100%
- Quality gates become habit
- Fewer retroactive fixes needed
- Improved code quality trends

---

## Troubleshooting

### Common Issues and Solutions

**Issue**: "Checklist feels like overhead"
- **Solution**: Compliance prevents hours of debugging. The 2-minute investment saves significant time.

**Issue**: "Forgot to run precommit before commit"
- **Solution**: Add precommit as explicit todo item BEFORE commit item. Mark commit as "blocked until precommit passes."

**Issue**: "Quality gates log getting too long"
- **Solution**: Archive old sprints to separate file (e.g., `quality-gates-log-sprint-1.md`)

**Issue**: "Not sure what counts as 'complex' for code review"
- **Solution**: Define clear criteria: >50 lines, new features, security-related, performance-critical, or architectural changes.

**Issue**: "Running out of time, tempted to skip quality gates"
- **Solution**: Budget time for quality gates when estimating tasks. They're not optional overhead, they're required steps.

---

## Conclusion

This workflow enforcement system transforms quality gates from optional suggestions into mandatory requirements through:

1. **Mandatory entry point** (SESSION-START-CHECKLIST.md)
2. **Visible accountability** (quality-gates-log.md)
3. **Prominent documentation** (CLAUDE.md updates)
4. **Explicit todo structure** (quality gates as separate steps)
5. **Continuous tracking** (compliance metrics)

**Key Success Factors**:
- Start EVERY session with checklist (no exceptions)
- Make quality gates explicit in todos
- Run validations BEFORE commit (not after)
- Update tracking log immediately
- Learn from violations

**Expected Outcome**:
- Compliance: 33% → 81% → 100%
- CRITICAL issues: Caught before commit
- Code quality: Continuous improvement
- Workflow: Becomes automatic habit

---

**Implementation Checklist for New Project**:

- [ ] Create SESSION-START-CHECKLIST.md
- [ ] Create tracking/quality-gates-log.md
- [ ] Update CLAUDE.md with quality gates section
- [ ] Define quality gate requirements for your project
- [ ] Customize build commands and tool names
- [ ] Define evidence requirements
- [ ] Set complexity thresholds for code review
- [ ] Train team on workflow
- [ ] Start using checklist in every session
- [ ] Track compliance and improve

**Last Updated**: 2025-01-20
**Version**: 3.0
**Tested On**: MobileBayJubilee iOS project
**Results**: 33% → 81% compliance improvement in one session
**v3.0 Update**: Added mandatory zen precommit enforcement across all workflow documentation
