from __future__ import annotations

import os
import sys
from typing import Any

from groq import Groq
from rich.console import Console

sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
import config

console = Console()

_client: Groq | None = None


def _build_client() -> Groq:
    if not config.API_KEY:
        console.print(
            f"\n[bold red]✗ API key is not set.[/bold red]\n"
            f"  Open [cyan]{config.API_FILE}[/cyan] and add your Groq API key.\n"
        )
        sys.exit(1)

    return Groq(api_key=config.API_KEY)


def get_client() -> Groq:
    global _client
    if _client is None:
        _client = _build_client()
    return _client


def chat_completion(
    messages: list[dict],
    tools: list[dict] | None = None,
) -> dict:
    client = get_client()

    kwargs: dict[str, Any] = {
        "model": config.DEFAULT_MODEL,
        "messages": messages,
        "max_tokens": config.MAX_TOKENS,
        "temperature": config.TEMPERATURE,
    }
    if tools:
        kwargs["tools"] = tools
        kwargs["tool_choice"] = "auto"

    response = client.chat.completions.create(**kwargs)

    choice = response.choices[0]
    msg = choice.message

    result: dict[str, Any] = {
        "role": "assistant",
        "content": msg.content or "",
    }
    if hasattr(msg, "tool_calls") and msg.tool_calls:
        result["tool_calls"] = [
            {
                "id": tc.id,
                "type": "function",
                "function": {
                    "name": tc.function.name,
                    "arguments": tc.function.arguments,
                },
            }
            for tc in msg.tool_calls
        ]
    return result

