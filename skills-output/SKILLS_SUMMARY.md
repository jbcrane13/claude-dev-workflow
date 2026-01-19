# Claude Dev Workflow Skills - Complete Suite

**Version**: 3.1.0
**Created**: 2025-11-19
**Total Skills**: 4 (1 comprehensive + 3 specialized)

## Overview

This suite of skills transforms the comprehensive Claude Dev Workflow documentation into reusable, invokable AI skills. These skills enable Claude to guide development projects with phase-based methodologies, quality gates, and proactive quality practices.

---

## Skills Architecture

### Strategy: Hybrid Approach

We created **1 comprehensive skill** for complete workflow coverage, plus **3 specialized skills** for focused expertise:

```
claude-dev-workflow (MAIN)
├── Comprehensive workflow for all project types
├── All platforms: iOS, macOS, Web, Multi-platform
└── Complete methodology reference

iOS-specific (SPECIALIZED)
├── SwiftUI/SwiftData mandatory standards
├── iOS 17.0+ exclusive patterns
└── Mobile-first development

macOS-specific (SPECIALIZED)
├── SwiftUI for macOS patterns
├── NavigationSplitView, desktop UI
└── macOS 14.0+ exclusive patterns

Quality Engineering (SPECIALIZED)
├── Quality gates & phase gates
├── Testing strategies
├── Technical debt & performance tracking
└── Zen tools for quality assurance
```

---

## Skill 1: claude-dev-workflow (Comprehensive)

**File**: `claude-dev-workflow.zip` (86KB)
**Type**: Main comprehensive skill
**Platform**: All (iOS, macOS, Web, Multi-platform)

### When to Use

Invoke this skill when you need:
- Complete development workflow for any project type
- Phase-based project planning and execution
- Multi-agent team deployment guidance
- Comprehensive quality gates and phase gates
- Session management and handoffs
- Architecture decision making (ADRs)
- Platform-agnostic workflow guidance

### What It Contains

**Core Methodology**:
- Phase-based development structure (Phase 0 → Phase N)
- Multi-agent team deployment (iOS 5-agent, Web 6-agent)
- Quality gates (task completion criteria)
- Phase gates (phase boundary validations)
- Session management and continuity

**Platform Standards**:
- iOS: SwiftUI, SwiftData, @Observable, async/await
- macOS: SwiftUI, SwiftData, NavigationSplitView
- Web: Development workflow patterns

**Proactive Quality**:
- Tier 1 Mandatory: Phase gates, ADRs, technical debt
- Tier 2 High Value: Performance baselines, tool chains
- Tier 3 Advanced: Dependency monitoring, retrospectives

**Zen MCP Tools Integration**:
- planner, consensus, analyze, refactor, codereview
- debug, precommit, challenge, thinkdeep
- Tool chaining patterns for common scenarios

**Knowledge Management**:
- Architecture Decision Records (ADRs)
- Technical debt tracking
- Performance baseline monitoring
- Knowledge base system

### Use Cases

1. **Starting any new project** (iOS/macOS/Web)
2. **Deploying multi-agent teams**
3. **Enforcing quality standards across platforms**
4. **Managing complex projects with multiple phases**
5. **Making architectural decisions systematically**
6. **Tracking technical debt and performance**

### Key Features

- ✅ Complete workflow from Phase 0 to completion
- ✅ Platform-specific standards (iOS, macOS, Web)
- ✅ Multi-agent coordination patterns
- ✅ Mandatory quality gates and phase gates
- ✅ Proactive quality system (prevent bugs before they occur)
- ✅ Comprehensive Zen tools guidance
- ✅ Session continuity and handoff protocols

---

## Skill 2: ios-development-workflow (Specialized)

**File**: `ios-development-workflow.zip` (32KB)
**Type**: Platform-specific specialized skill
**Platform**: iOS 17.0+

### When to Use

Invoke this skill when you need:
- iOS-specific development standards enforcement
- SwiftUI/SwiftData mandatory tech stack guidance
- iOS code review (verify compliance)
- iOS architecture patterns (@Observable, NavigationStack)
- iOS-specific quality gates
- Mobile-first development patterns

### What It Contains

**Mandatory iOS Stack**:
- ✅ SwiftUI (exclusively for UI)
- ✅ SwiftData (exclusively for persistence)
- ✅ @Observable (exclusively for state)
- ✅ async/await (exclusively for async)
- ✅ NavigationStack (modern navigation)

