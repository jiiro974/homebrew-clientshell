# Homebrew Tap — ClientShell

Secure workstation platform for MSP/SOC teams.

## Installation

```bash
brew tap jiiro974/clientshell
brew install clientshell
```

This installs 3 binaries:
- `clientshell` — Main CLI with interactive shell
- `cs-toolbox` — 70+ SOC/security diagnostic tools
- `cs-server` — Central web server + WebSocket

## Usage

```bash
clientshell                    # Interactive shell
cs-toolbox help                # List 70+ tools
cs-toolbox portscan host top100
cs-toolbox netexplorer --watch
```

## Install cs-toolbox only

```bash
brew install jiiro974/clientshell/cs-toolbox
```

## Upgrade

```bash
brew upgrade clientshell
```

## Documentation

- [User Guide](https://jiiro974.github.io/clientshell-releases)
- [Releases](https://github.com/jiiro974/clientshell-releases/releases)
