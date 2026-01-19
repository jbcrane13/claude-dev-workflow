# macOS Development Workflow - SwiftUI & Modern Swift

**Version**: 3.1.0
**Platform**: macOS 14.0+ (Sonoma)
**Stack**: SwiftUI, SwiftData, @Observable, async/await

## When to Use This Skill

Invoke this skill when you need:

1. **macOS Development Standards**
   - SwiftUI/SwiftData mandatory tech stack for macOS
   - @Observable state management
   - async/await concurrency patterns
   - NavigationSplitView / NavigationStack implementation
   - macOS-specific UI patterns (sidebars, toolbars, menus)

2. **macOS-Specific Workflow**
   - Phase-based macOS app development
   - 5-agent macOS development team deployment
   - macOS quality gates and phase gates
   - macOS performance metrics

3. **macOS Code Review**
   - Verify SwiftUI best practices for macOS
   - Check for forbidden technologies (AppKit, Core Data, Combine)
   - Ensure macOS 14.0+ compliance
   - Validate mac-specific patterns

4. **macOS Architecture Decisions**
   - Navigation patterns (NavigationSplitView vs NavigationStack)
   - Window management
   - Menu bar integration
   - Toolbar customization

---

## ⚠️ MANDATORY RULES (NON-NEGOTIABLE)

### ✅ REQUIRED Technologies (You MUST Use)

| Category | Technology | Notes |
|----------|------------|-------|
| **UI Framework** | SwiftUI | Exclusively - no AppKit except when SwiftUI lacks APIs |
| **Data Persistence** | SwiftData | Exclusively - no Core Data |
| **State Management** | @Observable | From Observation framework - no Combine |
| **Concurrency** | async/await | Swift Concurrency - no completion handlers |
| **Navigation** | NavigationSplitView / NavigationStack | Modern navigation patterns |
| **Minimum Target** | macOS 14.0+ (Sonoma) | Do not support older macOS versions |
| **Language** | Swift 6.0+ | Latest Swift features |

### ❌ FORBIDDEN Technologies (You MUST NOT Use)

| Forbidden | Reason | Use Instead |
|-----------|--------|-------------|
| **AppKit** | Legacy, not SwiftUI-native | SwiftUI (exception: missing APIs) |
| **Core Data** | Legacy, replaced | SwiftData |
| **Combine** | Replaced by Observation | @Observable + async/await |
| **@Published** | Legacy state | @Observable properties |
| **@ObservableObject** | Legacy pattern | @Observable class |
| **@StateObject** | Legacy pattern | @State + @Observable |
| **@EnvironmentObject** | Legacy pattern | @Environment + @Observable |
| **NavigationView** | Deprecated | NavigationSplitView / NavigationStack |
| **Completion Handlers** | Legacy async pattern | async/await |

### 🔒 Critical Rules - Zero Tolerance

1. **NO AppKit** unless SwiftUI genuinely lacks the required API (rare - e.g., advanced text editing, some menu customization)
2. **NO Core Data** - SwiftData is the only approved persistence layer
3. **NO Combine** - @Observable framework is the only approved state management
4. **NO completion handlers** - async/await for all asynchronous operations
5. **macOS 14.0+ ONLY** - do not add backwards compatibility code

---

## macOS Development Team (5 Agents)

```yaml
Team Structure:
  Coordinator Agent:
    - macOS workflow management
    - Quality gate enforcement
    - Session continuity
    - Tools: planner, consensus, challenge

  Architecture Agent:
    - SwiftUI for macOS architecture design
    - SwiftData model design
    - Navigation patterns (split view vs stack)
    - Window and scene management
    - Tools: analyze, thinkdeep, apilookup

  UI Feature Agents (2):
    - Parallel SwiftUI view implementation
    - macOS-specific UI (toolbars, sidebars, menus)
    - @Observable state management
    - NavigationSplitView / NavigationStack flows
    - Tools: codereview, debug, refactor

  Testing Agent:
    - Unit tests (XCTest)
    - UI tests (XCUITest for macOS)
    - SwiftData testing
    - Tools: precommit, debug
```

---

## macOS-Specific Patterns

### NavigationSplitView (Primary Pattern for macOS)

