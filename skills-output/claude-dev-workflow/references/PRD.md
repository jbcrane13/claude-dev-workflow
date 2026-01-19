# Product Requirements Document (PRD)

**Project Name**: [Your Project Name]
**Version**: 1.0
**Last Updated**: [Date]
**Owner**: [Product Owner/Team]
**Status**: Draft / In Review / Approved

---

## ⚠️ WORKFLOW INTEGRATION (READ FIRST!)

**This PRD template is designed to work with the Claude Dev Workflow v3.1+**

### Before You Start

**MANDATORY CHECKLIST**:
- [ ] Read [claude.md - MANDATORY REQUIREMENTS](../claude.md#⚠️-mandatory-requirements-read-first) section
- [ ] Understand multi-agent deployment criteria (3+ features = deploy team)
- [ ] Know platform-specific mandatory tech standards (iOS/macOS: SwiftUI, SwiftData, @Observable only)
- [ ] Understand quality gates (precommit, phase gates, screenshot evidence)

### How This PRD Integrates with Workflow

**Phase 0: PRD Creation**
1. ✅ Fill out this entire template
2. ✅ Get stakeholder approval
3. ✅ Use completed PRD with zen `planner` tool:
   ```yaml
   Tool: zen:planner
   model: "gemini-2.5-pro"
   step: "Break down [Project Name] PRD into detailed phase plan with dependencies"
   # Attach: This completed PRD
   ```

**During Development**
- **Major Technical Decisions**: Create ADRs (see [ADR Guide](./adr/README.md))
  - Use tool chain: `challenge` → `consensus` → (optional) `clink` → ADR
- **Critical Scenarios**: Use `clink` for external AI perspectives
  - Security reviews, complex bugs, high-stakes decisions
- **Phase Completions**: Run mandatory phase gates
  - `analyze` (quality) → `refactor` (debt) → `analyze` (performance)

**Quality Requirements**
- ✅ Every commit requires zen `precommit` tool (MANDATORY)
- ✅ Every feature requires screenshot evidence
- ✅ Every phase requires phase gate validation
- ✅ Build + tests must pass before completion

**Multi-Agent Teams**
- If 3+ features in P1/P2: **MUST deploy multi-agent team** (see [Agent Deployment](./agent-deployment.md))
- Coordinator ensures all agents follow this PRD

### Zen Tools Quick Reference for PRD Workflow

**Phase 0 - Planning**:
- `planner`: Break down completed PRD into detailed project plan
- `thinkdeep`: Architecture decisions (save continuation_id)
- `challenge`: Question technical assumptions before committing
- `consensus`: Multi-model analysis for major decisions
- `clink`: (Optional) External AI perspective for critical decisions

**During Development**:
- `chat`: Day-to-day assistance and questions
- `apilookup`: Latest API documentation
- `debug`: Issue resolution when problems arise
- `codereview`: Quality checks before task completion
- `precommit`: **MANDATORY** before EVERY commit

**Phase Completion**:
- `analyze` (quality): Establish quality baseline
- `refactor` (debt): Identify technical debt
- `analyze` (performance): Measure performance metrics

**See**: [Zen Tools Guide](./zen-tools-guide.md) | [Tool Chaining Patterns](./tool-chaining-patterns.md)

---

## 📋 Document Control

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | [Date] | [Name] | Initial draft |

---

## 🎯 Executive Summary

### Product Vision
> One-sentence description of what the product is and why it exists.

[Provide a clear, concise statement of the product vision. Example: "A mobile task management app that helps busy professionals organize their work and personal tasks with minimal friction."]

### Problem Statement
**Who**: [Target users]
**What**: [Problem they face]
**Why**: [Why this problem matters]
**Current Solution**: [How they solve it today]
**Gap**: [What's missing from current solutions]

### Success Criteria
- [Metric 1]: [Target value]
- [Metric 2]: [Target value]
- [Metric 3]: [Target value]

**Example**:
- User Adoption: 1,000 active users within 3 months
- Engagement: Users create average 5+ tasks per week
- Retention: 60% weekly active user retention

---

## 👥 Target Users & Personas

### Primary Persona: [Persona Name]

**Demographics**:
- Age: [Range]
- Occupation: [Role/Industry]
- Tech Savviness: [Low/Medium/High]

**Goals**:
- [Goal 1]
- [Goal 2]
- [Goal 3]

**Pain Points**:
- [Pain point 1]
- [Pain point 2]
- [Pain point 3]

**User Needs**:
- [Need 1]
- [Need 2]
- [Need 3]

### Secondary Persona: [Persona Name] (if applicable)
[Repeat structure above]

---

## 🎨 Product Overview

### Core Value Proposition
[Describe in 2-3 sentences what makes this product unique and valuable]

### Key Features Overview
1. **[Feature 1 Name]**: [One-line description]
2. **[Feature 2 Name]**: [One-line description]
3. **[Feature 3 Name]**: [One-line description]

### Product Scope

**In Scope**:
- ✅ [Feature/capability in scope]
- ✅ [Feature/capability in scope]
- ✅ [Feature/capability in scope]

**Out of Scope** (for initial release):
- ❌ [Feature/capability explicitly NOT in scope]
- ❌ [Feature/capability explicitly NOT in scope]
- ❌ [Feature/capability explicitly NOT in scope]

---

## 🚀 Feature Requirements

### Feature Prioritization Framework

| Priority | Meaning | Release |
|----------|---------|---------|
| **P0** | Critical foundation (Phase 0) | Must have before any features |
| **P1** | Must-have (MVP) | Phase 1 |
| **P2** | Should-have | Phase 2 |
| **P3** | Nice-to-have | Phase 3+ |
| **P4** | Future consideration | Backlog |

---

### P0: Foundation Features

#### P0-1: [Foundation Feature Name]
**Description**: [What is this foundation element?]
**Rationale**: [Why is this critical?]
**Requirements**:
- [Requirement 1]
- [Requirement 2]

---

### P1: Core Features (MVP)

#### P1-1: [Feature Name]

**Description**: [What does this feature do?]

**User Story**:
> As a [user type], I want to [action], so that [benefit].

**Acceptance Criteria**:
- [ ] [Criterion 1: Specific, measurable condition]
- [ ] [Criterion 2: Specific, measurable condition]
- [ ] [Criterion 3: Specific, measurable condition]

**User Flow**:
1. User [action]
2. System [response]
3. User sees [outcome]

**Success Metrics**:
- [Metric]: [Target]

**Dependencies**:
- Depends on: [Other feature/system]
- Enables: [Future feature]

**Technical Notes**:
- [Any technical constraints or requirements]

**UI/UX Requirements**:
- [Visual/interaction requirements]

---

#### P1-2: [Feature Name]
[Repeat structure above for each P1 feature]

---

### P2: Enhanced Features

#### P2-1: [Feature Name]
[Same structure as P1 features]

---

### P3: Nice-to-Have Features

#### P3-1: [Feature Name]
[Same structure as P1 features]

---

## 📱 User Flows

### Primary User Flow: [Flow Name]

**Trigger**: [What initiates this flow]
**Steps**:
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Success Outcome**: [What success looks like]
**Error Handling**: [What happens if something goes wrong]

### Secondary User Flow: [Flow Name]
[Repeat structure]

---

## 🎨 Design & User Experience

### Design Principles
1. **[Principle 1]**: [Description]
2. **[Principle 2]**: [Description]
3. **[Principle 3]**: [Description]

### Platform-Specific Guidelines

**iOS** (if applicable):
- ⚠️ **MANDATORY**: Follow [iOS Development Standards](./ios-development.md) - ZERO TOLERANCE
  - **MUST USE**: SwiftUI, SwiftData, @Observable, async/await, NavigationStack
  - **FORBIDDEN**: UIKit (except when SwiftUI lacks APIs), Core Data, Combine/@Published/@ObservableObject/@StateObject
  - Target: iOS 17.0+ minimum
- Follow iOS Human Interface Guidelines
- Use native SwiftUI components
- Dark mode support: [Yes/No]

**macOS** (if applicable):
- ⚠️ **MANDATORY**: Follow [macOS Development Standards](./mac-development.md) - ZERO TOLERANCE
  - **MUST USE**: SwiftUI, SwiftData, @Observable, async/await, NavigationSplitView/NavigationStack
  - **FORBIDDEN**: AppKit (except when SwiftUI lacks APIs), Core Data, Combine/@Published/@ObservableObject/@StateObject
  - Target: macOS 14.0+ (Sonoma) minimum
- Follow macOS Human Interface Guidelines
- Use native SwiftUI components
- Dark mode support: [Yes/No]

**Web** (if applicable):
- Responsive design: Mobile, tablet, desktop
- Browser support: [List browsers and versions]
- Accessibility: WCAG [level] compliance

**Android** (if applicable):
- Follow Material Design 3
- Support Android [minimum version]

### Accessibility Requirements
- [ ] Screen reader support
- [ ] Keyboard navigation
- [ ] Color contrast ratios (WCAG AA minimum)
- [ ] Text scaling support
- [ ] VoiceOver/TalkBack optimization

---

## 🔧 Technical Requirements

### Platform & Technology

**Primary Platform**: [iOS/macOS/Web/Android/etc.]
**Minimum Versions**: [Specify]

**Technology Stack**:
- Frontend: [Framework/Language]
  - ⚠️ **iOS Projects**: See mandatory tech stack in [iOS Development](./ios-development.md)
    - **REQUIRED**: SwiftUI, SwiftData, @Observable (iOS 17+)
  - ⚠️ **macOS Projects**: See mandatory tech stack in [macOS Development](./mac-development.md)
    - **REQUIRED**: SwiftUI, SwiftData, @Observable (macOS 14.0+)
- Backend: [If applicable]
- Database: [Technology]
  - **iOS/macOS**: SwiftData only (Core Data forbidden)
- APIs: [Third-party services]

**⚠️ Major Technical Decisions**:
- All significant technology/architecture choices MUST be documented as ADRs
- Use tool chain: `challenge` → `consensus` → (optional) `clink` → Create ADR
- See: [ADR Guide](./adr/README.md) and [Tool Chaining Patterns](./tool-chaining-patterns.md)
- Examples of ADR-worthy decisions:
  - State management approach
  - Data persistence strategy
  - API architecture (REST vs GraphQL)
  - Navigation patterns
  - Major framework/library choices

### Performance Requirements
- App launch time: [< X seconds]
- Screen load time: [< X seconds]
- API response time: [< X ms]
- Offline capability: [Yes/No, describe]

### Data Requirements

**Data Models** (high-level):
- [Model 1]: [Description and key fields]
- [Model 2]: [Description and key fields]

**Data Storage**:
- Local storage: [Technology, e.g., SwiftData, Room, IndexedDB]
- Cloud sync: [Yes/No, technology]

**Data Privacy**:
- User data handling: [Description]
- Compliance: [GDPR, CCPA, etc.]

### Security Requirements
- Authentication: [Method]
- Authorization: [Approach]
- Data encryption: [At rest/in transit]
- API security: [Approach]

### Integration Requirements
- [ ] [Third-party service 1]
- [ ] [Third-party service 2]
- [ ] Analytics: [Platform]
- [ ] Crash reporting: [Platform]

---

## 📊 Success Metrics & KPIs

### Launch Metrics (First 30 days)
| Metric | Target | Measurement |
|--------|--------|-------------|
| Downloads/Signups | [Number] | [Tool/method] |
| Daily Active Users | [Number] | [Tool/method] |
| User Retention (Day 7) | [%] | [Tool/method] |

### Product Metrics (Ongoing)
| Metric | Target | Measurement |
|--------|--------|-------------|
| [Metric 1] | [Target] | [Tool/method] |
| [Metric 2] | [Target] | [Tool/method] |
| [Metric 3] | [Target] | [Tool/method] |

### Quality Metrics
- Crash rate: [< X%]
- Bug severity: [No P0/P1 bugs in production]
- Test coverage: [≥ X%]
- Performance: [Specific metrics]

---

## 🗓️ Timeline & Milestones

### Phase 0: Foundation (Estimated: [duration])
- [ ] PRD finalized and approved
- [ ] Use zen `planner` with completed PRD to create detailed project plan
- [ ] Multi-agent team deployed (if 3+ features)
- [ ] Architecture design complete (ADRs for major decisions)
- [ ] Technology stack confirmed (mandatory standards followed)
- [ ] Project structure initialized
- [ ] Quality gate criteria defined

### Phase 1: MVP (Estimated: [duration])
- [ ] All P1 features implemented
- [ ] Core user flows functional
- [ ] All features have screenshot evidence
- [ ] Tests passing (≥70% coverage)
- [ ] All commits passed zen `precommit`
- [ ] **🚦 MANDATORY PHASE GATE**: Run analyze + refactor + analyze (performance)
- [ ] All CRITICAL/HIGH issues from phase gate resolved
- [ ] Ready for internal testing

### Phase 2: Enhanced Features (Estimated: [duration])
- [ ] P2 features implemented
- [ ] UI/UX improvements
- [ ] Performance optimization
- [ ] Screenshot evidence for all features
- [ ] Tests passing
- [ ] **🚦 MANDATORY PHASE GATE**: Run analyze + refactor + analyze (performance)
- [ ] Technical debt trend monitored (see tracking/technical-debt-log.md)
- [ ] Performance baseline updated (see tracking/performance-baseline.md)
- [ ] Ready for beta testing

### Phase 3: Launch Preparation (Estimated: [duration])
- [ ] All P3 features complete
- [ ] Production build ready
- [ ] App Store/deployment assets ready
- [ ] **🚦 MANDATORY PHASE GATE**: Final quality validation
- [ ] All phase gates passed
- [ ] No CRITICAL or HIGH severity issues
- [ ] Launch plan executed

---

## ⚠️ Risks & Constraints

### Technical Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| [Risk 1] | [Low/Medium/High] | [Low/Medium/High] | [Mitigation strategy] |
| [Risk 2] | [Low/Medium/High] | [Low/Medium/High] | [Mitigation strategy] |

### Business Risks
| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| [Risk 1] | [Low/Medium/High] | [Low/Medium/High] | [Mitigation strategy] |

### Constraints
- **Budget**: [Constraint]
- **Timeline**: [Constraint]
- **Resources**: [Constraint]
- **Technical**: [Constraint]

---

## 🔄 Dependencies & Integrations

### External Dependencies
- [ ] [Service/API name]: [Purpose]
- [ ] [Third-party SDK]: [Purpose]

### Internal Dependencies
- [ ] [Team/system]: [What's needed]

---

## 📝 Open Questions & Decisions

| Question | Status | Owner | Decision | Date |
|----------|--------|-------|----------|------|
| [Question 1] | Open/Resolved | [Name] | [Decision if resolved] | [Date] |
| [Question 2] | Open/Resolved | [Name] | [Decision if resolved] | [Date] |

---

## 📚 Appendix

### References
- [Document/resource 1]
- [Document/resource 2]
- [Competitive analysis]
- [User research findings]

### Glossary
| Term | Definition |
|------|------------|
| [Term 1] | [Definition] |
| [Term 2] | [Definition] |

### Mockups & Wireframes
- [Link to design files]
- [Figma/Sketch links]

---

## ✅ Approval & Sign-off

| Role | Name | Signature | Date |
|------|------|-----------|------|
| Product Owner | [Name] | | |
| Engineering Lead | [Name] | | |
| Design Lead | [Name] | | |
| Stakeholder | [Name] | | |

---

## 🔄 Revision History

### Future Revisions
- Version 1.1: [Planned changes]
- Version 2.0: [Major revision plans]

---

**Related Documentation**:
- [Project Management](./project-management.md) - Phase planning
- [Quality Gates](./quality-gates.md) - Completion criteria
- [Agent Deployment](./agent-deployment.md) - Team structure
- [Main Index](../claude.md) - Workflow overview

---

**Instructions for Use**:

**Phase 0 - PRD Creation**:
1. ✅ Read [claude.md - MANDATORY REQUIREMENTS](../claude.md#⚠️-mandatory-requirements-read-first) first
2. ✅ Copy this template for your project
3. ✅ Fill in ALL sections completely
4. ✅ For iOS: Verify tech stack follows [iOS Development Standards](./ios-development.md)
5. ✅ For macOS: Verify tech stack follows [macOS Development Standards](./mac-development.md)
6. ✅ Review with team and stakeholders
7. ✅ Get formal approval (sign-off section)

**Phase 0 - Project Planning**:
7. ✅ Use zen `planner` with completed PRD:
   ```yaml
   Tool: zen:planner
   model: "gemini-2.5-pro"
   step: "Break down [Project Name] PRD into detailed phase plan with task dependencies"
   working_directory: "/absolute/path/to/project"
   # Reference this completed PRD in your prompt
   ```
8. ✅ Deploy multi-agent team if 3+ features (see [Agent Deployment](./agent-deployment.md))
9. ✅ Create ADRs for any major technical decisions using tool chain:
   - `challenge` → `consensus` → (optional) `clink` → Create ADR
   - See [Tool Chaining Patterns](./tool-chaining-patterns.md) Pattern 10

**During Development**:
10. ✅ Reference PRD throughout development
11. ✅ Update as requirements evolve (version control)
12. ✅ Create ADRs for new major decisions
13. ✅ Run zen `precommit` before EVERY commit (MANDATORY)
14. ✅ Capture screenshot evidence for every feature
15. ✅ Run mandatory phase gates at end of each phase

**Quality Checklist (Every Phase)**:
- [ ] zen `precommit` passed for all commits
- [ ] Screenshot evidence for all features
- [ ] Tests ≥70% coverage
- [ ] Build passes
- [ ] Phase gates passed (analyze + refactor + analyze)

**Remember**:
- A well-defined PRD enables effective planning with zen `planner`
- Following mandatory requirements prevents rework and failed quality gates
- Multi-agent teams are REQUIRED for projects with 3+ features
- Phase gates are MANDATORY - no exceptions!
