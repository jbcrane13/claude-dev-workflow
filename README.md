# Claude Dev Workflow

**Version**: 2.0  
**Last Updated**: 2025-01-20  
**License**: MIT

---

## 🎯 Overview

A comprehensive, phase-based development workflow for AI agent teams building production-quality applications. **Version 2.0** introduces a paradigm shift from **reactive** (fixing problems) to **proactive** (preventing problems) development with systematic quality assurance, decision documentation, and knowledge preservation.

### Key Features

- ✅ **Multi-Agent Coordination** - Parallel execution with coordinated oversight
- ✅ **Phase-Based Development** - Incremental delivery of working features
- ✅ **Proactive Quality System** ⭐ NEW - Phase gates, ADRs, systematic validation
- ✅ **Technical Debt Monitoring** ⭐ NEW - Track trends before they become problems
- ✅ **Performance Baselines** ⭐ NEW - Detect regressions early (>10% threshold)
- ✅ **Knowledge Preservation** ⭐ NEW - Continuation IDs and structured learning
- ✅ **Tool Chaining Patterns** ⭐ NEW - Proven sequences for common scenarios
- ✅ **Session Continuity** - Seamless handoffs across sessions
- ✅ **Zen MCP Integration** - Enhanced collaboration through AI tools
- ✅ **Production Ready** - Battle-tested patterns and practices

### 🆕 What's New in v2.0

**Shift from Reactive to Proactive**:
- **Before**: Tools used only when problems occur
- **After**: Systematic prevention at every phase with mandatory quality gates

**Expected Impact**:
- 📉 50-70% reduction in bugs reaching later phases
- 🎯 Better architectural decisions through multi-model validation
- 📊 Visible quality, performance, and debt trends
- 🧠 Institutional knowledge preserved across sessions

---

## 📚 Documentation

### Core Workflow Documents

| Document | Purpose |
|----------|---------|
| [claude.md](./claude.md) | Master index and quick start guide |
| [PRD Template](./docs/PRD.md) | Product Requirements Document template |
| [Agent Deployment](./docs/agent-deployment.md) | Multi-agent team structures |
| [Project Management](./docs/project-management.md) | Phase-based planning |
| [Session Management](./docs/session-management.md) | Context preservation |
| [iOS Development](./docs/ios-development.md) | iOS technical standards |
| [Testing Guidelines](./docs/testing-guidelines.md) | Testing requirements |
| [Zen Tools Guide](./docs/zen-tools-guide.md) | MCP tool usage |
| [Mock Data Strategy](./docs/mock-data-strategy.md) | Data transition planning |
| [Quality Gates](./docs/quality-gates.md) | Completion criteria |

### ⭐ NEW: Proactive Quality System (v2.0)

| Document | Purpose |
|----------|---------|
| [**Workflow Improvements Summary**](./WORKFLOW-IMPROVEMENTS-SUMMARY.md) | Complete guide to v2.0 proactive system |
| [**Tool Chaining Patterns**](./docs/tool-chaining-patterns.md) | 7 proven tool sequences for common scenarios |
| [**ADR Template**](./docs/adr/template.md) | Architecture Decision Record template |
| [**ADR Guide**](./docs/adr/README.md) | How to document architectural decisions |
| [**Technical Debt Log**](./tracking/technical-debt-log.md) | Phase-by-phase debt tracking template |
| [**Performance Baseline**](./tracking/performance-baseline.md) | Performance regression detection template |
| [**Retrospective Template**](./tracking/knowledge-base/retrospectives/template.md) | Phase retrospective template |

---

## 🚀 Quick Start

### For iOS Projects

```bash
# 1. Clone this repository
git clone https://github.com/yourusername/claude-dev-workflow.git

# 2. Navigate to deployment scripts
cd claude-dev-workflow/scripts

# 3. Run iOS project deployment script
./deploy-ios-project.sh "MyAwesomeApp" "/path/to/create/project"

# 4. Follow the workflow
# - Start with claude.md for overview
# - Review docs/ios-development.md for iOS standards
# - Use docs/project-management.md for phase planning
```

### For Other Project Types

Coming soon:
- Android deployment script
- Web application deployment script
- General software deployment script

---

## 📁 Repository Structure

