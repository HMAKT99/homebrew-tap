# HMAKT99/tap

Homebrew tap for [AGASTHY](https://github.com/HMAKT99/Agasthy), developer machine intelligence.

```bash
brew install --cask hmakt99/tap/agasthy   # the app (macOS, Apple silicon)
brew install hmakt99/tap/agasthy-cli      # the read-only CLI and MCP server (macOS Apple silicon, Linux x64)
```

The app is not yet notarized by Apple, so on first launch macOS asks you to allow it once in **System Settings → Privacy & Security → Open Anyway**. The app updates itself; `brew upgrade` picks up new CLI versions.

Use the CLI from coding agents as an MCP server:

```bash
claude mcp add agasthy -- "$(brew --prefix)/bin/agasthy" mcp
```
