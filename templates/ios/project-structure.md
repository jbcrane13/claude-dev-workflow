# iOS Project Structure

This document defines the standard project structure for iOS applications using the Claude Dev Workflow.

---

## Standard Directory Structure

```
ProjectName/
├── ProjectName.xcodeproj          # Xcode project file
│
├── ProjectName/                    # Main source directory
│   ├── App/                        # Application entry point
│   │   ├── ProjectNameApp.swift   # Main @main app struct
│   │   └── ContentView.swift      # Root view
│   │
│   ├── Models/                     # Data models (SwiftData)
│   │   ├── ModelName.swift        # @Model classes
│   │   └── ...
│   │
│   ├── Views/                      # SwiftUI views
│   │   ├── FeatureA/
│   │   │   ├── FeatureAView.swift
│   │   │   ├── FeatureARow.swift
│   │   │   └── FeatureADetailView.swift
│   │   ├── FeatureB/
│   │   │   └── ...
│   │   └── Shared/
│   │       └── CommonComponents.swift
│   │
│   ├── Stores/                     # Observable state management
│   │   ├── AppStore.swift         # @Observable app-level state
│   │   ├── FeatureStore.swift     # @Observable feature state
│   │   └── ...
│   │
│   ├── Services/                   # Business logic & APIs
│   │   ├── NetworkService.swift   # API client
│   │   ├── AuthService.swift      # Authentication
│   │   └── ...
│   │
│   ├── Utilities/                  # Helper code
│   │   ├── Extensions/
│   │   │   ├── Date+Extensions.swift
│   │   │   └── String+Extensions.swift
│   │   ├── Helpers/
│   │   │   └── ValidationHelpers.swift
│   │   └── MockData.swift         # Mock data (Phase 1)
│   │
│   └── Resources/                  # Assets and resources
│       ├── Assets.xcassets         # Images, colors, etc.
│       ├── Localizable.strings     # Localization
│       └── Info.plist              # App configuration
│
├── Tests/                          # Test target
│   └── ProjectNameTests/
│       ├── Models/
│       │   └── ModelTests.swift
│       ├── Stores/
│       │   └── StoreTests.swift
│       └── Services/
│           └── ServiceTests.swift
│
├── UITests/                        # UI test target (Phase 3+)
│   └── ProjectNameUITests/
│       └── CriticalFlowTests.swift
│
├── tracking/                       # Workflow tracking
│   ├── session-state.md           # Current session state
│   ├── phase-status.md            # Phase progress
│   ├── mock-data-registry.md      # Mock data tracking
│   └── screenshots/               # Feature screenshots
│       └── README.md
│
├── docs/                           # Project documentation
│   ├── claude.md                  # Workflow reference (symlink)
│   ├── architecture.md            # Architecture decisions
│   ├── api-documentation.md       # API docs
│   └── features.md                # Feature specifications
│
├── .gitignore                      # Git ignore file
└── README.md                       # Project README
```

---

## Directory Purposes

### `/ProjectName/App/`
**Purpose**: Application entry point and root setup

**Contains**:
- `ProjectNameApp.swift` - Main `@main` struct
- `ContentView.swift` - Root view
- App-level configuration

**Example**:
```swift
// ProjectNameApp.swift
import SwiftUI
import SwiftData

@main
struct TaskManagerApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Task.self,
            Category.self,
        ])
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )
        do {
            return try ModelContainer(
                for: schema,
                configurations: [modelConfiguration]
            )
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
```

---

### `/ProjectName/Models/`
**Purpose**: SwiftData models and data structures

**Naming Convention**: `[Entity]Model.swift` or `[Entity].swift`

**Example**:
```swift
// Task.swift
import Foundation
import SwiftData

@Model
final class Task {
    var id: UUID
    var title: String
    var isCompleted: Bool
    var createdAt: Date
    var dueDate: Date?
    
    @Relationship(deleteRule: .cascade)
    var category: Category?
    
    init(title: String, isCompleted: Bool = false) {
        self.id = UUID()
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = .now
    }
}
```

---

### `/ProjectName/Views/`
**Purpose**: SwiftUI view components

**Organization**:
- Group by feature
- Shared components in `/Shared/`
- One view per file
- Related views in same folder

**Naming Convention**:
- Main views: `[Feature]View.swift`
- Row/cell components: `[Feature]Row.swift`
- Detail views: `[Feature]DetailView.swift`

**Example Structure**:
```
Views/
├── Tasks/
│   ├── TaskListView.swift       # Main list
│   ├── TaskRow.swift             # List row component
│   ├── TaskDetailView.swift      # Detail screen
│   └── AddTaskView.swift         # Add task sheet
├── Categories/
│   └── CategoryPickerView.swift
└── Shared/
    └── LoadingView.swift
```

---

### `/ProjectName/Stores/`
**Purpose**: Observable state management

**Guidelines**:
- Use `@Observable` macro
- One store per major feature
- `AppStore` for app-wide state
- Stores contain business logic

