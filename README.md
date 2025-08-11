# Instalação
Simples...

## VPS/Dedicado (Min)
    Ubuntu 20.04
    4 CPUs
    6GB RAM

## Outros
    1 Dominio Exemplo:
    - api.seudominio.com.br (APONTA VIA DNS/CLOUDFLARE)
    - app.seudominio.com.br (APONTA VIA DNS/CLOUDFLARE)

## Programas
    Baixar SSH Clinet -> https://www.putty.org/
    Obs.: Funciona com outros também!

--------


Atenção: Siga as instruções para entender onde e quando utilizar os links
abaixo, é super simples de instalar, basta ter muita atenção.


## 01 - Atualizar o servidor:
    apt update
    apt upgrade

## 02 - Instalação do AAPANEL:
    wget -O install.sh http://www.aapanel.com/script/install-ubuntu_6.0_en.sh && sudo bash install.sh aapanel

## 03 - Acessando o AAPanel:
    Seguindo os dados fornecido via SSH/Linha de comando.
        Exemplo: http://seu_ip:35101/%CODE% -> A porta pode ser outra.
    Apos acesar:
        Menu -> Files 
            Acesse a pasta "home"
        Abra o terminal, logue no SSH do ser servidor com os dados.

## 04 - Execute os comandos:
    
    git clone https://github.com/ksevendev/kchat-install.git

    **Login: ksevendev
    **Senha: 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

    Dê permissão root: 
        chmod -R 777 kchat-install

    Depois acesse a pasta do instalador:
        cd KChatInstall

    Para uma instalação nova execute:
        ./install_primaria
    
    * Para uma instalação secundaria execute:
        ./install_instancia

    Vai exibir um menu:
        [0] Instalar
        [1] Atualizar
        [2] Deletar
        [3] Bloquear
        [4] Desbloquear
        [5] Alterar domínio

    - Aperte "0" e enter para fazer a instalação, mas você pode usar as demais opções para gerenciar como desejar posteriormente.
    
### 05 - Informações/Links solicitados:

    - 05.1 - Digite a senha do banco de dados (PostGres) -> Sem caracteres especiais
    - 05.2 - Digite o link do Código-Fonte
        - https://github.com/ksevendev/kchat.git
    - 05.3 - Digite o nome da empresa (instancia) -> sem espaço, caracteres especiais e letras maiúsculas (*Cada instancia um nome diferente. )
    - 05.4 - Digite a quantidade de conexões (Para dono 9999)
    - 05.5 - Digite a quantidade de usuários atendentes (Para dono 9999)
    - 05.6 - Digite o domínio frontend (Exemplo.: app.seudominio.com.br)
    - 05.7 - Digite o domínio backend (Exemplo.: api.seudominio.com.br)
    - 05.8 - Digite a porta do frontend (3000 - 3999) -> *Cada instancia uma porta diferente. 
        - Para primeira instalação recomendamos: 3000
    - 05.9 - Digite a porta do backend (4000 - 4999) -> *Cada instancia uma porta diferente. 
        - Para primeira instalação recomendamos: 4000
    - 05.10 - Digite a porta do REDIS/AGND (5000 - 5999) -> *Cada instancia uma porta diferente. 
        - Para primeira instalação recomendamos: 5000

SO AGUARDA, **CASO SOLICITAR LOGIN E SENHA USE A MESMA ANTERIORMENTE!

-------------------------------------

### Comandos extras após instalação:
    npx sequelize db:migrate
    su deploy
    pm2 restart all

-------------------------------------

#### Código-Fonte - Original: 
    https://github.com/atendechat/atendechat-novo.git

#### Instalador - Original: 
    git clone https://github.com/atendechat/atendechat-instalador.git
Permissão root: chmod -R 777 atendechat-instalador

#### Usuario de token - Original:
    Usuário: atendechat
    Senha: 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
    
    
