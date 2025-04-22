# Requerimientos del producto - Sistema Asistencias

## 1. Requerimientos del Negocio

 - Facilitar el control de asistencia de los estudiantes por grado, nivel y sección.
 - Generar reportes de asistencia para docentes y administración.
 - Integrar el sistema con la base de datos de estudiantes y docentes.
 - Garantizar la seguridad y privacidad de los datos de los estudiantes.
 - Permitir acceso a los registros de asistencia a desde cualquier dispositivo autorizado.

## 2. Requerimientos Funcionales

 - Registrar asistencia de estudiantes de forma manual o automática (mediante código QR o RFID).
 - Permitir a los docentes gestionar la asistencia de su sección y realizar modificaciones.
 - Generar reportes diarios, semanales y mensuales de asistencia.
 - Enviar notificaciones a los padres en caso de inasistencia de sus hijos.
 - Permitir la integración con otros sistemas escolares como calificaciones y gestión académica.

## 3. Requerimientos No-funcionales o de Calidad

 ### 1. Escalabilidad
 - Fuente: Sistema administrativo de una nueva escuela
 - Estímulo: Solicita integrarse al sistema con su propio conjunto de usuarios y datos
 - Entorno: Durante el crecimiento normal del sistema o en picos de uso (ej. inicio de ciclo escolar)
 - Respuesta: El sistema asigna recursos de manera dinámica y permite la gestión de la nueva escuela sin afectar el rendimiento general
 - Métrica: Soporta al menos 100 escuelas simultáneamente, con un aumento lineal de recursos y sin degradación de rendimiento superior al 10%

 ### Disponibilidad
- Fuente: Docente o administrador
- Estímulo: Accede al sistema para realizar tareas (consultas, registro, reportes, etc.)
- Entorno: En cualquier momento, 24 horas al día, 7 días a la semana
- Respuesta: El sistema responde sin fallos ni interrupciones
- Métrica: Disponibilidad del 99.9% mensual; 95% de las solicitudes deben responderse en menos de 2 segundos

### Seguridad
- Fuente: Actor malicioso o usuario no autenticado
- Estímulo: Intenta acceder a información sensible del sistema
- Entorno: Durante el uso normal o ante un intento de ataque
- Respuesta: El sistema bloquea el acceso, encripta la información y genera un registro del evento
- Métrica: 100% de los accesos a datos sensibles requieren autenticación; encriptación con estándares (AES-256); intentos no autorizados registrados en menos de 2 segundos

### Usabilidad
- Fuente: Docente o administrador sin experiencia técnica
- Estímulo: Realiza tareas comunes dentro del sistema (ej. ingresar notas, generar reportes)
- Entorno: Durante su jornada, desde computadora o dispositivo móvil
- Respuesta: El sistema presenta una interfaz clara, intuitiva y con ayuda contextual
- Métrica: El 90% de los usuarios debe poder realizar tareas básicas sin capacitación, en un máximo de 3 pasos

### Mantenibilidad
- Fuente: Equipo de desarrollo
- Estímulo: Se requiere actualizar el sistema o corregir errores
- Entorno: Durante ciclos de mantenimiento o mejoras
- Respuesta: El sistema permite modificar módulos específicos sin afectar otros componentes
- Métrica: Las tareas de mantenimiento deben reducirse al menos un 30% gracias a una arquitectura modular y documentación técnica actualizada