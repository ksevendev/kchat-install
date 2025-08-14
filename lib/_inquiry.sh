#!/bin/bash

get_mysql_root_password_old() {
  
  print_banner
  printf "${WHITE} 💻 Insira senha para o usuario Deploy e Banco de Dados (Não utilizar caracteres especiais):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " mysql_root_password
}

read_input() {
  local prompt="$1"
  local regex="$2"
  local hide_input="$3"
  local input_var

  while true; do
    print_banner
    printf "${WHITE} 💻 ${prompt}${GRAY_LIGHT}\n"
    
    if [[ "$hide_input" == "true" ]]; then
      read -s -p "> " input_var
      echo
    else
      read -p "> " input_var
    fi
    
    if [[ -z "$input_var" ]]; then
      printf "${RED}⚠️ Entrada não pode ser vazia. Tente novamente.${GRAY_LIGHT}\n"
      continue
    fi
    
    if [[ -n "$regex" ]] && ! [[ "$input_var" =~ $regex ]]; then
      printf "${RED}⚠️ Entrada inválida. Por favor, tente novamente.${GRAY_LIGHT}\n"
      continue
    fi

    echo "$input_var"
    break
  done
}

confirm_inputs() {
  print_banner
  printf "${WHITE}🚀 Confirme as informações antes de prosseguir:\n"
  printf "🔐 Senha BD: ********\n"
  printf "🏢 Instância: %s\n" "$instancia_add"
  printf "📞 Max Whats: %s\n" "$max_whats"
  printf "👤 Max Usuários: %s\n" "$max_user"
  printf "📦 GitHub: %s\n" "$link_git"
  printf "🌐 Frontend URL: %s\n" "$frontend_url"
  printf "🌐 Backend URL: %s\n" "$backend_url"
  printf "🔌 Frontend Porta: %s\n" "$frontend_port"
  printf "🔌 Backend Porta: %s\n" "$backend_port"
  printf "🔌 Redis Porta: %s\n" "$redis_port"
  printf "\nDeseja continuar? (s/n): "
  read -r confirm

  if [[ ! "$confirm" =~ ^[Ss]$ ]]; then
    printf "${YELLOW}Instalação cancelada pelo usuário.${GRAY_LIGHT}\n"
    exit 1
  fi
}

get_mysql_root_password() {
  print_banner
  printf "${WHITE} 💻 Insira senha para o usuario Deploy e Banco de Dados (sem caracteres especiais):${GRAY_LIGHT}\n"
  
  while true; do
    read -s -p "> " mysql_root_password
    echo
    if [[ -z "$mysql_root_password" ]]; then
      printf "${RED}⚠️ A senha não pode ser vazia. Tente novamente.${GRAY_LIGHT}\n"
    elif [[ "$mysql_root_password" =~ [^a-zA-Z0-9] ]]; then
      printf "${RED}⚠️ Caracteres especiais não são permitidos. Use apenas letras e números.${GRAY_LIGHT}\n"
    else
      break
    fi
  done
}

get_link_git() {
  
  print_banner
  printf "${WHITE} 💻 Insira o link do GITHUB do seu KChat que deseja instalar:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " link_git
}

get_instancia_add() {
  
  print_banner
  printf "${WHITE} 💻 Informe um nome para a Instancia/Empresa que será instalada (Não utilizar espaços ou caracteres especiais, Utilizar Letras minusculas; ):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " instancia_add
}

get_max_whats() {
  
  print_banner
  printf "${WHITE} 💻 Informe a Qtde de Conexões/Whats que a ${instancia_add} poderá cadastrar:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " max_whats
}

get_max_user() {
  
  print_banner
  printf "${WHITE} 💻 Informe a Qtde de Usuarios/Atendentes que a ${instancia_add} poderá cadastrar:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " max_user
}

get_frontend_url() {
  
  print_banner
  printf "${WHITE} 💻 Digite o domínio do FRONTEND/PAINEL para a ${instancia_add}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_url
}

