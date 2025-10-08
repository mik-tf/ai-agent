# AI-Agent Examples

This directory contains example projects demonstrating the AI agent loop technique with Qwen.

## Available Examples

### 1. React to Vue Conversion
- **Directory**: `react-to-vue/`
- **Description**: Converts React functional components with hooks to Vue 3 Composition API components
- **Source**: React components in JSX format
- **Target**: Vue Single File Components (SFC) with Composition API

### 2. Python to TypeScript Conversion
- **Directory**: `python-to-ts/`
- **Description**: Converts Python modules with type hints to TypeScript modules
- **Source**: Python code with typing
- **Target**: TypeScript code with equivalent typing

## Running Examples

To run any example with the AI agent loop technique:

1. Navigate to the example directory:
   ```bash
   cd examples/react-to-vue
   ```

2. Create the target directory if it doesn't exist:
   ```bash
   mkdir -p target
   ```

3. Prepare your prompt file (there's already a sample):
   ```bash
   # The prompt.md file already exists with conversion instructions
   ```

4. Run this AI agent loop:
   ```bash
   # From the main repository directory
   ../agent-loop.sh
   ```

## Structure

Each example follows this structure:
- `source/` - The original codebase to be converted
- `target/` - The destination for the converted code
- `prompt.md` - Specific instructions for the conversion
- `README.md` - Description of the example

## Creating Your Own Example

To create a new example:

1. Create a new directory under examples/
2. Add your source code to a `source/` subdirectory
3. Create an empty `target/` subdirectory
4. Write a specific `prompt.md` with conversion instructions
5. Test with this AI agent loop scripts