# crontab-one-execution

Este directorio contiene un script para simplificar la programación de tareas cron en sistemas basados en Unix. El script `crontab-one-execution.sh` permite programar la ejecución de un comando en un momento específico.

## Uso

````bash
./crontab-one-execution.sh comando minutos horas dia mes
````

## Ejemplo

````bash
./crontab-one-execution.sh "sudo service web restart" 0 7 19 10
````

Este ejemplo ejecuta el comando "sudo service web restart" a las 7:00 AM el 19 de octubre.

## Requisitos

- El script requiere ser ejecutado en un entorno Unix con acceso a crontab.

## Parámetros

- `comando`: El comando que se ejecutará.
- `minutos`: Minuto en que se ejecutará el comando (0-59).
- `horas`: Hora en que se ejecutará el comando (0-23).
- `dia`: Día del mes en que se ejecutará el comando (1-31).
- `mes`: Mes en que se ejecutará el comando (1-12).

## Validaciones

- Se realizan validaciones para asegurar que los parámetros sean números y estén dentro de los rangos adecuados.

## Funcionalidades

- El script muestra las entradas actuales en la tabla de cron.
- Crea una nueva entrada de cron con el comando proporcionado.
- Elimina cualquier entrada existente previamente igual a la nueva.
- Añade la nueva entrada a la tabla de cron.

## Uso avanzado

Puedes integrar este script en tus flujos de trabajo o scripts para programar tareas específicas en un horario determinado.

## Contribuciones

Si encuentras algún problema o tienes mejoras que sugieres, ¡no dudes en abrir un problema o enviar una solicitud de extracción!
