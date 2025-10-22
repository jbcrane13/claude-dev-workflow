# Architecture Decision Records (ADR)

**Purpose**: Document significant architectural and design decisions with their context, alternatives, and rationale.

**Last Updated**: 2025-01-20

---

## What is an ADR?

An Architecture Decision Record captures an important architectural decision made along with its context and consequences. ADRs help:

- **Preserve knowledge** across sessions and agent handoffs
- **Explain the "why"** behind architectural choices
- **Track decision evolution** as projects mature
- **Enable better decisions** through systematic evaluation (using `challenge`, `consensus`, `thinkdeep`)
- **Maintain context** via continuation IDs for future reference

---

## When to Create an ADR

Create an ADR for decisions that:

✅ **Affect system architecture**
- State management approach
- Data persistence strategy
- API design patterns
- Authentication/authorization approach

✅ **Involve significant trade-offs**
- Performance vs. simplicity
- Flexibility vs. constraints
- Build time vs. runtime performance

✅ **Have long-term impact**
- Technology/framework selection
- Dependency choices
- Platform-specific implementation strategies

✅ **Are difficult to reverse**
- Database schema designs
- Core abstractions
- Module boundaries

❌ **Don't create ADRs for**:
- Minor implementation details
- Temporary workarounds
- Obvious choices with no alternatives
- Decisions easily changed later

---

## ADR Workflow

### 1. Identify Decision Need

```markdown
Example triggers:
- "Should we use SwiftData or Core Data?"
- "How should we handle offline data sync?"
- "Which navigation pattern for iOS app?"
- "REST API vs GraphQL for backend?"
```

### 2. Use Zen Tools for Analysis

**Recommended Tool Chain**:

```yaml
Step 1: Challenge the problem
- Tool: `challenge`
- Purpose: Question assumptions, identify hidden constraints
- Save output for ADR

Step 2: Multi-model analysis
- Tool: `consensus`
- Models: 2-3 models with different stances (for/against/neutral)
- Purpose: Explore perspectives, identify trade-offs
- Save continuation_id

Step 3: Deep investigation (if complex)
- Tool: `thinkdeep`
- Purpose: Systematic exploration of implications
- Reuse continuation_id from consensus
- Save continuation_id

Step 4: Document decision
- Copy template.md to new ADR
- Number sequentially: ADR-001, ADR-002, etc.
- Fill in all sections
- Include continuation IDs for future context
```

### 3. Document Decision

**Naming Convention**:
```
ADR-[NNN]-[short-descriptive-title].md

Examples:
ADR-001-swiftui-state-management.md
ADR-002-offline-data-sync-strategy.md
ADR-003-ios-navigation-pattern.md
ADR-004-backend-api-architecture.md
```

**Status Progression**:
```
Proposed → (evaluation) → Accepted/Rejected
Accepted → (time passes) → Superseded (if replaced by newer ADR)
```

### 4. Reference in Code

**Best Practice**: Link ADR in relevant code:

```swift
// MARK: - State Management
// Architecture: See ADR-001-swiftui-state-management.md
// Uses @Observable pattern per team decision

@Observable
class AppState {
    // implementation
}
```

---

## Platform-Specific Considerations

### iOS Development
**Common ADR Topics**:
- SwiftUI vs UIKit (for new features)
- SwiftData vs Core Data vs Realm
- State management (@Observable vs TCA vs Redux)
- Navigation (NavigationStack vs NavigationView)
- Concurrency patterns (async/await best practices)

### Android Development
**Common ADR Topics**:
- Jetpack Compose vs XML layouts
- Room vs SQLite vs Realm
- ViewModel patterns
- Navigation component approach
- Dependency injection (Hilt vs Koin)

### Web Development
**Common ADR Topics**:
- Framework choice (React vs Vue vs Svelte)
- State management (Redux vs Context vs Zustand)
- Routing approach
- API layer architecture
- Build tool selection

### Backend Development
**Common ADR Topics**:
- API design (REST vs GraphQL vs gRPC)
- Database choice and schema design
- Authentication/authorization approach
- Microservices vs monolith
- Message queue selection

---

## ADR Index

**Current ADRs**: 0

| Number | Title | Status | Date | Platform | Tools Used |
|--------|-------|--------|------|----------|------------|
| - | No ADRs yet | - | - | - | - |

**Update this table when creating new ADRs**

---

## Examples by Project Type

### Example: iOS App ADR

```markdown
# ADR-001: SwiftUI State Management with @Observable

**Status**: Accepted
**Date**: 2025-01-15
**Platform**: iOS 17+
**Continuation ID**: consensus_abc123

## Context
Need to choose state management approach for new iOS app...

## Decision
Use @Observable (Observation framework) for all state management...

## Alternatives Considered
1. Traditional ObservableObject with @Published (rejected - verbose)
2. TCA (The Composable Architecture) (rejected - steep learning curve)
3. Redux pattern (rejected - boilerplate overhead)

## Validation Process
- Consensus: 3 models (2 for @Observable, 1 neutral)
- Challenge: Addressed concerns about iOS 17 requirement
- continuation_id: consensus_abc123

## Consequences
Positive: Type-safe, less boilerplate, modern Swift
Negative: Requires iOS 17+, team learning curve
```

### Example: Web App ADR

```markdown
# ADR-002: React with TypeScript for Frontend

**Status**: Accepted
**Date**: 2025-01-16
**Platform**: Web (Chrome, Safari, Firefox)
**Continuation ID**: consensus_def456

## Context
Need to select frontend framework for new web application...

## Decision
React 18+ with TypeScript and Vite build tool...

## Alternatives Considered
1. Vue 3 (rejected - team unfamiliar)
2. Svelte (rejected - smaller ecosystem)
3. Angular (rejected - too heavy for project scope)
```

---

## Maintenance

### Regular Reviews

**When to Review ADRs**:
- Start of each new phase
- When related technology changes (new iOS version, framework update)
- When assumptions change
- When considering similar decisions

**Review Process**:
1. Check if decision is still valid
2. Update status if superseded
3. Add notes about changed context
4. Create new ADR if approach needs updating

### Archiving Old ADRs

**Don't delete ADRs** - they're historical record

If superseded:
1. Update status to "Superseded"
2. Link to new ADR that replaces it
3. Add note explaining why superseded
4. Keep in repository for history

---

## Tool Integration

### Continuation ID Management

**Why Save Continuation IDs**:
- Resume analysis in future sessions
- Provide context to new agents
- Build on previous reasoning
- Trace decision lineage

**Where to Store**:
- In ADR document (Validation Process section)
- In `tracking/knowledge-base/` for easy lookup
- In session handoff notes

### Recommended Tool Sequence

**For Major Decisions**:
```
1. challenge → question assumptions
2. consensus → multi-model analysis (save continuation_id)
3. thinkdeep → deep investigation (reuse continuation_id)
4. Document → create ADR with all continuation IDs
```

**For Quick Decisions**:
```
1. challenge → validate approach
2. Document → create simple ADR
```

---

## Related Documentation

- [Zen Tools Guide](../zen-tools-guide.md) - How to use consensus, challenge, thinkdeep
- [Session Management](../session-management.md) - Context preservation
- [Quality Gates](../quality-gates.md) - When ADRs are required

---

**Last Updated**: 2025-01-20
**Version**: 1.0
**Status**: ACTIVE - Use for all significant architectural decisions
