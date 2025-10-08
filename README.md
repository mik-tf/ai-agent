# AI-Agent: AI Coding Technique with Open Source Tools

## Table of Contents
- [AI-Agent: AI Coding Technique with Open Source Tools](#ai-agent-ai-coding-technique-with-open-source-tools)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Key Features](#key-features)
  - [Universal Project Automation Framework](#universal-project-automation-framework)
    - [Broad Application Areas](#broad-application-areas)
    - [🚀 Universal Workflow Features](#-universal-workflow-features)
  - [Installation](#installation)
  - [Quick Start](#quick-start)
    - [🚀 One-Command Project Setup (Recommended)](#-one-command-project-setup-recommended)
    - [📋 Default Prompt Structure](#-default-prompt-structure)
    - [▶️ Managing Projects](#️-managing-projects)
    - [📚 Complete Command Reference](#-complete-command-reference)
    - [🔧 Editing Projects](#-editing-projects)
    - [📊 Example Session](#-example-session)
  - [Use Cases](#use-cases)
    - [Codebase Porting](#codebase-porting)
    - [Repository Maintenance](#repository-maintenance)
    - [Feature Implementation](#feature-implementation)
    - [Bug Fixes](#bug-fixes)
    - [Content Creation](#content-creation)
    - [Data Processing](#data-processing)
    - [Research \& Development](#research--development)
    - [Creative Projects](#creative-projects)
  - [Advanced Usage](#advanced-usage)
    - [Custom Configuration](#custom-configuration)
    - [Monitoring and Control](#monitoring-and-control)
      - [Time Management (Self-Checking)](#time-management-self-checking)
    - [Universal Project Types](#universal-project-types)
      - [1. Codebase Transformation Projects](#1-codebase-transformation-projects)
      - [2. Content Generation Projects](#2-content-generation-projects)
      - [3. Data Processing Projects](#3-data-processing-projects)
      - [4. Research \& Development Projects](#4-research--development-projects)
      - [5. Creative Projects](#5-creative-projects)
  - [Qwen-Specific Implementation](#qwen-specific-implementation)
  - [Prompt Templates](#prompt-templates)
  - [Repository Structure](#repository-structure)
    - [Quick Configuration](#quick-configuration)
  - [Examples](#examples)
  - [Documentation](#documentation)
  - [Troubleshooting and Best Practices](#troubleshooting-and-best-practices)
    - [Common Issues](#common-issues)
    - [Monitoring](#monitoring)
  - [Prerequisites](#prerequisites)

## Introduction

**AI-Agent is a universal project automation framework** that implements a continuous loop approach to automated programming. An AI coding agent runs in an infinite loop, continuously working on codebases to implement features, port code, fix bugs, or maintain repositories.

## Key Features

- **Infinite AI Loop**: Continuous automated work cycles with proper tool configuration
- **Simple Prompts**: Less is more - define the goal and let the AI figure out the how
- **Multiple Use Cases**: Porting, maintenance, feature implementation, and more
- **Proper Tool Setup**: Essential file system operations (`write_file`, `edit`, `read_file`)
- **Enhanced Workflow**: Makefile targets for streamlined operations (create, edit, run, stop, etc.)
- **Interactive Menus**: All commands support interactive project selection
- **Self-checking Time Management**: Automatic stop when time constraint is reached
- **Project Monitoring**: Status, logs, and summary commands for insights
- **Project Management**: Remove, restart, and batch operations
- **Git Integration**: Automatic commits and version control
- **Multi-project** workspace management
- **Extensible AI backend** support (Qwen by default)

## Universal Project Automation Framework

**AI-Agent is a universal project automation framework** that can be applied to virtually any type of project, not just linguistic services. The framework provides continuous automation capabilities for:

### Broad Application Areas
1. **Codebase Porting & Migration**
   - React → Vue conversion
   - Python → TypeScript migration
   - Angular → Svelte transformation
   - Legacy system modernization

2. **Software Development**
   - API implementation from specifications
   - Feature development across large codebases
   - Bug fixing and refactoring
   - Test suite creation and maintenance

3. **Content Creation & Management**
   - Blog series generation
   - Documentation writing
   - Marketing copy creation
   - Social media content automation

4. **Data Processing & Analysis**
   - Data transformation pipelines
   - Report generation from raw data
   - Pattern recognition in datasets
   - Automated data cleaning workflows

5. **Research & Experimentation**
   - Scientific computing projects
   - Algorithm implementation and testing
   - Simulation development
   - Research paper drafting

6. **Creative Projects**
   - Game development
   - Interactive story creation
   - Art generation scripts
   - Music composition tools

### 🚀 Universal Workflow Features
The framework provides universal automation capabilities:

```bash
# Create ANY type of project (with optional PROJECT_NAME parameter)
make create
make create PROJECT_NAME=my-project
# → Interactive setup with time constraints, custom/generic prompts
# → Optional auto-start feature

# Run continuous automation
make run PROJECT_NAME=my-awesome-project
# → Infinite loop automation for any task
# → Respects time constraints set during creation

# Monitor progress
make monitor PROJECT_NAME=my-awesome-project
# → Real-time progress tracking
# → Check time logs and TODO updates

# Stop when done
make stop PROJECT_NAME=my-awesome-project
# → Graceful termination
```

## Installation

For detailed installation instructions, see [docs/INSTALLATION.md](docs/INSTALLATION.md).

The easiest way to get started is to use the Makefile interface:

```bash
# Clone the repository
git clone https://github.com/mik-tf/ai-agent.git
cd ai-agent

# See available commands
make help

# Create your first project (fully interactive)
make create

# Or skip the project name prompt
make create PROJECT_NAME=my-first-project
```

## Quick Start

### 🚀 One-Command Project Setup (Recommended)

```bash
# Create new project (interactive)
make create

# Create with specific name (skip name prompt)
make create PROJECT_NAME=my-awesome-project

# Edit existing project (interactive menu if no name)
make edit

# Edit specific project
make edit PROJECT_NAME=my-awesome-project
```

**The enhanced workflow will guide you through:**

1. **📛 Project Name** (skipped if `PROJECT_NAME=` provided)
   - Enter a unique project name
   - Validates that project doesn't already exist

2. **⏱️ Time Duration** (with validation)
   - `30m` → 30 minutes
   - `1h` → 1 hour
   - `2h30m` → 2 hours 30 minutes
   - `indefinite` → No time limit
   - Invalid formats will prompt again with error message

3. **👤 Git User Configuration** (auto-detected or prompted)
   - Automatically uses global git config if set
   - Falls back to GitHub CLI username if authenticated
   - Prompts manually if neither available
   - Ensures commits use your name, not "QwenCode"

4. **📝 Prompt Type**
   - **Custom**: Paste your own multi-line prompt (Ctrl+D to finish)
   - **Generic**: Choose from 6 pre-built templates

5. **🎯 Template Selection** (if Generic chosen)
   1. Codebase Porting (e.g., React to Vue)
   2. Translation Services
   3. Editing & Proofreading
   4. Copywriting
   5. Website Creation
   6. Other/General Purpose

6. **🚀 Auto-Start Option**
   - Optionally start the AI agent immediately after setup
   - Type `y` to start now, `N` to start later

### 📋 Default Prompt Structure

All projects include a consistent default prefix:

```markdown
Your job is to work on this codebase and maintain the repository.

Make a commit and push your changes after every single file edit.

Use the .agent/ directory as a scratchpad for your work.

Follow existing code patterns and conventions.

CURRENT STATUS: Starting the project

The specific project requirements:

[Time constraint if not indefinite]

[Your custom prompt or selected template]
```

### ▶️ Managing Projects

All commands support **interactive menus** - just omit the PROJECT_NAME!

```bash
# List all projects
make list

# Show detailed status (running/stopped, PIDs, versions)
make status

# Interactive menu - pick from list
make run
# Shows:
#   AI Agent Projects:
#   1) spherical-music (🟢 Running)
#   2) my-website (⭕ Stopped)
#   Select project (1-2): _

# Or skip menu with direct name
make run PROJECT_NAME=my-awesome-project

# Control projects
make stop          # Stop a project (interactive)
make restart       # Restart a project (interactive)
make stopall       # Stop ALL running projects

# Monitor & inspect
make monitor       # Watch real-time progress (interactive)
make logs          # View project logs (interactive)
make summary       # See project statistics & accomplishments (interactive)

# Modify & cleanup
make edit          # Edit prompt/time constraint (interactive)
make remove        # Delete project permanently (interactive, with confirmation)
```

### 📚 Complete Command Reference

| Command | Description | Interactive? |
|---------|-------------|--------------|
| `make create` | Create new project | Yes (prompts for name, time, prompt) |
| `make list` | List all projects | No |
| `make status` | Show detailed status of all projects | No |
| `make run` | Start AI agent loop | Yes (if no PROJECT_NAME) |
| `make stop` | Stop agent loop | Yes (if no PROJECT_NAME) |
| `make restart` | Restart a project | Yes (if no PROJECT_NAME) |
| `make stopall` | Stop all running projects | Yes (confirmation) |
| `make monitor` | Watch project progress | Yes (if no PROJECT_NAME) |
| `make logs` | View project logs (live tail) | Yes (if no PROJECT_NAME) |
| `make summary` | Show project statistics | Yes (if no PROJECT_NAME) |
| `make edit` | Edit prompt/time config | Yes (if no PROJECT_NAME) |
| `make remove` | Delete project | Yes (if no PROJECT_NAME + confirmation) |

All interactive commands can be used directly: `make <command> PROJECT_NAME=name`

### 🔧 Editing Projects

Need to refine your prompt or adjust time constraints? Use `edit`:

```bash
# Interactive - shows menu of projects
make edit

# Or edit specific project directly
make edit PROJECT_NAME=my-awesome-project
```

**Features:**
- **Auto-stops running projects** - Safely stops before editing
- **Flexible prompt editing**:
  - Rewrite completely (paste new prompt)
  - Edit in place (opens in your editor)
  - Keep current prompt (change time only)
- **Git safety**:
  - Shows uncommitted changes
  - Option to auto-commit before editing
  - Tracks all edits in `.agent/edit_history.log`
- **Version tracking** - Each edit increments project version
- **Regenerates time management** - Updates all time constraint files
- **Optional restart** - Apply changes immediately or start later

See [docs/EDITING_PROJECTS.md](docs/EDITING_PROJECTS.md) for complete details.

### 📊 Example Session

```bash
$ make create

🚀 AI-Agent Project Creator
==============================

Enter project name: my-website

⏱️  How long should the AI agent run?
Examples: 30m, 1h, 2h30m, indefinite

Enter duration: 30m

📝 Choose prompt type:
1) Custom prompt (paste your own)
2) Generic template (select from options)

Select (1-2) [2]: 1

📋 Enter your custom prompt (press Ctrl+D when done):
Create a beautiful landing page for a math education website
^D

✅ Custom prompt configured
✅ Project 'my-website' created successfully!

Configuration:
  - Time constraint: in 30 minute(s) of time
  - Prompt: Custom

🚀 Do you want to start the AI agent now for the project 'my-website'?
Start now? (y/N): y

Starting AI agent for project 'my-website'...
✅ Agent loop started with PID: 12345
```

## Use Cases

The AI agent loop technique is particularly effective for a wide variety of projects:

### Codebase Porting
- Converting from one framework to another (React to Vue, Angular to Svelte)
- Migrating between programming languages (Python to TypeScript, Java to Rust)
- Updating major version dependencies
- Legacy system modernization

### Repository Maintenance
- Automatically applying security patches
- Keeping dependencies up-to-date
- Performing code style updates
- Refactoring large codebases for consistency

### Feature Implementation
- Adding consistent features across large codebases
- Implementing API endpoints based on specifications
- Creating boilerplate for new components
- Extending existing functionality

### Bug Fixes
- Applying fixes to multiple similar code sections
- Refactoring patterns that cause known issues
- Identifying and resolving performance bottlenecks
- Addressing security vulnerabilities

### Content Creation
- Generating blog posts and articles
- Creating documentation and tutorials
- Producing marketing materials and copy
- Developing educational content and courses

### Data Processing
- Transforming data between formats
- Cleaning and validating datasets
- Generating reports and analytics
- Automating data pipeline tasks

### Research & Development
- Implementing algorithms from research papers
- Conducting experiments and simulations
- Analyzing data and generating insights
- Prototyping new ideas and concepts

### Creative Projects
- Developing games and interactive experiences
- Creating art and design assets
- Writing stories and narratives
- Composing music and audio content

For detailed prompt templates for these use cases, see [docs/PROMPT_TEMPLATES.md](docs/PROMPT_TEMPLATES.md).

For detailed prompt templates for these use cases, see [docs/PROMPT_TEMPLATES.md](docs/PROMPT_TEMPLATES.md).

## Advanced Usage

### Custom Configuration

You can customize the AI agent loop technique for any type of project with different configuration files:

- `config.json`: Configuration for the Qwen agent
- `.qwenignore`: Files to ignore during processing
- `prompt-advanced.md`: More detailed prompts with specific instructions

### Monitoring and Control

#### Time Management (Self-Checking)

The AI agent includes a **self-checking time management system** that automatically stops when the specified time limit is reached.

**Architecture: Immutable System Instructions**

To prevent the AI from accidentally disabling time management (e.g., by editing `prompt.md`), the system uses **separate, immutable instruction files**:

```
Project Structure:
├── prompt.md                              ← User/AI can freely edit
├── .agent/
│   ├── time_management_instructions.md   ← System file (immutable, gitignored)
│   ├── time_log.txt                      ← System metadata
│   └── last_iteration_start.txt          ← System metadata

At Runtime (agent-loop.sh):
cat .agent/time_management_instructions.md prompt.md | qwen
```

**Why separate files?**
- ✅ **AI cannot break time management** - Instructions not in editable `prompt.md`
- ✅ **User/AI can edit prompt freely** - No risk of removing time constraints
- ✅ **Clean separation** - System vs user content
- ✅ **Gitignored** - System files don't clutter git history

**How it works:**
1. When you create a project with a time constraint (e.g., `30m`):
   - Creates `.agent/time_management_instructions.md` with checking logic
   - Logs project start time in `.agent/time_log.txt`

2. **At every iteration**, the loop script:
   - Logs iteration start → `.agent/last_iteration_start.txt`
   - Concatenates `.agent/time_management_instructions.md` + `prompt.md`
   - Sends combined instructions to Qwen

3. **The AI checks time** (as instructed):
   - Reads start time and deadline
   - Checks when last iteration started
   - If exceeded: Creates `.agent/STOP` file, writes summary, exits

**Key features:**
- ✅ **Foolproof**: AI physically cannot remove time management
- ✅ **Self-correcting**: Even if one iteration runs long, the next catches it
- ✅ **Graceful exit**: Agent finishes current work, commits, then stops
- ✅ **Manual override**: `make stop` still works anytime

See [docs/TIME_MANAGEMENT.md](docs/TIME_MANAGEMENT.md) for complete details.

For long-running processes on any project type, consider:

- Using `tmux` or `screen` to run processes in the background
- Setting up logging to track the agent's progress
- Implementing early stopping conditions based on success metrics
- Using `make monitor` to track progress

### Universal Project Types

The AI agent loop technique can be adapted for various project categories:

#### 1. Codebase Transformation Projects
- Framework migrations (React → Vue, Angular → Svelte)
- Language conversions (Python → TypeScript, Java → Rust)
- Architecture refactoring (Monolith → Microservices)

#### 2. Content Generation Projects
- Blog series creation and publication
- Documentation writing and maintenance
- Marketing campaign development
- Educational material generation

#### 3. Data Processing Projects
- ETL pipeline development
- Data analysis and reporting
- Format conversion workflows
- Automated data cleaning

#### 4. Research & Development Projects
- Algorithm implementation from papers
- Experimental software development
- Scientific computing projects
- Prototype creation

#### 5. Creative Projects
- Game development and implementation
- Interactive storytelling
- Art and design generation
- Music composition tools

For detailed information about these project types and their specific implementations, see [docs/ADVANCED_USAGE.md](docs/ADVANCED_USAGE.md).

## Qwen-Specific Implementation

For detailed information about how Qwen works with the AI agent loop technique, configuration, and best practices specific to Qwen, see [docs/QWEN_IMPLEMENTATION.md](docs/QWEN_IMPLEMENTATION.md).

## Prompt Templates

For a comprehensive collection of prompt templates for different use cases (React to Vue, Python to TypeScript, API implementation, etc.), see [docs/PROMPT_TEMPLATES.md](docs/PROMPT_TEMPLATES.md).

## Repository Structure

The repository follows industry-standard organization:

```
ai-agent/
├── README.md                    # This file
├── LICENSE                      # Apache 2.0
├── Makefile                     # Enhanced workflow commands
├── scripts/
│   ├── agent-loop.sh           # Basic loop (with time management concatenation)
│   ├── agent-loop-advanced.sh  # Advanced loop with monitoring
│   ├── create-project.sh       # Interactive project creator
│   ├── run-project.sh          # Start agent loop for a project
│   ├── monitor-project.sh      # Monitor project progress
│   └── stop-project.sh         # Stop agent loop
├── examples/
│   ├── react-to-vue/           # React to Vue porting example
│   └── python-to-ts/           # Python to TypeScript example
└── docs/
    ├── INSTALLATION.md         # Installation guide
    ├── TIME_MANAGEMENT.md      # Time management architecture & guide
    ├── USAGE.md               # Usage examples
    ├── QWEN_IMPLEMENTATION.md # Qwen specifics
    └── ...

Project Structure (created by make create):
my-project/
├── prompt.md                               # User editable prompt
├── .agent/                                 # System directory (gitignored)
│   ├── time_management_instructions.md    # Immutable time instructions
│   ├── time_log.txt                       # Project start time & constraint
│   ├── last_iteration_start.txt           # Iteration tracking
│   ├── TODO.md                            # AI's task tracking
│   ├── final_summary.md                   # Created when time exceeded
│   └── STOP                               # Stop signal file
├── .gitignore                             # Ignores .agent/ system files
└── ...                                    # User project files
```

**Important**: To ensure the AI agent loop technique works correctly with file system operations, the Qwen CLI must be configured properly. See [docs/AGENT_SETUP.md](docs/AGENT_SETUP.md) for detailed instructions on setting up tool access.

### Quick Configuration

When running Qwen through this AI agent scripts, always use these flags:

```bash
qwen --approval-mode yolo --sandbox false
```

This enables the necessary file system tools:
- `write_file`: Create/write files
- `edit`: Modify existing files
- `read_file`: Read file contents
- And other essential tools for the AI agent loop technique

## Examples

Check out the [examples/](./examples/) directory for:
- React to Vue porting example
- Python to TypeScript conversion
- API specification to implementation
- Custom language creation

See [examples/README.md](examples/README.md) for more details on using the examples.

## Documentation

- **[TIME_MANAGEMENT.md](docs/TIME_MANAGEMENT.md)** - Complete guide to the self-checking time management system
- **[EDITING_PROJECTS.md](docs/EDITING_PROJECTS.md)** - How to edit existing projects (prompts, time constraints)
- **[INSTALLATION.md](docs/INSTALLATION.md)** - Installation instructions for all platforms
- **[QWEN_IMPLEMENTATION.md](docs/QWEN_IMPLEMENTATION.md)** - Qwen-specific configuration and usage
- **[AGENT_SETUP.md](docs/AGENT_SETUP.md)** - AI agent tool setup and configuration
- **[EXAMPLE_PROMPTS.md](docs/EXAMPLE_PROMPTS.md)** - Prompt templates and examples
- **[TROUBLESHOOTING_BEST_PRACTICES.md](docs/TROUBLESHOOTING_BEST_PRACTICES.md)** - Common issues and solutions

## Troubleshooting and Best Practices

For comprehensive troubleshooting guidance and best practices when using the AI agent loop technique, see [docs/TROUBLESHOOTING_BEST_PRACTICES.md](docs/TROUBLESHOOTING_BEST_PRACTICES.md).

### Common Issues

**Agent Stuck in Loops**: If the agent repeatedly tries the same failed approach, update the prompt to guide it away from that path.

**Agent Not Making Progress**: Check the agent's output log for errors or warnings. Verify that the agent has the necessary permissions and access to the required tools.

**Rate Limits**: Be aware of API limits for your Qwen instance and implement delays if needed.

**Qwen Not Found**: Make sure Qwen CLI is properly installed and in your PATH.

### Monitoring

## Prerequisites

- **Qwen CLI**: Install the Qwen Code CLI tool
  ```bash
  npm install -g @qwen-code/qwen-code@latest
  ```
- **Git**: For version control with proper user configuration
  ```bash
  # Configure git globally (recommended)
  git config --global user.name "Your Name"
  git config --global user.email "your.email@example.com"
  
  # Or use GitHub CLI (auto-detected)
  gh auth login
  ```
- **Unix-like environment**: Linux, macOS, or WSL on Windows