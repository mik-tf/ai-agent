# AI-Agent Implementation Guide

## How Qwen Works with the AI Agent Loop Technique

The Qwen implementation of the AI agent loop technique follows the same basic principle as other coding agents: run an infinite loop that feeds a prompt to the agent and allows it to work on a codebase. However, there are specific considerations for using Qwen in this manner.

## Qwen-Specific Features for AI Agent

### Context Window Management
Qwen models have large context windows that allow them to understand entire codebases or large portions of them. When using the AI agent loop technique:
- Ensure your prompt includes relevant file context
- Periodically refresh the agent's understanding by including recent changes
- Use the `.agent/` directory to store state and context that persists across loop iterations

### Qwen's Code Understanding
Qwen excels at:
- Understanding complex code structures
- Maintaining code consistency across large refactors
- Following established patterns in codebases
- Handling multi-file changes coherently

## Qwen Setup for AI Agent Loop Technique

### Installation

First, ensure you have the Qwen CLI installed:

```bash
npm install -g @qwen-code/qwen-code@latest
qwen --version
```

### Authentication
Configure your Qwen credentials:

```bash
qwen login
```

## Configuration Files

### .qwen/config.json
Create a configuration file to customize Qwen's behavior:

```json
{
  "model": "qwen-max",
  "temperature": 0.2,
  "max_tokens": 4000,
  "context_window": 32000
}
```

### .qwenignore
Use this to specify files that should not be modified by this AI agent process:

```
node_modules/
.git/
dist/
build/
*.log
```

## Qwen-Specific Scripts

The basic AI agent loop for Qwen would be:

```bash
while :; do cat prompt.md | qwen; done
```

However, for more controlled execution, you may want to add rate limiting or error handling:

```bash
while :; do
  cat prompt.md | qwen
  sleep 5  # Add delay to respect API limits
  git add .
  git commit -m "Agent: Automated update" || echo "No changes to commit"
done
```

## Best Practices for AI-Agent

### Prompts for Qwen
- Be explicit about the current state of the project
- Mention specific files that have been modified recently
- Include context about the goal and current progress
- Use clear, structured language that Qwen can parse effectively

### Example Prompt Structure for Qwen
```
Current state: [describe current progress]

Task: [clear description of what to do next]

Files modified in last iteration:
- file1.ts: [summary of changes]
- file2.ts: [summary of changes]

Next steps:
1. [specific instruction 1]
2. [specific instruction 2]

Remember to:
- Maintain consistency with existing code patterns
- Update tests when modifying functionality
- Keep performance considerations in mind
```

## Monitoring Qwen in AI Agent Mode

Since Qwen can process large contexts, it's especially important to:
- Monitor token usage to manage costs
- Check for drift in the agent's understanding of the codebase
- Periodically verify that the direction aligns with the intended goal

## Troubleshooting AI-Agent

### Common Issues
1. **Context Drift**: If Qwen starts ignoring previous work, include more explicit references to the current state
2. **Token Limits**: For very large codebases, you might need to provide more focused prompts
3. **Rate Limits**: Implement delays between requests to avoid hitting API limits