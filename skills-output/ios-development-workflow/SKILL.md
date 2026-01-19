# iOS Development Workflow - SwiftUI & Modern Swift

**Version**: 3.1.0
**Platform**: iOS 17.0+
**Stack**: SwiftUI, SwiftData, @Observable, async/await

## When to Use This Skill

Invoke this skill when you need:

1. **iOS Development Standards**
   - SwiftUI/SwiftData mandatory tech stack
   - @Observable state management
   - async/await concurrency patterns
   - NavigationStack implementation

2. **iOS-Specific Workflow**
   - Phase-based iOS app development
   - 5-agent iOS development team deployment
   - iOS quality gates and phase gates
   - iOS performance metrics

3. **iOS Code Review**
   - Verify SwiftUI best practices
   - Check for forbidden technologies (UIKit, Core Data, Combine)
   - Ensure iOS 17.0+ compliance

4. **iOS Architecture Decisions**
   - State management approaches
   - Data persistence strategies
   - Navigation patterns
   - SwiftUI component design

---

## ⚠️ MANDATORY RULES (NON-NEGOTIABLE)

### ✅ REQUIRED Technologies (You MUST Use)

| Category | Technology | Notes |
|----------|------------|-------|
| **UI Framework** | SwiftUI | Exclusively - no UIKit except when SwiftUI lacks APIs |
| **Data Persistence** | SwiftData | Exclusively - no Core Data |
| **State Management** | @Observable | From Observation framework - no Combine |
| **Concurrency** | async/await | Swift Concurrency - no completion handlers |
| **Navigation** | NavigationStack | Modern navigation - no NavigationView |
| **Minimum Target** | iOS 17.0+ | Do not support older iOS versions |
| **Language** | Swift 6.0+ | Latest Swift features |

### ❌ FORBIDDEN Technologies (You MUST NOT Use)

| Forbidden | Reason | Use Instead |
|-----------|--------|-------------|
| **UIKit** | Legacy, not SwiftUI-native | SwiftUI (exception: missing APIs) |
| **Core Data** | Legacy, replaced | SwiftData |
| **Combine** | Replaced by Observation | @Observable + async/await |
| **@Published** | Legacy state | @Observable properties |
| **@ObservableObject** | Legacy pattern | @Observable class |
| **@StateObject** | Legacy pattern | @State + @Observable |
| **@EnvironmentObject** | Legacy pattern | @Environment + @Observable |
| **NavigationView** | Deprecated | NavigationStack |
| **Completion Handlers** | Legacy async pattern | async/await |

### 🔒 Critical Rules - Zero Tolerance

1. **NO UIKit** unless SwiftUI genuinely lacks the required API (rare)
2. **NO Core Data** - SwiftData is the only approved persistence layer
3. **NO Combine** - @Observable framework is the only approved state management
4. **NO completion handlers** - async/await for all asynchronous operations
5. **iOS 17.0+ ONLY** - do not add backwards compatibility code

### 🚨 Consequences of Non-Compliance

If you violate these rules:
- ❌ Code review will **FAIL**
- ❌ Pull request will be **REJECTED**
- ❌ You will be required to **REWRITE** the code
- ❌ Quality gates will **NOT PASS**

---

## iOS Development Team (5 Agents)

```yaml
Team Structure:
  Coordinator Agent:
    - iOS workflow management
    - Quality gate enforcement
    - Session continuity
    - Tools: planner, consensus, challenge

  Architecture Agent:
    - SwiftUI architecture design
    - SwiftData model design
    - Navigation patterns
    - Tools: analyze, thinkdeep, apilookup

  UI Feature Agents (2):
    - Parallel SwiftUI view implementation
    - @Observable state management
    - NavigationStack flows
    - Tools: codereview, debug, refactor

  Testing Agent:
    - Unit tests (XCTest)
    - UI tests (XCUITest)
    - SwiftData testing
    - Tools: precommit, debug
```

---

## State Management - @Observable Pattern

### Core Principles

**Modern Swift Observation:**
```swift
import Observation

@Observable
final class UserStore {
    var users: [User] = []
    var isLoading = false
    var errorMessage: String?

    func loadUsers() async {
        isLoading = true
        defer { isLoading = false }

        do {
            users = try await APIClient.fetchUsers()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
```

