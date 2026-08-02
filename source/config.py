import os
import json

DEFAULT_MODEL = "llama-3.3-70b-versatile"

MAX_TOKENS = 8192
TEMPERATURE = 0.2

AGENT_NAME = "make it"
ORG_NAME = "Kni-org"

MAX_ITERATIONS = 40

WORKING_DIR = os.getcwd()

HOME_DIR = os.path.expanduser("~")
SESSION_DIR = os.path.join(HOME_DIR, ".make_it")
HISTORY_FILE = os.path.join(SESSION_DIR, "history.json")
API_FILE = os.path.join(SESSION_DIR, "api.json")

os.makedirs(SESSION_DIR, exist_ok=True)

API_KEY = ""

if os.path.exists(API_FILE):
    try:
        with open(API_FILE, "r", encoding="utf-8") as f:
            data = json.load(f)
            API_KEY = data.get("api_key", "")
    except Exception:
        API_KEY = ""