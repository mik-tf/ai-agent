# Example Prompts for AI Agent Loop Technique

## React to Vue Porting Example

File: `examples/react-to-vue/prompt.md`

```
Your job is to port the React components in the source/ directory to Vue 3 Composition API components in the target/ directory.

You have access to the current React components as well as the target Vue directory.

Convert:
- JSX syntax to Vue SFC format (.vue files)
- React useState to Vue ref/reactive
- React functional components to Vue SFCs with Composition API
- React event handling to Vue event handling (@click, etc.)
- Maintain the same functionality and props interface
- Keep the same styling approach (CSS classes, etc.)

For each React component in source/:
1. Create a corresponding .vue file in target/
2. Convert the logic to Vue Composition API
3. Update the template syntax
4. Maintain the same exported API
5. Add appropriate TypeScript typing if present

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.
```

## Python to TypeScript Conversion Example

File: `examples/python-to-ts/prompt.md`

```
Your job is to port the Python modules in the source/ directory to TypeScript modules in the target/ directory.

You have access to the current Python code as well as the target TypeScript directory.

Convert:
- Python classes to TypeScript classes
- Python typing to TypeScript typing
- Python error handling to TypeScript error handling
- Python docstrings to TypeScript JSDoc comments
- Python modules to TypeScript modules
- Maintain the same functionality and API

For each Python file in source/:
1. Create a corresponding .ts file in target/
2. Convert the logic to TypeScript syntax
3. Add proper TypeScript typing
4. Maintain the same exported API
5. Convert error handling appropriately

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work. Store long term plans and todo lists there.
```