**SwiftUI Integration:**
```swift
struct UsersView: View {
    @State private var userStore = UserStore()

    var body: some View {
        List(userStore.users) { user in
            UserRow(user: user)
        }
        .task {
            await userStore.loadUsers()
        }
    }
}
```

### ❌ DO NOT Use (Legacy Patterns)

```swift
// ❌ WRONG - Legacy Combine pattern
class UserStore: ObservableObject {
    @Published var users: [User] = []
}

// ❌ WRONG - Legacy state pattern
struct UsersView: View {
    @StateObject var userStore = UserStore()
}
```

---

## SwiftData Implementation

### Model Definition

```swift
import SwiftData

@Model
final class User {
    @Attribute(.unique) var id: UUID
    var name: String
    var email: String
    var createdAt: Date

    @Relationship(deleteRule: .cascade)
    var posts: [Post] = []

    init(name: String, email: String) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.createdAt = Date()
    }
}
```

### Container Setup

```swift
import SwiftUI
import SwiftData

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [User.self, Post.self])
    }
}
```

### Data Operations

```swift
struct UserListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \\User.name) private var users: [User]

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
        .toolbar {
            Button("Add") {
                let newUser = User(name: "New User", email: "user@example.com")
                modelContext.insert(newUser)
            }
        }
    }
}
```

---

## Navigation - NavigationStack

### Basic Navigation

```swift
struct ContentView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            List {
                NavigationLink("Users", value: Route.users)
                NavigationLink("Settings", value: Route.settings)
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .users:
                    UsersView()
                case .settings:
                    SettingsView()
                case .userDetail(let user):
                    UserDetailView(user: user)
                }
            }
        }
    }
}

enum Route: Hashable {
    case users
    case settings
    case userDetail(User)
}
```

### Programmatic Navigation

```swift
@Observable
final class NavigationCoordinator {
    var path = NavigationPath()

    func navigateToUser(_ user: User) {
        path.append(Route.userDetail(user))
    }

    func navigateBack() {
        if !path.isEmpty {
            path.removeLast()
        }
    }

    func navigateToRoot() {
        path = NavigationPath()
    }
}
```

---

## Swift Concurrency - async/await

### Network Calls

```swift
actor APIClient {
    func fetchUsers() async throws -> [User] {
        let url = URL(string: "https://api.example.com/users")!
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([User].self, from: data)
    }
}
```

### UI Integration

```swift
struct UsersView: View {
    @State private var users: [User] = []
    @State private var isLoading = false

    var body: some View {
        List(users) { user in
            Text(user.name)
        }
        .task {
            isLoading = true
            defer { isLoading = false }

            do {
                users = try await APIClient().fetchUsers()
            } catch {
                print("Error loading users: \\(error)")
            }
        }
    }
}
```

### ❌ DO NOT Use Completion Handlers

```swift
// ❌ WRONG - Old completion handler pattern
func fetchUsers(completion: @escaping (Result<[User], Error>) -> Void) {
    URLSession.shared.dataTask(with: url) { data, _, error in
        // ...
    }.resume()
}

// ✅ CORRECT - async/await
func fetchUsers() async throws -> [User] {
    let (data, _) = try await URLSession.shared.data(from: url)
    return try JSONDecoder().decode([User].self, from: data)
}
```

---

## iOS Quality Gates

### Before Marking ANY Task Complete

**Code Quality:**
- ✅ SwiftUI exclusively (no UIKit)
- ✅ SwiftData exclusively (no Core Data)
- ✅ @Observable exclusively (no Combine/@Published)
- ✅ async/await exclusively (no completion handlers)
- ✅ NavigationStack (no NavigationView)
- ✅ iOS 17.0+ target
- ✅ zen codereview passed
- ✅ zen precommit passed

**Functionality:**
- ✅ Feature works on iOS Simulator
- ✅ Screenshot evidence (iPhone 15 Pro or similar)
- ✅ No crashes
- ✅ NavigationStack flows work correctly

**Testing:**
- ✅ XCTest unit tests passing
- ✅ XCUITest UI tests (for critical flows)
- ✅ SwiftData tests passing

**Build:**
- ✅ Xcode build succeeds with zero errors
- ✅ Zero warnings (treat warnings as errors)
- ✅ Runs on iOS Simulator without crash
- ✅ Feature accessible and functional

---

## iOS Phase Gates

**At END of EVERY Phase:**

