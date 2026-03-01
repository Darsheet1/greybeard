# MCP Integration

greybeard includes a built-in [MCP](https://modelcontextprotocol.io) (Model Context Protocol) server. This lets you use greybeard's review tools directly inside Claude Desktop, Cursor, Zed, and any other MCP-compatible client.

---

## How it works

Running `greybeard mcp` starts a stdio JSON-RPC server that exposes greybeard's tools via the MCP protocol. Your LLM client connects to it locally — no network exposure, no external servers.

---

## Available tools

| Tool | Description |
|------|-------------|
| `review_decision` | Staff-level review of a decision, diff, or document |
| `self_check` | Review your own proposal before sharing it |
| `coach_communication` | Get suggested language for a specific audience |
| `list_packs` | List available content packs |

---

## Claude Desktop

1. Find your config file:
    - **macOS:** `~/Library/Application Support/Claude/claude_desktop_config.json`
    - **Windows:** `%APPDATA%\Claude\claude_desktop_config.json`

2. Add the greybeard server:

```json
{
  "mcpServers": {
    "greybeard": {
      "command": "greybeard",
      "args": ["mcp"]
    }
  }
}
```

3. Restart Claude Desktop.

You'll see greybeard tools available in the tool picker. You can now ask Claude things like:

> "Use greybeard to review this design doc"  
> "Self-check my proposal with the oncall-future-you pack"  
> "What packs does greybeard have available?"

!!! tip "Full path if needed"
    If Claude Desktop can't find `greybeard`, use the full path:
    ```json
    {
      "mcpServers": {
        "greybeard": {
          "command": "/usr/local/bin/greybeard",
          "args": ["mcp"]
        }
      }
    }
    ```
    Find it with: `which greybeard`

---

## Cursor

In your Cursor settings, add a new MCP server:

```json
{
  "mcpServers": {
    "greybeard": {
      "command": "greybeard",
      "args": ["mcp"]
    }
  }
}
```

---

## Zed

In your Zed `settings.json`:

```json
{
  "assistant": {
    "mcp_servers": {
      "greybeard": {
        "command": "greybeard",
        "args": ["mcp"]
      }
    }
  }
}
```

---

## Other MCP clients

Any client that supports the MCP stdio transport works. Point it at `greybeard mcp`. The server speaks JSON-RPC 2.0 over stdin/stdout.

---

## Tool reference

### `review_decision`

```json
{
  "input": "string (required) — diff, design doc, ADR, etc.",
  "context": "string (optional) — additional context",
  "mode": "review | mentor | self-check (default: review)",
  "pack": "string (default: staff-core)"
}
```

### `self_check`

```json
{
  "context": "string (required) — your decision or proposal",
  "input": "string (optional) — supporting document",
  "pack": "string (default: staff-core)"
}
```

### `coach_communication`

```json
{
  "concern": "string (required) — what you need to communicate",
  "audience": "team | peers | leadership | customer (required)",
  "pack": "string (default: mentor-mode)"
}
```

### `list_packs`

No parameters. Returns a markdown list of all available packs.

---

## LLM backend for MCP

The MCP server uses whatever backend you've configured in `~/.greybeard/config.yaml`. This is separate from the LLM the MCP client itself uses.

For example: Claude Desktop uses Claude for its own reasoning, but when it calls `review_decision`, greybeard uses your configured backend (e.g. Ollama, GPT-4o, etc.) to generate the review.
