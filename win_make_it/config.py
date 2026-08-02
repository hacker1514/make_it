import os
import sys

ENV_VAR_NAME = "AI_API_KEY"

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

API_KEY = os.environ.get(ENV_VAR_NAME, "")