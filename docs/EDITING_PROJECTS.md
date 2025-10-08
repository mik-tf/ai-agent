# Editing Projects in AI-Agent

## Overview

The `make edit` command allows you to modify existing project configurations without recreating the entire project. This is useful for:

- Refining prompts based on initial results
- Adjusting time constraints as requirements change
- Iterating on project direction
- Course-correcting mid-execution

## Usage

```bash
make edit PROJECT_NAME=my-project
```

## Features

### 1. Auto-Stop Running Projects

If your project is currently running, `edit-project` will:
1. Detect the running process
2. Gracefully stop it
3. Proceed with editing
4. Optionally restart with new configuration

**No manual intervention needed!**

### 2. Flexible Prompt Editing Modes

Choose how you want to modify your prompt:

#### Mode 1: Rewrite Completely
- Paste an entirely new prompt
- Overwrites current `prompt.md`
- Best for: Major direction changes

```bash
Select (1-4): 1
Enter your new prompt (press Ctrl+D when done):
[paste your new prompt]
```

#### Mode 2: Edit in Place
- Opens `prompt.md` in your editor (nano, vim, emacs, etc.)
- Respects `$EDITOR` environment variable
- Best for: Refining existing prompts

```bash
Select (1-4): 2
Opening prompt.md in nano...
# [editor opens, you make changes, save and exit]
```

#### Mode 3: Keep Current Prompt
- Only change time constraint
- Prompt stays exactly as-is
- Best for: Time adjustments only

```bash
Select (1-4): 3
✅ Keeping current prompt
```

### 3. Git Safety Checks

Before editing, the system checks for uncommitted changes:

```
⚠️  Warning: You have uncommitted changes in this project.

 M src/index.html
 M src/styles.css
?? src/js/script.js

Proceed with editing anyway? (y/N): 
```

**Two-step safety:**
1. **Gate 1**: Do you want to proceed with uncommitted changes?
2. **Gate 2**: Auto-commit those changes now?

**Options:**
- **y → y**: Commit changes, then proceed
- **y → n**: Proceed without committing (changes remain uncommitted)
- **n**: Cancel editing, handle git state manually

### 4. Time Constraint Updates

Change time constraints with validation:

```bash
⏱️  Change time constraint? (current: in 20 minute(s) of time)
Examples: 30m, 1h, 2h30m, indefinite
Enter new duration or press ENTER to keep current: 1h

✅ Configuration updated
```

**What happens:**
- `.agent/time_management_instructions.md` is regenerated with new time
- `.agent/time_log.txt` is updated with new start time
- Project version is incremented
- System ready for restart

### 5. Version Tracking

Every edit increments the project version:

**`.agent/time_log.txt`:**
```
Project Start Time: 2025-10-06 22:31:00
Time Constraint: in 1 hour(s) of time
Project Version: 2
Last Edited: 2025-10-06 22:31:00
```

**`.agent/edit_history.log`:**
```
================================================================================
Edit Version: 2
Edit Date: 2025-10-06 22:31:00
Previous Time Constraint: in 20 minute(s) of time
New Time Constraint: in 1 hour(s) of time
Prompt Modified: Yes
Editor Mode: Edit in place
Notes: Project configuration updated
================================================================================
```

**Benefits:**
- Complete audit trail
- Track project evolution
- Debug configuration issues
- Document iteration process

### 6. Automatic File Updates

When you edit a project, the system automatically:

✅ Regenerates `.agent/time_management_instructions.md` (if time set)
✅ Updates `.agent/time_log.txt` with new version & start time
✅ Logs edit to `.agent/edit_history.log`
✅ Commits changes to git
✅ Clears `.agent/last_iteration_start.txt` (fresh start)

## Complete Workflow Example

```bash
# Start with running project
make edit PROJECT_NAME=spherical-music

# Output:
🔧 Editing project: spherical-music
==================================

Current configuration:
  Status: Running (PID: 103027)
  Time constraint: in 20 minute(s) of time
  Version: 1
  
Current prompt:
─────────────────────────────────
create a complete modern UX website on the music of the spheres...
─────────────────────────────────

⚠️  Warning: You have uncommitted changes in this project.

 M src/index.html
 M src/styles.css

Proceed with editing anyway? (y/N): y
Auto-commit these changes before editing? (y/N): y
✅ Changes committed

🛑 Project is running. Stopping it now...
✅ Project stopped

📝 How would you like to edit the prompt?
1) Rewrite completely (paste new prompt, overwrites current)
2) Edit in place (opens prompt.md in your editor)
3) Keep current prompt (only change time constraint)
4) Cancel

Select (1-4): 2

Opening prompt.md in nano...
# [You edit in nano, save, exit]
✅ Prompt edited

⏱️  Change time constraint? (current: in 20 minute(s) of time)
Examples: 30m, 1h, 2h30m, indefinite
Enter new duration or press ENTER to keep current: 1h

✅ Configuration updated (Version 2):
  - Prompt: Modified (Edit in place)
  - Time constraint: in 20 minute(s) of time → in 1 hour(s) of time
  - Edit logged in .agent/edit_history.log

📝 Committing configuration changes...
[main abc1234] Project edit v2: Updated configuration
 3 files changed, 25 insertions(+), 10 deletions(-)

🚀 Start project with new configuration? (y/N): y

Starting AI agent...
✅ AI agent loop started with PID: 105234
📊 Project now at Version 2
📝 Check .agent/edit_history.log for full history
```

