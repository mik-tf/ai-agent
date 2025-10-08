# Troubleshooting and Best Practices for AI-Agent

## Troubleshooting

### Common Issues and Solutions

#### 1. Qwen Not Found Error
**Problem**: `command not found: qwen`
**Solution**: 
- Ensure Qwen CLI is installed: `npm install -g @qwen-code/qwen-code@latest`
- Check your PATH: `echo $PATH`
- Restart your terminal after installation

#### 2. Rate Limiting Issues
**Problem**: API requests being rejected due to rate limits
**Solution**:
- Increase the sleep delay between iterations: `SLEEP_DELAY=30`
- Check your Qwen account limits in your dashboard
- Implement exponential backoff in your script if needed

#### 3. Agent Getting Stuck in Loops
**Problem**: Agent repeatedly tries the same failed approach
**Solution**:
- Update the prompt to guide the agent away from the problematic approach
- Add specific instructions about what not to do
- Use the `.agent/TODO.md` file to track progress and prevent repetition

#### 4. Memory/CPU Issues
**Problem**: High resource usage during long runs
**Solution**:
- Monitor resource usage: `htop` or `top`
- Add longer sleep delays: `SLEEP_DELAY=60`
- Consider running on a machine with more resources
- Periodically backup and reset the working directory

#### 5. Git Conflicts
**Problem**: Git errors during commit operations
**Solution**:
- Ensure proper git setup: `git config user.name` and `git config user.email`
- Check for uncommitted changes before starting
- Add problematic files to `.gitignore` or `.qwenignore`

#### 6. Prompt Not Working Effectively
**Problem**: Agent doesn't follow instructions properly
**Solution**:
- Simplify the prompt (remember: "less is more")
- Add specific examples of desired output
- Be explicit about current state and next steps
- Use numbered lists for complex tasks

### Monitoring Tools

#### Log Monitoring
```bash
# Watch the output in real-time
tail -f agent-output.log

# Check for errors
grep -i error agent-errors.log

# Count total iterations
grep "Starting iteration" agent-output.log | wc -l
```

#### Git Monitoring
```bash
# Check recent commits
git log --oneline -10

# See current changes
git status
git diff

# Check specific file changes
git diff HEAD~1 path/to/file
```

#### System Monitoring
```bash
# Monitor resource usage during run
htop
# Or in a separate terminal while running the AI agent
watch -n 2 'ps aux | grep qwen | head -10'
```

## Best Practices

### 1. Start Simple
- Begin with simple, well-defined tasks
- Use minimal prompts initially (50-100 words)
- Gradually increase complexity as you understand the agent's behavior
- Test with small codebases first

### 2. Effective Prompting
- Be specific about current state and desired outcome
- Include examples when possible
- Use clear, structured language
- Mention what has been done in previous iterations
- Specify file names and exact changes when needed

### 3. Git Workflow
- Commit frequently to track agent's progress
- Use meaningful commit messages
- Create branches for experimental work
- Backup your repository regularly
- Use `.gitignore` to exclude temporary files

### 4. Resource Management
- Monitor API usage and costs
- Set reasonable sleep delays (10-60 seconds)
- Limit the number of iterations if needed
- Use appropriate Qwen models (not always the largest)

### 5. Progress Tracking
- Maintain a `.agent/TODO.md` file for persistent tracking
- Regularly review the agent's progress
- Be prepared to intervene manually if going off track
- Set up notifications for major milestones

### 6. Error Handling
- Always redirect stderr to a log file
- Check return codes from commands
- Implement graceful degradation
- Have a manual override plan

## Advanced Techniques

### 1. Hybrid Approach
Combine automated and manual work:
- Use the AI agent for bulk conversion
- Manually review and refine critical components
- Use the AI agent for repetitive tasks, manual for complex logic

### 2. Parallel Processing
- Run multiple AI agent instances on different parts of codebase
- Use separate branches for different conversion tasks
- Coordinate with proper merge strategies

### 3. Quality Assurance
- Set up automated tests to verify converted code
- Have manual check points at major milestones
- Verify performance requirements are met
- Test across different environments

## Safety Considerations

### 1. Data Safety
- Regular backups of source repository
- Use version control properly
- Store sensitive information securely
- Monitor what code is being processed

### 2. Cost Management
- Set up billing alerts for API usage
- Monitor token usage during runs
- Use appropriate model sizes for tasks
- Consider stopping conditions to prevent runaway usage

### 3. Security
- Don't process sensitive code without proper security measures
- Use private repositories
- Sanitize any data before processing
- Be careful with file access permissions

## Performance Optimization

### 1. Model Selection
- Use `qwen-turbo` for simple tasks for speed
- Use `qwen-max` for complex reasoning tasks
- Consider the trade-off between speed and accuracy

### 2. Context Management
- Keep prompt sizes reasonable
- Include only necessary file context
- Update context as codebase changes significantly

### 3. Loop Optimization
- Adjust sleep times based on API limits and needs
- Implement early stopping conditions
- Monitor and optimize iteration times