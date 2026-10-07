# Installing the Council of AI MCP server (for AI agents such as Cline)

This is a remote server. There is nothing to download, build or run locally, and it needs no API key,
account or environment variable.

1. Open the MCP settings file of the client (for Cline: `cline_mcp_settings.json`).
2. Add this entry inside `mcpServers`, keeping any servers already there:

```json
{
  "mcpServers": {
    "council-of-ai": {
      "type": "streamableHttp",
      "url": "https://councilof.ai/mcp/free",
      "disabled": false,
      "autoApprove": []
    }
  }
}
```

3. Save the file and let the client reconnect.
4. Check the connection: call `tools/list`. Every tool returned is read-only. Then call `board_totals` with no
   arguments; it returns the live board totals with their state (LIVE or UNREACHABLE).

If the client cannot reach the server, report the exact error. Do not substitute numbers from memory: every figure
must come from a tool result.
