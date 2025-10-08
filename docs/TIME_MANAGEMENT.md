# Time Management in AI-Agent

## Overview

AI-Agent features a **self-checking time management system** that allows you to set time limits for agent runs. The agent automatically monitors elapsed time and stops gracefully when the deadline is reached.

### Architecture: Immutable System Instructions

To prevent the AI from accidentally disabling time management, the system uses **separate immutable instruction files**:

```
Project Structure:
├── prompt.md                                    ← User/AI can freely edit
├── .agent/
│   ├── time_management_instructions.md         ← System file (immutable)
│   ├── time_log.txt                            ← System metadata
│   └── last_iteration_start.txt                ← System metadata
└── ...

At Runtime:
cat .agent/time_management_instructions.md prompt.md | qwen
```

**Why separate files?**
- ✅ **AI cannot accidentally remove time constraints** - Instructions are in `.agent/`, not `prompt.md`
- ✅ **User can edit prompt freely** - No risk of breaking time management
- ✅ **Clean separation** - System instructions vs user content
- ✅ **Gitignored** - `.agent/time_management_instructions.md` not committed to repo

## How It Works

### 1. Time Constraint Setup

When creating a project, you specify a time duration:

```bash
make create PROJECT_NAME=my-project

# Prompts you for duration:
# Examples: 30m, 1h, 2h30m, indefinite
```

The system accepts these formats:
- `30m` or `30min` → 30 minutes
- `1h` or `1hour` → 1 hour
- `2h30m` → 2 hours and 30 minutes
- `indefinite` or `inf` → No time limit

### 2. Time Tracking Files

The system creates and maintains these files in `.agent/`:

**`.agent/time_management_instructions.md`** (Immutable system file)
```markdown
## CRITICAL TIME MANAGEMENT

**Time Constraint**: You have in 30 minute(s) of time to complete this work.

**At the START of EVERY iteration, you MUST:**
[... full instructions ...]
```
- Created during project setup if time constraint specified
- **Prepended to prompt at runtime** by `agent-loop.sh`
- **Not in `prompt.md`** - AI cannot accidentally remove it
- Gitignored - not committed to repository

**`.agent/time_log.txt`**
```
Project Start Time: 2025-10-06 20:10:47
Time Constraint: in 30 minute(s) of time
```

**`.agent/last_iteration_start.txt`**
```
2025-10-06 20:32:15
```
(Updated at the start of each iteration)

### 3. Self-Checking Mechanism

At the **start of every iteration**, the AI agent:

1. **Reads** `.agent/time_log.txt` to get:
   - Project start time
   - Time constraint

2. **Calculates** the deadline:
   - Example: Start 20:10 + 30 minutes = Deadline 20:40

3. **Checks** `.agent/last_iteration_start.txt`:
   - When did the last iteration start?
   - Example: Last iteration started at 20:43

4. **Compares** to deadline:
   - If 20:43 > 20:40 → Time exceeded!

5. **Takes action** if over time:
   - Creates `.agent/STOP` file
   - Writes `.agent/final_summary.md` with completion status
   - Exits gracefully on next loop check

## Example Flow

### Timeline of a 30-Minute Project

```
20:10:00  │ Project created
          │ Start time logged: 20:10:00
          │ Deadline calculated: 20:40:00
          │
20:15:30  │ Iteration 1 starts
          │ ✓ Check: 20:15 < 20:40 → Continue
          │ ... works for ~15 minutes ...
          │
20:32:15  │ Iteration 2 starts  
          │ ✓ Check: 20:32 < 20:40 → Continue
          │ ... works for ~12 minutes ...
          │
20:43:20  │ Iteration 3 starts
          │ ✗ Check: Last iteration (20:32) before deadline,
          │          but NOW (20:43) is after 20:40
          │ → Create .agent/STOP file
          │ → Write final summary
          │ → Loop exits
          │
20:43:25  │ Process terminated gracefully
```

## Key Features

### ✅ Self-Correcting

Even if one iteration takes longer than expected, the next iteration detects the overrun:

```
Scenario: 30-minute limit, iteration takes 35 minutes

20:10 │ Start (deadline: 20:40)
      │
20:10 │ Iteration 1 begins
      │ ... works for 35 minutes ...
20:45 │ Iteration 1 completes (over deadline!)
      │
20:45 │ Iteration 2 begins
      │ ✓ Checks time_log.txt
      │ ✗ Sees: 20:45 > 20:40 deadline
      │ → Creates STOP file
      │ → Exits without continuing work
```

### ✅ Graceful Exit

The agent doesn't abruptly terminate mid-operation. Instead it:
1. Finishes current thought/file edit
2. Commits changes to git
3. Writes a final summary
4. Creates STOP file
5. Exits loop naturally

### ✅ Logged Behavior

All time-related events are logged in `.agent/time_log.txt`:

```
Project Start Time: 2025-10-06 20:10:47
Current Time: 2025-10-06 20:40:00
Time Constraint: in 30 minute(s) of time
Status: Completed on time
Notes: All deliverables created and committed

Maintenance Log:
- 2025-10-06 20:43: Time exceeded, creating STOP signal
```

### ✅ Manual Override

You can always manually stop the agent:

```bash
make stop PROJECT_NAME=my-project
```

This kills the process immediately regardless of time status.

## Prompt Instructions

When you create a project with a time constraint, the prompt includes:

