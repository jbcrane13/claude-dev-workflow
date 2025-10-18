# Claude Dev Workflow

**Version**: 2.0  
**Last Updated**: 2025-01-20  
**License**: MIT

---

## 🎯 Overview

A comprehensive, phase-based development workflow for AI agent teams building production-quality applications. This workflow emphasizes parallel execution, incremental delivery, quality gates, and session continuity through Zen MCP tool integration.

### Key Features

- ✅ **Multi-Agent Coordination** - Parallel execution with coordinated oversight
- ✅ **Phase-Based Development** - Incremental delivery of working features
- ✅ **Quality Gates** - Ensuring completion criteria are met
- ✅ **Session Continuity** - Seamless handoffs across sessions
- ✅ **Zen MCP Integration** - Enhanced collaboration through AI tools
- ✅ **Production Ready** - Battle-tested patterns and practices

---

## 📚 Documentation

All workflow documentation is located in the `docs/` directory:

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
├── README.md                          # This file
├── LICENSE                            # MIT License
├── claude.md                          # Master workflow index
│
├── docs/                              # Complete documentation
│   ├── PRD.md                         # Product Requirements Document template
│   ├── agent-deployment.md            # Team structures
│   ├── project-management.md          # Phase planning
│   ├── session-management.md          # Continuity practices
│   ├── ios-development.md             # iOS standards
│   ├── testing-guidelines.md          # Testing requirements
│   ├── zen-tools-guide.md             # Zen MCP tools
│   ├── mock-data-strategy.md          # Data strategy
│   └── quality-gates.md               # Completion criteria
│
├── templates/                         # Project templates
│   ├── ios/                           # iOS project template
│   │   ├── project-structure.md       # Structure guide
│   │   └── .gitignore                 # iOS gitignore
│   ├── android/                       # [Coming soon]
│   └── web/                           # [Coming soon]
│
├── tracking/                          # Template tracking files
│   ├── session-state.md               # Session state template
│   ├── phase-status.md                # Phase tracking template
│   ├── mock-data-registry.md          # Mock data template
│   └── screenshots/                   # Screenshots directory
│       └── README.md                  # Screenshot guide
│
├── scripts/                           # Deployment scripts
│   ├── deploy-ios-project.sh          # iOS project setup
│   ├── deploy-android-project.sh      # [Coming soon]
│   └── deploy-web-project.sh          # [Coming soon]
│
└── examples/                          # Example projects
    ├── ios-task-app/                  # Complete iOS example
    └── README.md                      # Examples guide
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

### Phase Structure

```
Phase 0: Foundation & Planning
   ↓
Phase 1: Core P1 Features (MVP)
   ↓
Phase 2: Enhanced P1 + P2 Features
   ↓
Phase 3: P3 Features + Polish
   ↓
Phase N: Production Ready
```

### Quality Gates

Every task must pass:
- ✅ Code quality checks
- ✅ Functionality verification
- ✅ Tests passing
- ✅ Build successful
- ✅ Screenshot evidence
- ✅ Documentation complete

See [Quality Gates](./docs/quality-gates.md) for complete checklist.

---

## 🔧 Zen MCP Tools Integration

### Available Tools

| Tool | Purpose | When to Use |
|------|---------|-------------|
| `planner` | Project breakdown | Phase 0, Planning |
| `thinkdeep` | Complex analysis | Architecture decisions |
| `analyze` | Codebase analysis | Throughout development |
| `codereview` | Quality verification | Before completion |
| `debug` | Issue resolution | When problems arise |
| `precommit` | Final verification | Before commit |
| `refactor` | Code improvement | Phase 2+ |
| `consensus` | Team alignment | Major decisions |

See [Zen Tools Guide](./docs/zen-tools-guide.md) for detailed usage.

---

## 📸 Screenshot Evidence

**Critical Requirement**: Nothing is complete without screenshot proof!

Every feature must have:
- Screenshot showing functionality
- Screenshot of success state
- Screenshot of error state (if applicable)

Screenshots stored in: `tracking/screenshots/`

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

### Version 2.0 (Current)

- ✅ Complete iOS workflow
- ✅ Full documentation set
- ✅ iOS deployment script
- ✅ Example projects
- ✅ Quality gates
- ✅ Zen tools integration

### Roadmap

**Version 2.1** (Next)
- [ ] Android deployment script
- [ ] Android documentation
- [ ] Android example project

**Version 2.2**
- [ ] Web application deployment
- [ ] Web documentation
- [ ] Web example projects

**Version 3.0**
- [ ] Multi-platform orchestration
- [ ] Advanced automation
- [ ] CI/CD integration
- [ ] Performance metrics

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

**Remember**: Nothing is complete until it builds, runs, and has screenshot proof! 📸

---

**Made with ❤️ for AI-powered development teams**