```yaml
1. zen analyze (quality focus)
   Focus Areas:
   - SwiftUI view architecture
   - @Observable state management
   - SwiftData model design
   - Navigation patterns

2. zen refactor (codesmills)
   Check For:
   - Legacy patterns (Combine, UIKit, Core Data)
   - Complex view hierarchies
   - State management issues
   - Navigation complexity

3. zen analyze (performance focus)
   iOS Metrics:
   - Build time (Xcode compilation)
   - Cold start time (app launch)
   - Memory usage (instruments)
   - Binary size (.ipa size)
   - SwiftUI view rendering performance
```

**iOS Performance Baselines:**

| Metric | Target | Regression Threshold |
|--------|--------|---------------------|
| Build time | < 30s (incremental) | +15% |
| Cold start | < 1s | +20% |
| Memory (idle) | < 50MB | +25% |
| Binary size | < 20MB | +10% |

---

## iOS Project Structure

```
MyApp/
├── MyApp.xcodeproj
└── MyApp/
    ├── App/
    │   └── MyApp.swift              # @main entry point
    ├── Models/
    │   ├── User.swift               # SwiftData @Model
    │   └── Post.swift               # SwiftData @Model
    ├── Stores/
    │   ├── UserStore.swift          # @Observable store
    │   └── AppState.swift           # @Observable app state
    ├── Views/
    │   ├── ContentView.swift        # Root view
    │   ├── Users/
    │   │   ├── UsersView.swift
    │   │   └── UserDetailView.swift
    │   └── Settings/
    │       └── SettingsView.swift
    ├── Navigation/
    │   └── Route.swift              # NavigationStack routes
    ├── Networking/
    │   └── APIClient.swift          # async/await API
    ├── Resources/
    │   └── Assets.xcassets
    └── Tests/
        ├── MyAppTests/              # XCTest unit tests
        └── MyAppUITests/            # XCUITest UI tests
```

---

## iOS Workflow Quick Start

### Phase 0: Setup

```yaml
1. Create new Xcode project
   - Interface: SwiftUI
   - Life Cycle: SwiftUI App
   - Language: Swift
   - Minimum Deployment: iOS 17.0

2. Enable SwiftData
   - Add @main with .modelContainer

3. Review iOS Development Guidelines (references)

4. Create PRD for iOS app

5. Use zen planner with PRD

6. Deploy 5-agent iOS team
```

### Phase 1: Core Features

```yaml
1. Implement P1 features with:
   - SwiftUI views
   - @Observable stores
   - SwiftData models
   - NavigationStack flows

2. Quality gates for each feature:
   - ✅ Builds in Xcode
   - ✅ Runs on simulator
   - ✅ Screenshot evidence
   - ✅ zen precommit passed

3. Phase gates at phase end:
   - ✅ analyze (quality)
   - ✅ refactor (debt)
   - ✅ analyze (performance)
```

### Phase 2+: Enhancement

```yaml
1. P2+ features implementation

2. Mock → Real API migration
   - async/await networking
   - Error handling
   - Loading states

3. Performance optimization
   - SwiftUI view optimization
   - SwiftData query optimization
   - Memory profiling

4. Phase gates mandatory
```

---

## Common iOS Patterns

### Loading State

```swift
@Observable
final class ContentStore {
    enum LoadingState {
        case idle
        case loading
        case loaded([Item])
        case failed(Error)
    }

    var state: LoadingState = .idle

    func load() async {
        state = .loading

        do {
            let items = try await APIClient.fetchItems()
            state = .loaded(items)
        } catch {
            state = .failed(error)
        }
    }
}

struct ContentView: View {
    @State private var store = ContentStore()

    var body: some View {
        Group {
            switch store.state {
            case .idle, .loading:
                ProgressView()
            case .loaded(let items):
                List(items) { item in
                    Text(item.title)
                }
            case .failed(let error):
                ErrorView(error: error)
            }
        }
        .task {
            await store.load()
        }
    }
}
```

### Form Input

```swift
@Observable
final class ProfileStore {
    var name = ""
    var email = ""
    var bio = ""

    var isValid: Bool {
        !name.isEmpty && email.contains("@")
    }

    func save() async throws {
        try await APIClient.updateProfile(
            name: name,
            email: email,
            bio: bio
        )
    }
}

struct ProfileView: View {
    @State private var store = ProfileStore()

    var body: some View {
        Form {
            TextField("Name", text: $store.name)
            TextField("Email", text: $store.email)
            TextField("Bio", text: $store.bio, axis: .vertical)

            Button("Save") {
                Task {
                    try await store.save()
                }
            }
            .disabled(!store.isValid)
        }
    }
}
```

