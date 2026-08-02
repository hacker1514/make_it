#!/bin/bash

BLUE="\033[34m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} Welcome To ${YELLOW}Make It Setup ${RESET}"
echo -e "${CYAN} Developer : ${MAGENTA}Niranjan Kumar K ${RESET}"
echo -e "${CYAN} Version   : ${RED}1.0 ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Setting up...${RESET}"

# Create install directory
mkdir -p "$HOME/.makeit" >/dev/null 2>&1

# Download the Make It binary
curl -L https://kni-org-make-it.netlify.app/linux/make_it_linux -o "$HOME/.makeit/makeit" >/dev/null 2>&1
chmod +x "$HOME/.makeit/makeit" >/dev/null 2>&1

# Create symlink in /usr/local/bin
sudo ln -sf "$HOME/.makeit/makeit" /usr/local/bin/makeit >/dev/null 2>&1

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${CYAN}Groq API Key Configuration${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Enter your Groq API Key:${RESET}"
echo -e "${YELLOW}Get one free at ${CYAN}https://console.groq.com/keys${RESET}"

read -s -p "Groq API Key : " API_KEY
echo

# Trim whitespace
API_KEY="$(echo -e "${API_KEY}" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"

if [ -z "$API_KEY" ]; then
    echo -e "${RED}[ERROR] API key cannot be empty.${RESET}"
    exit 1
fi

# Validate the API key against the Groq API
echo -e "${YELLOW}Validating API key...${RESET}"
HTTP_CODE=$(curl -s -o /tmp/makeit_validate.json -w "%{http_code}" -H "Authorization: Bearer $API_KEY" https://api.groq.com/openai/v1/models)

if [ "$HTTP_CODE" = "200" ]; then
    echo -e "${GREEN}API key validated successfully!${RESET}"
else
    echo -e "${RED}[ERROR] Invalid API key (HTTP $HTTP_CODE). Please check your key.${RESET}"
    rm -f /tmp/makeit_validate.json
    exit 1
fi
rm -f /tmp/makeit_validate.json

# Store the API key in api.json inside the Make It directory
cat > "$HOME/.makeit/api.json" <<EOF
{
  "api_key": "$API_KEY"
}
EOF

echo ""
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} Make It Installed Successfully ! ${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo ""
echo -e "${GREEN}API key saved to ~/.makeit/api.json${RESET}"
echo -e "${YELLOW}Run: ${CYAN}makeit${RESET}"
echo -e "${YELLOW}You will not be asked for the key again.${RESET}"
echo -e "${YELLOW}To reset: delete ~/.makeit/api.json${RESET}"

rm -- "$0" >/dev/null 2>&1