get_backend_url() {
  
  print_banner
  printf "${WHITE} 💻 Digite o domínio do BACKEND/API para a ${instancia_add}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_url
}

get_frontend_port() {
  
  print_banner
  printf "${WHITE} 💻 Digite a porta do FRONTEND para a ${instancia_add}; Ex: 3000 A 3999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " frontend_port
}


get_backend_port() {
  
  print_banner
  printf "${WHITE} 💻 Digite a porta do BACKEND para esta instancia; Ex: 4000 A 4999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " backend_port
}

get_redis_port() {
  
  print_banner
  printf "${WHITE} 💻 Digite a porta do REDIS/AGENDAMENTO MSG para a ${instancia_add}; Ex: 5000 A 5999 ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " redis_port
}

get_empresa_delete() {
  
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que será Deletada (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_delete
}

get_empresa_atualizar() {
  
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Atualizar (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_atualizar
}

get_empresa_bloquear() {
  
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Bloquear (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_bloquear
}

get_empresa_desbloquear() {
  
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Desbloquear (Digite o mesmo nome de quando instalou):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_desbloquear
}

get_empresa_dominio() {
  
  print_banner
  printf "${WHITE} 💻 Digite o nome da Instancia/Empresa que deseja Alterar os Dominios (Atenção para alterar os dominios precisa digitar os 2, mesmo que vá alterar apenas 1):${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " empresa_dominio
}

get_alter_frontend_url() {
  
  print_banner
  printf "${WHITE} 💻 Digite o NOVO domínio do FRONTEND/PAINEL para a ${empresa_dominio}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_frontend_url
}

get_alter_backend_url() {
  
  print_banner
  printf "${WHITE} 💻 Digite o NOVO domínio do BACKEND/API para a ${empresa_dominio}:${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_backend_url
}

get_alter_frontend_port() {
  
  print_banner
  printf "${WHITE} 💻 Digite a porta do FRONTEND da Instancia/Empresa ${empresa_dominio}; A porta deve ser o mesma informada durante a instalação ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_frontend_port
}

get_alter_backend_port() {
  
  print_banner
  printf "${WHITE} 💻 Digite a porta do BACKEND da Instancia/Empresa ${empresa_dominio}; A porta deve ser o mesma informada durante a instalação ${GRAY_LIGHT}"
  printf "\n\n"
  read -p "> " alter_backend_port
}

check_dependencies() {
  print_banner
  printf "${WHITE}🔍 Verificando dependências básicas e status da instalação...${GRAY_LIGHT}\n\n"

  local dependencies=("nginx" "mysql-server" "redis-server" "nodejs" "npm" "git" "unzip")
  local missing=()

  for pkg in "${dependencies[@]}"; do
    if dpkg -s "$pkg" &> /dev/null; then
      printf "${GREEN}✔ %s está instalado${GRAY_LIGHT}\n" "$pkg"
    else
      printf "${RED}✘ %s NÃO está instalado${GRAY_LIGHT}\n" "$pkg"
      missing+=("$pkg")
    fi
  done

  if [ ${#missing[@]} -eq 0 ]; then
    printf "\n${GREEN}Todas as dependências básicas estão instaladas!${GRAY_LIGHT}\n"
  else
    printf "\n${YELLOW}Pacotes faltando: %s${GRAY_LIGHT}\n" "${missing[*]}"
    printf "Deseja instalar os pacotes faltantes agora? (s/n): "
    read -r resposta
    if [[ "$resposta" =~ ^[Ss]$ ]]; then
      printf "${WHITE}Instalando pacotes faltantes...${GRAY_LIGHT}\n"
      sudo apt-get update
      sudo apt-get install -y "${missing[@]}"
      printf "${GREEN}Instalação concluída!${GRAY_LIGHT}\n"
    else
      printf "${YELLOW}Instalação cancelada pelo usuário.${GRAY_LIGHT}\n"
    fi
  fi

  # Exibir status dos serviços importantes (exemplo nginx e mysql)
  printf "\n${WHITE}Status dos serviços principais:${GRAY_LIGHT}\n"
  for service in nginx mysql redis; do
    systemctl is-active --quiet "$service"
    if [ $? -eq 0 ]; then
      printf "${GREEN}✔ Serviço %s está ativo${GRAY_LIGHT}\n" "$service"
    else
      printf "${RED}✘ Serviço %s não está ativo${GRAY_LIGHT}\n" "$service"
    fi
  done

  printf "\nPressione Enter para voltar ao menu..."
  read -r
}

check_extra_dependencies() {
  print_banner
  printf "${WHITE}🔍 Verificando libs e dependências extras...${GRAY_LIGHT}\n\n"

  local extra_packages=(
    libxshmfence-dev libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgcc-s1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
    nodejs
  )
  local missing=()

  for pkg in "${extra_packages[@]}"; do
    if dpkg -s "$pkg" &> /dev/null; then
      printf "${GREEN}✔ %s instalado${GRAY_LIGHT}\n" "$pkg"
    else
      printf "${RED}✘ %s NÃO instalado${GRAY_LIGHT}\n" "$pkg"
      missing+=("$pkg")
    fi
  done

  if [ ${#missing[@]} -eq 0 ]; then
    printf "\n${GREEN}Todas as dependências extras estão instaladas!${GRAY_LIGHT}\n"
  else
    printf "\n${YELLOW}Pacotes faltando: %s${GRAY_LIGHT}\n" "${missing[*]}"
    printf "Deseja instalar os pacotes faltantes agora? (s/n): "
    read -r resposta
    if [[ "$resposta" =~ ^[Ss]$ ]]; then
      printf "${WHITE}Instalando pacotes faltantes...${GRAY_LIGHT}\n"
      sudo apt-get update
      sudo apt-get install -y "${missing[@]}"
      printf "${GREEN}Instalação concluída!${GRAY_LIGHT}\n"
    else
      printf "${YELLOW}Instalação cancelada pelo usuário.${GRAY_LIGHT}\n"
    fi
  fi

  printf "\nPressione Enter para voltar ao menu..."
  read -r
}

check_all_dependencies() {
  print_banner
  printf "${WHITE}🔍 Verificando todas as dependências básicas e extras...${GRAY_LIGHT}\n\n"

  local basic_packages=(nginx mysql-server redis-server nodejs npm git unzip)
  local extra_packages=(
    libxshmfence-dev libgbm-dev wget unzip fontconfig locales gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils
  )

  local missing_basic=()
  local missing_extra=()

  # Checa básicos
  for pkg in "${basic_packages[@]}"; do
    if ! dpkg -s "$pkg" &> /dev/null; then
      printf "${RED}✘ Pacote básico %s NÃO está instalado${GRAY_LIGHT}\n" "$pkg"
      missing_basic+=("$pkg")
    else
      printf "${GREEN}✔ Pacote básico %s instalado${GRAY_LIGHT}\n" "$pkg"
    fi
  done

  printf "\n"

  # Checa extras
  for pkg in "${extra_packages[@]}"; do
    if ! dpkg -s "$pkg" &> /dev/null; then
      printf "${RED}✘ Biblioteca extra %s NÃO está instalada${GRAY_LIGHT}\n" "$pkg"
      missing_extra+=("$pkg")
    else
      printf "${GREEN}✔ Biblioteca extra %s instalada${GRAY_LIGHT}\n" "$pkg"
    fi
  done

  printf "\n"

  # Instalar básicos se faltando
  if [ ${#missing_basic[@]} -ne 0 ]; then
    printf "${YELLOW}Pacotes básicos faltando: %s${GRAY_LIGHT}\n" "${missing_basic[*]}"
    printf "Deseja instalar os pacotes básicos faltantes agora? (s/n): "
    read -r resposta_basic
    if [[ "$resposta_basic" =~ ^[Ss]$ ]]; then
      printf "${WHITE}Instalando pacotes básicos...${GRAY_LIGHT}\n"
      sudo apt-get update
      sudo apt-get install -y "${missing_basic[@]}"
      printf "${GREEN}Pacotes básicos instalados com sucesso!${GRAY_LIGHT}\n"
    else
      printf "${YELLOW}Instalação dos pacotes básicos cancelada.${GRAY_LIGHT}\n"
    fi
  else
    printf "${GREEN}Todas as dependências básicas já estão instaladas!${GRAY_LIGHT}\n"
  fi

  printf "\n"

  # Instalar extras se faltando
  if [ ${#missing_extra[@]} -ne 0 ]; then
    printf "${YELLOW}Bibliotecas extras faltando: %s${GRAY_LIGHT}\n" "${missing_extra[*]}"
    printf "Deseja instalar as bibliotecas extras faltantes agora? (s/n): "
    read -r resposta_extra
    if [[ "$resposta_extra" =~ ^[Ss]$ ]]; then
      printf "${WHITE}Instalando bibliotecas extras...${GRAY_LIGHT}\n"
      sudo apt-get update
      sudo apt-get install -y "${missing_extra[@]}"
      printf "${GREEN}Bibliotecas extras instaladas com sucesso!${GRAY_LIGHT}\n"
    else
      printf "${YELLOW}Instalação das bibliotecas extras cancelada.${GRAY_LIGHT}\n"
    fi
  else
    printf "${GREEN}Todas as bibliotecas extras já estão instaladas!${GRAY_LIGHT}\n"
  fi

  # Status dos serviços principais
  printf "\n${WHITE}Status dos serviços principais:${GRAY_LIGHT}\n"
  for service in nginx mysql redis; do
    if systemctl is-active --quiet "$service"; then
      printf "${GREEN}✔ Serviço %s está ativo${GRAY_LIGHT}\n" "$service"
    else
      printf "${RED}✘ Serviço %s não está ativo${GRAY_LIGHT}\n" "$service"
    fi
  done

  printf "\nPressione Enter para voltar ao menu..."
  read -r
}

check_environment() {
  print_banner
  printf "${WHITE}🛡️ Verificando ambiente para instalação e uso...${GRAY_LIGHT}\n\n"

  # Reaproveita check_all_dependencies para dependências
  check_all_dependencies

  # Verifica se portas essenciais estão livres (exemplo 80, 443, 3000, 4000)
  local ports=(80 443 3000 4000)
  for port in "${ports[@]}"; do
    if sudo lsof -i:"$port" &>/dev/null; then
      printf "${RED}⚠️ Porta %d já está em uso. Pode causar conflito.${GRAY_LIGHT}\n" "$port"
    else
      printf "${GREEN}✔ Porta %d está livre.${GRAY_LIGHT}\n" "$port"
    fi
  done

  # Verifica status dos serviços (nginx, mysql, redis)
  for service in nginx mysql redis; do
    if systemctl is-active --quiet "$service"; then
      printf "${GREEN}✔ Serviço %s está ativo${GRAY_LIGHT}\n" "$service"
    else
      printf "${YELLOW}⚠️ Serviço %s não está ativo (recomendado ativar)${GRAY_LIGHT}\n" "$service"
    fi
  done

  printf "\nPressione Enter para voltar ao menu..."
  read -r
}

check_vps_requirements() {
  print_banner
  printf "${WHITE}📊 Verificando requisitos mínimos da VPS...${GRAY_LIGHT}\n\n"

  # Checar CPU cores
  local cpu_cores
  cpu_cores=$(nproc)
  printf "🧮 Cores de CPU disponíveis: %d\n" "$cpu_cores"
  if (( cpu_cores < 2 )); then
    printf "${YELLOW}⚠️ Recomenda-se ao menos 2 cores para bom desempenho.${GRAY_LIGHT}\n"
  else
    printf "${GREEN}✔ CPU atende o requisito mínimo.${GRAY_LIGHT}\n"
  fi

  # Checar RAM disponível em MB
  local ram_mb
  ram_mb=$(free -m | awk '/^Mem:/ {print $2}')
  printf "💾 Memória RAM total: %d MB\n" "$ram_mb"
  if (( ram_mb < 2048 )); then
    printf "${YELLOW}⚠️ Recomendado ao menos 2GB de RAM para KChat.${GRAY_LIGHT}\n"
  else
    printf "${GREEN}✔ RAM atende o requisito mínimo.${GRAY_LIGHT}\n"
  fi

  # Checar espaço em disco na partição root (em GB)
  local disk_gb
  disk_gb=$(df -BG / | tail -1 | awk '{print $4}' | sed 's/G//')
  printf "🗄️ Espaço livre em disco (raiz): %d GB\n" "$disk_gb"
  if (( disk_gb < 10 )); then
    printf "${YELLOW}⚠️ Recomenda-se pelo menos 10GB livres para instalação.${GRAY_LIGHT}\n"
  else
    printf "${GREEN}✔ Espaço em disco atende o requisito mínimo.${GRAY_LIGHT}\n"
  fi

  # Checar versão do sistema
  local os_version
  os_version=$(lsb_release -d | awk -F"\t" '{print $2}')
  printf "🖥️ Sistema operacional: %s\n" "$os_version"

  printf "\nPressione Enter para voltar ao menu..."
  read -r
}

get_urls() {
  get_mysql_root_password
  get_link_git
  get_instancia_add
  get_max_whats
  get_max_user
  get_frontend_url
  get_backend_url
  get_frontend_port
  get_backend_port
  get_redis_port
}

software_update() {
  get_empresa_atualizar
  frontend_update
  backend_update
}

software_delete() {
  get_empresa_delete
  deletar_tudo
}

software_bloquear() {
  get_empresa_bloquear
  configurar_bloqueio
}

software_desbloquear() {
  get_empresa_desbloquear
  configurar_desbloqueio
}

software_dominio() {
  get_empresa_dominio
  get_alter_frontend_url
  get_alter_backend_url
  get_alter_frontend_port
  get_alter_backend_port
  configurar_dominio
}

install_without_aapanel() {
  print_banner
  printf "${WHITE} 🚀 Iniciando instalação do KChat sem AAPanel...${GRAY_LIGHT}\n\n"

  # Atualiza pacotes
  sudo apt update && sudo apt upgrade -y

  # Instala pacotes básicos
  sudo apt install -y nginx mysql-server redis-server nodejs npm git unzip

  # Aqui você pode colocar o mesmo fluxo da função 0) get_urls para configurar o KChat
  get_urls
  
  printf "${GREEN}✅ Instalação sem AAPanel concluída com sucesso!${GRAY_LIGHT}\n"
}

upgrade_vps() {
  print_banner
  printf "${WHITE} 🚀Atualizando servidor...${GRAY_LIGHT}\n\n"
  sudo apt update && sudo apt upgrade -y
}

install_aapanel() {
  print_banner
  printf "${WHITE} 🚀 Iniciando instalação do AAPanel...${GRAY_LIGHT}\n\n"
  wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel
}

enable_root_ssh() {
  print_banner
  printf "${WHITE}🔑 Configurando senha para root e habilitando login via SSH...${GRAY_LIGHT}\n\n"

  # Solicita nova senha para root
  printf "${CYAN}Digite a nova senha para o usuário root:${GRAY_LIGHT}\n"
  passwd root

  # Faz backup do sshd_config
  BACKUP_FILE="/etc/ssh/sshd_config.bak-$(date +%F_%H-%M-%S)"
  cp /etc/ssh/sshd_config "$BACKUP_FILE"
  printf "${GREEN}✔ Backup criado em: $BACKUP_FILE${GRAY_LIGHT}\n"

  # Altera configuração para permitir login root
  if grep -q "^PermitRootLogin" /etc/ssh/sshd_config; then
    sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config
  else
    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
  fi
  printf "${GREEN}✔ Configuração do SSH atualizada para permitir login root${GRAY_LIGHT}\n"

  # Reinicia serviço SSH
  if command -v systemctl &> /dev/null; then
    systemctl restart ssh || systemctl restart sshd
  else
    /etc/init.d/ssh restart || service ssh restart
  fi
  printf "${GREEN}🚀 Login root via SSH habilitado com sucesso!${GRAY_LIGHT}\n"
  
  printf "\nPressione Enter para voltar ao menu..."
  read -r
}

inquiry_options() {
  
  print_banner
  printf "${WHITE} 💻 Bem vindo(a) ao Gerenciador KChat, Selecione abaixo a proxima ação!${GRAY_LIGHT}"
  printf "\n\n"
  printf "${CYAN}   [0] 🔄 Atualizar servidor${GRAY_LIGHT}\n"
  printf "${CYAN}   [1] 🛠️ Instalar AAPanel${GRAY_LIGHT}\n"
  printf "${YELLOW}   -------------------${GRAY_LIGHT}\n"
  printf "${GREEN}   [2] 🚀 Instalar KChat (Com AAPanel)${GRAY_LIGHT}\n"
  printf "${GREEN}   [3] 🚀 Instalar KChat (Sem AAPanel)${GRAY_LIGHT}\n"
  printf "${YELLOW}   -------------------${GRAY_LIGHT}\n"
  printf "${MAGENTA}   [4] ⬆️ Atualizar KChat${GRAY_LIGHT}\n"
  printf "${MAGENTA}   [5] 🔒 Bloquear KChat${GRAY_LIGHT}\n"
  printf "${MAGENTA}   [6] 🔓 Desbloquear KChat${GRAY_LIGHT}\n"
  printf "${MAGENTA}   [7] 🌐 Alter. dominio KChat${GRAY_LIGHT}\n"
  printf "${MAGENTA}   [8] 🗑️ Deletar KChat${GRAY_LIGHT}\n"
  printf "${YELLOW}   -------------------${GRAY_LIGHT}\n"
  printf "${BLUE}   [9] ✅ Verificar dependências básicas${GRAY_LIGHT}\n"
  printf "${BLUE}   [10] 📦 Verificar e instalar libs e dependências extras${GRAY_LIGHT}\n"
  printf "${BLUE}   [11] 🔧 Verificar e instalar todas as dependências (básicas + extras)${GRAY_LIGHT}\n"
  printf "${CYAN}   [12] 🛡️ Checar ambiente para instalação e uso${GRAY_LIGHT}\n"
  printf "${CYAN}   [13] 📊 Verificar requisitos mínimos da VPS${GRAY_LIGHT}\n"
  printf "${YELLOW}   -------------------${GRAY_LIGHT}\n"
  printf "${MAGENTA}   [14] 🔑 Habilitar login root via SSH${GRAY_LIGHT}\n"
  printf "${YELLOW}   -------------------${GRAY_LIGHT}\n"
  printf "${RED}   [15] SAIR ${GRAY_LIGHT}\n"
  read -p "> " option

  case "${option}" in
    0)
      upgrade_vps
      inquiry_options
      #exit 
      ;;
    1)
      install_aapanel
      inquiry_options
      #exit 
      ;;
    2)
      get_urls 
      ;;
    3)
      install_without_aapanel
      exit 
      ;;
    4)
      software_update 
      exit
      ;;
    5)
      software_bloquear 
      exit
      ;;
    6)
      software_desbloquear 
      exit
      ;;
    7)
      software_dominio 
      exit
      ;; 
    8)
      software_delete 
      exit
      ;;
    9)
      check_dependencies
      inquiry_options
      ;;
    10)
      check_extra_dependencies
      inquiry_options
      ;;
    11)
      check_all_dependencies
      inquiry_options
      ;;
    12)
      check_environment
      inquiry_options
      ;;
    13)
      check_vps_requirements
      inquiry_options
      ;;
    14)
      enable_root_ssh
      inquiry_options
      ;;
    15)
      printf "${RED}Saindo... Até a próxima!${GRAY_LIGHT}\n"
      exit 
      ;;
    *) 
      printf "${YELLOW}Opção inválida. Saindo... Até a próxima!${GRAY_LIGHT}\n"
      exit ;;
  esac
}


