# Makefile for AI-Agent Enhanced Workflow
# Standardized build and automation targets

# Variables
PROJECT_DIR := $(CURDIR)
SCRIPTS_DIR := $(PROJECT_DIR)/scripts
DOCS_DIR := $(PROJECT_DIR)/docs
TEMPLATES_DIR := $(PROJECT_DIR)/templates

# Default target
.PHONY: help
help:
	@echo "AI-Agent Enhanced Workflow"
	@echo "============================="
	@echo "Available targets:"
	@echo "  create [PROJECT_NAME=name]       - Create a new AI agent project (interactive if no name)"
	@echo "  edit [PROJECT_NAME=name]         - Edit project config (shows menu if no name)"
	@echo "  list                             - List all AI agent projects"
	@echo "  status                           - Show detailed status (running/stopped, versions)"
	@echo "  run [PROJECT_NAME=name]          - Start AI agent loop (shows menu if no name)"
	@echo "  restart [PROJECT_NAME=name]      - Restart a project (shows menu if no name)"
	@echo "  stop [PROJECT_NAME=name]         - Stop AI agent loop (shows menu if no name)"
	@echo "  stopall                          - Stop all running projects"
	@echo "  monitor [PROJECT_NAME=name]      - Monitor project progress (shows menu if no name)"
	@echo "  logs [PROJECT_NAME=name]         - View project logs (shows menu if no name)"
	@echo "  summary [PROJECT_NAME=name]      - Show project summary (shows menu if no name)"
	@echo "  remove [PROJECT_NAME=name]       - Delete a project permanently (shows menu if no name)"
	@echo "  test-setup                       - Test AI-Agent tool configuration"
	@echo "  clean                            - Clean temporary files"
	@echo "  docs                             - Generate documentation"
	@echo "  help                             - Show this help message"

# Create a new project with interactive setup
.PHONY: create
create:
	@$(SCRIPTS_DIR)/create-project.sh $(PROJECT_NAME)

# Edit an existing project (interactive if no PROJECT_NAME)
.PHONY: edit
edit:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh edit $(PROJECT_NAME)

# List all projects in the workspace
.PHONY: list
list:
	@echo "AI agent projects:"
	@echo ""
	@find .. -maxdepth 2 -name ".agent" -type d | while read project; do \
		project_name=$$(dirname "$$project"); \
		base_name=$$(basename "$$project_name"); \
		if [ "$$base_name" != "ai-agent" ]; then \
			echo "  📁 $$base_name"; \
		fi; \
	done || echo "  No projects found"

# Show detailed status of all projects
.PHONY: status
status:
	@$(SCRIPTS_DIR)/status-projects.sh

# Run AI agent loop (interactive if no PROJECT_NAME)
.PHONY: run
run:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh run $(PROJECT_NAME)

# Monitor project progress (interactive if no PROJECT_NAME)
.PHONY: monitor
monitor:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh monitor $(PROJECT_NAME)

# Stop AI agent loop (interactive if no PROJECT_NAME)
.PHONY: stop
stop:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh stop $(PROJECT_NAME)

# Restart a project (interactive if no PROJECT_NAME)
.PHONY: restart
restart:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh restart $(PROJECT_NAME)

# Stop all running projects
.PHONY: stopall
stopall:
	@$(SCRIPTS_DIR)/stopall-projects.sh

# View project logs (interactive if no PROJECT_NAME)
.PHONY: logs
logs:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh logs $(PROJECT_NAME)

# Show project summary (interactive if no PROJECT_NAME)
.PHONY: summary
summary:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh summary $(PROJECT_NAME)

# Remove a project (interactive if no PROJECT_NAME)
.PHONY: remove
remove:
	@$(SCRIPTS_DIR)/interactive-wrapper.sh remove $(PROJECT_NAME)

# Test setup
.PHONY: test-setup
test-setup:
	@echo "Testing AI-Agent setup..."
	@$(SCRIPTS_DIR)/test-setup.sh

# Clean temporary files
.PHONY: clean
clean:
	@echo "Cleaning temporary files..."
	@find . -name "*.tmp" -delete
	@find . -name "*.log" -delete
	@echo "Temporary files cleaned."

# Generate documentation
.PHONY: docs
docs:
	@echo "Generating documentation..."
	@$(SCRIPTS_DIR)/generate-docs.sh $(PROJECT_NAME)

# Install dependencies (if needed)
.PHONY: install
install:
	@echo "Installing dependencies..."
	@npm install

# Update AI-Agent
.PHONY: update
update:
	@echo "Updating AI-Agent..."
	@git pull origin main