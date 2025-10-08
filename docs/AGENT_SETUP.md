# AI-Agent Setup Guide

## Proper Configuration for File System Tools

To ensure the AI agent loop technique works correctly with file system operations, you need to configure the Qwen CLI properly.

### Required Flags

When running Qwen through this AI agent scripts, always use these flags:

```bash
qwen --approval-mode yolo --sandbox false
```

- `--approval-mode yolo`: Automatically approves all tool actions (necessary for file operations)
- `--sandbox false`: Disables sandbox restrictions that prevent file system access

### Available File System Tools

Once properly configured, these tools become available:

1. **`write_file`**: Creates or overwrites files with specified content
2. **`edit`**: Modifies existing files by replacing text
3. **`read_file`**: Reads content from files
4. **`glob`**: Finds files matching patterns
5. **`run_shell_command`**: Executes shell commands

### Troubleshooting

If you encounter "Tool not found" errors:

1. Verify Qwen is installed correctly:
   ```bash
   qwen --version
   ```

2. Test tool availability:
   ```bash
   echo "List available tools" | qwen --approval-mode yolo --sandbox false
   ```

3. Check that the loop scripts are using the correct flags as shown in this guide.

### Example Usage

The AI agent loop scripts in this repository are already configured correctly. Simply run:

```bash
./scripts/agent-loop.sh
```

Or for advanced features:

```bash
./scripts/agent-loop-advanced.sh
```