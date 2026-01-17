#!/bin/bash

source ./btk.sh

log debug "Asignando variables"
CONTAINER_NAME_PHP="php-sigacad2"
CONTAINER_NAME_POSTGRES="pgsql-sigacad2"
DATABASE_PAHT="./user"
DATABASE_SIGACAD2_NAME="sigacad2"
DATABASE_TEMPLATE_NAME="db"
POSTGRES_USER="postgres"

MESSAGE=""
WHILETO=false

show_menu() {
    echo "$(bgBlue " Menú de Configuración ")"
    echo "    i. $(lightGreen "Iniciar los contenedores")"
    echo "    s. $(lightGreen "Detener los contenedores")"
    echo "    b. $(lightBlue "Re-construir los contenedores")"
    echo "    db. $(lightRed "Restaurar la base de datos")"
    echo "    q. Salir"
    echo ""
    if [ -n "$MESSAGE" ]; then
        echo "$MESSAGE"
        MESSAGE=""
    fi
}

start_containers() {
    log debug "Iniciando los contenedores"
    podman-compose -p sigacad2 up -d
}

stop_containers() {
    log debug "Deteniendo los contenedores"
    podman-compose down
}

rebuild_containers() {
    log debug "Re-construyendo los contenedores"
    podman-compose down && podman-compose -p sigacad2 up -d --build
}

restore_database() {
    log debug "Restaurando la base de datos"
    if podman ps --format "{{.Names}}" | grep -q "^${CONTAINER_NAME_POSTGRES}$"; then
        podman exec ${CONTAINER_NAME_POSTGRES} psql -U ${POSTGRES_USER} -c "DROP DATABASE ${DATABASE_SIGACAD2_NAME};"
        podman exec ${CONTAINER_NAME_POSTGRES} psql -U ${POSTGRES_USER} -c "CREATE DATABASE ${DATABASE_SIGACAD2_NAME};"
        podman cp ${DATABASE_PAHT}/${DATABASE_TEMPLATE_NAME}.sql ${CONTAINER_NAME_POSTGRES}:/tmp/sigacad2.sql
        podman exec ${CONTAINER_NAME_POSTGRES} psql -U ${POSTGRES_USER} -d ${DATABASE_SIGACAD2_NAME} -f /tmp/sigacad2.sql
        podman exec ${CONTAINER_NAME_POSTGRES} pg_restore -U ${POSTGRES_USER} -d ${DATABASE_SIGACAD2_NAME} -C -v /tmp/finanzas.sql
    else
        MESSAGE="$(red "El contenedor ${CONTAINER_NAME_POSTGRES} no está en ejecución.")"
    fi
}


while true; do
    show_menu
    read -p "Seleccione una opción: " option
    case $option in
        i)
            start_containers
            ;;
        s)
            stop_containers
            ;;
        b)
            rebuild_containers
            ;;
        db)
            restore_database
            ;;
        q)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "$(red "Opción no válida. Por favor, seleccione una opción válida.")"
            ;;
    esac
done