**Forbidden Technologies**:
- ❌ UIKit, Core Data, Combine
- ❌ @Published, @ObservableObject, @StateObject
- ❌ NavigationView, completion handlers

**iOS-Specific Patterns**:
- State management with @Observable
- SwiftData model implementation
- NavigationStack routing
- Loading states and error handling
- Form input patterns

**iOS Quality Gates**:
- SwiftUI/SwiftData compliance checks
- iOS 17.0+ target verification
- Screenshot evidence (iPhone simulator)
- XCTest unit tests
- XCUITest UI tests

**iOS Phase Gates**:
- Build time, cold start, memory, binary size metrics
- Performance regression thresholds
- SwiftUI architecture validation

### Use Cases

1. **Building iOS 17.0+ applications**
2. **Enforcing SwiftUI/SwiftData standards**
3. **iOS code review (forbidden tech detection)**
4. **iOS architecture decisions**
5. **iOS performance optimization**
6. **iOS testing strategies**

### Key Features

- ✅ Zero tolerance for legacy tech (UIKit, Core Data, Combine)
- ✅ Comprehensive SwiftUI patterns and examples
- ✅ @Observable state management guide
- ✅ NavigationStack implementation patterns
- ✅ iOS-specific quality and phase gates
- ✅ Mobile-first development practices
- ✅ 5-agent iOS team coordination

---

## Skill 3: macos-development-workflow (Specialized)

**File**: `macos-development-workflow.zip` (29KB)
**Type**: Platform-specific specialized skill
**Platform**: macOS 14.0+ (Sonoma)

### When to Use

Invoke this skill when you need:
- macOS-specific development standards enforcement
- SwiftUI for macOS patterns (NavigationSplitView)
- Desktop-first multi-pane app development
- macOS code review (verify compliance)
- Toolbar and menu customization
- Window management patterns

### What It Contains

**Mandatory macOS Stack**:
- ✅ SwiftUI (exclusively for UI)
- ✅ SwiftData (exclusively for persistence)
- ✅ @Observable (exclusively for state)
- ✅ async/await (exclusively for async)
- ✅ NavigationSplitView / NavigationStack

**Forbidden Technologies**:
- ❌ AppKit, Core Data, Combine
- ❌ @Published, @ObservableObject, @StateObject
- ❌ NavigationView, completion handlers

**macOS-Specific Patterns**:
- NavigationSplitView (2-column and 3-column)
- Toolbar customization
- Menu bar integration
- Window management
- Settings window
- Keyboard shortcuts

**macOS Quality Gates**:
- SwiftUI/SwiftData compliance checks
- macOS 14.0+ target verification
- Screenshot evidence (macOS window)
- Desktop patterns validation
- Menu and toolbar verification

**macOS Phase Gates**:
- Build time, cold start, memory, app size metrics
- Window resize performance
- Desktop-specific regression checks

### Use Cases

1. **Building macOS 14.0+ applications**
2. **Enforcing SwiftUI for macOS standards**
3. **Desktop-first multi-pane app development**
4. **macOS code review (forbidden tech detection)**
5. **Toolbar and menu implementation**
6. **Multi-window management**

### Key Features

- ✅ Zero tolerance for legacy tech (AppKit, Core Data, Combine)
- ✅ NavigationSplitView as primary navigation
- ✅ Desktop-first design patterns
- ✅ Comprehensive toolbar and menu examples
- ✅ Window management best practices
- ✅ macOS-specific quality and phase gates
- ✅ 5-agent macOS team coordination

---

## Skill 4: quality-engineering-workflow (Specialized)

**File**: `quality-engineering-workflow.zip` (47KB)
**Type**: Quality-focused specialized skill
**Platform**: Platform-agnostic (iOS, macOS, Web, Backend)

### When to Use

Invoke this skill when you need:
- Quality gates enforcement (before task completion)
- Phase gates implementation (at phase boundaries)
- Mandatory pre-commit workflow
- Testing strategy and guidelines
- Technical debt tracking
- Performance baseline monitoring
- Architecture Decision Records (ADRs)
- Zen tools for quality assurance

### What It Contains

**Quality Gates** (Task/Feature Completion):
- Code quality checklist
- Functionality verification
- Testing requirements (70% coverage minimum)
- Build verification
- Documentation requirements
- **MANDATORY pre-commit validation**

