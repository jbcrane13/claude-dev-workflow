# Claude Dev Workflow

**Version**: 3.0
**Last Updated**: 2025-01-30
**License**: MIT

---

## 🎯 Overview

A comprehensive, phase-based development workflow for AI agent teams building production-quality applications. This system provides:

- **Multi-Agent Coordination** - Parallel execution with coordinated oversight
- **Phase-Based Development** - Incremental delivery of working features
- **Mandatory Quality System** - Phase gates, ADRs, systematic validation
- **Session Continuity** - Seamless handoffs across sessions
- **Zen MCP Integration** - Enhanced collaboration through AI tools
- **Production Ready** - Battle-tested patterns and practices

**🚀 START HERE**: Read [claude.md](./claude.md) for the complete workflow

---

## 📚 Documentation

### Primary Entry Point

**[📖 claude.md](./claude.md)** - **START HERE** - Complete workflow with mandatory requirements

### Core Workflow Documents

| Document | Purpose |
|----------|---------|
| [Agent Deployment](./docs/agent-deployment.md) | Multi-agent team structures (with decision tree) |
| [iOS Development](./docs/ios-development.md) | iOS technical standards (with mandatory rules) |
| [Project Management](./docs/project-management.md) | Phase-based planning |
| [Session Management](./docs/session-management.md) | Context preservation |
| [Quality Gates](./docs/quality-gates.md) | Completion criteria |
| [Testing Guidelines](./docs/testing-guidelines.md) | Testing requirements |
| [Zen Tools Guide](./docs/zen-tools-guide.md) | MCP tool usage |
| [Tool Chaining Patterns](./docs/tool-chaining-patterns.md) | Proven tool sequences |
| [Mock Data Strategy](./docs/mock-data-strategy.md) | Data transition planning |

### Templates & Tracking

| Document | Purpose |
|----------|---------|
| [PRD Template](./docs/PRD.md) | Product Requirements Document |
| [ADR Template](./docs/adr/template.md) | Architecture Decision Records |
| [Technical Debt Log](./tracking/technical-debt-log.md) | Debt tracking template |
| [Performance Baseline](./tracking/performance-baseline.md) | Performance monitoring |

---

## 🚀 Quick Start

### For iOS Projects

```bash
# 1. Clone this repository
git clone https://github.com/yourusername/claude-dev-workflow.git
cd claude-dev-workflow

# 2. Deploy iOS project
./scripts/deploy-ios-project.sh "MyApp" "/path/to/projects"

# 3. Read the workflow documentation
cat claude.md  # Start here - includes MANDATORY requirements

# 4. Review iOS standards
cat docs/ios-development.md  # iOS mandatory rules at top
```

### For Other Project Types

Coming soon:
- Android deployment script (v3.1)
- Web application deployment script (v3.2)
- General software deployment script (v3.3)

---

## 📁 Repository Structure

```
claude-dev-workflow/
├── README.md                          # This file - quick overview
├── claude.md                          # ⚠️ START HERE - complete workflow
├── QUICK_REFERENCE.md                 # One-page quick reference
│
├── docs/                              # Complete documentation (9 guides)
│   ├── agent-deployment.md            # Team structures + decision tree
│   ├── ios-development.md             # iOS standards + mandatory rules
│   ├── project-management.md          # Phase planning
│   ├── session-management.md          # Context preservation
│   ├── quality-gates.md               # Completion criteria
│   ├── testing-guidelines.md          # Testing requirements
│   ├── zen-tools-guide.md             # MCP tool usage
│   ├── tool-chaining-patterns.md      # Tool sequences
│   ├── mock-data-strategy.md          # Data strategy
│   ├── PRD.md                         # PRD template
│   └── adr/                           # Architecture Decision Records
│       ├── README.md                  # ADR guide
│       └── template.md                # ADR template
│
├── templates/                         # Project templates
│   └── ios/                           # iOS project template
│
├── tracking/                          # Tracking templates
│   ├── session-state.md               # Session state
│   ├── phase-status.md                # Phase progress
│   ├── mock-data-registry.md          # Mock data tracking
│   ├── technical-debt-log.md          # Debt monitoring
│   ├── performance-baseline.md        # Performance tracking
│   └── knowledge-base/                # Knowledge preservation
│
├── scripts/                           # Deployment scripts
│   └── deploy-ios-project.sh          # iOS project setup
│
└── examples/                          # Example projects (coming)
```

