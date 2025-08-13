#!/bin/bash
#
# Print banner art.

#######################################
# Print a board. 
# Globals:
#   BG_BROWN
#   NC
#   WHITE
#   CYAN_LIGHT
#   RED
#   GREEN
#   YELLOW
# Arguments:
#   None
#######################################
print_banner() {
  clear

  # Coleta informações do sistema
  local hostname=$(hostname)
  local os_info=$(lsb_release -ds 2>/dev/null || cat /etc/*release | grep PRETTY_NAME | head -1 | cut -d= -f2 | tr -d '"')
  local kernel=$(uname -r)
  local uptime=$(uptime -p)
  local cpu=$(lscpu | grep "Model name:" | sed 's/Model name:\s*//')

  printf "${RED}";
  printf "##  ###  ######   ##  ##   ######   ######\n";
  printf "## ###   ##  ##   ##  ##   ##  ##     ##\n";
  printf "####     ##       ######   ##  ##     ##\n";
  printf "####     ##       ##  ##   ######     ##\n";
  printf "## ###   ##  ##   ##  ##   ##  ##     ##\n";
  printf "##  ###  ######   ##  ##   ##  ##     ##\n";

  printf "\n"
  printf "${YELLOW}------------------------------------------------------------------------------${GRAY_LIGHT}\n"
  printf "\n"
  
  # Mostra as infos coletadas
  printf "${YELLOW}Hostname:${NC}       %s\n" "$hostname"
  printf "${YELLOW}Sistema:${NC}        %s\n" "$os_info"
  printf "${YELLOW}Kernel:${NC}         %s\n" "$kernel"
  printf "${YELLOW}Uptime:${NC}         %s\n" "$uptime"
  printf "${YELLOW}CPU:${NC}            %s\n" "$cpu"

  printf "\n"
  printf "${YELLOW}------------------------------------------------------------------------------${GRAY_LIGHT}\n"

  printf "${NC}";

  printf "\n"
}