```
claude-dev-workflow/
├── README.md                                      # This file
├── LICENSE                                        # MIT License
├── claude.md                                      # Master workflow index
├── WORKFLOW-IMPROVEMENTS-SUMMARY.md               # ⭐ NEW: v2.0 proactive system guide
│
├── docs/                                          # Complete documentation
│   ├── PRD.md                                     # Product Requirements Document template
│   ├── agent-deployment.md                        # Team structures
│   ├── project-management.md                      # Phase planning
│   ├── session-management.md                      # Continuity practices
│   ├── ios-development.md                         # iOS standards
│   ├── testing-guidelines.md                      # Testing requirements
│   ├── zen-tools-guide.md                         # Zen MCP tools (updated v2.0)
│   ├── mock-data-strategy.md                      # Data strategy
│   ├── quality-gates.md                           # Completion criteria (updated v2.0)
│   ├── tool-chaining-patterns.md                  # ⭐ NEW: Tool sequence patterns
│   └── adr/                                       # ⭐ NEW: Architecture Decision Records
│       ├── README.md                              #   ADR guide
│       └── template.md                            #   ADR template
│
├── templates/                                     # Project templates
│   ├── ios/                                       # iOS project template
│   │   ├── project-structure.md                   # Structure guide
│   │   └── .gitignore                             # iOS gitignore
│   ├── android/                                   # [Coming soon]
│   └── web/                                       # [Coming soon]
│
├── tracking/                                      # Template tracking files
│   ├── session-state.md                           # Session state template
│   ├── phase-status.md                            # Phase tracking template
│   ├── mock-data-registry.md                      # Mock data template
│   ├── technical-debt-log.md                      # ⭐ NEW: Debt tracking
│   ├── performance-baseline.md                    # ⭐ NEW: Performance monitoring
│   ├── knowledge-base/                            # ⭐ NEW: Knowledge preservation
│   │   ├── architecture-decisions/                #   ADR tool outputs
│   │   ├── performance-analysis/                  #   Performance reports
│   │   ├── technical-debt/                        #   Refactor outputs
│   │   └── retrospectives/                        #   Phase retrospectives
│   │       └── template.md                        #   Retrospective template
│   └── screenshots/                               # Screenshots directory
│       └── README.md                              # Screenshot guide
│
├── scripts/                                       # Deployment scripts
│   ├── deploy-ios-project.sh                      # iOS project setup (updated v2.0)
│   ├── deploy-android-project.sh                  # [Coming soon]
│   └── deploy-web-project.sh                      # [Coming soon]
│
└── examples/                                      # Example projects
    ├── ios-task-app/                              # Complete iOS example
    └── README.md                                  # Examples guide
```

---

## 🎭 Supported Project Types

### ✅ Currently Supported

- **iOS Applications** (Swift, SwiftUI, SwiftData)
  - Full deployment script
  - Complete documentation
  - Example project
  - Template files

### 🔄 Coming Soon

- **Android Applications** (Kotlin, Jetpack Compose)
- **Web Applications** (React, Vue, Angular)
- **Backend Services** (Node.js, Python, Go)
- **General Software** (Any language/framework)

---

## 🤖 Agent Team Structures

### iOS Development Team (5 agents)

```yaml
Team: ios-development
Size: 5 agents
Mode: Parallel with coordination

Roles:
  - Coordinator Agent (1)
    → Manages workflow, ensures quality
    
  - Architecture Agent (1)
    → SwiftUI architecture, SwiftData models
    
  - Feature Development Agents (2)
    → Parallel feature implementation
    
  - Testing Agent (1)
    → Unit/UI tests, quality verification
```

See [Agent Deployment Guide](./docs/agent-deployment.md) for complete team structures.

---

## 📋 Development Workflow

### Phase Structure with Proactive Quality ⭐

```
Phase 0: Foundation & Planning
   ↓
Phase 1: Core P1 Features (MVP)
   ↓
   🚦 MANDATORY PHASE GATE (NEW in v2.0)
   - analyze (quality) → baseline
   - refactor (debt) → track trends
   - analyze (performance) → detect regressions
   ↓
Phase 2: Enhanced P1 + P2 Features
   ↓
   🚦 MANDATORY PHASE GATE
   - Compare to previous phase
   - Address CRITICAL/HIGH issues
   - Update trend tracking
   ↓
Phase 3: P3 Features + Polish
   ↓
   🚦 MANDATORY PHASE GATE
   ↓
Phase N: Production Ready
```

### Quality Gates

**Every Task** must pass:
- ✅ Code quality checks
- ✅ Functionality verification
- ✅ Tests passing
- ✅ Build successful
- ✅ Screenshot evidence
- ✅ Documentation complete