```swift
struct ContentView: View {
    @State private var selectedItem: SidebarItem?

    var body: some View {
        NavigationSplitView {
            // Sidebar
            List(SidebarItem.allCases, selection: $selectedItem) { item in
                Label(item.title, systemImage: item.icon)
                    .tag(item)
            }
            .navigationTitle("My App")
        } detail: {
            // Detail view
            if let selectedItem {
                DetailView(for: selectedItem)
            } else {
                Text("Select an item")
                    .foregroundStyle(.secondary)
            }
        }
    }
}

enum SidebarItem: String, CaseIterable, Identifiable {
    case users, projects, settings

    var id: String { rawValue }

    var title: String {
        switch self {
        case .users: "Users"
        case .projects: "Projects"
        case .settings: "Settings"
        }
    }

    var icon: String {
        switch self {
        case .users: "person.2"
        case .projects: "folder"
        case .settings: "gear"
        }
    }
}
```

### Three-Column NavigationSplitView

```swift
struct AdvancedContentView: View {
    @State private var selectedCategory: Category?
    @State private var selectedItem: Item?

    var body: some View {
        NavigationSplitView {
            // Sidebar (column 1)
            List(Category.allCases, selection: $selectedCategory) { category in
                Label(category.title, systemImage: category.icon)
            }
        } content: {
            // Content list (column 2)
            if let selectedCategory {
                List(selectedCategory.items, selection: $selectedItem) { item in
                    ItemRow(item: item)
                }
            }
        } detail: {
            // Detail (column 3)
            if let selectedItem {
                ItemDetailView(item: selectedItem)
            } else {
                Text("Select an item")
            }
        }
    }
}
```

### Toolbar Customization

```swift
struct DocumentView: View {
    @State private var store = DocumentStore()

    var body: some View {
        VStack {
            DocumentEditor(store: store)
        }
        .toolbar {
            ToolbarItemGroup(placement: .primaryAction) {
                Button {
                    Task {
                        await store.save()
                    }
                } label: {
                    Label("Save", systemImage: "square.and.arrow.down")
                }

                Button {
                    store.export()
                } label: {
                    Label("Export", systemImage: "square.and.arrow.up")
                }
            }

            ToolbarItem(placement: .navigation) {
                Button {
                    store.toggleSidebar()
                } label: {
                    Label("Toggle Sidebar", systemImage: "sidebar.left")
                }
            }
        }
    }
}
```

### Window Management

```swift
@main
struct MyMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            // Custom menu commands
            CommandGroup(after: .newItem) {
                Button("New Project") {
                    // Action
                }
                .keyboardShortcut("n", modifiers: [.command, .shift])
            }
        }
        .defaultSize(width: 1200, height: 800)

        // Settings window
        Settings {
            SettingsView()
        }
    }
}
```

### Menu Bar Integration

```swift
@main
struct MyMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            // File menu
            CommandMenu("File") {
                Button("Open...") {
                    // Action
                }
                .keyboardShortcut("o")

                Divider()

                Button("Save") {
                    // Action
                }
                .keyboardShortcut("s")
            }

            // Edit menu additions
            CommandGroup(after: .pasteboard) {
                Button("Transform Text") {
                    // Action
                }
            }
        }

        // Menu bar extra (optional)
        MenuBarExtra("My App", systemImage: "star") {
            Button("Show Window") {
                // Action
            }
            Divider()
            Button("Quit") {
                NSApplication.shared.terminate(nil)
            }
        }
    }
}
```

---

## macOS Quality Gates

### Before Marking ANY Task Complete

**Code Quality:**
- ✅ SwiftUI exclusively (no AppKit)
- ✅ SwiftData exclusively (no Core Data)
- ✅ @Observable exclusively (no Combine/@Published)
- ✅ async/await exclusively (no completion handlers)
- ✅ NavigationSplitView or NavigationStack (no NavigationView)
- ✅ macOS 14.0+ target
- ✅ zen codereview passed
- ✅ zen precommit passed

**macOS-Specific:**
- ✅ Proper navigation pattern for mac (usually NavigationSplitView)
- ✅ Toolbar configured appropriately
- ✅ Menu commands added (if applicable)
- ✅ Window sizing appropriate
- ✅ Keyboard shortcuts for key actions