**Example**:
```swift
// TaskStore.swift
import Foundation
import Observation

@Observable
final class TaskStore {
    var tasks: [Task] = []
    var isLoading = false
    var errorMessage: String?
    
    func fetchTasks() async {
        isLoading = true
        defer { isLoading = false }
        
        do {
            // Fetch logic
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
```

---

### `/ProjectName/Services/`
**Purpose**: API clients, networking, business logic

**Types**:
- API clients
- Authentication services
- Data services
- Third-party integrations

**Example**:
```swift
// NetworkService.swift
import Foundation

class NetworkService {
    static let shared = NetworkService()
    private init() {}
    
    func fetch<T: Decodable>(_ endpoint: String) async throws -> T {
        // Network logic
    }
}
```

---

### `/ProjectName/Utilities/`
**Purpose**: Helper code, extensions, utilities

**Organization**:
- `/Extensions/` - Swift extensions
- `/Helpers/` - Helper functions
- `MockData.swift` - Mock data (remove in Phase 3)

**Example**:
```swift
// Extensions/Date+Extensions.swift
import Foundation

extension Date {
    var isToday: Bool {
        Calendar.current.isDateInToday(self)
    }
}
```

---

### `/ProjectName/Resources/`
**Purpose**: Non-code assets

**Contains**:
- `Assets.xcassets` - Images, colors, symbols
- `Localizable.strings` - Translations
- `Info.plist` - App configuration

---

### `/Tests/`
**Purpose**: Unit and integration tests

**Organization**: Mirror main source structure

**Example**:
```
Tests/ProjectNameTests/
├── Models/
│   └── TaskTests.swift
├── Stores/
│   └── TaskStoreTests.swift
└── Services/
    └── NetworkServiceTests.swift
```

---

### `/UITests/`
**Purpose**: UI tests (Phase 3+)

**Contains**: Critical user flow tests only

---

### `/tracking/`
**Purpose**: Development workflow tracking

**Files**:
- `session-state.md` - Current session
- `phase-status.md` - Phase progress
- `mock-data-registry.md` - Mock data tracking
- `screenshots/` - Feature evidence

---

### `/docs/`
**Purpose**: Project-specific documentation

**Contains**:
- `architecture.md` - Architecture decisions
- `api-documentation.md` - API docs
- `features.md` - Feature specs
- Symlink to `claude.md` for workflow reference

---

## File Naming Conventions

### Swift Files

**Models**: `[Entity].swift`
- ✅ `Task.swift`
- ✅ `Category.swift`

**Views**: `[Feature][Type]View.swift`
- ✅ `TaskListView.swift`
- ✅ `AddTaskView.swift`
- ✅ `TaskRow.swift` (for row components)

**Stores**: `[Feature]Store.swift`
- ✅ `TaskStore.swift`
- ✅ `AppStore.swift`

**Services**: `[Purpose]Service.swift`
- ✅ `NetworkService.swift`
- ✅ `AuthService.swift`

**Tests**: `[FileName]Tests.swift`
- ✅ `TaskTests.swift`
- ✅ `TaskStoreTests.swift`

---

## Best Practices

### File Organization

1. **One type per file** - Don't mix models, views, stores in same file
2. **Group by feature** - Related code stays together
3. **Shared code separate** - Common components in `/Shared/`
4. **Clear naming** - File names indicate purpose

### Import Order

```swift
// 1. System frameworks
import SwiftUI
import SwiftData

// 2. Third-party frameworks
import SomeLibrary

// 3. Internal imports
@testable import ProjectName
```

### Code Organization Within File

```swift
// 1. Imports
import SwiftUI

// 2. Type definition
struct TaskListView: View {
    // 3. Properties
    @State private var store = TaskStore()
    
    // 4. Body
    var body: some View {
        // View code
    }
    
    // 5. Private methods
    private func deleteTask() {
        // Logic
    }
}

// 6. Extensions (if needed)
extension TaskListView {
    // Additional functionality
}

// 7. Preview
#Preview {
    TaskListView()
}
```

---

## Project Setup Checklist

When starting a new iOS project:

- [ ] Create directory structure
- [ ] Set up `.gitignore`
- [ ] Create `README.md`
- [ ] Set up SwiftData container in App
- [ ] Create initial models
- [ ] Set up basic navigation
- [ ] Create tracking files
- [ ] Initialize git repository
- [ ] Create initial commit

---

## Migration Notes

### From UIKit

If migrating from UIKit:
- Replace ViewControllers with SwiftUI Views
- Replace Storyboards with SwiftUI code
- Update navigation to NavigationStack
- Convert delegates to closures/async

### From Other Patterns

If using different patterns:
- Replace MVVM with MV + @Observable
- Remove Combine, use async/await
- Replace Core Data with SwiftData
- Update to SwiftUI-native patterns

---

## Related Documentation

- [iOS Development Guidelines](../../docs/ios-development.md)
- [Project Management](../../docs/project-management.md)
- [Quality Gates](../../docs/quality-gates.md)

---

**Last Updated**: 2025-01-20
