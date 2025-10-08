# Sample Prompt Templates

This directory contains sample prompt templates for different use cases of the AI agent loop technique with Qwen.

## 1. Codebase Porting (React to Vue)

File: `prompt-react-to-vue.md`

```
Your job is to port the existing React codebase to Vue.js in the target directory and maintain the repository.

You have access to the current React repository as well as the Vue destination repository.

Make a commit and push your changes after every single file edit.

Use the target-repo/.agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Convert:
- JSX components to Vue SFCs
- React hooks to Vue Composition API
- React state management to Vue reactivity
- React router to Vue Router
- Keep the same functionality and UI
- Update package dependencies accordingly

The original project was mostly tested by manually running the code. When porting, you will need to write end to end and unit tests for the Vue project. But make sure to spend most of your time on the actual porting, not on the testing. A good heuristic is to spend 80% of your time on the actual porting, and 20% on the testing.
```

## 2. Language Migration (Python to TypeScript)

File: `prompt-python-to-ts.md`

```
Your job is to port the Python codebase to TypeScript and maintain the repository.

You have access to the current Python repository as well as the TypeScript destination repository.

Make a commit and push your changes after every single file edit.

Use the ts-repo/.agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Convert:
- Python syntax to TypeScript syntax
- Dynamic typing to static typing
- Python modules to TypeScript modules
- Python-specific libraries to TypeScript equivalents
- Async/await patterns from Python to TypeScript
- Keep the same functionality and API contracts

The original project was mostly tested by manually running the code. When porting, you will need to write end to end and unit tests for the TypeScript project. But make sure to spend most of your time on the actual porting, not on the testing. A good heuristic is to spend 80% of your time on the actual porting, and 20% on the testing.
```

## 3. API Implementation from Specification

File: `prompt-spec-to-impl.md`

```
Your job is to implement a complete API server based on the provided API specification.

You have access to the specification document in the spec/ directory.

Make a commit and push your changes after every single file edit.

Use the api-server/.agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Implement:
- All endpoints specified in the API documentation
- Proper request/response validation
- Error handling for all endpoints
- Authentication if specified
- Database models if specified
- Logging and monitoring

The original specification is minimal. You will need to implement proper testing for the API. But make sure to spend most of your time on the actual implementation, not on the testing. A good heuristic is to spend 80% of your time on the actual implementation, and 20% on testing.
```

## 4. Repository Maintenance

File: `prompt-maintenance.md`

```
Your job is to maintain this codebase by applying updates, fixes, and improvements.

Current status: [describe current state]

Tasks to work on:
- Update dependencies to latest secure versions
- Apply security patches
- Improve performance where possible
- Update documentation
- Fix any identified issues

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Focus on:
- Security updates first
- Backward compatibility
- Performance improvements
- Code quality improvements
- Documentation updates
```

## 5. Feature Addition

File: `prompt-feature-addition.md`

```
Your job is to add the new feature X to this existing codebase.

Requirements:
- The feature should integrate with existing code seamlessly
- Follow existing code patterns and architecture
- Maintain backward compatibility
- Add proper tests for the new functionality
- Update documentation as needed

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Implementation plan:
1. Create necessary files/models
2. Add core functionality
3. Integrate with existing UI/API
4. Add tests
5. Update documentation
```

## 6. Bug Fixing

File: `prompt-bug-fix.md`

```
Your job is to identify and fix bugs in this codebase based on reported issues.

Current issues to address:
- Issue #123: [description]
- Issue #456: [description]
- Issue #789: [description]

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Fix methodology:
1. Reproduce the issue if possible
2. Identify the root cause
3. Implement the fix
4. Add a test to prevent regression
5. Verify the fix works
6. Move to the next issue
```

## 7. Code Modernization

File: `prompt-modernization.md`

```
Your job is to modernize this legacy codebase by updating it to current best practices.

Areas for improvement:
- Update deprecated features
- Improve performance
- Modernize syntax and patterns
- Update dependencies
- Improve test coverage
- Update documentation

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Modernization approach:
1. Identify deprecated features and patterns
2. Update dependencies incrementally
3. Refactor code in small, testable chunks
4. Add tests for refactored code
5. Update documentation
6. Verify all existing functionality still works
```

## 8. General Purpose Template

File: `prompt-general.md`

```
Your job is to work on this codebase and maintain the repository.

Current status: [describe current state]
Current task: [describe what needs to be done]

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.

Guidelines:
- Follow existing code patterns and conventions
- Maintain code quality and test coverage
- Keep functionality intact unless explicitly asked to change it
- Add tests for new functionality
- Update documentation as needed
- Make incremental, focused changes
```