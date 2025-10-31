# Changelog

All notable changes to the Claude Dev Workflow project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

---

## [3.2.0] - 2025-01-31

### Added
- **macOS Development Support**: Comprehensive development guidelines for macOS applications, mirroring iOS standards
  - New docs/mac-development.md guide (846 lines) with mandatory rules for SwiftUI, SwiftData, @Observable
  - Target: macOS 14.0+ (Sonoma) minimum
  - macOS-specific patterns: NavigationSplitView, window management, menu bar integration
  - Same 5-agent team structure as iOS
  - Same mandatory tech stack: SwiftUI, SwiftData, @Observable, async/await
  - Updated claude.md to include iOS/macOS Development Standards (lines 42-63)
  - Updated README.md to list macOS as fully supported platform
  - Updated docs/PRD.md with macOS platform-specific guidelines

### Why v3.2
macOS applications follow the same modern Swift development practices as iOS (SwiftUI, SwiftData, Observation framework). By adding macOS as a parallel platform option with identical mandatory standards, the workflow now supports both Apple platforms without code bloat or iOS workflow degradation. Uses consistent "iOS/macOS" pattern throughout documentation.

---

## [3.1.0] - 2025-01-30

### Added
- **clink Tool Integration**: Comprehensive documentation for using external AI perspectives
  - Detailed `clink` section in docs/zen-tools-guide.md with usage examples
  - 3 new tool chaining patterns featuring clink integration:
    - Pattern 8: Complex Bug with External Validation
    - Pattern 9: Security-Critical Code Review
    - Pattern 10: Architectural Decision with External Challenge
  - Updated claude.md tool table to show clink's tactical use

### Why v3.1
External AI perspectives provide genuine value for critical scenarios (complex bugs, security reviews, high-stakes decisions) by breaking echo chambers and catching blind spots that internal tools miss. This is a tactical enhancement that doesn't change the core workflow but provides a powerful tool for edge cases.

---

## [3.0.0] - 2025-01-30

### Added
- **MANDATORY REQUIREMENTS** section in claude.md (lines 9-106) - Cannot be missed by agents
- **Decision tree** in agent-deployment.md - Clear WHEN to spawn multi-agent teams
- **MANDATORY RULES** in ios-development.md - Zero tolerance for violations

### Changed
- 51% documentation reduction (15,476 → ~7,500 lines)
- Clear enforcement hierarchy (MUST vs SHOULD vs OPTIONAL)

### Removed
- 4 redundant files totaling 2,892 lines:
  - GETTING_STARTED.md (428 lines)
  - PROJECT_SUMMARY.md (449 lines)
  - WORKFLOW-IMPROVEMENTS-SUMMARY.md (622 lines)
  - WORKFLOW-ENFORCEMENT-IMPLEMENTATION-GUIDE.md (1,393 lines)

### Fixed
- README.md simplified from 680 to 380 lines (44% reduction)
- All broken links to deleted files updated

### Why v3.0
Agents were missing critical instructions (team spawning, iOS guidelines) because they were buried in 15K+ lines of documentation. v3.0 puts mandatory requirements front and center with clear enforcement, making it impossible for agents to miss critical instructions.

---

## [2.0.0] - 2025-01-20

### Added
- **Phase Gates**: Mandatory analyze + refactor + analyze (performance) at every phase end
- **Architecture Decision Records (ADRs)**: Formal decision documentation workflow
  - ADR template (docs/adr/template.md)
  - ADR guide (docs/adr/README.md)
- **Technical Debt Monitoring**: Phase-by-phase tracking with trend analysis
  - Technical debt log template (tracking/technical-debt-log.md)
- **Performance Baselines**: Platform-specific metrics and regression detection
  - Performance baseline template (tracking/performance-baseline.md)
- **Tool Chaining Patterns**: 7 documented sequences for common scenarios
  - docs/tool-chaining-patterns.md (730 lines)
- **Knowledge Base System**: Structured preservation with continuation IDs
  - tracking/knowledge-base/ directory structure
- **Cross-Phase Retrospectives**: Systematic learning and improvement
  - Retrospective template (tracking/knowledge-base/retrospectives/template.md)

### Why v2.0
Shift from reactive to proactive development workflow. Instead of using tools only when problems occur, v2.0 introduces systematic quality checks at phase boundaries, formal decision documentation, and continuous monitoring to prevent issues before they happen. Expected to reduce bugs reaching later phases by 50-70%.

---

## [1.0.0] - 2025-01-20

### Added
- Complete iOS development workflow with SwiftUI, SwiftData, @Observable
- Multi-agent coordination system with 5-agent iOS team structure
- Phase-based development methodology
- Quality gates for task and phase completion
- Zen MCP tools integration (11 tools documented)
- Session management and context preservation
- Mock data strategy and transition planning
- iOS deployment script (scripts/deploy-ios-project.sh)
- Complete documentation suite (9 core guides)
- Project templates for iOS applications

### Initial Release
First public release of the Claude Dev Workflow system, providing a comprehensive, phase-based approach for AI agent teams building production-quality iOS applications.

---

## Version Numbering

- **Major versions (X.0.0)**: Breaking changes, significant workflow restructuring
- **Minor versions (x.Y.0)**: New features, additional tools/patterns, backward compatible
- **Patch versions (x.y.Z)**: Bug fixes, documentation improvements, minor updates

---

**See**: [README.md](./README.md) for current version overview