---

## 🎭 Supported Project Types

### ✅ Fully Supported

**iOS Applications** (Swift, SwiftUI, SwiftData)
- Complete deployment script
- Mandatory technical standards
- Example project (coming)
- 5-agent team structure

### 🚧 Coming Soon

- **Android Applications** (Kotlin, Jetpack Compose) - v3.1
- **Web Applications** (React, Vue, Next.js) - v3.2
- **Backend Services** (Node.js, Python, Go) - v3.3

---

## 🤖 Multi-Agent Teams

### iOS Development Team (5 Agents)

```
Coordinator Agent
└── Manages workflow, ensures quality gates

Architecture Agent
└── SwiftUI/SwiftData design

Feature Agents (2x)
└── Parallel implementation

Testing Agent
└── Quality verification
```

**When to Deploy Teams**: See decision tree in [agent-deployment.md](./docs/agent-deployment.md)

### Web Application Team (6 Agents)

```
Coordinator + Backend + Frontend + UI + Database + Testing
```

**See**: [Agent Deployment Guide](./docs/agent-deployment.md) for complete structures

---

## ✅ Mandatory Requirements

**Before starting ANY work, you MUST:**

1. **Deploy Multi-Agent Team** (for projects with 3+ features)
2. **Follow Platform Standards** (iOS: SwiftUI, SwiftData, @Observable only)
3. **Pass Quality Gates** (zen precommit, screenshots, tests, builds)
4. **Run Phase Gates** (analyze + refactor + analyze at every phase end)

