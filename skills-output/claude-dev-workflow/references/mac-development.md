# macOS Development Guidelines

**Version**: 1.0
**Last Updated**: 2025-01-30
**Minimum Target**: macOS 14.0+ (Sonoma)

---

## ⚠️ MANDATORY RULES (NON-NEGOTIABLE)

**Before writing ANY macOS code, you MUST comply with these rules. These are project requirements, not recommendations.**

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
| **Closures for async** | Legacy async pattern | async/await |

### 🔒 Critical Rules - Zero Tolerance

1. **NO AppKit** unless SwiftUI genuinely lacks the required API (e.g., advanced text editing, some menu customization)
2. **NO Core Data** - SwiftData is the only approved persistence layer
3. **NO Combine** - @Observable framework is the only approved state management
4. **NO completion handlers** - async/await for all asynchronous operations
5. **macOS 14.0+ ONLY** - do not add backwards compatibility code

### 🚨 Consequences of Non-Compliance

If you violate these rules:
- ❌ Code review will **FAIL**
- ❌ Pull request will be **REJECTED**
- ❌ You will be required to **REWRITE** the code
- ❌ Quality gates will **NOT PASS**

**These rules exist to ensure:**
- Modern, maintainable codebase
- Consistent architecture
- Future compatibility
- Team productivity
- Reduced technical debt

---

## Table of Contents