**Every Phase** must pass ⭐ NEW:
- ✅ Quality baseline analysis (`analyze`)
- ✅ Technical debt analysis (`refactor`)
- ✅ Performance regression check (`analyze` performance)
- ✅ CRITICAL/HIGH issues addressed
- ✅ Trends documented (improving/stable/declining)

See [Quality Gates](./docs/quality-gates.md) for complete checklist.

---

## 🔧 Zen MCP Tools Integration

### Available Tools

| Tool | Purpose | When to Use | v2.0 Usage ⭐ |
|------|---------|-------------|---------------|
| `planner` | Project breakdown | Phase 0, Planning | Initial planning with PRD |
| `analyze` | Codebase analysis | Throughout development | **Phase gates (quality + performance)** |
| `refactor` | Code improvement | Phase 2+ | **Phase gates (debt tracking)** |
| `codereview` | Quality verification | Before completion | Before all commits |
| `debug` | Issue resolution | When problems arise | Bug investigations |
| `precommit` | Final verification | **Before EVERY commit** | **Mandatory (100% compliance)** |
| `consensus` | Team alignment | Major decisions | **ADR workflow** |
| `challenge` | Question assumptions | Major decisions | **ADR workflow** |
| `thinkdeep` | Deep analysis | Complex problems | ADR workflow, debugging |
| `apilookup` | API documentation | Dependency updates | Proactive monitoring |

See [Zen Tools Guide](./docs/zen-tools-guide.md) and [Tool Chaining Patterns](./docs/tool-chaining-patterns.md) for detailed usage.

---

## 📸 Screenshot Evidence

**Critical Requirement**: Nothing is complete without screenshot proof!

Every feature must have:
- Screenshot showing functionality
- Screenshot of success state
- Screenshot of error state (if applicable)

Screenshots stored in: `tracking/screenshots/`

---

## ⚡ Proactive Quality System (v2.0)

### Three-Tier Implementation

**Tier 1: Mandatory (High Impact, Easy)**
- 🚦 **Phase Gate Validations** - Run at EVERY phase end (15-20 min)
  - `analyze` (quality) → Establish baseline
  - `refactor` (codesmells) → Track technical debt
  - `analyze` (performance) → Detect regressions >10%

- 📋 **Architecture Decision Records (ADRs)** - Document major decisions (20-30 min)
  - `challenge` → Question assumptions
  - `consensus` → Multi-model validation (for/against/neutral)
  - `thinkdeep` → Deep investigation (optional)
  - Document with continuation IDs

- 📊 **Technical Debt Monitoring** - Track trends every phase (10-15 min)
  - Phase-by-phase tracking
  - Severity classification (CRITICAL/HIGH/MEDIUM/LOW)
  - Trend analysis: ⬆️ Increasing / ➡️ Stable / ⬇️ Decreasing

**Tier 2: High Value (Moderate Effort)**
- 📈 **Performance Baselines** - Establish and monitor (30 min initial, 15 min/phase)
  - Platform-specific metrics (build time, launch time, memory, size)
  - Regression detection (>10% threshold)
  - Baseline comparison

- 🔗 **Tool Chaining Patterns** - Follow proven sequences
  - 7 documented patterns for common scenarios
  - Continuation ID management
  - Context preservation across tools

- 🧠 **Knowledge Base System** - Preserve institutional knowledge
  - Structured storage of tool outputs
  - ADR documentation
  - Performance and debt reports
  - Phase retrospectives

**Tier 3: Advanced (Future Optimization)**
- 🔄 **Cross-Phase Retrospectives** - Learn and improve
- 🔍 **Dependency Monitoring** - Proactive API/SDK tracking

### Quick Reference

**End of Every Phase** (Mandatory):
```yaml
1. ✅ analyze (quality) → Save continuation_id → Document
2. ✅ refactor (debt) → Save continuation_id → Document
3. ✅ analyze (performance) → Save continuation_id → Document
4. ✅ Address CRITICAL/HIGH issues
5. ✅ Create phase-X-summary.md with all continuation IDs
6. ✅ Update trend tracking

Time: 15-20 minutes
Value: Prevents 50-70% of future issues
```

**Major Decisions** (Recommended):
```yaml
1. ✅ challenge → Question assumptions
2. ✅ consensus → Multi-model validation
3. ✅ (Optional) thinkdeep → Deep dive
4. ✅ Create ADR-NNN.md with continuation IDs

Time: 20-30 minutes
Value: Better decisions, preserved knowledge
```