**Functionality:**
- ✅ Feature works on macOS (test on real Mac or VM)
- ✅ Screenshot evidence (macOS window)
- ✅ No crashes
- ✅ Navigation flows work correctly
- ✅ Menus and toolbars functional

**Testing:**
- ✅ XCTest unit tests passing
- ✅ XCUITest UI tests (for critical flows)
- ✅ SwiftData tests passing

**Build:**
- ✅ Xcode build succeeds with zero errors
- ✅ Zero warnings
- ✅ Runs on macOS without crash
- ✅ Feature accessible and functional

---

## macOS Phase Gates

**At END of EVERY Phase:**

```yaml
1. zen analyze (quality focus)
   Focus Areas:
   - SwiftUI for macOS architecture
   - NavigationSplitView usage
   - @Observable state management
   - SwiftData model design
   - Toolbar and menu patterns
   - Window management

2. zen refactor (codesmells)
   Check For:
   - Legacy patterns (Combine, AppKit, Core Data)
   - Complex view hierarchies
   - State management issues
   - Navigation complexity
   - Inefficient toolbar/menu code

3. zen analyze (performance focus)
   macOS Metrics:
   - Build time (Xcode compilation)
   - Cold start time (app launch)
   - Memory usage (Activity Monitor)
   - App size (.app bundle size)
   - SwiftUI view rendering performance
   - Window resize performance
```

**macOS Performance Baselines:**

| Metric | Target | Regression Threshold |
|--------|--------|---------------------|
| Build time | < 45s (incremental) | +15% |
| Cold start | < 1.5s | +20% |
| Memory (idle) | < 75MB | +25% |
| App size | < 30MB | +10% |
| Window resize | 60fps | < 60fps |

---

## macOS Project Structure

```
MyMacApp/
├── MyMacApp.xcodeproj
└── MyMacApp/
    ├── App/
    │   └── MyMacApp.swift              # @main entry point with WindowGroup
    ├── Models/
    │   ├── Document.swift              # SwiftData @Model
    │   └── Project.swift               # SwiftData @Model
    ├── Stores/
    │   ├── AppState.swift              # @Observable app state
    │   └── DocumentStore.swift         # @Observable store
    ├── Views/
    │   ├── ContentView.swift           # NavigationSplitView root
    │   ├── Sidebar/
    │   │   └── SidebarView.swift
    │   ├── Detail/
    │   │   ├── ProjectDetailView.swift
    │   │   └── DocumentDetailView.swift
    │   └── Settings/
    │       └── SettingsView.swift       # Settings window
    ├── Navigation/
    │   └── SidebarItem.swift           # Navigation model
    ├── Menus/
    │   └── Commands.swift              # Menu commands
    ├── Networking/
    │   └── APIClient.swift             # async/await API
    ├── Resources/
    │   └── Assets.xcassets
    └── Tests/
        ├── MyMacAppTests/              # XCTest unit tests
        └── MyMacAppUITests/            # XCUITest UI tests
```

---

## macOS Workflow Quick Start

### Phase 0: Setup

```yaml
1. Create new Xcode project (macOS App)
   - Interface: SwiftUI
   - Life Cycle: SwiftUI App
   - Language: Swift
   - Minimum Deployment: macOS 14.0

2. Enable SwiftData
   - Add @main with .modelContainer

3. Review macOS Development Guidelines (references)

4. Create PRD for macOS app

5. Use zen planner with PRD

6. Deploy 5-agent macOS team
```

### Phase 1: Core Features

```yaml
1. Implement P1 features with:
   - SwiftUI views
   - NavigationSplitView for multi-pane layout
   - @Observable stores
   - SwiftData models
   - Toolbar and menu commands

2. Quality gates for each feature:
   - ✅ Builds in Xcode
   - ✅ Runs on macOS
   - ✅ Screenshot evidence
   - ✅ zen precommit passed

3. Phase gates at phase end:
   - ✅ analyze (quality)
   - ✅ refactor (debt)
   - ✅ analyze (performance)
```

---

## Common macOS Pitfalls

### Pitfall 1: Using iOS-only Patterns
**Problem**: Using NavigationStack when NavigationSplitView is better for mac
**Solution**: Prefer NavigationSplitView for multi-pane macOS apps. NavigationStack is for simpler, iOS-like flows.

