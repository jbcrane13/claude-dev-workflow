#!/bin/bash

# iOS Project Deployment Script
# Claude Dev Workflow v2.0
# 
# This script creates a new iOS project with the complete Claude Dev Workflow structure
#
# Usage: ./deploy-ios-project.sh "ProjectName" "/path/to/create/project"
#
# Example: ./deploy-ios-project.sh "TaskManager" "/Users/blake/Projects"
#   Creates: /Users/blake/Projects/TaskManager/

set -e  # Exit on error

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_header() {
    echo -e "\n${BLUE}========================================${NC}"
    echo -e "${BLUE}$1${NC}"
    echo -e "${BLUE}========================================${NC}\n"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check arguments
if [ "$#" -ne 2 ]; then
    print_error "Usage: $0 \"ProjectName\" \"/path/to/create/project\""
    echo "Example: $0 \"TaskManager\" \"/Users/blake/Projects\""
    exit 1
fi

PROJECT_NAME="$1"
BASE_PATH="$2"
PROJECT_PATH="$BASE_PATH/$PROJECT_NAME"

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
WORKFLOW_ROOT="$(dirname "$SCRIPT_DIR")"

print_header "Claude Dev Workflow - iOS Project Setup"

echo "Project Name: $PROJECT_NAME"
echo "Project Path: $PROJECT_PATH"
echo "Workflow Root: $WORKFLOW_ROOT"
echo ""

# Validate inputs
if [ -z "$PROJECT_NAME" ]; then
    print_error "Project name cannot be empty"
    exit 1
fi

if [ -d "$PROJECT_PATH" ]; then
    print_error "Project directory already exists: $PROJECT_PATH"
    exit 1
fi

if [ ! -d "$BASE_PATH" ]; then
    print_error "Base path does not exist: $BASE_PATH"
    exit 1
fi

# Check for required tools
print_info "Checking prerequisites..."

if ! command -v xcodebuild &> /dev/null; then
    print_error "Xcode not found. Please install Xcode from the App Store."
    exit 1
fi

if ! command -v git &> /dev/null; then
    print_error "Git not found. Please install Git."
    exit 1
fi

print_success "All prerequisites met"

# Create project structure
print_header "Creating Project Structure"

echo "Creating directories..."
mkdir -p "$PROJECT_PATH"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/App"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Models"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Views"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Views/Shared"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Stores"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Services"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Utilities"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Utilities/Extensions"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Utilities/Helpers"
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Resources"
mkdir -p "$PROJECT_PATH/Tests/${PROJECT_NAME}Tests"
mkdir -p "$PROJECT_PATH/Tests/${PROJECT_NAME}Tests/Models"
mkdir -p "$PROJECT_PATH/Tests/${PROJECT_NAME}Tests/Stores"
mkdir -p "$PROJECT_PATH/Tests/${PROJECT_NAME}Tests/Services"
mkdir -p "$PROJECT_PATH/UITests/${PROJECT_NAME}UITests"
mkdir -p "$PROJECT_PATH/tracking"
mkdir -p "$PROJECT_PATH/tracking/screenshots"
mkdir -p "$PROJECT_PATH/tracking/session-summaries"
mkdir -p "$PROJECT_PATH/docs"

print_success "Directory structure created"

# Copy workflow files
print_header "Setting Up Workflow Files"

echo "Copying tracking templates..."
cp "$WORKFLOW_ROOT/tracking/session-state.md" "$PROJECT_PATH/tracking/"
cp "$WORKFLOW_ROOT/tracking/phase-status.md" "$PROJECT_PATH/tracking/"
cp "$WORKFLOW_ROOT/tracking/mock-data-registry.md" "$PROJECT_PATH/tracking/"
cp "$WORKFLOW_ROOT/tracking/screenshots/README.md" "$PROJECT_PATH/tracking/screenshots/"

echo "Copying documentation..."
cp "$WORKFLOW_ROOT/docs/"*.md "$PROJECT_PATH/docs/"

echo "Copying claude.md to project root..."
cp "$WORKFLOW_ROOT/claude.md" "$PROJECT_PATH/claude.md"

echo "Copying .gitignore..."
cp "$WORKFLOW_ROOT/templates/ios/.gitignore" "$PROJECT_PATH/.gitignore"

print_success "Workflow files copied"

# Create Xcode project
print_header "Creating Xcode Project"

cd "$PROJECT_PATH"

# Create the main app file
cat > "$PROJECT_PATH/$PROJECT_NAME/App/${PROJECT_NAME}App.swift" << EOF
//
//  ${PROJECT_NAME}App.swift
//  ${PROJECT_NAME}
//
//  Created by Claude Dev Workflow
//  Target: iOS 17.0+
//

import SwiftUI
import SwiftData

@main
struct ${PROJECT_NAME}App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            // Add your @Model types here
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
EOF

# Create ContentView
cat > "$PROJECT_PATH/$PROJECT_NAME/App/ContentView.swift" << EOF
//
//  ContentView.swift
//  ${PROJECT_NAME}
//
//  Created by Claude Dev Workflow
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "checkmark.circle.fill")
                    .imageScale(.large)
                    .foregroundStyle(.green)
                    .font(.system(size: 60))
                
                Text("${PROJECT_NAME}")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                Text("Claude Dev Workflow")
                    .font(.title3)
                    .foregroundStyle(.secondary)
                
                Text("Ready to build! ✅")
                    .font(.title2)
                    .padding()
            }
            .navigationTitle("${PROJECT_NAME}")
        }
    }
}