**Phase Gates** (Phase Completion):
- Three-step mandatory sequence:
  1. `zen analyze` (quality focus)
  2. `zen refactor` (technical debt)
  3. `zen analyze` (performance focus)
- Critical/high issue resolution
- Phase summary with continuation IDs

**Pre-Commit Workflow** (MANDATORY):
- NO commits without `zen precommit`
- Address ALL findings before committing
- Commit only after passing validation
- Post-commit verification

**Proactive Quality System**:
- **Tier 1 Mandatory**:
  - Phase gates (analyze + refactor + analyze)
  - ADRs for major decisions
  - Technical debt monitoring
- **Tier 2 High Value**:
  - Performance baselines
  - Tool chaining patterns
  - Knowledge base system

**Testing Guidelines**:
- Unit testing (business logic, 90% coverage)
- Integration testing (API, database, multi-component)
- UI testing (critical flows)
- Test pyramid model
- Platform-specific testing (XCTest, XCUITest, etc.)

**Zen Tools for Quality**:
- `precommit` (MANDATORY before every commit)
- `codereview` (systematic review)
- `analyze` (quality, performance, security)
- `refactor` (code smells, improvements)
- `debug` (root cause analysis)
- `challenge` (critical thinking)
- `consensus` (multi-model validation)

**Quality Tracking**:
- Technical debt log (severity tracking, trend analysis)
- Performance baseline (platform-specific metrics)
- Quality scorecard
- Process compliance metrics

### Use Cases

1. **Enforcing quality gates before task completion**
2. **Running mandatory phase gates at phase boundaries**
3. **Implementing pre-commit validation workflow**
4. **Establishing comprehensive testing strategy**
5. **Tracking technical debt trends across phases**
6. **Monitoring performance baselines and regressions**
7. **Creating Architecture Decision Records (ADRs)**
8. **Using Zen MCP tools for quality assurance**

### Key Features

- ✅ Prevents 50-70% of bugs through proactive quality
- ✅ MANDATORY pre-commit workflow (no exceptions)
- ✅ Phase gates catch issues before next phase
- ✅ ADRs preserve architectural decisions
- ✅ Technical debt tracking with trend analysis
- ✅ Performance regression detection
- ✅ Comprehensive testing guidelines (unit, integration, UI)
- ✅ Tool chaining patterns for quality workflows

---

## Skill Selection Guide

### Decision Tree

**Q: Do you need complete workflow guidance for any project type?**
→ Use: **claude-dev-workflow** (comprehensive)

**Q: Are you building an iOS application?**
→ Use: **ios-development-workflow** (specialized iOS)

**Q: Are you building a macOS application?**
→ Use: **macos-development-workflow** (specialized macOS)

**Q: Do you need quality enforcement, testing, or phase gates?**
→ Use: **quality-engineering-workflow** (specialized quality)

### Multiple Skills

You can use multiple skills together:

**Example 1: iOS Project**
- Primary: **ios-development-workflow** (iOS-specific standards)
- Supporting: **quality-engineering-workflow** (quality gates, testing)

**Example 2: macOS Project**
- Primary: **macos-development-workflow** (macOS-specific standards)
- Supporting: **quality-engineering-workflow** (quality gates, testing)

**Example 3: Multi-Platform Project**
- Primary: **claude-dev-workflow** (complete workflow)
- Supporting: **ios-development-workflow** (for iOS components)
- Supporting: **macos-development-workflow** (for macOS components)
- Supporting: **quality-engineering-workflow** (quality enforcement)

---

## Installation & Usage

### Step 1: Upload Skills to Claude

1. Go to https://claude.ai/skills
2. Click "Upload Skill"
3. Upload each .zip file:
   - `claude-dev-workflow.zip`
   - `ios-development-workflow.zip`
   - `macos-development-workflow.zip`
   - `quality-engineering-workflow.zip`

### Step 2: Invoke Skills in Conversations

**Example 1: Starting an iOS Project**
```
I'm starting a new iOS app for task management.
Please invoke the ios-development-workflow skill to guide me.
```

**Example 2: Quality Gate Check**
```
I've completed the user authentication feature.
Please invoke the quality-engineering-workflow skill
to verify all quality gates before marking complete.
```

**Example 3: Phase Completion**
```
Phase 1 is complete. Please invoke the
quality-engineering-workflow skill to run phase gates.
```

**Example 4: Complete Workflow**
```
I'm planning a new macOS application.
Please invoke the claude-dev-workflow skill for
complete project planning and phase structure.
```

