#!/bin/bash



# Detalles
# Version=1.0



# Verificaciones
if ! command -v tput &> /dev/null; then
    echo "Error: 'tput' no está instalado. Este script requiere 'tput' para funcionar correctamente."
    exit 1
fi



# Configuración
# Usar MODE existente si está definido, sino usar "light" como valor por defecto
MODE="${MODE:-light}"



# Colores básicos
BLACK=$(tput setaf 0)           # Negro
RED=$(tput setaf 1)             # Rojo
GREEN=$(tput setaf 2)           # Verde
YELLOW=$(tput setaf 3)          # Amarillo
BLUE=$(tput setaf 4)            # Azul
MAGENTA=$(tput setaf 5)         # Magenta
CYAN=$(tput setaf 6)            # Cyan
WHITE=$(tput setaf 7)           # Blanco
LIGHT_BLACK=$(tput setaf 8)     # Azul claro
LIGHT_RED=$(tput setaf 9)       # Rojo claro
LIGHT_GREEN=$(tput setaf 10)    # Verde claro
LIGHT_YELLOW=$(tput setaf 11)   # Amarillo claro
LIGHT_BLUE=$(tput setaf 12)     # Azul claro
LIGHT_MAGENTA=$(tput setaf 13)  # Magenta
LIGHT_CYAN=$(tput setaf 14)     # Cyan
LIGHT_WHITE=$(tput setaf 15)    # Blanco
# Colores de fondo
BG_BLACK=$(tput setab 0)            # Fondo negro
BG_RED=$(tput setab 1)              # Fondo rojo
BG_GREEN=$(tput setab 2)            # Fondo verde
BG_YELLOW=$(tput setab 3)           # Fondo amarillo
BG_BLUE=$(tput setab 4)             # Fondo azul
BG_MAGENTA=$(tput setab 5)          # Fondo magenta
BG_CYAN=$(tput setab 6)             # Fondo cyan
BG_WHITE=$(tput setab 7)            # Fondo blanco
BG_LIGHT_BLACK=$(tput setab 8)      # Fondo negro claro
BG_LIGHT_RED=$(tput setab 9)        # Fondo rojo claro
BG_LIGHT_GREEN=$(tput setab 10)     # Fondo verde claro
BG_LIGHT_YELLOW=$(tput setab 11)    # Fondo amarillo claro
BG_LIGHT_BLUE=$(tput setab 12)      # Fondo azul claro
BG_LIGHT_MAGENTA=$(tput setab 13)   # Fondo magenta claro
BG_LIGHT_CYAN=$(tput setab 14)      # Fondo cyan claro
BG_LIGHT_WHITE=$(tput setab 15)     # Fondo blanco claro
# Variaciones
NONE=$(tput sgr0)                   # Resetear color
BOLD=$(tput bold)                   # Texto en negrita
UNDERLINE=$(tput smul)              # Texto subrayado
BLINK=$(tput blink)                 # Texto parpadeante



# preset
TEXT_COLOR=$WHITE
INFO_COLOR=$BG_BLUE
WARN_COLOR=$BG_YELLOW
ERROR_COLOR=$BG_RED



# mode
if [ "$MODE" = "light" ]; then
    TEXT_COLOR="$BLACK"
else
    TEXT_COLOR="$WHITE"
fi



# Logs
function log() {
    local type="$1"
    local message="$2"
    local bg_color="$NONE"
    local text_color="$TEXT_COLOR"

    case "$type" in
        "info")
            bg_color="$BG_BLUE"
            LOG_TYPE="INFO"
            ;;
        "warn")
            bg_color="$BG_YELLOW"
            LOG_TYPE="WARNING"
            ;;
        "error")
            bg_color="$BG_RED"
            LOG_TYPE="ERROR"
            ;;
        "success")
            bg_color="$BG_GREEN"
            LOG_TYPE="SUCCESS"
            ;;
        "debug")
            bg_color="$BG_LIGHT_BLACK"
            text_color="$LIGHT_CYAN"
            LOG_TYPE="DEBUG"
            ;;
        *)
            bg_color="$NONE"
            ;;
    esac
    printf "%s %s%s%s %s\n" "$(date)" "$bg_color$text_color" " $LOG_TYPE " "$NONE" "$message"
}


# Text color functions
function black () {
    printf "${BLACK}$1${NONE}"
}
function red () {
    printf "${RED}$1${NONE}"
}
function green () {
    printf "${GREEN}$1${NONE}"
}
function yellow () {
    printf "${YELLOW}$1${NONE}"
}
function blue () {
    printf "${BLUE}$1${NONE}"
}
function magenta () {
    printf "${MAGENTA}$1${NONE}"
}
function cyan () {
    printf "${CYAN}$1${NONE}"
}
function white () {
    printf "${WHITE}$1${NONE}"
}
function lightBlack () {
    printf "${LIGHT_BLACK}$1${NONE}"
}
function lightRed () {
    printf "${LIGHT_RED}$1${NONE}"
}
function lightGreen () {
    printf "${LIGHT_GREEN}$1${NONE}"
}
function lightYellow () {
    printf "${LIGHT_YELLOW}$1${NONE}"
}
function lightBlue () {
    printf "${LIGHT_BLUE}$1${NONE}"
}
function lightMagenta () {
    printf "${LIGHT_MAGENTA}$1${NONE}"
}
function lightCyan () {
    printf "${LIGHT_CYAN}$1${NONE}"
}
function lightWhite () {
    printf "${LIGHT_WHITE}$1${NONE}"
}
# Background color functions
function bgBlack () {
    printf "${BG_BLACK}${TEXT_COLOR}$1${NONE}"
}
function bgRed () {
    printf "${BG_RED}${TEXT_COLOR}$1${NONE}"
}
function bgGreen () {
    printf "${BG_GREEN}${TEXT_COLOR}$1${NONE}"
}
function bgYellow () {
    printf "${BG_YELLOW}${TEXT_COLOR}$1${NONE}"
}
function bgBlue () {
    printf "${BG_BLUE}${TEXT_COLOR}$1${NONE}"
}
function bgMagenta () {
    printf "${BG_MAGENTA}${TEXT_COLOR}$1${NONE}"
}
function bgCyan () {
    printf "${BG_CYAN}${TEXT_COLOR}$1${NONE}"
}
function bgWhite () {
    printf "${BG_WHITE}${TEXT_COLOR}$1${NONE}"
}
function bgLightBlack () {
    printf "${BG_LIGHT_BLACK}${TEXT_COLOR}$1${NONE}"
}
function bgLightRed () {
    printf "${BG_LIGHT_RED}${TEXT_COLOR}$1${NONE}"
}
function bgLightGreen () {
    printf "${BG_LIGHT_GREEN}${TEXT_COLOR}$1${NONE}"
}
function bgLightYellow () {
    printf "${BG_LIGHT_YELLOW}${TEXT_COLOR}$1${NONE}"
}
function bgLightBlue () {
    printf "${BG_LIGHT_BLUE}${TEXT_COLOR}$1${NONE}"
}
function bgLightMagenta () {
    printf "${BG_LIGHT_MAGENTA}${TEXT_COLOR}$1${NONE}"
}
function bgLightCyan () {
    printf "${BG_LIGHT_CYAN}${TEXT_COLOR}$1${NONE}"
}
function bgLightWhite () {
    printf "${BG_LIGHT_WHITE}${TEXT_COLOR}$1${NONE}"
}