### Pitfall 2: Missing Toolbar/Menu Commands
**Problem**: No keyboard shortcuts, minimal menus
**Solution**: Add comprehensive toolbar and menu commands. macOS users expect keyboard-driven workflows.

### Pitfall 3: Poor Window Management
**Problem**: Default tiny window, no size constraints
**Solution**: Use `.defaultSize()` and `.windowResizability()` modifiers.

### Pitfall 4: Using AppKit Unnecessarily
**Problem**: Wrapping AppKit views when SwiftUI has the capability
**Solution**: Use pure SwiftUI. Only use AppKit for genuinely missing APIs.

### Pitfall 5: Mobile-First Design
**Problem**: Designing for phone-sized screens
**Solution**: Design for desktop: larger windows, keyboard shortcuts, multi-pane layouts.

### Pitfall 6: No Settings Window
**Problem**: Settings buried in main window
**Solution**: Use `Settings { SettingsView() }` scene for dedicated settings window.

### Pitfall 7: Ignoring macOS HIG
**Problem**: Non-standard mac UI patterns
**Solution**: Follow macOS Human Interface Guidelines for native feel.

---

## macOS vs iOS Key Differences

| Aspect | iOS | macOS |
|--------|-----|-------|
| **Primary Navigation** | NavigationStack | NavigationSplitView |
| **Screen Size** | Compact (phones/tablets) | Large (desktop displays) |
| **Input** | Touch-first | Keyboard & mouse |
| **Menus** | Minimal | Extensive menu bar |
| **Toolbars** | Bottom tab bar | Top toolbar |
| **Windows** | Single fullscreen | Multiple resizable windows |
| **Settings** | In-app settings view | Dedicated Settings window |
| **Keyboard Shortcuts** | Limited | Essential |
| **Layout** | Single column focus | Multi-pane/column layouts |

---

## Zen Tools for macOS

### Planning
```yaml
zen planner:
  - Input: macOS app PRD
  - Output: Phase-based macOS implementation plan
```

### Architecture Review
```yaml
zen analyze:
  - Focus: SwiftUI for macOS, NavigationSplitView patterns
  - Check: Compliance with mandatory standards
  - Validate: Window management, toolbar/menu design
```

### Code Review
```yaml
zen codereview:
  - Verify: SwiftUI/SwiftData/Observable compliance
  - Check: No AppKit/CoreData/Combine
  - Validate: macOS 14.0+ patterns, navigation, menus
```

### Debugging
```yaml
zen debug:
  - macOS-specific crashes
  - NavigationSplitView issues
  - SwiftData query problems
  - Window management bugs
  - @Observable state issues
```

### Refactoring
```yaml
zen refactor:
  - Migrate AppKit → SwiftUI
  - Migrate Core Data → SwiftData
  - Migrate Combine → @Observable
  - Optimize NavigationSplitView
  - Improve toolbar/menu structure
```

---

## macOS Resources

**Included in Skill**:
- Complete macOS development guidelines
- SwiftUI for macOS architecture patterns
- NavigationSplitView implementation guide
- Toolbar and menu customization
- Window management
- macOS-specific quality gates
- Phase gates with macOS metrics

**Use This Skill When**:
- Building macOS 14.0+ applications
- Need SwiftUI for macOS expertise
- Enforcing macOS mandatory standards
- macOS-specific code review
- macOS performance optimization
- macOS testing implementation
- Multi-pane desktop app development

---

## Summary

This skill provides macOS-specific development workflow with:
- **Mandatory SwiftUI/SwiftData stack** (zero tolerance for legacy)
- **NavigationSplitView** as primary navigation (desktop-first design)
- **@Observable state management** (no Combine)
- **async/await concurrency** (no completion handlers)
- **macOS 14.0+ exclusively** (no backwards compatibility)
- **Desktop patterns**: toolbars, menus, keyboard shortcuts, multi-window
- **Phase-based development** with macOS-specific quality gates
- **5-agent macOS team** coordination patterns

**Remember**: NO AppKit, NO Core Data, NO Combine. SwiftUI, SwiftData, @Observable only! Desktop-first design with NavigationSplitView! 💻 ✅
