import os

AGENT_NAME = "make it"
ORG_NAME = "Kni-org"

MAX_ITERATIONS = 40

WORKING_DIR = os.getcwd()

HOME_DIR = os.path.expanduser("~")
SESSION_DIR = os.path.join(HOME_DIR, ".make_it")
HISTORY_FILE = os.path.join(SESSION_DIR, "history.json")

os.makedirs(SESSION_DIR, exist_ok=True)

AI_PRIMARY_PATH = r"C:\kni\edx.py"
AI_SECONDARY_PATH = r"C:\nia\ai.py"