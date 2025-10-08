# Installation Guide for AI-Agent

## Prerequisites

Before installing AI-Agent, ensure you have:

- Node.js v18 or higher
- npm or yarn package manager
- Git for version control
- A Qwen API key (if using hosted version)

## Installing Qwen

1. Install the Qwen CLI globally:

```bash
npm install -g @qwen-code/qwen-code@latest
```

2. Verify the installation:

```bash
qwen --version
```

3. Log in to your Qwen account (if required):

```bash
qwen login
```

## Installing AI-Agent

### Option 1: Clone and Use Scripts Directly

```bash
# Clone the repository
git clone https://github.com/mik-tf/ai-agent.git
cd ai-agent

# Use the enhanced workflow with Makefile
make help
make create

# OR use scripts directly:
chmod +x scripts/*.sh
./scripts/agent-init.sh my-project
```

### Option 2: Install via npm (when published)

```bash
npm install -g @mik-tf/ai-agent
```

## Setting up Your Environment

### Environment Variables (Optional)

You can set environment variables to customize this AI agent loop behavior:

```bash
# Set custom prompt file
export PROMPT_FILE="custom-prompt.md"

# Set custom log file
export LOG_FILE="my-project.log"

# Set maximum iterations (0 for infinite)
export MAX_ITERATIONS=100

# Set delay between iterations (in seconds)
export SLEEP_DELAY=15

# Set custom commit message prefix
export COMMIT_PREFIX="AI-Agent: "
```

### Configuration Files

#### .qwen/config.json

Create a configuration file to specify model preferences:

```json
{
  "model": "qwen-max",
  "temperature": 0.2,
  "max_tokens": 4000,
  "context_window": 32000
}
```

#### .qwenignore

Use this file to specify files/directories the agent should not modify:

```
node_modules/
.git/
dist/
build/
*.log
.env
TODO_BACKUP/
```

## Initial Setup for a New Project

### Method 1: Enhanced Workflow (Recommended)

1. Use the Makefile interface:
   ```bash
   cd /path/to/ai-agent
   make create
   ```
   Follow the interactive prompts to create your project.

### Method 2: Traditional Script Approach

1. Create a project directory:
   ```bash
   mkdir my-agent-project
   cd my-agent-project
   git init
   ```

2. Copy this AI agent scripts to your project:
   ```bash
   cp /path/to/ai-agent-cli/scripts/agent-*.sh ./
   chmod +x agent-*.sh
   ```

3. Initialize the project:
   ```bash
   ./scripts/agent-init.sh .
   ```

4. Customize your `prompt.md` file with specific instructions

5. Start this AI agent loop:
   ```bash
   ./agent-loop.sh
   ```

## Docker Setup (Optional)

For isolated execution, you can run AI-Agent in Docker:

```dockerfile
FROM node:18-alpine

# Install git
RUN apk add --no-cache git

# Install Qwen CLI
RUN npm install -g @qwen-code/qwen-code@latest

# Copy AI agent scripts
COPY scripts/agent-*.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/agent-*.sh

WORKDIR /app

CMD ["sh", "-c", "agent-init.sh project && cd project && agent-loop.sh"]
```

Build and run:
```bash
docker build -t ai-agent-cli .
docker run -it --env QWEN_API_KEY=your_key_here ai-agent-cli
```