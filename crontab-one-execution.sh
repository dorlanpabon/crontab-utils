#!/bin/sh

# Verificar que se proporcionen todos los argumentos
if [ "$#" -ne 5 ]; then
    echo "Uso: $0 comando minutos horas dia mes"
    echo "Ejemplo: $0 \"sudo service web restart\" 0 7 19 10"
    echo "Traduccion: Ejecuta el comando \"sudo service web restart\" a las 7:00 AM el 19 de octubre"
    exit 1
fi

# Guardar los argumentos en variables
comando="$1"
minutos="$2"
horas="$3"
dia="$4"
mes="$5"

# Función para validar número y rango
validar_numero_rango() {
    if ! [ "$1" -ge 0 ] 2>/dev/null; then
        echo "Error: $2 debe ser un número"
        exit 1
    fi

    if [ "$1" -gt $3 ] || [ "$1" -lt $4 ]; then
        echo "Error: $2 debe ser un número entre $4 y $3"
        exit 1
    fi
}

# Validar que todos sean números y estén en el rango correcto
validar_numero_rango "$minutos" "minutos" 59 0
validar_numero_rango "$horas" "horas" 23 0
validar_numero_rango "$dia" "dia" 31 1
validar_numero_rango "$mes" "mes" 12 1

# Obtener la entrada actual de la tabla de cron
entradas_cron=$(crontab -l 2>/dev/null)

echo "Entradas actuales en la tabla de cron:" 
echo "$entradas_cron"

# Crear la nueva entrada de cron
nueva_entrada="$minutos $horas $dia $mes * $comando" 

# Codigo para eliminar la entrada de cron al ejecutarse el cronjob
nueva_entrada="$nueva_entrada && crontab -l | grep -Fv \"$nueva_entrada\" | crontab -"

# Si no hay entradas en la tabla de cron, crear una nueva
if [ -z "$entradas_cron" ]; then
    echo "$nueva_entrada" | crontab -
    echo "Entrada agregada a la tabla de cron"
    crontab -l
    exit 0
fi

# Si ya existe una entrada igual, no hacer nada
if echo "$entradas_cron" | grep -F "$nueva_entrada" >/dev/null 2>&1; then
    echo "No se hace nada, Ya existe una entrada igual en la tabla de cron"
    exit 0
fi

# Agregar la nueva entrada a la tabla de cron
echo "$entradas_cron" | { cat; echo "$nueva_entrada"; } | crontab -
echo "Nueva entrada agregada a la tabla de cron"
crontab -l
exit 0
