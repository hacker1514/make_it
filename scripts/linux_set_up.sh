#!/bin/bash

BLUE="\033[34m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
MAGENTA="\033[35m"
RED="\033[31m"
RESET="\033[0m"

echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN} Welcome To ${YELLOW}Make It Setup${RESET}"
echo -e "${CYAN} Developer : ${MAGENTA}Niranjan Kumar K${RESET}"
echo -e "${CYAN} Version   : ${RED}1.0${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Setting up...${RESET}"

mkdir -p "$HOME/.makeit"

curl -fsSL https://kni-org-make-it.netlify.app/linux/make_it_linux -o "$HOME/.makeit/makeit" || {
    echo -e "${RED}Download failed.${RESET}"
    exit 1
}

chmod +x "$HOME/.makeit/makeit"

if [ -w /usr/local/bin ]; then
    ln -sf "$HOME/.makeit/makeit" /usr/local/bin/makeit
else
    sudo ln -sf "$HOME/.makeit/makeit" /usr/local/bin/makeit
fi

echo
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${CYAN}Groq API Key Configuration${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${YELLOW}Enter your Groq API Key:${RESET}"
echo -e "${YELLOW}Get one free at ${CYAN}https://console.groq.com/keys${RESET}"

read -s -p "Groq API Key : " API_KEY
echo

API_KEY="$(printf "%s" "$API_KEY" | xargs)"

if [ -z "$API_KEY" ]; then
    echo -e "${RED}[ERROR] API key cannot be empty.${RESET}"
    exit 1
fi

echo -e "${YELLOW}Validating API key...${RESET}"

HTTP_CODE=$(curl -s -o /tmp/makeit_validate.json -w "%{http_code}" \
    -H "Authorization: Bearer $API_KEY" \
    https://api.groq.com/openai/v1/models)

if [ "$HTTP_CODE" != "200" ]; then
    echo -e "${RED}[ERROR] Invalid API key (HTTP $HTTP_CODE).${RESET}"
    rm -f /tmp/makeit_validate.json
    exit 1
fi

rm -f /tmp/makeit_validate.json

cat > "$HOME/.makeit/api.json" <<EOF
{
  "api_key": "$API_KEY"
}
EOF

echo
echo -e "${BLUE}----------------------------------------${RESET}"
echo -e "${GREEN}Make It Installed Successfully!${RESET}"
echo -e "${BLUE}----------------------------------------${RESET}"
echo
echo -e "${GREEN}API key saved to ~/.makeit/api.json${RESET}"
echo -e "${YELLOW}Run: ${CYAN}makeit${RESET}"
echo -e "${YELLOW}You will not be asked for the key again.${RESET}"
echo -e "${YELLOW}To reset: delete ~/.makeit/api.json${RESET}"

rm -- "$0" 2>/dev/null
