<div align="center">

<img src="main/assets/images/logo.svg" alt="Make It Logo" width="120" height="120">

# ⚡ Make It

### Terminal AI Coding Agent

**Tell it what to build — it makes it.** Create projects, edit files, run commands, and write code right from your terminal, powered by an intelligent **Dual AI Engine**.

[![Version](https://img.shields.io/badge/version-1.0.0-10b981?style=for-the-badge&labelColor=0f172a)](https://hacker1514.github.io/make_it/download/)
[![License](https://img.shields.io/badge/license-MIT-06b6d4?style=for-the-badge&labelColor=0f172a)](LICENSE)
[![Platforms](https://img.shields.io/badge/platforms-9%20OS-8b5cf6?style=for-the-badge&labelColor=0f172a)](download.html)
[![Powered By](https://img.shields.io/badge/powered%20by-AI--Engine-10b981?style=for-the-badge&labelColor=0f172a)](download.html)
[![Open Source](https://img.shields.io/badge/open%20source-%E2%9D%A4%EF%B8%8F-06b6d4?style=for-the-badge&labelColor=0f172a)](https://github.com/hacker1514)

**By [Niranjan Kumar K](https://github.com/hacker1514) · KNI-ORG**

[🚀 Download](download.html) · [📖 Docs](docs.html) · [✨ Features](features.html) · [📸 Screenshots](screenshots.html) · [❓ FAQ](faq.html)

</div>

---

## 🌟 About

**Make It** is a terminal-based AI coding agent that combines the power of artificial intelligence with practical file-system operations, command execution, and project scaffolding. It's the pair programmer you always wanted — fast, reliable, and always available.

Born from a simple observation: *developers spend too much time on repetitive tasks an AI could handle.* With Make It, you describe what you want and the AI builds it — no complex configuration, no steep learning curve, just **describe, and it's done**.

> ⚡ **High Performance & High Availability** — powered by an intelligent dual AI engine architecture with automatic failover.

---

## ✨ Features

| Feature | Description |
| :--- | :--- |
| 🧠 **AI Coding** | Write, refactor, and debug code in any language using natural language. |
| ✏️ **File Operations** | Read, write, edit, append, move, copy, and delete files seamlessly. |
| 📦 **Project Generator** | Generate full project scaffolds from a single prompt. |
| 🖥️ **Command Execution** | Run shell commands, package managers, and scripts directly. |
| 💾 **Context Memory** | Retains your project context and conversation history across turns. |
| 🎨 **Rich Terminal UI** | Clean interactive terminal layout with syntax highlighting and clear output dividers. |
| 🪟 **Cross Platform** | Windows, Linux, macOS, WSL, and Termux — everywhere you code. |
| ⚡ **Dual AI Engine** | Priority primary AI with automatic secondary AI fallback for maximum reliability. |
| 🚀 **Zero API Setup** | Works out of the box with zero complex API key setup required. |
| 🧩 **Open Source** | Free, MIT-licensed, and community-driven. |

---

## 🏗️ Architecture & Dual AI Engine

Make It uses a modular agent architecture built around a dual AI backend:

```
                  ┌──────────────────────┐
                  │    User Instruction  │
                  └──────────┬───────────┘
                             │
                             ▼
                  ┌──────────────────────┐
                  │   Agent Orchestrator │
                  └──────────┬───────────┘
                             │
               ┌─────────────┴─────────────┐
               ▼                           ▼
    ┌────────────────────┐      ┌────────────────────┐
    │     Primary AI     │      │    Secondary AI    │
    │ (Highest Priority) │      │     (Fallback)     │
    └──────────┬─────────┘      └──────────┬─────────┘
               │                           │
               └─────────────┬─────────────┘
                             │
                             ▼
                  ┌──────────────────────┐
                  │ Tool Execution Loop  │
                  │ (Filesystem & Shell) │
                  └──────────────────────┘
```

- **Primary AI Engine**: Highest priority backend for fast, accurate code generation.
- **Secondary AI Engine**: Automatic fallback if the primary engine encounters network issues or errors.
- **Tool System**: Enables the agent to read/write files, list directories, search codebases, and run commands.

---

## 📸 Screenshots

<div align="center">

| Terminal Agent | Project Generation | Setup Experience |
| :---: | :---: | :---: |
| ![Terminal](main/assets/images/terminal.png) | ![Commands](main/assets/images/commands.png) | ![Install](main/assets/images/install.png) |

</div>

---

## 🚀 Quick Start

### Prerequisites

- A modern OS: **Windows 10/11, Linux, macOS 12+, WSL 2**, or **Termux**
- `curl` (pre-installed on most systems)

### Installation

Choose your platform and copy the command:

#### 🪟 Windows

```bat
curl -L https://hacker1514.github.io/make_it/scripts/win_set_up.bat -o win_set_up.bat && win_set_up
```

#### 🐧 Linux / Ubuntu / Debian / Fedora / Arch

```bash
curl -L https://hacker1514.github.io/make_it/scripts/linux_set_up.sh -o linux_set_up.sh && chmod +x linux_set_up.sh && ./linux_set_up.sh
```

#### 🍎 macOS

```bash
curl -L https://hacker1514.github.io/make_it/scripts/mac_set_up.sh -o mac_set_up.sh && chmod +x mac_set_up.sh && ./mac_set_up.sh
```

#### 🪟➡️🐧 WSL

```bash
curl -L https://hacker1514.github.io/make_it/scripts/wsl_set_up.sh -o wsl_set_up.sh && chmod +x wsl_set_up.sh && ./wsl_set_up.sh
```

#### 📱 Termux (Android)

```bash
curl -L https://hacker1514.github.io/make_it/scripts/termux_set_up.sh -o termux_set_up.sh && chmod +x termux_set_up.sh && ./termux_set_up.sh
```

---

## ▶️ Usage

### Interactive Mode

```bash
makeit
```

### One-Shot Command

```bash
makeit "tell me what files are there in my directory"
```

```bash
makeit "build a FastAPI REST API for a todo app with SQLite"
```

| Command | Description |
| :--- | :--- |
| `makeit` | Start an interactive AI session |
| `makeit "instruction"` | Run a one-shot instruction |
| `help` / `?` | Show built-in help |
| `clear` | Clear terminal console |
| `exit` / `quit` | Exit session |

---

## 🛠️ Tool System

Make It equips the AI agent with a full suite of filesystem and shell tools:

| Tool | Icon | Description |
| :--- | :---: | :--- |
| `read_file` | 📖 | Read file contents with optional line range filtering |
| `write_file` | ✏️ | Create or overwrite files with automatic parent directory creation |
| `edit_file` | 🔧 | Replace specific target text chunks in existing files |
| `append_file` | ➕ | Append content to the end of a file |
| `list_dir` | 📁 | List directory structure and file sizes as a tree |
| `create_dir` | 📂 | Create directories and necessary parent paths |
| `delete_file` | 🗑️ | Delete files or directories recursively |
| `move_file` | 📦 | Move or rename files and directories |
| `copy_file` | 🗐 | Copy files from source to destination |
| `run_command` | ⚡ | Execute shell commands (git, npm, pip, build scripts) |
| `search_web` | 🔍 | Search for documentation and package info |
| `get_file_info` | ℹ️ | Inspect file size, existence, and metadata |
| `find_in_files` | 🔎 | Search pattern across files in directory (grep) |
| `patch_json` | 🗄️ | Update specific key paths inside JSON files |

---

## ⚙️ Automated Multi-OS Builds (GitHub Actions)

Make It uses a GitHub Actions CI workflow ([`.github/workflows/build.yml`](.github/workflows/build.yml)) to build standalone binary executables across platforms:

- **Windows**: `make_it_win.exe`
- **Linux**: `make_it_linux`
- **macOS**: `make_it_mac`
- **Termux**: `make_it_termux`

All binaries are compiled automatically on push, pull requests, manual workflow dispatches, and release tags.

---

## 🧠 Memory System

Make It maintains context across conversation turns:

- 💬 **Conversation History** — coherent multi-turn responses
- 📁 **Project Context** — remembers working directory and modified files
- 💾 **Persistent Session Storage** — saved locally in `~/.make_it/history.json`

---

## 📄 License

**Make It** is licensed under the [MIT License](LICENSE). Free to use, modify, and distribute.

---

## 📬 Contact

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-%40hacker1514-0f172a?style=for-the-badge&logo=github&logoColor=white&labelColor=10b981)](https://github.com/hacker1514)
[![Email](https://img.shields.io/badge/Email-hackerenvironment1514%40gmail.com-0f172a?style=for-the-badge&logo=gmail&logoColor=white&labelColor=06b6d4)](mailto:hackerenvironment1514@gmail.com)

</div>

---

<div align="center">

**Made with ❤️ by [Niranjan Kumar K](https://github.com/hacker1514) · KNI-ORG**

© 2026 Niranjan Kumar K. All rights reserved.

</div>
