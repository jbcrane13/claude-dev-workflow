# Contributing to Claude Dev Workflow

Thank you for your interest in contributing to Claude Dev Workflow! This document provides guidelines for contributing.

---

## 📋 Table of Contents

1. [Code of Conduct](#code-of-conduct)
2. [How to Contribute](#how-to-contribute)
3. [Development Setup](#development-setup)
4. [Contribution Types](#contribution-types)
5. [Submission Guidelines](#submission-guidelines)
6. [Style Guidelines](#style-guidelines)
7. [Testing](#testing)

---

## Code of Conduct

### Our Pledge

We are committed to providing a welcoming and inspiring community for all.

### Standards

**Positive Behavior**:
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Gracefully accepting constructive criticism
- Focusing on what is best for the community
- Showing empathy towards other community members

**Unacceptable Behavior**:
- Trolling, insulting/derogatory comments, personal attacks
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

---

## How to Contribute

### Reporting Bugs

**Before submitting a bug report**:
1. Check existing issues
2. Verify the bug with latest version
3. Collect relevant information

**Bug Report Should Include**:
- Clear, descriptive title
- Steps to reproduce
- Expected behavior
- Actual behavior
- Screenshots (if applicable)
- Environment details (OS, versions, etc.)

### Suggesting Enhancements

**Enhancement Suggestions Should**:
- Use clear, descriptive title
- Provide detailed description
- Explain current vs. proposed behavior
- Include examples or mockups
- Explain why this would be useful

### Pull Requests

**Good Pull Requests**:
- Solve a single problem
- Follow existing code style
- Include tests (if applicable)
- Update documentation
- Have clear commit messages

---

## Development Setup

### Prerequisites

- Git
- For iOS contributions: macOS, Xcode 15+
- For documentation: Markdown editor
- For scripts: Bash shell

### Getting Started

```bash
# Fork and clone
git clone https://github.com/yourusername/claude-dev-workflow.git
cd claude-dev-workflow

# Create branch
git checkout -b feature/your-feature-name

# Make changes
# ...

# Test changes
./scripts/deploy-ios-project.sh "TestApp" "/tmp/test"

# Commit
git commit -am "Add feature: description"

# Push
git push origin feature/your-feature-name

# Create Pull Request on GitHub
```

---

## Contribution Types

### 📚 Documentation

**Improvements Needed**:
- Fixing typos or unclear explanations
- Adding examples
- Improving organization
- Translating to other languages

**Documentation Style**:
- Clear, concise language
- Examples for complex concepts
- Consistent formatting
- Links to related docs

### 🔧 Deployment Scripts

**Android Script** (Priority)
- Similar structure to iOS script
- Android Studio project setup
- Gradle configuration
- Material Design 3 templates

**Web Scripts** (Next Priority)
- React/Vue/Angular variants
- Package.json setup
- TypeScript configuration
- Build tool setup

**Script Requirements**:
- Comprehensive error handling
- Clear user feedback
- Color-coded output
- Detailed comments
- Works on macOS/Linux

### 📝 Templates

**New Templates**:
- Android project structure
- Web application structures
- Backend service structures

**Template Requirements**:
- Complete directory structure
- Starter files
- Configuration examples
- README template

### 🎯 Example Projects

**Example Requirements**:
- Complete, working project
- Follows workflow completely
- All tracking files included
- Screenshot evidence
- Documented decisions
- Lessons learned

### 🐛 Bug Fixes

**Bug Fix Guidelines**:
- Identify root cause
- Add test to prevent regression
- Update documentation if needed
- Explain fix in PR description

---

## Submission Guidelines

### Commit Messages

**Format**:
```
Type: Short description (50 chars max)

Detailed description of what and why.
Reference issue numbers.

Fixes #123
```

**Types**:
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `style:` Formatting
- `refactor:` Code restructure
- `test:` Tests
- `chore:` Maintenance

**Examples**:
```
feat: Add Android deployment script

- Creates project structure
- Copies workflow files
- Initializes Gradle project
- Adds Material Design 3 templates

Closes #45
```

### Pull Request Process

1. **Update Documentation**
   - README if adding features
   - Relevant guides
   - CHANGELOG.md

2. **Test Thoroughly**
   - Test deployment scripts
   - Verify documentation accuracy
   - Check all links work

3. **Describe Changes**
   - What changed
   - Why it changed
   - How to test
   - Screenshots if UI changes

4. **Request Review**
   - Tag relevant maintainers
   - Respond to feedback
   - Make requested changes

5. **After Merge**
   - Delete your branch
   - Close related issues

---

## Style Guidelines

### Documentation Style

**Markdown**:
- Use ATX-style headers (`#` not `===`)
- Code blocks with language tags
- Tables for structured data
- Emoji for visual markers (sparingly)

**Writing**:
- Active voice
- Clear, concise language
- Examples for complex topics
- Consistent terminology

### Code Style

**Bash Scripts**:
```bash
#!/bin/bash

# Clear, descriptive comments
# Fail fast with set -e

set -e

# Color codes at top
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# Functions for common tasks
print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Validate inputs
if [ -z "$VAR" ]; then
    echo "Error: VAR required"
    exit 1
fi
```

**Swift** (for templates):
- Follow iOS development guidelines in docs
- SwiftUI + SwiftData patterns
- @Observable for state
- Async/await for concurrency

---

## Testing

### Testing Deployment Scripts

**iOS Script**:
```bash
# Test in temporary directory
./scripts/deploy-ios-project.sh "TestApp" "/tmp"

# Verify:
# - Directory structure correct
# - Files created
# - Git initialized
# - Documentation copied

# Clean up
rm -rf /tmp/TestApp
```

### Testing Documentation

**Checklist**:
- [ ] All links work
- [ ] Code examples valid
- [ ] Formatting correct
- [ ] Spelling/grammar checked
- [ ] Clear and understandable

---

## Areas Needing Contribution

### High Priority

1. **Android Deployment Script**
   - Similar to iOS script
   - Creates Android project structure
   - Copies workflow files

2. **Web Application Scripts**
   - React variant
   - Vue variant
   - Next.js variant

3. **Example Projects**
   - iOS task app
   - Android task app
   - Web task app

### Medium Priority

4. **Documentation Improvements**
   - More examples
   - Better organization
   - Troubleshooting guides

5. **Template Enhancements**
   - More starter files
   - Configuration examples
   - Best practices

### Low Priority

6. **CI/CD Integration**
   - GitHub Actions workflows
   - Automated testing
   - Deployment automation

7. **Tooling**
   - CLI tool for workflows
   - IDE integrations
   - Automation scripts

---

## Questions?

- Open an issue with `question` label
- Start a discussion on GitHub
- Review existing documentation

---

## Recognition

Contributors will be:
- Listed in README
- Mentioned in CHANGELOG
- Credited in relevant documentation

---

Thank you for contributing to Claude Dev Workflow! 🎉