1. [Project Requirements](#project-requirements)
2. [Architecture Principles](#architecture-principles)
3. [macOS-Specific Patterns](#macos-specific-patterns)
4. [State Management](#state-management)
5. [Swift Concurrency](#swift-concurrency)
6. [SwiftData Implementation](#swiftdata-implementation)
7. [Navigation & Window Management](#navigation--window-management)
8. [Menus & Toolbars](#menus--toolbars)
9. [Performance Optimization](#performance-optimization)
10. [Error Handling](#error-handling)
11. [Testing Considerations](#testing-considerations)
12. [Project Structure](#project-structure)
13. [Common Patterns](#common-patterns)
14. [Code Quality Checklist](#code-quality-checklist)

---

## Project Requirements

### Minimum Specifications
- **Target Platform**: macOS 14.0+ (Sonoma)
- **Language**: Swift 6.0+
- **UI Framework**: SwiftUI (exclusively)
- **Data Persistence**: SwiftData
- **State Management**: Observation framework
- **Concurrency**: Swift Concurrency (async/await, actors)
- **Project Format**: `.xcodeproj` or `.xcworkspace`

### Never Use
- ❌ AppKit (unless absolutely necessary for specific APIs not available in SwiftUI)
- ❌ Core Data (use SwiftData instead)
- ❌ Combine framework (use Observation and async/await)
- ❌ `@Published`, `@ObservableObject`, `@StateObject` (use `@Observable` and `@State`)
- ❌ NavigationView (use NavigationSplitView or NavigationStack)
- ❌ Completion handlers/closures for async operations (use async/await)

### Platform-Specific Features
- ✅ Use `NavigationSplitView` for multi-column layouts (common on Mac)
- ✅ Implement proper window management
- ✅ Support keyboard shortcuts and menu bar
- ✅ Use `Settings` scene for preferences
- ✅ Support Spotlight integration where applicable
- ✅ Implement proper toolbar with `ToolbarItem`

---

## Architecture Principles

### SwiftUI-First Approach
- **Always start with SwiftUI** - only use AppKit when SwiftUI genuinely cannot accomplish the task
- Use `View` protocol for all UI components
- Leverage SwiftUI's declarative syntax
- Use built-in SwiftUI components before creating custom solutions

### When AppKit is Acceptable
**Only use AppKit/NSViewRepresentable when:**
- Advanced text editing features not in SwiftUI (e.g., NSTextView customization)
- Specific menu bar customization beyond SwiftUI capabilities
- File system integration requiring NSOpenPanel/NSSavePanel advanced features
- Legacy library integration that requires AppKit

**Document all AppKit usage** with clear justification in code comments.

### MVVM with Observation
```swift
@Observable
final class ContentViewModel {
    var items: [Item] = []
    var selectedItem: Item?
    var isLoading = false

    func loadData() async {
        isLoading = true
        defer { isLoading = false }

        // Async data loading
        items = await dataService.fetchItems()
    }
}

struct ContentView: View {
    @State private var viewModel = ContentViewModel()

    var body: some View {
        NavigationSplitView {
            List(viewModel.items, selection: $viewModel.selectedItem) { item in
                Text(item.name)
            }
        } detail: {
            if let selected = viewModel.selectedItem {
                DetailView(item: selected)
            } else {
                Text("Select an item")
            }
        }
        .task {
            await viewModel.loadData()
        }
    }
}
```

---

## macOS-Specific Patterns

### Window Management

```swift
@main
struct MyMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandGroup(replacing: .newItem) {
                Button("New Document") {
                    // Handle new document
                }
                .keyboardShortcut("n", modifiers: .command)
            }
        }

        Settings {
            SettingsView()
        }
    }
}
```

### Multi-Column Layouts

```swift
struct ContentView: View {
    @State private var selection: String?

    var body: some View {
        NavigationSplitView {
            // Sidebar
            List(selection: $selection) {
                ForEach(categories) { category in
                    NavigationLink(value: category.id) {
                        Label(category.name, systemImage: category.icon)
                    }
                }
            }
            .navigationTitle("Categories")
        } detail: {
            // Detail view
            if let selection {
                DetailView(categoryID: selection)
            } else {
                Text("Select a category")
                    .foregroundStyle(.secondary)
            }
        }
    }
}
```

### Keyboard Shortcuts

```swift
struct ContentView: View {
    var body: some View {
        Form {
            // Content
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Save") {
                    save()
                }
                .keyboardShortcut("s", modifiers: .command)
            }
        }
    }
}
```

---

## State Management

### Use @Observable for Models

```swift
@Observable
final class DocumentManager {
    var documents: [Document] = []
    var activeDocument: Document?
    var isSaving = false

    func createDocument() async throws {
        let document = Document()
        documents.append(document)
        activeDocument = document
    }

    func save() async throws {
        guard let document = activeDocument else { return }
        isSaving = true
        defer { isSaving = false }

        try await storage.save(document)
    }
}
```

### Use @State for View State

```swift
struct DocumentView: View {
    @State private var manager = DocumentManager()
    @State private var isShowingInspector = false
    @State private var searchText = ""

    var body: some View {
        NavigationSplitView {
            // Sidebar
        } detail: {
            // Detail
        }
        .searchable(text: $searchText)
        .inspector(isPresented: $isShowingInspector) {
            InspectorView()
        }
    }
}
```

---

## Swift Concurrency

### Use async/await for Asynchronous Operations

```swift
@Observable
final class DataManager {
    var items: [Item] = []

    func loadItems() async throws {
        items = try await apiClient.fetchItems()
    }

    func syncData() async throws {
        try await Task.sleep(for: .seconds(1))
        try await loadItems()
    }
}
```

### Use Actors for Thread-Safe State

```swift
actor DocumentCache {
    private var cache: [UUID: Document] = [:]

    func store(_ document: Document) {
        cache[document.id] = document
    }

    func retrieve(_ id: UUID) -> Document? {
        cache[id]
    }
}
```

---

## SwiftData Implementation

### Define Models

```swift
import SwiftData

@Model
final class Document {
    var id: UUID
    var title: String
    var content: String
    var createdAt: Date
    var modifiedAt: Date

    @Relationship(deleteRule: .cascade)
    var sections: [Section]

    init(title: String, content: String = "") {
        self.id = UUID()
        self.title = title
        self.content = content
        self.createdAt = Date()
        self.modifiedAt = Date()
        self.sections = []
    }
}
```

### Configure Container

```swift
@main
struct MyMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Document.self, Section.self])
    }
}
```

### Query Data

```swift
struct DocumentListView: View {
    @Query(sort: \Document.modifiedAt, order: .reverse)
    private var documents: [Document]

    @Environment(\.modelContext) private var modelContext

    var body: some View {
        List(documents) { document in
            DocumentRow(document: document)
        }
        .toolbar {
            Button("New Document") {
                createDocument()
            }
        }
    }

    private func createDocument() {
        let document = Document(title: "Untitled")
        modelContext.insert(document)
    }
}
```

---

## Navigation & Window Management

### NavigationSplitView for Multi-Column Layouts

```swift
struct ContentView: View {
    @State private var columnVisibility: NavigationSplitViewVisibility = .all
    @State private var selectedCategory: Category?
    @State private var selectedItem: Item?

    var body: some View {
        NavigationSplitView(columnVisibility: $columnVisibility) {
            // Sidebar
            CategoryList(selection: $selectedCategory)
        } content: {
            // Content list
            if let category = selectedCategory {
                ItemList(category: category, selection: $selectedItem)
            }
        } detail: {
            // Detail
            if let item = selectedItem {
                ItemDetailView(item: item)
            } else {
                ContentUnavailableView("Select an item", systemImage: "doc.text")
            }
        }
    }
}
```

### Settings Window

```swift
struct SettingsView: View {
    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }

            AppearanceSettingsView()
                .tabItem {
                    Label("Appearance", systemImage: "paintbrush")
                }
        }
        .frame(width: 500, height: 400)
    }
}
```

---

## Menus & Toolbars

### Custom Commands

```swift
struct AppCommands: Commands {
    var body: some Commands {
        CommandMenu("Document") {
            Button("New Document") {
                createDocument()
            }
            .keyboardShortcut("n", modifiers: .command)

            Divider()

            Button("Import...") {
                importDocument()
            }
            .keyboardShortcut("i", modifiers: [.command, .shift])
        }
    }
}

// In App:
@main
struct MyMacApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            AppCommands()
        }
    }
}
```

### Toolbar Configuration

```swift
struct ContentView: View {
    var body: some View {
        NavigationStack {
            // Content
        }
        .toolbar {
            ToolbarItemGroup(placement: .navigation) {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                }
            }

            ToolbarItemGroup(placement: .primaryAction) {
                Button(action: save) {
                    Label("Save", systemImage: "square.and.arrow.down")
                }
                .keyboardShortcut("s", modifiers: .command)
            }
        }
    }
}
```

---

## Performance Optimization

### Lazy Loading

```swift
struct DocumentListView: View {
    @Query private var documents: [Document]

    var body: some View {
        List {
            ForEach(documents) { document in
                LazyVStack {
                    DocumentRow(document: document)
                }
            }
        }
    }
}
```

### Use @MainActor for UI Updates

```swift
@Observable
@MainActor
final class UIManager {
    var isShowingAlert = false
    var alertMessage = ""

    func showAlert(_ message: String) {
        alertMessage = message
        isShowingAlert = true
    }
}
```

### Optimize Rendering

```swift
struct ContentView: View {
    var body: some View {
        List {
            ForEach(items) { item in
                ItemRow(item: item)
                    .id(item.id) // Explicit identity
            }
        }
        .drawingGroup() // Use for complex drawing
    }
}
```

---

## Error Handling

### Use Result Type

```swift
@Observable
final class DataManager {
    var loadState: LoadState = .idle

    enum LoadState {
        case idle
        case loading
        case success([Item])
        case failure(Error)
    }

    func loadData() async {
        loadState = .loading

        do {
            let items = try await api.fetchItems()
            loadState = .success(items)
        } catch {
            loadState = .failure(error)
        }
    }
}
```

### Present Errors to User

```swift
struct ContentView: View {
    @State private var manager = DataManager()
    @State private var errorWrapper: ErrorWrapper?

    var body: some View {
        content
            .alert(item: $errorWrapper) { wrapper in
                Alert(
                    title: Text("Error"),
                    message: Text(wrapper.error.localizedDescription)
                )
            }
    }

    private func handleError(_ error: Error) {
        errorWrapper = ErrorWrapper(error: error)
    }
}

struct ErrorWrapper: Identifiable {
    let id = UUID()
    let error: Error
}
```

---

## Testing Considerations

### Unit Tests for ViewModels

```swift
@Test
func testDocumentCreation() async throws {
    let manager = DocumentManager()

    try await manager.createDocument()

    #expect(manager.documents.count == 1)
    #expect(manager.activeDocument != nil)
}
```

### UI Tests

```swift
@Test
func testDocumentListNavigation() throws {
    let app = XCUIApplication()
    app.launch()

    app.buttons["New Document"].tap()

    #expect(app.staticTexts["Untitled"].exists)
}
```

---

## Project Structure

```
MyMacApp/
├── MyMacApp/
│   ├── App/
│   │   ├── MyMacAppApp.swift           # App entry point
│   │   └── AppCommands.swift           # Custom menu commands
│   ├── Models/
│   │   ├── Document.swift              # SwiftData models
│   │   └── Section.swift
│   ├── ViewModels/
│   │   ├── DocumentManager.swift       # @Observable view models
│   │   └── SettingsManager.swift
│   ├── Views/
│   │   ├── ContentView.swift           # Main view
│   │   ├── DocumentListView.swift
│   │   ├── DocumentDetailView.swift
│   │   ├── SettingsView.swift
│   │   └── Components/
│   │       ├── DocumentRow.swift
│   │       └── InspectorView.swift
│   ├── Services/
│   │   ├── DataService.swift           # Business logic
│   │   └── StorageService.swift
│   └── Resources/
│       └── Assets.xcassets
├── MyMacAppTests/
│   ├── ViewModelTests.swift
│   └── ServiceTests.swift
└── MyMacAppUITests/
    └── NavigationTests.swift
```

---

## Common Patterns

### Document-Based App Pattern

```swift
@main
struct MyMacApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: MyDocument()) { file in
            ContentView(document: file.$document)
        }
        .commands {
            DocumentCommands()
        }
    }
}

struct MyDocument: FileDocument {
    var content: String

    static var readableContentTypes: [UTType] { [.plainText] }

    init(content: String = "") {
        self.content = content
    }

    init(configuration: ReadConfiguration) throws {
        guard let data = configuration.file.regularFileContents,
              let string = String(data: data, encoding: .utf8)
        else {
            throw CocoaError(.fileReadCorruptFile)
        }
        content = string
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = content.data(using: .utf8)!
        return FileWrapper(regularFileWithContents: data)
    }
}
```

### Preferences/Settings Pattern

```swift
@Observable
final class PreferencesManager {
    var appearanceMode: AppearanceMode = .system
    var fontSize: Double = 14.0

    enum AppearanceMode: String, CaseIterable {
        case light, dark, system
    }
}

struct SettingsView: View {
    @State private var preferences = PreferencesManager()

    var body: some View {
        Form {
            Picker("Appearance", selection: $preferences.appearanceMode) {
                ForEach(PreferencesManager.AppearanceMode.allCases, id: \.self) { mode in
                    Text(mode.rawValue.capitalized)
                }
            }

            Slider(value: $preferences.fontSize, in: 10...24) {
                Text("Font Size: \(Int(preferences.fontSize))")
            }
        }
        .padding()
    }
}
```

---

## Code Quality Checklist

### Before Every Commit (Use zen `precommit` - MANDATORY)

**Architecture**:
- [ ] Using SwiftUI exclusively (except documented AppKit exceptions)
- [ ] Using SwiftData for persistence
- [ ] Using @Observable for state management
- [ ] Using async/await for concurrency
- [ ] No forbidden technologies (Combine, Core Data, completion handlers)

**macOS Patterns**:
- [ ] Proper window management implemented
- [ ] Menu bar integration appropriate
- [ ] Keyboard shortcuts defined for common actions
- [ ] Settings scene configured if needed
- [ ] NavigationSplitView used appropriately

**Performance**:
- [ ] Views use proper identity (id modifier)
- [ ] Expensive operations use lazy loading
- [ ] @MainActor used for UI updates
- [ ] No unnecessary view re-renders

**Error Handling**:
- [ ] All async operations have error handling
- [ ] Errors presented to user appropriately
- [ ] No force-unwrapping of optionals

**Testing**:
- [ ] ViewModel unit tests written
- [ ] UI tests for critical flows
- [ ] Test coverage ≥70%

**Documentation**:
- [ ] Complex logic has comments
- [ ] AppKit usage justified in comments
- [ ] Public APIs documented

---

## Related Documentation

- [Agent Deployment](./agent-deployment.md) - Multi-agent team structure
- [iOS Development](./ios-development.md) - iOS-specific guidelines (many patterns apply to macOS)
- [Quality Gates](./quality-gates.md) - Completion criteria
- [Testing Guidelines](./testing-guidelines.md) - Testing requirements
- [Main Index](../claude.md) - Complete workflow

---

**Remember**:
- ⚠️ Run zen `precommit` before EVERY commit (MANDATORY)
- 📸 Capture screenshots for every feature
- ✅ Follow the mandatory technology stack
- 🚫 Never use forbidden technologies
- 📖 Create ADRs for major architectural decisions

**macOS follows the same quality gates and workflow as iOS** - the only differences are platform-specific UI patterns and APIs.
