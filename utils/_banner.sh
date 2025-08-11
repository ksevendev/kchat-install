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
  local mem_total=$(free -h | awk '/Mem:/ {print $2}')
  local disk_usage=$(df -h / | awk 'NR==2 {print $5}')
  local ip_addr=$(hostname -I | awk '{print $1}')

  printf "${RED}";
  printf "##  ###  ######   ##  ##   ######   ######\n";
  printf "## ###   ##  ##   ##  ##   ##  ##     ##\n";
  printf "####     ##       ######   ##  ##     ##\n";
  printf "####     ##       ##  ##   ######     ##\n";
  printf "## ###   ##  ##   ##  ##   ##  ##     ##\n";
  printf "##  ###  ######   ##  ##   ##  ##     ##\n";

  printf "\n"
  printf "------------------------------------------------------------------------------"
  printf "\n"
  
  # Mostra as infos coletadas
  printf "${YELLOW}Hostname:${NC}       %s\n" "$hostname"
  printf "${YELLOW}Sistema:${NC}        %s\n" "$os_info"
  printf "${YELLOW}Kernel:${NC}         %s\n" "$kernel"
  printf "${YELLOW}Uptime:${NC}         %s\n" "$uptime"
  printf "${YELLOW}CPU:${NC}            %s\n" "$cpu"
  printf "${YELLOW}Memória Total:${NC}  %s\n" "$mem_total"
  printf "${YELLOW}Uso Disco /:${NC}    %s\n" "$disk_usage"
  printf "${YELLOW}IP Principal:${NC}   %s\n" "$ip_addr"

  printf "\n"
  printf "------------------------------------------------------------------------------"
  printf "\n"

  printf "${CYAN_LIGHT}2025 @ Todos os direitos reservados a https://kseven.dev.br${NC}\n\n"

  printf "${NC}";

  printf "\n"
}