#Preview {
    ContentView()
}
EOF

# Create Assets.xcassets
mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Resources/Assets.xcassets"
cat > "$PROJECT_PATH/$PROJECT_NAME/Resources/Assets.xcassets/Contents.json" << EOF
{
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Resources/Assets.xcassets/AppIcon.appiconset"
cat > "$PROJECT_PATH/$PROJECT_NAME/Resources/Assets.xcassets/AppIcon.appiconset/Contents.json" << EOF
{
  "images" : [
    {
      "idiom" : "universal",
      "platform" : "ios",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

mkdir -p "$PROJECT_PATH/$PROJECT_NAME/Resources/Assets.xcassets/AccentColor.colorset"
cat > "$PROJECT_PATH/$PROJECT_NAME/Resources/Assets.xcassets/AccentColor.colorset/Contents.json" << EOF
{
  "colors" : [
    {
      "idiom" : "universal"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

# Create basic test file
cat > "$PROJECT_PATH/Tests/${PROJECT_NAME}Tests/${PROJECT_NAME}Tests.swift" << EOF
//
//  ${PROJECT_NAME}Tests.swift
//  ${PROJECT_NAME}Tests
//
//  Created by Claude Dev Workflow
//

import XCTest
@testable import ${PROJECT_NAME}

final class ${PROJECT_NAME}Tests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here
    }

    override func tearDownWithError() throws {
        // Put teardown code here
    }

    func testExample() throws {
        // This is an example test
        XCTAssertTrue(true)
    }
}
EOF

# Create UI test file
cat > "$PROJECT_PATH/UITests/${PROJECT_NAME}UITests/${PROJECT_NAME}UITests.swift" << EOF
//
//  ${PROJECT_NAME}UITests.swift
//  ${PROJECT_NAME}UITests
//
//  Created by Claude Dev Workflow
//

import XCTest

final class ${PROJECT_NAME}UITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()
        
        // Verify app launches successfully
        XCTAssertTrue(app.exists)
    }
}
EOF

print_success "Source files created"

print_warning "Note: You'll need to create the .xcodeproj file using Xcode"
print_info "1. Open Xcode"
print_info "2. File > New > Project"
print_info "3. Select iOS > App"
print_info "4. Use these settings:"
print_info "   - Product Name: ${PROJECT_NAME}"
print_info "   - Organization: [Your Organization]"
print_info "   - Interface: SwiftUI"
print_info "   - Storage: SwiftData"
print_info "   - Language: Swift"
print_info "5. Save to: ${PROJECT_PATH}"
print_info "6. Delete generated files and use the ones created by this script"

# Create project README
print_header "Creating Project Documentation"

cat > "$PROJECT_PATH/README.md" << 'EOFREADME'
# ${PROJECT_NAME}

iOS application built using the Claude Dev Workflow.

---

## 📱 Project Info

- **Platform**: iOS 17.0+
- **Language**: Swift 6.0+
- **UI Framework**: SwiftUI
- **Data**: SwiftData
- **Architecture**: Model-View with @Observable
- **Concurrency**: Swift Concurrency (async/await)

---

## 🚀 Getting Started

### Prerequisites

- Xcode 15.0+
- macOS 14.0+
- iOS 17.0+ Simulator or Device

### Setup

1. Open `${PROJECT_NAME}.xcodeproj` in Xcode
2. Select your target device/simulator
3. Press `Cmd+R` to build and run

### First Steps

1. Review `claude.md` (project root) for workflow overview
2. Check `tracking/phase-status.md` for current phase
3. Read `docs/ios-development.md` for iOS standards
4. Follow phase-based development process

---

## 📁 Project Structure

```
${PROJECT_NAME}/
├── ${PROJECT_NAME}.xcodeproj
├── claude.md                   # Master workflow (PROJECT ROOT)
├── README.md
├── ${PROJECT_NAME}/
│   ├── App/                    # Application entry point
│   ├── Models/                 # SwiftData models
│   ├── Views/                  # SwiftUI views
│   ├── Stores/                 # @Observable stores
│   ├── Services/               # Business logic & APIs
│   ├── Utilities/              # Helpers & extensions
│   └── Resources/              # Assets, strings, etc.
├── Tests/                      # Unit tests
├── UITests/                    # UI tests
├── tracking/                   # Development tracking
│   ├── session-state.md
│   ├── phase-status.md
│   ├── mock-data-registry.md
│   └── screenshots/
└── docs/                       # Detailed documentation
    ├── PRD.md
    ├── ios-development.md
    ├── project-management.md
    └── ...
```

---

## 📋 Development Workflow

### Phase-Based Development

```
Phase 0: Foundation & Planning
   ↓
Phase 1: Core P1 Features (MVP)
   ↓
Phase 2: Enhanced Features
   ↓
Phase 3+: Production Ready
```

### Current Status

**Phase**: [Update in tracking/phase-status.md]
**Progress**: [X%]
**Status**: [On Track / At Risk / Blocked]

---

## ✅ Quality Gates

Before marking any task complete:

- [ ] Code follows iOS development guidelines
- [ ] All tests passing
- [ ] Builds successfully on simulator
- [ ] Screenshot evidence provided
- [ ] Code reviewed
- [ ] Documentation updated

---

## 🧪 Testing

### Run Tests

```bash
# Run all tests
xcodebuild test -project ${PROJECT_NAME}.xcodeproj -scheme ${PROJECT_NAME} -destination 'platform=iOS Simulator,name=iPhone 15'

# Run in Xcode
Cmd+U
```

### Test Coverage

Target: ≥ 70% for Phase 1, ≥ 80% for production

---

## 📸 Screenshots

All feature screenshots stored in `tracking/screenshots/`

Required for every completed feature!

---

## 📚 Documentation

- [Master Workflow](claude.md) - Complete workflow reference (project root)
- [iOS Development](docs/ios-development.md) - iOS technical standards
- [Project Management](docs/project-management.md) - Phase planning
- [Quality Gates](docs/quality-gates.md) - Completion criteria
- [Testing Guidelines](docs/testing-guidelines.md) - Testing standards

---

## 🔧 Development Tools

### Zen MCP Tools

Use throughout development:
- `planner` - Project breakdown
- `analyze` - Codebase analysis
- `codereview` - Quality verification
- `debug` - Issue resolution
- `precommit` - Final checks

See [Zen Tools Guide](docs/zen-tools-guide.md)

---

## 🤝 Contributing

Follow the Claude Dev Workflow:

1. Review current phase in `tracking/phase-status.md`
2. Pick a task from phase plan
3. Follow iOS development guidelines
4. Write tests
5. Ensure all quality gates pass
6. Provide screenshot evidence
7. Update tracking files

---

## 📝 License

[Your License Here]

---

## 🆘 Support

- Review documentation in `docs/`
- Check `tracking/session-state.md` for current context
- See `tracking/phase-status.md` for progress

---

**Built with Claude Dev Workflow v2.0**
EOFREADME

# Replace placeholder in README
sed -i '' "s/\${PROJECT_NAME}/$PROJECT_NAME/g" "$PROJECT_PATH/README.md"

print_success "README.md created"

# Initialize git
print_header "Initializing Git Repository"

git init
git add .
git commit -m "Initial commit: ${PROJECT_NAME} created with Claude Dev Workflow v2.0

- Project structure created
- Workflow files initialized
- Documentation added
- Ready for Phase 0 planning"

print_success "Git repository initialized"

# Create initial phase status
cat > "$PROJECT_PATH/tracking/phase-status.md" << EOF
# Project Phase Status

**Current Phase**: Phase 0 - Foundation & Planning
**Phase Progress**: 0% (0/8 tasks complete)
**Status**: Not Started
**Last Updated**: $(date "+%Y-%m-%d %H:%M")

---

## Phase 0 Tasks

### Not Started ⏳
- [ ] PROJ-000: Review workflow documentation
- [ ] PROJ-001: Define project requirements
- [ ] PROJ-002: Plan architecture (Zen \`thinkdeep\`)
- [ ] PROJ-003: Design data models
- [ ] PROJ-004: Create project plan (Zen \`planner\`)
- [ ] PROJ-005: Define Phase 1-N features
- [ ] PROJ-006: Set up mock data strategy
- [ ] PROJ-007: Initialize Xcode project

---

## Next Steps

1. Review all documentation in \`docs/\`
2. Use Zen \`planner\` to create complete project plan
3. Define P1/P2/P3 features
4. Complete Phase 0 checklist

---

## Notes

Project created with Claude Dev Workflow deployment script.
Ready to begin Phase 0 planning!
EOF

# Update session state
cat > "$PROJECT_PATH/tracking/session-state.md" << EOF
# Session State

**Last Updated**: $(date "+%Y-%m-%d %H:%M")
**Current Phase**: Phase 0 - Foundation & Planning
**Phase Progress**: 0%
**Active Agents**: Coordinator

---

## Current Context

### What We're Building
${PROJECT_NAME} - iOS application using Swift, SwiftUI, and SwiftData

### Current Phase Goal
Complete foundation and planning phase:
- Review workflow documentation
- Define project architecture
- Plan all development phases
- Set up quality gates

### Where We Are
- Project structure: Created ✅
- Workflow files: Initialized ✅
- Git repository: Initialized ✅
- Xcode project: Needs manual creation ⏳
- Architecture planning: Not started ⏳
- Phase planning: Not started ⏳

---

## Recent Decisions

### Decision: Project Structure
- **Date/Time**: $(date "+%Y-%m-%d %H:%M")
- **Decision**: Use standard iOS structure with Claude Dev Workflow
- **Rationale**: Follows best practices and enables team coordination
- **Made by**: Deployment script
- **Tool used**: deploy-ios-project.sh

---

## Next Steps

### Immediate (This Session)
1. Create Xcode project file manually
2. Review all workflow documentation
3. Use Zen \`planner\` for project breakdown

### Next Session
1. Define Phase 1 P1 features
2. Design data models
3. Plan architecture

---

## Files Modified This Session
- All project files created by deployment script
- Git repository initialized
- tracking/session-state.md (this file)
- tracking/phase-status.md

---

## Agent Notes

### Coordinator Notes
Project successfully deployed with Claude Dev Workflow structure.
Next: Manual Xcode project creation, then Phase 0 planning.

---

## Continuation Context

**For Next Session/Agent**:
Project structure is ready. Need to:
1. Create .xcodeproj file in Xcode
2. Begin Phase 0 planning
3. Use Zen tools for architecture decisions

**Zen Continuation ID**: [Will be set after first Zen tool usage]

---

## Emergency Recovery Info

**Project Root**: ${PROJECT_PATH}
**Git Branch**: main (default)
**Last Commit**: Initial commit
**Build Last Successful**: Not yet built
**Tests Last Passed**: Not yet run
EOF

# Create a quick start guide
cat > "$PROJECT_PATH/QUICK_START.md" << EOF
# ${PROJECT_NAME} - Quick Start Guide

Welcome to your new iOS project created with Claude Dev Workflow!

---

## 🎯 Next Steps (In Order)

### 1. Create Xcode Project File

The directory structure is ready, but you need to create the .xcodeproj file:

**Option A: Create New Project in Xcode** (Recommended)
1. Open Xcode
2. File > New > Project
3. Select: iOS > App
4. Settings:
   - Product Name: \`${PROJECT_NAME}\`
   - Team: [Your Team]
   - Organization Identifier: [Your identifier]
   - Interface: SwiftUI
   - Storage: SwiftData
   - Language: Swift
   - Include Tests: Yes
5. **Important**: Save to \`${PROJECT_PATH}\`
6. **Delete** the auto-generated files:
   - ${PROJECT_NAME}/${PROJECT_NAME}App.swift (use the one in App/ folder)
   - ${PROJECT_NAME}/ContentView.swift (use the one in App/ folder)
   - ${PROJECT_NAME}/Item.swift (if generated)
7. **Add** the existing source files to the project:
   - Right-click ${PROJECT_NAME} group > Add Files
   - Add: App/, Models/, Views/, Stores/, Services/, Utilities/, Resources/

**Option B: Manual Setup** (Advanced)
- Create Xcode project configuration manually
- Add all source files and folders
- Configure build settings
- Set up test targets

---

### 2. Verify Project Builds

\`\`\`bash
cd ${PROJECT_PATH}

# Build the project
xcodebuild -project ${PROJECT_NAME}.xcodeproj \\
  -scheme ${PROJECT_NAME} \\
  -destination 'platform=iOS Simulator,name=iPhone 15' \\
  build

# Or in Xcode: Cmd+B
\`\`\`

You should see "Ready to build! ✅" when you run the app.

---

### 3. Review Workflow Documentation

Read these in order:

1. **\`claude.md\`** (at project root) (5-10 min)
   - Master workflow overview
   - Quick reference guide

2. **\`docs/ios-development.md\`** (10-15 min)
   - iOS technical standards
   - SwiftUI/SwiftData patterns
   - Code quality guidelines

3. **\`docs/project-management.md\`** (10 min)
   - Phase-based development
   - Task planning
   - Quality gates

4. **\`docs/agent-deployment.md\`** (10 min)
   - Multi-agent coordination
   - Role definitions
   - Team structures

---

### 4. Begin Phase 0 Planning

Use Zen tools to plan your project:

**Step 1: Project Breakdown**
\`\`\`
Use Zen tool: planner

Input: "Plan iOS app: ${PROJECT_NAME}
[Describe your app idea, target users, key features]"

Output: Detailed phase breakdown with tasks and dependencies
\`\`\`

**Step 2: Architecture Planning**
\`\`\`
Use Zen tool: thinkdeep

Input: "Design architecture for ${PROJECT_NAME}
Requirements: [Your specific needs]"

Output: Architecture recommendations and decisions
\`\`\`

**Step 3: Define Features**
- Create list of all features
- Prioritize as P0/P1/P2/P3
- Map to phases
- Update \`tracking/phase-status.md\`

---

### 5. Track Your Progress

Update these files regularly:

**\`tracking/session-state.md\`**
- Current work
- Decisions made
- Blockers
- Next steps

**\`tracking/phase-status.md\`**
- Task progress
- Completed items
- Timeline

**\`tracking/mock-data-registry.md\`**
- Mock data usage
- Migration plan

**\`tracking/screenshots/\`**
- Feature evidence
- Proof of completion

---

## 📚 Essential Commands

### Build & Test
\`\`\`bash
# Build
xcodebuild -project ${PROJECT_NAME}.xcodeproj -scheme ${PROJECT_NAME} build

# Test
xcodebuild test -project ${PROJECT_NAME}.xcodeproj \\
  -scheme ${PROJECT_NAME} \\
  -destination 'platform=iOS Simulator,name=iPhone 15'

# Or in Xcode
# Build: Cmd+B
# Test: Cmd+U
# Run: Cmd+R
\`\`\`

### Git Workflow
\`\`\`bash
# Check status
git status

# Stage changes
git add .

# Commit (after quality gates pass!)
git commit -m "Descriptive message"

# View history
git log --oneline
\`\`\`

---

## ✅ Phase 0 Checklist

Before moving to Phase 1:

- [ ] Xcode project created and builds
- [ ] All workflow documentation reviewed
- [ ] Used Zen \`planner\` for project breakdown
- [ ] Architecture designed (Zen \`thinkdeep\`)
- [ ] Data models planned
- [ ] Phase 1-N features defined
- [ ] P1/P2/P3 priorities assigned
- [ ] Mock data strategy created
- [ ] Quality gates understood
- [ ] Team roles assigned (if multi-agent)

---

## 🎓 Learning Resources

### Workflow Guides
- [Master Index](claude.md) (project root)
- [iOS Development](docs/ios-development.md)
- [Project Management](docs/project-management.md)
- [Quality Gates](docs/quality-gates.md)

### Zen MCP Tools
- [Zen Tools Guide](docs/zen-tools-guide.md)
- Tools: planner, thinkdeep, analyze, codereview, debug, precommit

### Technical References
- [SwiftUI Documentation](https://developer.apple.com/documentation/swiftui/)
- [SwiftData Documentation](https://developer.apple.com/documentation/swiftdata/)
- [Swift Concurrency](https://docs.swift.org/swift-book/LanguageGuide/Concurrency.html)

---

## 🆘 Troubleshooting

### "Xcode project won't build"
1. Check file paths are correct
2. Ensure all source files added to target
3. Verify Swift version set to 6.0+
4. Check iOS deployment target is 17.0+

### "Can't find workflow docs"
- Master index: \`claude.md\` (at project root)
- Detailed docs: \`${PROJECT_PATH}/docs/\`

### "Lost context between sessions"
- Check \`tracking/session-state.md\`
- Review git commit history
- Use Zen \`chat\` with continuation_id

---

## 🎯 Success Criteria

You're ready for Phase 1 when:

✅ Project builds successfully
✅ Tests run (even if minimal)
✅ Architecture documented
✅ All phases planned
✅ P1 features defined clearly
✅ Quality gates understood
✅ Tracking files initialized

---

**Questions?** Review the docs or use Zen \`chat\` tool for assistance!

**Ready to build something amazing! 🚀**
EOF

# Create LICENSE file
cat > "$PROJECT_PATH/LICENSE" << EOF
MIT License

Copyright (c) $(date "+%Y") [Your Name]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

print_success "License file created"

# Final summary
print_header "Deployment Complete! 🎉"

echo ""
print_success "Project: ${PROJECT_NAME}"
print_success "Location: ${PROJECT_PATH}"
echo ""

print_info "What was created:"
echo "  ✅ Complete directory structure"
echo "  ✅ Workflow tracking files"
echo "  ✅ Documentation (linked to master workflow)"
echo "  ✅ Swift source files (App, Views, Models, etc.)"
echo "  ✅ Test files"
echo "  ✅ Git repository initialized"
echo "  ✅ README and Quick Start guide"
echo ""

print_warning "Next Steps:"
echo ""
echo "1️⃣  Create Xcode project file"
print_info "   Open Xcode > New Project > iOS App"
print_info "   Save to: ${PROJECT_PATH}"
print_info "   See QUICK_START.md for detailed instructions"
echo ""

echo "2️⃣  Read the Quick Start Guide"
print_info "   cat ${PROJECT_PATH}/QUICK_START.md"
echo ""

echo "3️⃣  Review workflow documentation"
print_info "   Start with: ${PROJECT_PATH}/claude.md"
echo ""

echo "4️⃣  Begin Phase 0 planning"
print_info "   Use Zen 'planner' tool"
print_info "   Update: ${PROJECT_PATH}/tracking/phase-status.md"
echo ""

print_header "Important Reminders"

echo "📸 Screenshot Evidence Required"
print_info "   Every feature needs screenshots in tracking/screenshots/"
echo ""

echo "✅ Quality Gates Are Mandatory"
print_info "   See docs/quality-gates.md"
print_info "   Nothing complete without: Build + Tests + Screenshots"
echo ""

echo "📋 Update Tracking Files"
print_info "   session-state.md - Current work & decisions"
print_info "   phase-status.md - Task progress"
print_info "   mock-data-registry.md - Mock data usage"
echo ""

print_success "Happy coding! 🚀"
echo ""

# Print file tree
print_info "Project Structure:"
echo ""
if command -v tree &> /dev/null; then
    tree -L 2 -I ".git" "$PROJECT_PATH"
else
    find "$PROJECT_PATH" -maxdepth 2 -print | sed -e "s;$PROJECT_PATH;.;g;s;[^/]*\/;|____;g;s;____|; |;g"
fi

echo ""
print_info "Full instructions: ${PROJECT_PATH}/QUICK_START.md"
echo ""