**See**: [claude.md - MANDATORY REQUIREMENTS section](./claude.md#%EF%B8%8F-mandatory-requirements-read-first) for complete details

---

## 📋 Development Workflow

```
Phase 0: Foundation & Planning
   ↓
   Deploy Multi-Agent Team
   ↓
Phase 1: Core P1 Features (MVP)
   ↓
   🚦 MANDATORY PHASE GATE
   ↓
Phase 2: Enhanced Features
   ↓
   🚦 MANDATORY PHASE GATE
   ↓
Phase N: Production Ready
```

**Quality Gates at EVERY level:**
- Task: precommit, screenshot, tests, build
- Phase: analyze, refactor, analyze (performance)

---

## 📸 Screenshot Evidence

**Critical Requirement**: Nothing is complete without screenshot proof!

```
tracking/screenshots/
├── phase1-feature-name.png
├── phase2-feature-name.png
└── phase3-feature-name.png
```

---

## 🔧 Zen MCP Tools

| Tool | Purpose | Required When |
|------|---------|---------------|
| `planner` | Project breakdown | Phase 0, planning |
| `analyze` | Codebase analysis | **Phase gates (mandatory)** |
| `refactor` | Code improvement | **Phase gates (mandatory)** |
| `codereview` | Quality verification | Before completion |
| `debug` | Issue resolution | When problems arise |
| `precommit` | Final verification | **Before EVERY commit (mandatory)** |
| `consensus` | Team alignment | Major decisions (ADRs) |

**See**: [Zen Tools Guide](./docs/zen-tools-guide.md) for complete usage

---

## 🎯 Getting Started Checklist

**New Project Setup:**

- [ ] Clone this repository
- [ ] **Read [claude.md](./claude.md) completely** (includes MANDATORY requirements)
- [ ] Review [agent-deployment.md](./docs/agent-deployment.md) decision tree
- [ ] For iOS: Read [ios-development.md](./docs/ios-development.md) mandatory rules
- [ ] Run deployment script for your platform
- [ ] Deploy multi-agent team (if applicable)
- [ ] Create PRD using [PRD template](./docs/PRD.md)
- [ ] Use zen `planner` with PRD to create project plan
- [ ] Begin Phase 0: Foundation

---

## 💡 Best Practices

### Planning
- Use zen `planner` for breakdown
- Define phases upfront
- Identify P1 features early

### Execution
- Deploy teams for 3+ feature projects
- Focus on one phase at a time
- **Never skip quality gates**
- **Never skip phase gates**

### Quality
- Run zen `precommit` before every commit
- Capture screenshots for every feature
- Test continuously (≥70% coverage)
- Build frequently

---

## 📦 Installation

```bash
# Clone repository
git clone https://github.com/yourusername/claude-dev-workflow.git
cd claude-dev-workflow

# Deploy iOS project
chmod +x scripts/deploy-ios-project.sh
./scripts/deploy-ios-project.sh "MyApp" "~/Projects"

# Start development
cd ~/Projects/MyApp
cat claude.md  # Read workflow
```

---

## 🤝 Contributing

We welcome contributions! See [CONTRIBUTING.md](./CONTRIBUTING.md) for guidelines.

**High Priority:**
- Android deployment script
- Web deployment scripts
- Example projects
- Documentation improvements

---

## 📊 Version History

### v3.0 (Current) - Documentation Clarity & Enforcement 🎉

**Released**: January 30, 2025

**Major Changes:**
- ✅ **MANDATORY REQUIREMENTS** section added to claude.md (cannot be missed)
- ✅ **Decision tree** added to agent-deployment.md (clear when to spawn teams)
- ✅ **Mandatory rules** added to ios-development.md (zero tolerance for violations)
- ✅ **51% documentation reduction** (15,476 → ~7,500 lines)
- ✅ **Removed 4 redundant files** (consolidated overlapping content)
- ✅ **Clear enforcement hierarchy** (MUST vs SHOULD vs OPTIONAL)

**Why v3.0:**
Agents were missing critical instructions (team spawning, iOS guidelines) because they were buried in 15K+ lines of documentation. v3.0 puts mandatory requirements front and center with clear enforcement.

### v2.0 - Proactive Quality System

**Released**: January 20, 2025

- Phase gates (analyze + refactor + analyze)
- Architecture Decision Records (ADRs)
- Technical debt monitoring
- Performance baselines
- Tool chaining patterns
- Knowledge preservation

### v1.0 - Initial Release

**Released**: January 20, 2025

- Complete iOS workflow
- Multi-agent coordination
- Phase-based development
- Quality gates
- Zen MCP integration

---

## 📄 License

MIT License - see [LICENSE](./LICENSE) file for details.

---

## 🆘 Support

### Documentation
- **Start here**: [claude.md](./claude.md)
- **Quick reference**: [QUICK_REFERENCE.md](./QUICK_REFERENCE.md)
- **Full guides**: [docs/](./docs/)

### Common Issues

**Build Failures** → Use zen `debug`, review quality gates
**Agent Coordination** → Review agent-deployment.md decision tree
**Lost Context** → Check session-management.md

---

## ⭐ Key Takeaways

1. **📖 Read [claude.md](./claude.md) first** - MANDATORY requirements at the top
2. **🤖 Deploy teams for 3+ feature projects** - Use decision tree
3. **📱 iOS: Follow mandatory tech stack** - SwiftUI, SwiftData, @Observable only
4. **✅ Pass all quality gates** - precommit before every commit
5. **🚦 Run phase gates** - analyze + refactor + analyze at every phase end
6. **📸 Screenshot everything** - Nothing complete without proof

---

**Built with ❤️ for AI-powered development teams**

**Ready to start?** → **[Read claude.md](./claude.md)**
