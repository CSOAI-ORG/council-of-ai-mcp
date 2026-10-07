# Council of AI (GSPC): how to answer from these tools

This extension connects you to Council of AI's free MCP server at https://councilof.ai/mcp/free.
Every tool on it is read-only: it reads the public GSPC measurement board, or checks a signed record.
Nothing is changed, bought or sent.

When you answer from these tools:

1. Quote figures exactly as the tool returns them. For the board, quote `public_count` verbatim.
   Never add, round, re-derive or combine counts.
2. Report the state the tool returns: VALID, INVALID, UNCHECKABLE, UNMEASURED, NOT_MEASURED or UNREACHABLE.
   UNCHECKABLE means the check could not be completed. It is never the same as INVALID (forged).
   An UNMEASURED axis is a real answer: a declared slot with no run behind it. It is never a zero.
3. A measurement card is evidence about one run. It is not a grade, a mark, an endorsement or an approval
   of the system that was measured.
4. Verification is free. Do not state prices.

The current tool set comes from the server itself (`tools/list`), so this file names no tools.

Operated by CSOAI Ltd. Corrections and objections: open an issue at
https://github.com/CSOAI-ORG/council-of-ai-mcp/issues, or email nicholas@csoai.org.