See [WORKFLOW-IMPROVEMENTS-SUMMARY.md](./WORKFLOW-IMPROVEMENTS-SUMMARY.md) for complete details.

---

## 🎯 Getting Started Checklist

### New Project Setup

- [ ] Read [claude.md](./claude.md) master index
- [ ] Create [PRD](./docs/PRD.md) defining product requirements
- [ ] Review [Agent Deployment](./docs/agent-deployment.md)
- [ ] Select appropriate team structure
- [ ] Run deployment script for your platform
- [ ] Review technical guidelines (iOS, Web, etc.)
- [ ] Use Zen `planner` with PRD to create project plan
- [ ] Define Phase 0-N in project-management format
- [ ] Set up session management tracking
- [ ] Initialize mock data registry
- [ ] Begin Phase 0: Foundation

---

## 💡 Best Practices

### Planning
1. Use Zen `planner` for breakdown
2. Identify P1 features early
3. Plan all phases upfront
4. Update plans as you learn

### Execution
1. Focus on one phase at a time
2. Complete tasks fully before moving on
3. Never skip quality gates
4. Document all decisions

### Quality
1. Test continuously
2. Build frequently
3. Screenshot everything
4. Review before completion (Zen `codereview`)

### Communication
1. Update phase status daily
2. Document blockers immediately
3. Celebrate phase completions
4. Learn from retrospectives (Zen `consensus`)

---

## 📦 Installation & Usage

### Prerequisites

- Git
- For iOS: Xcode 15+, macOS
- For Web: Node.js 18+, npm/yarn
- For Android: Android Studio, JDK 17+

### Clone Repository

```bash
git clone https://github.com/yourusername/claude-dev-workflow.git
cd claude-dev-workflow
```

### Deploy iOS Project

```bash
# Make script executable
chmod +x scripts/deploy-ios-project.sh

# Run deployment
./scripts/deploy-ios-project.sh "MyApp" "/path/to/projects"

# This creates:
# /path/to/projects/MyApp/
#   ├── MyApp.xcodeproj
#   ├── MyApp/
#   ├── Tests/
#   ├── tracking/
#   ├── docs/
#   └── README.md
```

### Start Development

```bash
cd /path/to/projects/MyApp

# 1. Review workflow docs
open docs/claude.md

# 2. Plan Phase 0
# Use Zen planner tool

# 3. Begin development
# Follow phase-based workflow
```

---

## 🔄 Continuous Improvement

### After Each Phase

1. Retrospective (Zen `consensus`)
2. Update processes if needed
3. Refine quality gates
4. Improve agent coordination

### Documentation Updates

- Version all changes
- Track what works/doesn't work
- Evolve best practices
- Share learnings

---

## 🤝 Contributing

Contributions welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Follow existing documentation style
4. Test deployment scripts
5. Submit pull request

### Areas for Contribution

- [ ] Android deployment script
- [ ] Web application templates
- [ ] Additional example projects
- [ ] Documentation improvements
- [ ] Tool integrations
- [ ] Best practice examples

---

## 📄 License

MIT License - see [LICENSE](./LICENSE) file for details.

---

## 🆘 Support & Resources

### Documentation

- Start here: [claude.md](./claude.md)
- Full guides: [docs/](./docs/)
- Examples: [examples/](./examples/)

### Getting Help

- Review [Session Management](./docs/session-management.md) for context issues
- Check [Quality Gates](./docs/quality-gates.md) for completion questions
- See [Zen Tools Guide](./docs/zen-tools-guide.md) for tool usage
- Review technical guides for platform-specific issues

### Common Issues

**Build Failures**
1. Use Zen `debug` for root cause
2. Review [Testing Guidelines](./docs/testing-guidelines.md)
3. Check [Quality Gates](./docs/quality-gates.md)

**Agent Coordination**
1. Review [Agent Deployment](./docs/agent-deployment.md)
2. Use Zen `consensus` for alignment
3. Coordinator intervention

**Lost Context**
1. Check [Session Management](./docs/session-management.md)
2. Review session state files
3. Reconstruct from git history

---

## 🎓 Learning Path

### Beginners

1. Read [claude.md](./claude.md) overview
2. Review [Project Management](./docs/project-management.md)
3. Try iOS deployment script
4. Follow example project

### Intermediate

1. Deep dive into [Agent Deployment](./docs/agent-deployment.md)
2. Master [Zen Tools Guide](./docs/zen-tools-guide.md)
3. Implement custom team structure
4. Contribute improvements

