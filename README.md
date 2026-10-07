# Council of AI: free MCP connector (GSPC)

A free, read-only remote MCP server from Council of AI. Your assistant can read the public GSPC AI measurement
board and check Council of AI's signed records: measurement cards, measurement capsules and Merkle inclusion.

- **Endpoint:** `https://councilof.ai/mcp/free` (streamable HTTP; no key, no account)
- **Tools:** every tool is read-only (`readOnlyHint`). Your client lists the current set with `tools/list`.
- **Answers carry their state:** VALID, INVALID, UNCHECKABLE, UNMEASURED, NOT_MEASURED or UNREACHABLE.
  "Could not check" is never reported as "forged", and an unmeasured slot is never reported as a zero.
- **Measurement only.** A card is evidence about one run. It is not a grade, a mark or an endorsement.
  Verification is free.

## Install

### One click

[![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/install-mcp?name=council-of-ai&config=eyJ1cmwiOiJodHRwczovL2NvdW5jaWxvZi5haS9tY3AvZnJlZSJ9)
[![Install in VS Code](https://img.shields.io/badge/VS_Code-Install-0098FF?logo=visualstudiocode&logoColor=white)](https://vscode.dev/redirect/mcp/install?name=council-of-ai&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fcouncilof.ai%2Fmcp%2Ffree%22%7D)
[![Install in VS Code Insiders](https://img.shields.io/badge/VS_Code_Insiders-Install-24bfa5?logo=visualstudiocode&logoColor=white)](https://insiders.vscode.dev/redirect/mcp/install?name=council-of-ai&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fcouncilof.ai%2Fmcp%2Ffree%22%7D&quality=insiders)
[![Add to LM Studio](https://img.shields.io/badge/LM_Studio-Add_MCP-4b5563)](https://lmstudio.ai/install-mcp?name=council-of-ai&config=eyJ1cmwiOiJodHRwczovL2NvdW5jaWxvZi5haS9tY3AvZnJlZSJ9)

### Gemini CLI (this repository is a Gemini CLI extension)

```sh
gemini extensions install https://github.com/CSOAI-ORG/council-of-ai-mcp
```

### Claude Code

```sh
claude mcp add --transport http council-of-ai https://councilof.ai/mcp/free
```

### OpenAI Codex CLI (`~/.codex/config.toml`)

```toml
[mcp_servers.council-of-ai]
url = "https://councilof.ai/mcp/free"
```

### Config files

| Client | File | Entry |
|---|---|---|
| Cursor | `~/.cursor/mcp.json` | `{"mcpServers": {"council-of-ai": {"url": "https://councilof.ai/mcp/free"}}}` |
| VS Code | `.vscode/mcp.json` | `{"servers": {"council-of-ai": {"type": "http", "url": "https://councilof.ai/mcp/free"}}}` |
| Windsurf | `~/.codeium/windsurf/mcp_config.json` | `{"mcpServers": {"council-of-ai": {"serverUrl": "https://councilof.ai/mcp/free"}}}` |
| Gemini CLI | `~/.gemini/settings.json` | `{"mcpServers": {"council-of-ai": {"httpUrl": "https://councilof.ai/mcp/free"}}}` |
| Zed | `settings.json` | `{"context_servers": {"council-of-ai": {"url": "https://councilof.ai/mcp/free"}}}` |
| JetBrains AI Assistant | Settings, Tools, AI Assistant, MCP, Add, As JSON | `{"mcpServers": {"council-of-ai": {"url": "https://councilof.ai/mcp/free"}}}` |
| Cline | `cline_mcp_settings.json` | `{"mcpServers": {"council-of-ai": {"type": "streamableHttp", "url": "https://councilof.ai/mcp/free"}}}` |

### Chat apps that take a pasted server URL

Add a custom connector with the URL `https://councilof.ai/mcp/free` and no authentication:

- **Claude** (claude.ai, Desktop): Settings, Connectors, Add custom connector.
- **ChatGPT** (developer mode): Settings, Apps and Connectors, Advanced settings, Developer mode, Create.
- **Mistral Le Chat:** Intelligence, Connectors, Add connector, Custom MCP Connector.
- **Microsoft Copilot Studio:** Agent, Tools, Add a tool, New tool, Model Context Protocol.

Menu names follow each vendor's documentation and can change.

### Check it yourself, no client needed

```sh
curl -s https://councilof.ai/mcp/free \
  -H 'content-type: application/json' -H 'accept: application/json, text/event-stream' \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/list"}'
```

## The other endpoint

`https://councilof.ai/mcp` carries the same read-only tools plus tools metered with x402, paid from the caller's own
wallet. This connector uses only the free endpoint.

## Registry names

Official MCP Registry: `ai.councilof/gspc-free` (this endpoint) and `ai.councilof/gspc` (the endpoint above).

## Who runs it, and how to object

Operated by CSOAI Ltd (Council of AI), UK company number 16939677. Contact: nicholas@csoai.org.
Corrections and objections: open an issue on this repository, or email that address.

## Licence

The files in this repository are Apache-2.0.