### Step 3: Follow Skill Guidance

Each skill will provide:
- Clear instructions and checklists
- Platform-specific standards
- Quality gate requirements
- Phase gate sequences
- Code examples and patterns
- Zen tool usage guidance

---

## Skill Contents Summary

### File Sizes

| Skill | Size | Components |
|-------|------|------------|
| claude-dev-workflow | 86KB | SKILL.md + 12 reference docs |
| ios-development-workflow | 32KB | SKILL.md + 4 reference docs |
| macos-development-workflow | 29KB | SKILL.md + 4 reference docs |
| quality-engineering-workflow | 47KB | SKILL.md + 7 reference docs |

### Reference Documents Included

**claude-dev-workflow**:
- PRD template
- Agent deployment guide
- iOS & macOS development standards
- Project management guide
- Session management guide
- Testing guidelines
- Zen tools guide
- Tool chaining patterns
- ADR guide and templates
- Mock data strategy
- Quality gates guide
- Technical debt & performance tracking

**ios-development-workflow**:
- iOS development standards
- Quality gates
- Testing guidelines
- Zen tools guide

**macos-development-workflow**:
- macOS development standards
- Quality gates
- Testing guidelines
- Zen tools guide

**quality-engineering-workflow**:
- Quality gates guide
- Testing guidelines
- Zen tools guide
- Tool chaining patterns
- ADR guide and templates
- Technical debt log
- Performance baseline tracking

---

## Key Differences from Original Documentation

### Optimized for AI Skill Format

1. **Structured for Invocation**: Each skill has clear "When to Use" section
2. **Focused Expertise**: Specialized skills provide deep-dive guidance
3. **Quick Reference**: Condensed checklists and patterns
4. **Embedded Examples**: Code examples inline for immediate use
5. **Decision Trees**: Clear guidance on which skill to use when
6. **Self-Contained**: Each skill works independently or in combination

### Enhanced Value

1. **Reusable**: Invoke skills across multiple projects
2. **Consistent**: Same standards and practices every time
3. **Comprehensive**: All workflow knowledge in skill format
4. **Accessible**: Quick access without searching documentation
5. **AI-Native**: Optimized for Claude's skill system

---

## Maintenance & Updates

### Version Tracking

All skills are version-synchronized:
- **Current Version**: 3.1.0
- **Last Updated**: 2025-01-30
- **Source**: GitHub repository jbcrane13/claude-dev-workflow

### Future Updates

When the original documentation is updated:
1. Regenerate skills from updated docs
2. Increment version number
3. Re-package and re-upload
4. Maintain backward compatibility where possible

---

## Success Metrics

### Expected Impact

Using these skills, projects should achieve:

**Quality Improvements**:
- 50-70% reduction in bugs reaching later phases
- 100% pre-commit validation compliance
- 100% phase gate completion
- 70%+ test coverage

**Process Improvements**:
- Clear phase structure and incremental delivery
- Systematic architectural decision making
- Visible technical debt and performance trends
- Preserved institutional knowledge

**Team Improvements**:
- Multi-agent coordination patterns
- Session continuity across handoffs
- Consistent standards enforcement
- Better architecture decisions

---

## Support & Feedback

### Questions or Issues

1. **Documentation**: See original repo at https://github.com/jbcrane13/claude-dev-workflow
2. **Skill Issues**: Create issue in GitHub repository
3. **Updates**: Watch repository for new versions

### Contributing

Improvements to skills can be contributed through:
1. GitHub pull requests to original documentation
2. Issue reports with suggested enhancements
3. Feedback on skill effectiveness

---

## Summary

This suite of 4 skills transforms the comprehensive Claude Dev Workflow into reusable AI expertise:

1. **claude-dev-workflow** (86KB) - Complete methodology for all projects
2. **ios-development-workflow** (32KB) - iOS 17.0+ SwiftUI expertise
3. **macos-development-workflow** (29KB) - macOS 14.0+ desktop development
4. **quality-engineering-workflow** (47KB) - Proactive quality system

**Total Knowledge**: 194KB of workflow expertise
**Platform Coverage**: iOS, macOS, Web, Multi-platform
**Quality Focus**: Proactive (prevent bugs before they occur)
**Expected Impact**: 50-70% reduction in bugs, better decisions, visible trends

Upload all four skills to Claude for comprehensive development workflow support! 🚀