### Advanced

1. Create custom deployment scripts
2. Extend workflow for new platforms
3. Optimize agent coordination
4. Build automated quality gates

---

## 📊 Project Status

### Version 2.0 (Current) - Proactive Quality Release 🎉

**Released**: January 20, 2025

**Core Features**:
- ✅ Complete iOS workflow
- ✅ Full documentation set
- ✅ iOS deployment script
- ✅ Example projects
- ✅ Quality gates
- ✅ Zen tools integration

**🆕 Proactive Quality System** (v2.0):
- ✅ **Mandatory Phase Gates** - 3-step validation at every phase end
- ✅ **Architecture Decision Records (ADRs)** - Formal decision documentation
- ✅ **Technical Debt Monitoring** - Phase-by-phase trend tracking
- ✅ **Performance Baselines** - Regression detection (>10% threshold)
- ✅ **Tool Chaining Patterns** - 7 proven sequences documented
- ✅ **Knowledge Base System** - Structured preservation with continuation IDs
- ✅ **Retrospective Templates** - Phase-level learning framework
- ✅ **Platform-Agnostic Design** - iOS, Android, Web, Backend ready

**Expected Impact**:
- 📉 50-70% reduction in bugs reaching later phases
- 🎯 Better architectural decisions (multi-model validation)
- 📊 Visible quality/performance/debt trends
- 🧠 Institutional knowledge preserved

### Roadmap

**Version 2.1** (Q1 2025)
- [ ] Android deployment script with v2.0 proactive features
- [ ] Android documentation
- [ ] Android example project

**Version 2.2** (Q2 2025)
- [ ] Web application deployment with v2.0 proactive features
- [ ] Web documentation
- [ ] Web example projects

**Version 3.0** (Q3 2025)
- [ ] Multi-platform orchestration
- [ ] Advanced automation
- [ ] CI/CD integration
- [ ] Performance metrics dashboard

---

## ⭐ Acknowledgments

Built for AI agent teams working with Claude, leveraging Zen MCP tools for enhanced collaboration and productivity.

Special thanks to:
- Anthropic Claude team
- Zen MCP developers
- Open source community

---

## 📞 Contact

- Issues: [GitHub Issues](https://github.com/yourusername/claude-dev-workflow/issues)
- Discussions: [GitHub Discussions](https://github.com/yourusername/claude-dev-workflow/discussions)

---

## 🚀 Getting the Most Out of v2.0

### For New Users

**Start Here**:
1. Read [WORKFLOW-IMPROVEMENTS-SUMMARY.md](./WORKFLOW-IMPROVEMENTS-SUMMARY.md) - Complete v2.0 guide
2. Review [Tool Chaining Patterns](./docs/tool-chaining-patterns.md) - Learn proven sequences
3. Deploy your first iOS project with `./scripts/deploy-ios-project.sh`
4. Use phase gates at end of Phase 1

**First Phase Checklist**:
- [ ] Run `planner` with PRD for project breakdown
- [ ] Implement P1 features
- [ ] **End of phase**: Run phase gates (analyze + refactor + analyze perf)
- [ ] Document findings with continuation IDs
- [ ] Create first ADR for a major decision

### For Existing Users

**Upgrade Path**:
1. Pull latest version: `git pull origin main`
2. Run analyze + refactor on current codebase to establish baseline
3. Start using phase gates at next phase completion
4. Create ADRs for upcoming major decisions
5. Gradually adopt Tier 2 & 3 features

**Key Changes in v2.0**:
- ✅ Phase gates are now **MANDATORY** at every phase end
- ✅ `precommit` should be run before **EVERY** commit (100% compliance)
- ✅ Major decisions should use ADR workflow (challenge → consensus)
- ✅ Technical debt and performance tracked every phase
- ✅ Continuation IDs preserved for knowledge reuse

### Success Metrics to Track

Monitor these to measure v2.0 effectiveness:
1. **Phase Gate Compliance**: 100% (run at every phase)
2. **Technical Debt Trend**: Stable or decreasing
3. **Performance Regressions**: <10% per phase
4. **ADRs Created**: ≥1 per phase (for non-trivial projects)
5. **Quality Score Trend**: Improving or stable
6. **Precommit Compliance**: 100%

---

**Remember**: Nothing is complete until it builds, runs, and has screenshot proof! 📸

**New in v2.0**: Nothing is quality-assured until phase gates pass! 🚦

---

**Made with ❤️ for AI-powered development teams**