### List with SwiftData

```swift
struct UsersView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \\User.name) private var users: [User]

    var body: some View {
        List {
            ForEach(users) { user in
                NavigationLink(value: Route.userDetail(user)) {
                    UserRow(user: user)
                }
            }
            .onDelete { indexSet in
                for index in indexSet {
                    modelContext.delete(users[index])
                }
            }
        }
        .toolbar {
            Button("Add") {
                let user = User(name: "New User", email: "user@example.com")
                modelContext.insert(user)
            }
        }
    }
}
```

---

## iOS Code Review Checklist

### Technology Compliance

- [ ] SwiftUI exclusively (no UIKit views)
- [ ] SwiftData exclusively (no Core Data)
- [ ] @Observable exclusively (no @Published/@ObservableObject)
- [ ] async/await exclusively (no completion handlers)
- [ ] NavigationStack (no NavigationView)
- [ ] iOS 17.0+ minimum target

### SwiftUI Best Practices

- [ ] View hierarchy is shallow (< 3-4 levels)
- [ ] Extracted subviews for reusability
- [ ] @State for local view state
- [ ] @Environment for injected dependencies
- [ ] No business logic in views (use @Observable stores)

### State Management

- [ ] @Observable for all stores/view models
- [ ] No manual `objectWillChange.send()`
- [ ] No `@Published` properties
- [ ] Clear state ownership

### SwiftData

- [ ] All models marked with @Model
- [ ] Proper @Relationship declarations
- [ ] Correct delete rules
- [ ] @Attribute(.unique) for unique fields

### Concurrency

- [ ] All async work uses async/await
- [ ] No completion handler closures
- [ ] Proper Task creation
- [ ] .task modifier for view lifecycle async
- [ ] Actor for shared mutable state (when needed)

### Navigation

- [ ] NavigationStack with path
- [ ] Type-safe route enum
- [ ] .navigationDestination for routing
- [ ] No NavigationLink(destination:) (deprecated pattern)

### Performance

- [ ] No expensive computations in body
- [ ] Large lists use proper data queries
- [ ] Images loaded asynchronously
- [ ] Minimal view refreshes

---

## iOS Testing Guidelines

### Unit Tests (XCTest)

```swift
import XCTest
@testable import MyApp

final class UserStoreTests: XCTestCase {
    func testLoadUsers() async throws {
        let store = UserStore()

        await store.loadUsers()

        XCTAssertFalse(store.users.isEmpty)
        XCTAssertFalse(store.isLoading)
    }

    func testLoadUsersError() async {
        let store = UserStore()
        // Test error handling
    }
}
```

### SwiftData Tests

```swift
import XCTest
import SwiftData
@testable import MyApp

final class UserModelTests: XCTestCase {
    var container: ModelContainer!
    var context: ModelContext!

    override func setUp() async throws {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        container = try ModelContainer(for: User.self, configurations: config)
        context = ModelContext(container)
    }

    func testUserCreation() throws {
        let user = User(name: "Test", email: "test@example.com")
        context.insert(user)
        try context.save()

        let descriptor = FetchDescriptor<User>()
        let users = try context.fetch(descriptor)

        XCTAssertEqual(users.count, 1)
        XCTAssertEqual(users.first?.name, "Test")
    }
}
```

### UI Tests (XCUITest)

```swift
import XCTest

final class MyAppUITests: XCTestCase {
    func testUserFlow() throws {
        let app = XCUIApplication()
        app.launch()

        // Navigate to users
        app.buttons["Users"].tap()

        // Add new user
        app.buttons["Add"].tap()

        let nameField = app.textFields["Name"]
        nameField.tap()
        nameField.typeText("John Doe")

        app.buttons["Save"].tap()

        // Verify user appears
        XCTAssertTrue(app.staticTexts["John Doe"].exists)
    }
}
```

---

## iOS Common Pitfalls

### Pitfall 1: Using UIKit
**Problem**: Adding `UIViewRepresentable` unnecessarily
**Solution**: Use pure SwiftUI. Only use UIKit if SwiftUI genuinely lacks the API.