## Use Cases

### Iterative Prompt Refinement

**Scenario:** AI isn't producing desired results

```bash
# Edit prompt to add more specific instructions
make edit PROJECT_NAME=my-project
# Mode: Edit in place
# Add: "Focus on performance optimization, use lazy loading"
# Restart with same time: press ENTER
```

### Time Extension

**Scenario:** Need more time to complete task

```bash
# Extend time constraint
make edit PROJECT_NAME=my-project
# Mode: Keep current prompt
# New time: 2h (was 1h)
# Restart immediately
```

### Complete Pivot

**Scenario:** Change project direction entirely

```bash
# Rewrite prompt completely
make edit PROJECT_NAME=my-project
# Mode: Rewrite completely
# New prompt: [paste completely different requirements]
# New time: indefinite
# Restart with new direction
```

### Quick Fixes

**Scenario:** Typo or small correction in prompt

```bash
# Quick edit in editor
make edit PROJECT_NAME=my-project
# Mode: Edit in place
# Fix typo: "React" → "Vue"
# Keep same time: press ENTER
```

## Files Modified by Edit

```
project/
├── prompt.md                               # Modified by user
├── .agent/
│   ├── time_management_instructions.md    # Regenerated if time set
│   ├── time_log.txt                       # Updated: version, start time
│   ├── edit_history.log                   # Appended: edit details
│   ├── last_iteration_start.txt           # Cleared (if exists)
│   └── TODO.md                            # Preserved
├── .git/                                  # New commit created
└── [user files preserved]                 # No changes to your code
```

## Best Practices

### 1. Commit Before Major Edits

```bash
# Manually commit work in progress
cd ../my-project
git add .
git commit -m "WIP: Feature X partially implemented"

# Then edit
cd ../ai-agent
make edit PROJECT_NAME=my-project
```

### 2. Check Edit History

```bash
# Review project evolution
cat ../my-project/.agent/edit_history.log

# See current version
cat ../my-project/.agent/time_log.txt
```

### 3. Test Prompt Changes

```bash
# Edit with short time for testing
make edit PROJECT_NAME=my-project
# New time: 10m (test run)

# If successful, edit again for full run
make edit PROJECT_NAME=my-project
# New time: 2h (production run)
```

### 4. Keep Indefinite for Exploration

```bash
# Remove time pressure for open-ended work
make edit PROJECT_NAME=my-project
# New time: indefinite
# Stop manually when satisfied
```

## Troubleshooting

### Editor Not Opening

**Problem:** `edit-project` says "opening nano" but nothing happens

**Solution:**
```bash
# Set your preferred editor
export EDITOR=vim  # or nano, emacs, code, etc.

# Or set permanently in ~/.bashrc
echo 'export EDITOR=vim' >> ~/.bashrc
```

### Can't Find Project

**Problem:** `Project 'my-project' not found`

**Solution:**
```bash
# List available projects
ls ../ | grep -v ai-agent

# Use exact project name
make edit PROJECT_NAME=exact-name-here
```

### Time Constraint Not Applied

**Problem:** Project runs indefinitely despite setting time

**Solution:**
```bash
# Verify time management file exists
ls -la ../my-project/.agent/time_management_instructions.md

# Check time_log.txt
cat ../my-project/.agent/time_log.txt

# If files missing, edit again:
make edit PROJECT_NAME=my-project
# Set time constraint properly
```

### Git Conflicts After Edit

**Problem:** Git complains about conflicts

**Solution:**
```bash
cd ../my-project
git status

# Resolve conflicts manually
git add resolved-file.txt
git commit -m "Resolved conflicts after edit"

# Continue with agent
cd ../ai-agent
make run PROJECT_NAME=my-project
```

## Comparison: Edit vs Recreate

| Aspect | Edit Project | Recreate Project |
|--------|--------------|------------------|
| Preserves code | ✅ Yes | ❌ No (must backup) |
| Preserves git history | ✅ Yes | ❌ Starts fresh |
| Version tracking | ✅ Yes | ❌ Always v1 |
| Speed | ✅ Fast | ⚠️ Slower |
| Complexity | ⚠️ Medium | ✅ Simple |
| When to use | Refinement | Complete restart |

## See Also

- [TIME_MANAGEMENT.md](TIME_MANAGEMENT.md) - How time constraints work
- [USAGE.md](USAGE.md) - General usage patterns
- [TROUBLESHOOTING_BEST_PRACTICES.md](TROUBLESHOOTING_BEST_PRACTICES.md) - Common issues
