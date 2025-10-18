# Claude Dev Workflow - Quick Reference Card

**Version**: 2.0 | **Platform**: iOS (Android/Web Coming Soon)

---

## 🚀 Deploy New iOS Project

```bash
cd /Users/blake/Documents/GitHub/claude-dev-workflow/scripts
./deploy-ios-project.sh "MyApp" "/path/to/projects"
```

---

## 📋 Phase Structure

```
Phase 0: Foundation ──▶ Phase 1: MVP ──▶ Phase 2: Enhanced ──▶ Phase 3: Production
```

---

## 🤖 iOS Team (5 Agents)

| Agent | Role | Primary Tools |
|-------|------|---------------|
| **Coordinator** | Orchestration, quality | planner, consensus |
| **Architecture** | Design, models | analyze, thinkdeep |
| **Feature (2x)** | Parallel implementation | chat, codereview |
| **Testing** | QA, verification | debug, precommit |

---

## 🔧 Zen MCP Tools

| Tool | When to Use |
|------|-------------|
| `planner` | Phase 0, planning |
| `thinkdeep` | Architecture decisions |
| `analyze` | Code analysis |
| `codereview` | Before completion |
| `debug` | Fixing issues |
| `precommit` | Before commit |
| `refactor` | Code improvements |
| `consensus` | Team decisions |
| `apilookup` | API documentation |

---

## ✅ Quality Gates (Every Task)

- [ ] Follows iOS guidelines
- [ ] Builds successfully
- [ ] Tests passing (≥70%)
- [ ] Screenshot evidence
- [ ] Code reviewed
- [ ] Documentation updated

---

## 📸 Screenshot Evidence

**Required for EVERY feature!**

```
tracking/screenshots/
├── phase1-task-list.png
├── phase1-add-task.png
└── phase1-delete-task.png
```

**Naming**: `phase[N]-[feature]-[state].png`

---

## 📁 iOS Project Structure

```
MyApp/
├── MyApp/
│   ├── App/              # Entry point
│   ├── Models/           # SwiftData
│   ├── Views/            # SwiftUI
│   ├── Stores/           # @Observable
│   ├── Services/         # APIs
│   └── Resources/        # Assets
├── Tests/                # Unit tests
├── tracking/             # Workflow
└── docs/                 # Documentation
```

---

## 🗂️ Tracking Files

| File | Update When |
|------|-------------|
| `session-state.md` | Every session |
| `phase-status.md` | Task changes |
| `mock-data-registry.md` | Mock data usage |
| `screenshots/` | Feature complete |

---

## 📝 iOS Standards

- ✅ SwiftUI (not UIKit)
- ✅ SwiftData (not Core Data)
- ✅ @Observable (not Combine)
- ✅ async/await (not closures)
- ✅ NavigationStack (not NavigationView)
- ✅ iOS 17.0+ target

---

## 🧪 Testing Requirements

| Phase | Coverage | Tests |
|-------|----------|-------|
| **Phase 1** | ≥70% | Unit only |
| **Phase 2** | ≥75% | Unit + Integration |
| **Phase 3** | ≥80% | Unit + Integration + UI |

---

## 📊 Mock Data Strategy

| Phase | Approach |
|-------|----------|
| **Phase 1** | Mock acceptable |
| **Phase 2** | Begin migration |
| **Phase 3** | Zero mock in production |

---

## 🔄 Git Workflow

```bash
# After quality gates pass
git add .
git commit -m "Type: Description

Detailed explanation
Fixes #123"

# Types: feat, fix, docs, style, refactor, test, chore
```

---

## 📞 Common Commands

### Build
```bash
xcodebuild -project MyApp.xcodeproj \
  -scheme MyApp build
```

### Test
```bash
xcodebuild test -project MyApp.xcodeproj \
  -scheme MyApp \
  -destination 'platform=iOS Simulator,name=iPhone 15'
```

---

## 🆘 Quick Troubleshooting

| Problem | Solution |
|---------|----------|
| Build fails | Use Zen `debug` |
| Lost context | Check `session-state.md` |
| Quality gate fail | Review `quality-gates.md` |
| Mock data confusion | Check `mock-data-registry.md` |

---

## 📚 Essential Docs

| Doc | Purpose |
|-----|---------|
| `claude.md` | Master index |
| `ios-development.md` | iOS standards |
| `quality-gates.md` | Completion criteria |
| `zen-tools-guide.md` | Tool usage |

---

## ⚡ Remember

1. **Nothing complete without screenshot** 📸
2. **All quality gates must pass** ✅
3. **Update tracking files** 📝
4. **Use Zen tools effectively** 🔧
5. **Test continuously** 🧪

---

**Quick Help**: `cat claude.md` or `cat QUICK_START.md`
