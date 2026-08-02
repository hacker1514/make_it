<div align="center">

<img src="assets/images/logo.svg" alt="Make It Logo" width="120" height="120">

# ⚡ Make It

### Terminal AI Coding Agent

**Tell it what to build — it makes it.** Create projects, edit files, run commands, and write code right from your terminal, powered by the lightning-fast **Groq** API.

[![Version](https://img.shields.io/badge/version-1.0.0-10b981?style=for-the-badge&labelColor=0f172a)](https://hacker1514.github.io/make_it/download/)
[![License](https://img.shields.io/badge/license-MIT-06b6d4?style=for-the-badge&labelColor=0f172a)](LICENSE)
[![Platforms](https://img.shields.io/badge/platforms-9%20OS-8b5cf6?style=for-the-badge&labelColor=0f172a)](download.html)
[![Powered By](https://img.shields.io/badge/powered%20by-Groq-10b981?style=for-the-badge&labelColor=0f172a)](https://console.groq.com)
[![Open Source](https://img.shields.io/badge/open%20source-%E2%9D%A4%EF%B8%8F-06b6d4?style=for-the-badge&labelColor=0f172a)](https://github.com/hacker1514)

**By [Niranjan Kumar K](https://github.com/hacker1514) · KNI-ORG**

[🚀 Download](download.html) · [📖 Docs](docs.html) · [✨ Features](features.html) · [📸 Screenshots](screenshots.html) · [❓ FAQ](faq.html)

</div>

---

## 🌟 About

**Make It** is a terminal-based AI coding agent that combines the power of large language models with practical file-system operations, command execution, and project scaffolding. It's the pair programmer you always wanted — fast, reliable, and always available.

Born from a simple observation: *developers spend too much time on repetitive tasks an AI could handle.* With Make It, you describe what you want and the AI builds it — no complex configuration, no steep learning curve, just **describe, and it's done**.

> ⚡ **Up to 1,200 tokens/second** — powered by Groq's LPU inference engine.

---

## ✨ Features

| Feature | Description |
| :--- | :--- |
| 🧠 **AI Coding** | Write, refactor, and debug code in any language using natural language. |
| ✏️ **File Editing** | Make precise edits across multiple files with a single instruction. |
| 📦 **Project Generator** | Generate full project scaffolds from a single prompt. |
| 🖥️ **Command Execution** | Run terminal commands safely with approval. |
| 💾 **Memory** | Remembers your project context across sessions. |
| 🎨 **Rich Terminal** | Beautiful interactive terminal with syntax highlighting & streaming output. |
| 🪟 **Cross Platform** | Windows, Linux, macOS, WSL, and Termux — everywhere you code. |
| ⚡ **Groq Integration** | Runs on the world's fastest inference engine. |
| 🚀 **Fast Responses** | Stream responses at blazing speed, no waiting. |
| 🧩 **Open Source** | Free, MIT-licensed, and community-driven. |

---

## 📸 Screenshots

<div align="center">

| Terminal Agent | Project Generation | Setup Experience |
| :---: | :---: | :---: |
| ![Terminal](assets/images/terminal.png) | ![Commands](assets/images/commands.png) | ![Install](assets/images/install.png) |

</div>

> More screenshots: [Screenshots Gallery](screenshots.html)

---

## 🚀 Quick Start

### Prerequisites

- A modern OS: **Windows 10/11, Linux, macOS 12+, WSL 2**, or **Termux**
- `curl` (pre-installed on most systems)
- A free **Groq API key** from [console.groq.com/keys](https://console.groq.com/keys)

### Install

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

### 🔑 One-Time Setup

The installer will ask for your **Groq API key** once. It validates the key, then stores it permanently:

| Platform | Location |
| :--- | :--- |
| Linux / macOS / WSL / Termux | `~/.makeit/api.json` |
| Windows | `C:\makeit\data\api.json` |

You'll **never be asked for the key again**.

### ▶️ Usage

```bash
makeit
```

Start an interactive session:

```
> makeit "create a flask API with SQLite and user authentication"
```

| Command | Description |
| :--- | :--- |
| `makeit` | Start an interactive AI session |
| `makeit "your instruction"` | Run a one-shot instruction |
| `makeit --reset` | Reset the memory system |

---

## ⚙️ Configuration

Make It uses environment variables for configuration. The only required one is your Groq API key (set during setup).

| Variable | Required | Description | Default |
| :--- | :---: | :--- | :--- |
| `AI_API_KEY` | ✅ | Your Groq API key | — |
| `MAKEIT_MODEL` | ❌ | Groq model to use | `mixtral-8x7b-32768` |
| `MAKEIT_TEMP` | ❌ | Temperature for AI responses | `0.7` |
| `MAKEIT_MAX_TOKENS` | ❌ | Maximum tokens per response | `4096` |
| `MAKEIT_HOME` | ❌ | Custom config directory path | `~/.makeit` |

---

## 🛠️ Tool System

Make It provides the AI agent with a set of tools to interact with your system:

| Tool | Purpose |
| :--- | :--- |
| 📄 `read_file` | Read the contents of a file |
| ✏️ `write_file` | Create or overwrite a file with new content |
| 🔍 `search_files` | Search for patterns across files using regex |
| 📋 `list_files` | List files in a directory |
| ⚡ `run_command` | Execute a terminal command |
| 🗑️ `delete_file` | Delete a file or empty directory |
| 📦 `create_project` | Scaffold an entire project structure |
| 🧪 `run_tests` | Execute test suites and report results |

Each tool is a Python function with a clear schema the AI understands. Tools can be extended or restricted based on your preferences.

---

## 🧠 Memory System

Make It remembers your project context across sessions:

- 💬 **Conversation History** — coherent multi-turn conversations
- 📁 **Project Context** — project structure, recent files, important variables
- ⚙️ **User Preferences** — preferred language, framework, and coding style
- 💾 **Persistent Storage** — stored in `~/.makeit/memory/` as JSON files

> Reset anytime with `makeit --reset`.

---

## 📁 Project Structure

```
makeit/
├── makeit/                    # core package
│   ├── __init__.py
│   ├── cli.py                 # CLI entry point
│   ├── config.py              # Configuration management
│   ├── agent.py               # AI agent orchestrator
│   ├── tools/                 # Tool implementations
│   │   ├── __init__.py
│   │   ├── file_tools.py
│   │   ├── command_tools.py
│   │   └── project_tools.py
│   ├── memory/                # Memory system
│   │   ├── __init__.py
│   │   ├── store.py
│   │   └── context.py
│   ├── llm/                   # LLM integration
│   │   ├── __init__.py
│   │   ├── groq_client.py
│   │   └── prompts.py
│   └── utils/                 # Utilities
│       ├── __init__.py
│       └── helpers.py
├── setup.py                   # Package setup
├── requirements.txt
└── README.md
```

---

## 🗺️ Roadmap

| Status | Milestone |
| :---: | :--- |
| ✅ **Done** | **Make It v1.0** — AI coding, file editing, project generation, 9-platform support |
| 🔄 **In Progress** | **Plugin System** — community plugins for custom tools & integrations |
| 🗓️ **Planned** | **Multi-Model Support** — additional providers + local models via Ollama |
| 🗓️ **Planned** | **Collaborative Mode** — shared sessions for pair programming |
| 🗓️ **Planned** | **GUI Companion** — lightweight visual companion app |
| 🗓️ **Planned** | **Automatic Project Recovery** — git-backed session snapshots |

---

## 🤝 Contributing

Make It is open source and community-driven. Contributions, issues, and feature requests are always welcome!

1. 🍴 Fork the repository
2. 🌿 Create a feature branch
3. ✏️ Make your changes
4. ✅ Submit a pull request

Or report bugs / suggest features via the [GitHub Issues](https://github.com/hacker1514/makeit/issues).

---

## 📄 License

**Make It** is licensed under the [MIT License](LICENSE). Free to use, modify, and distribute.

---

## 📬 Contact

<div align="center">

[![GitHub](https://img.shields.io/badge/GitHub-%40hacker1514-0f172a?style=for-the-badge&logo=github&logoColor=white&labelColor=10b981)](https://github.com/hacker1514)
[![Email](https://img.shields.io/badge/Email-hackerenvironment1514%40gmail.com-0f172a?style=for-the-badge&logo=gmail&logoColor=white&labelColor=06b6d4)](mailto:hackerenvironment1514@gmail.com)
[![WhatsApp](https://img.shields.io/badge/WhatsApp-%2B91%209515888385-0f172a?style=for-the-badge&logo=whatsapp&logoColor=white&labelColor=8b5cf6)](https://wa.me/919515888385)

</div>

---

<div align="center">

**Made with ❤️ by [Niranjan Kumar K](https://github.com/hacker1514) · KNI-ORG**

© 2026 Niranjan Kumar K. All rights reserved.

</div>