```markdown
## CRITICAL TIME MANAGEMENT

**Time Constraint**: You have in 30 minute(s) of time to complete this work.

**At the START of EVERY iteration, you MUST:**

1. Check `.agent/time_log.txt` for:
   - Project Start Time: [timestamp]
   - Time Constraint: in 30 minute(s) of time

2. Calculate your deadline: Start Time + time constraint

3. Check `.agent/last_iteration_start.txt` - when did your LAST iteration start?

4. **If the last iteration started AFTER the deadline:**
   - You have exceeded your time budget
   - Immediately create the stop signal: `touch .agent/STOP`
   - Write a final summary in `.agent/final_summary.md` of what was completed
   - The loop will exit gracefully
   - DO NOT continue working

5. **If still within deadline:**
   - Note remaining time in your planning
   - Prioritize high-value tasks
   - Continue working efficiently

**This is a hard requirement. Check time at every iteration start.**
```

## Implementation Details

### Shell Script Changes

**`agent-loop.sh`** - Concatenates system instructions with user prompt:
```bash
# Log iteration start time
ITERATION_START=$(date '+%Y-%m-%d %H:%M:%S')
echo "$ITERATION_START" > "$AGENT_DIR/last_iteration_start.txt"

# Prepend time management instructions if they exist
TIME_MGMT_FILE="$AGENT_DIR/time_management_instructions.md"
if [ -f "$TIME_MGMT_FILE" ]; then
    # Concatenate: system instructions + user prompt
    cat "$TIME_MGMT_FILE" "$PROMPT_FILE" | qwen --approval-mode yolo --sandbox false
else
    # No time constraint - just user prompt
    cat "$PROMPT_FILE" | qwen --approval-mode yolo --sandbox false
fi
```

**`create-project.sh`** - Creates separate instruction file:
```bash
# Create immutable time management instructions in .agent/
if [ "$TIME_TEXT" != "indefinite" ]; then
    cat > .agent/time_management_instructions.md << EOF
## CRITICAL TIME MANAGEMENT
[... full instructions ...]
EOF
fi

# User prompt stays clean - no time management mixed in
cat > prompt.md << EOF
Your job is to work on this codebase...
$CUSTOM_PROMPT
EOF

# Create time metadata
cat > .agent/time_log.txt << EOF
Project Start Time: $(date '+%Y-%m-%d %H:%M:%S')
Time Constraint: $TIME_TEXT
EOF
```

### STOP File Detection

**`agent-loop.sh`** (lines 80-83):
```bash
# Check if we should stop (optional stop condition)
if [ -f "$AGENT_DIR/STOP" ]; then
    echo "$(date): Stop signal received, exiting loop" >> "$LOG_FILE"
    break
fi
```

## Troubleshooting

### Agent Doesn't Stop on Time

**Symptom**: Agent continues past deadline

**Possible causes:**
1. Time constraint set to "indefinite"
2. `.agent/time_log.txt` file corrupted or missing
3. `.agent/time_management_instructions.md` was deleted
4. Loop script not concatenating files properly

**Solution:**
```bash
# Check if time management file exists
ls -la .agent/time_management_instructions.md

# Check time constraint
cat .agent/time_log.txt

# Verify loop is running correctly
tail -f agent-output.log

# Manually create STOP file
touch .agent/STOP

# Or kill the process
make stop PROJECT_NAME=my-project
```

### Time Management Instructions Disappeared

**Symptom**: `.agent/time_management_instructions.md` is missing

**Cause**: File was accidentally deleted or project was created with "indefinite" time

**Solution:**
```bash
# Recreate the file manually
cat > .agent/time_management_instructions.md << 'EOF'
## CRITICAL TIME MANAGEMENT

**Time Constraint**: You have in 30 minute(s) of time to complete this work.
[... copy full instructions from docs/TIME_MANAGEMENT.md ...]
EOF

# Or use indefinite mode and stop manually
make stop PROJECT_NAME=my-project
```

### First Iteration Takes Longer Than Total Time

**Symptom**: Set 30m limit, but first iteration takes 45m

**This is expected behavior:**
- First iteration completes fully (45m)
- Second iteration starts, checks time, sees deadline passed
- Agent stops at start of iteration 2

**Workaround for very long iterations:**
- Set longer time limits (e.g., 2h instead of 30m)
- Use `make stop` to manually stop mid-iteration
- Monitor with `make monitor` and kill if needed

### Time Zone Issues

**Symptom**: Times don't match system time

**Solution:**
The system uses local system time from `date` command. Ensure:
```bash
# Check system time
date '+%Y-%m-%d %H:%M:%S'

# Check time in time_log.txt matches
cat .agent/time_log.txt
```

## Best Practices

### 1. Choose Appropriate Time Limits

- **Quick tasks**: 30m - 1h (market research, simple scripts)
- **Medium tasks**: 2h - 4h (feature implementation, code porting)
- **Long tasks**: 8h+ or indefinite (large refactors, complex projects)

### 2. Monitor Progress

```bash
# Check if agent is still running
make list

# View recent activity
tail -f ../my-project/agent-output.log

# Check time status
cat ../my-project/.agent/time_log.txt
```

### 3. Plan for Overruns

Add 20-30% buffer to your time estimate:
- Expect 30m of work? Set 40m limit
- Expect 2h of work? Set 2h30m limit

This accounts for:
- Iteration overhead (git commits, API calls)
- Unexpected complexity
- Agent "getting stuck" on hard problems

### 4. Use Indefinite for Exploration

For open-ended tasks where quality > speed:
```bash
# No time pressure
make create PROJECT_NAME=exploration
# Select: indefinite
```

Then manually stop when satisfied with results.

## See Also

- [USAGE.md](USAGE.md) - General usage and examples
- [TROUBLESHOOTING_BEST_PRACTICES.md](TROUBLESHOOTING_BEST_PRACTICES.md) - Common issues
- [QWEN_IMPLEMENTATION.md](QWEN_IMPLEMENTATION.md) - Qwen-specific details