### Pitfall 2: Using Core Data
**Problem**: Importing CoreData framework
**Solution**: Use SwiftData exclusively. It's modern and SwiftUI-native.

### Pitfall 3: Using Combine
**Problem**: `import Combine`, `@Published`, `@ObservableObject`
**Solution**: Use `@Observable` from Observation framework.

### Pitfall 4: Completion Handler Async
**Problem**: Using closures for async operations
**Solution**: Use async/await exclusively.

### Pitfall 5: NavigationView
**Problem**: Using deprecated `NavigationView`
**Solution**: Use `NavigationStack` with type-safe routes.

### Pitfall 6: Complex View Bodies
**Problem**: 100+ line view bodies
**Solution**: Extract subviews. Keep views focused.

### Pitfall 7: Business Logic in Views
**Problem**: API calls and data manipulation in views
**Solution**: Use @Observable stores. Views should be presentation-only.

### Pitfall 8: No Screenshot Evidence
**Problem**: Marking features complete without simulator screenshots
**Solution**: Always capture and save screenshots to `tracking/screenshots/`.

---

## Zen Tools for iOS

### Planning
```yaml
zen planner:
  - Input: iOS app PRD
  - Output: Phase-based iOS implementation plan
```

### Architecture Review
```yaml
zen analyze:
  - Focus: SwiftUI architecture, SwiftData models
  - Check: Compliance with mandatory standards
```

### Code Review
```yaml
zen codereview:
  - Verify: SwiftUI/SwiftData/Observable compliance
  - Check: No UIKit/CoreData/Combine
  - Validate: iOS 17.0+ patterns
```

### Debugging
```yaml
zen debug:
  - iOS simulator crashes
  - SwiftData query issues
  - NavigationStack problems
  - @Observable state issues
```

### Refactoring
```yaml
zen refactor:
  - Migrate UIKit → SwiftUI
  - Migrate Core Data → SwiftData
  - Migrate Combine → @Observable
  - Simplify SwiftUI hierarchies
```

### Pre-Commit
```yaml
zen precommit:
  - MANDATORY before every iOS commit
  - Checks: Code quality, standards compliance
  - Validates: Build succeeds, tests pass
```

---

## iOS ADR Examples

### ADR-001: SwiftUI Navigation Pattern
```markdown
# ADR-001: Use NavigationStack with Type-Safe Routes

**Date**: 2025-01-30
**Status**: Accepted

## Context
Need navigation pattern for iOS 17.0+ app with complex flows.

## Decision
Use NavigationStack with enum-based routes.

**Alternatives Considered**:
1. NavigationView (deprecated)
2. Coordinator pattern with UIKit
3. Third-party navigation libraries

**Rationale**:
- Modern iOS 17.0+ API
- Type-safe routing
- Programmatic navigation support
- Native SwiftUI integration

## Consequences
**Positive**:
- Type safety prevents navigation errors
- Easy programmatic navigation
- Future-proof for iOS updates

**Negative**:
- Slightly more boilerplate than simple NavigationLink
- Team must learn pattern

**Tool Chain**:
- challenge (questioning alternatives)
- consensus (gpt-5-pro FOR, gemini-2.5-pro NEUTRAL)
- Continuation ID: ABC123
```

---

## iOS Resources

**Included in Skill**:
- Complete iOS development guidelines
- SwiftUI architecture patterns
- SwiftData implementation guide
- State management with @Observable
- Navigation with NavigationStack
- Async/await concurrency
- Testing strategies
- Quality gates specific to iOS
- Phase gates with iOS metrics

**Use This Skill When**:
- Building iOS 17.0+ applications
- Need SwiftUI/SwiftData expertise
- Enforcing iOS mandatory standards
- iOS-specific code review
- iOS performance optimization
- iOS testing implementation

---

## Summary

This skill provides iOS-specific development workflow with:
- **Mandatory SwiftUI/SwiftData stack** (zero tolerance for legacy)
- **@Observable state management** (no Combine)
- **async/await concurrency** (no completion handlers)
- **NavigationStack** (no NavigationView)
- **iOS 17.0+ exclusively** (no backwards compatibility)
- **Phase-based development** with iOS-specific quality gates
- **5-agent iOS team** coordination patterns

**Remember**: NO UIKit, NO Core Data, NO Combine. SwiftUI, SwiftData, @Observable only! 📱 ✅
