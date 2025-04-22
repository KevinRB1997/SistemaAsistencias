# 1. Introducción
## 1.1. Propósito
El control de la asistencia en el contexto educativo ha sido una actividad propia de la misma educacion desde hace muchos años y en el contexto actual la educacion se ha unido con la tecnologia de muchas formas. Un sistema que facilite el control de la asistencia de los estudiantes y que ademas proporciones funcionalidad moderas es crucial para la modernidad.

Este proyecto propone el diseño de una arquitectura de sistemas orientada a cubrir los requerimientos específicos de control de asistencia en un entorno escolar. A través de una solución tecnológica robusta y escalable, se busca facilitar el registro de asistencia por parte de los docentes, permitir la integración con bases de datos existentes, generar reportes detallados y ofrecer mecanismos de comunicación eficientes con los padres de familia.

El sistema estará diseñado con un enfoque en la seguridad, la usabilidad y la disponibilidad, garantizando el acceso a los registros desde múltiples dispositivos autorizados. Asimismo, se contempla la posibilidad de registrar asistencia de forma automática utilizando tecnologías como códigos QR o dispositivos RFID, permitiendo su adaptación a diferentes contextos escolares.

Este documento detalla los fundamentos técnicos y conceptuales de la arquitectura propuesta, abordando los requerimientos de negocio, funcionales y no-funcionales, así como los lineamientos de calidad que aseguran una solución sostenible y de alto impacto para las instituciones educativas.
## 1.2 Alcance
El presente proyecto tiene como objetivo el diseño y prototipado de una arquitectura de sistema destinada a gestionar el control de asistencia estudiantil en instituciones educativas de nivel primario y secundario. Esta solución estará enfocada en automatizar y optimizar los procesos relacionados con el registro, consulta y reporte de asistencia, permitiendo una administración más eficiente y segura de la información.

## 1.3. Definiciones, Acrónimos y Abreviaturas
Proporcionar definiciones para los términos y acrónimos utilizados a lo largo del documento.

## 1.4. Referencias
Enumerar otros documentos, sitios web o materiales referenciados en este documento.

## 1.5. Resumen
Proporcionar un breve resumen de las secciones siguientes del documento.

# 2. Representación Arquitectónica 
## 2.1.Estilo Arquitectónico y Justificación

Para la etapa de prototipado del sistema de control de asistencia estudiantil, se ha optado por implementar una arquitectura monolítica como estilo base. Este enfoque consiste en el desarrollo de una única aplicación cohesiva que agrupa todos los componentes funcionales —interfaz de usuario, lógica de negocio, y acceso a datos— dentro de un único proyecto desplegable.

La selección de una arquitectura monolítica responde a diversos factores técnicos, académicos y estratégicos que se alinean con los objetivos y el alcance del prototipo:

### 2.1.1 Simplicidad en el desarrollo: 
El patrón monolítico facilita una estructura clara y directa, ideal para etapas iniciales donde la prioridad es validar funcionalidades y demostrar viabilidad del sistema. Permite que los desarrolladores trabajen con mayor rapidez al evitar la complejidad inherente de los entornos distribuidos.
### 2.1.1 Facilidad de despliegue: 
Al tratarse de una aplicación unificada, el proceso de despliegue resulta más sencillo y directo, ya que no requiere la coordinación entre múltiples servicios o contenedores, lo cual es especialmente ventajoso en entornos de prueba y demostración.
### 2.1.1 Costos reducidos: 
En comparación con arquitecturas más complejas como microservicios, el enfoque monolítico demanda menos recursos de infraestructura y mantenimiento, lo que lo convierte en una solución más económica para fines académicos y de prototipado.
### 2.1.1 Idoneidad para sistemas pequeños o medianos: 
Dado que el sistema en su etapa inicial estará orientado a una escala controlada —una o pocas instituciones educativas—, una arquitectura monolítica es perfectamente adecuada en términos de escalabilidad y rendimiento.
### 2.1.1 Mayor facilidad para realizar cambios rápidos: 
Durante el desarrollo inicial, donde pueden surgir modificaciones frecuentes en los requerimientos, la estructura monolítica permite iterar con agilidad sin incurrir en sobrecostos de coordinación entre módulos independientes.

### Consideraciones Futuras
Aunque la arquitectura monolítica resulta apropiada para esta etapa, se reconoce que, a medida que el sistema evolucione y se proyecte hacia una implementación a mayor escala (por ejemplo, múltiples instituciones o una plataforma nacional), será conveniente considerar una migración hacia arquitecturas más modulares o distribuidas, como microservicios o arquitecturas orientadas a eventos. Esta transición permitirá una mejor escalabilidad, mantenibilidad y tolerancia a fallos en ambientes productivos de alta demanda.

# 3. Partes Interesadas y Preocupaciones del Sistema
## 3.1. Partes Interesadas

El desarrollo del sistema de control de asistencia involucra a múltiples partes interesadas, cada una con intereses específicos y preocupaciones que deben ser consideradas cuidadosamente para asegurar el éxito del proyecto.

Una de las partes fundamentales son los docentes, quienes serán los principales usuarios del sistema en el día a día. Su interés se centra en disponer de una herramienta ágil y confiable que les permita registrar la asistencia de sus estudiantes de manera rápida, así como generar reportes claros que respalden su labor pedagógica. 

La administración escolar, compuesta por la dirección del centro y el personal administrativo, busca contar con estadísticas precisas y actualizadas sobre la asistencia de los estudiantes. Su interés está en poder supervisar el cumplimiento de asistencia en todas las secciones y grados, con un enfoque institucional. 

Los estudiantes, si bien no interactúan directamente con el sistema de forma administrativa, son los sujetos principales del proceso. Su interés se enfoca en que la asistencia sea registrada de manera justa y precisa, evitando errores que puedan impactar negativamente en su historial. 

Los padres o tutores legales esperan recibir notificaciones oportunas ante ausencias injustificadas de sus hijos, lo que les permite un mayor control y seguimiento del compromiso académico de los estudiantes. Su interés radica en contar con un medio confiable y eficiente para estar informados.

## 3.2. Preocupaciones del Sistema

Una de las principales preocupaciones es el rendimiento del sistema. Dado que el sistema será utilizado en tiempo real por docentes y personal administrativo durante las jornadas escolares, se espera que las operaciones —como el registro de asistencia, generación de reportes y consulta de datos— se ejecuten con tiempos de respuesta bajos, incluso bajo carga moderada. La fluidez en la interacción con la plataforma resulta esencial para no interferir en el desarrollo de las clases ni generar frustración en los usuarios.

La escalabilidad también representa una preocupación fundamental. Aunque el sistema será inicialmente prototipado con una arquitectura monolítica y pensado para instituciones específicas, su diseño debe prever la posibilidad de ampliarse para cubrir múltiples escuelas, niveles y sedes en un futuro. Esto implica no solo el soporte para un mayor volumen de datos y usuarios concurrentes, sino también la capacidad de adaptarse a nuevos requerimientos funcionales sin necesidad de rediseños drásticos.

Otra preocupación crítica es la seguridad. El sistema manejará información sensible, como datos personales de estudiantes, historiales de asistencia y datos de contacto de padres de familia. Por ello, se requiere implementar mecanismos robustos de autenticación y control de accesos, así como aplicar técnicas de encriptación para proteger los datos tanto en tránsito como en reposo. Asimismo, se debe asegurar el cumplimiento de normativas de privacidad y protección de datos vigentes en el contexto educativo.

La disponibilidad del sistema es otro aspecto relevante. Se espera que la plataforma esté operativa de forma continua, permitiendo su acceso desde distintos dispositivos autorizados, en cualquier momento del día. Para ello, será necesario considerar una infraestructura que garantice alta disponibilidad y planes de recuperación ante fallos.

Por último, la usabilidad y la mantenibilidad deben ser también consideradas como preocupaciones clave. El sistema debe presentar una interfaz amigable e intuitiva, adaptada al perfil de los usuarios finales (docentes, administrativos y padres), minimizando la necesidad de capacitación técnica. Al mismo tiempo, el código debe estructurarse de forma modular y bien documentada, lo cual facilitará futuras actualizaciones, correcciones y posibles migraciones a arquitecturas más avanzadas como microservicios.

# 4. Visión General del Sistema 
## 4.1.	Descripción de Alto Nivel
El sistema de control de asistencia estudiantil es una plataforma informática diseñada para facilitar, automatizar y centralizar el registro, seguimiento y análisis de la asistencia de los estudiantes en instituciones educativas. Su propósito principal es proporcionar a los docentes, personal administrativo y padres de familia una herramienta confiable y segura para gestionar la asistencia escolar de forma eficiente.

Desde un punto de vista funcional, el sistema permitirá registrar la asistencia de los estudiantes tanto de manera manual (por selección en listas digitales) como de forma automática mediante tecnologías como códigos QR o dispositivos RFID. Cada sesión de asistencia estará vinculada a una clase, sección y docente específicos, lo que garantiza trazabilidad y organización de los datos.

Los docentes podrán acceder a su panel personalizado donde visualizarán la lista de estudiantes asignados a su sección, podrán registrar o modificar asistencias, y generar reportes periódicos. Por su parte, la administración escolar tendrá acceso a un módulo avanzado de reportes que incluirá estadísticas generales, seguimiento por niveles educativos, y exportación de datos. Además, el sistema integrará un módulo de notificaciones automáticas que alertará a los padres o tutores en caso de inasistencias injustificadas.

El sistema estará compuesto por los siguientes componentes de alto nivel:

### 4.2.1. Interfaz de Usuario (Frontend):
Desarrollada para ser accesible desde navegadores web y dispositivos móviles, esta interfaz proporcionará vistas personalizadas para docentes, personal administrativo y eventualmente padres de familia. Su diseño estará orientado a la usabilidad, con navegación clara y operaciones intuitivas.
### 4.2.2. Lógica de Negocio (Backend):
Este componente gestionará los procesos centrales del sistema, como el registro y validación de asistencias, generación de reportes, programación de notificaciones y gestión de roles y permisos de usuarios. Se encargará también de interactuar con las bases de datos y servicios externos necesarios.
### 4.2.3. Base de Datos:
Almacenará toda la información relacionada con los usuarios, estudiantes, docentes, secciones académicas, registros de asistencia y logs del sistema. Se diseñará bajo principios de normalización y seguridad, contemplando integridad referencial y acceso controlado.
### 4.2.4. Modulo de Notificaciones:
Encargado de emitir alertas automáticas a los padres de familia mediante correo electrónico, SMS o notificaciones dentro de una aplicación complementaria, este módulo garantizará una comunicación eficaz ante inasistencias.
### 4.2.5. Módulo de Seguridad y Autenticación:
Gestionará el acceso al sistema mediante mecanismos de autenticación (usuario y contraseña, y eventualmente autenticación de doble factor), control de sesiones y asignación de roles, asegurando que cada usuario acceda solo a la información que le corresponde.
Esta arquitectura de componentes está pensada para operar de manera cohesiva dentro de una estructura monolítica durante el prototipado inicial, permitiendo la validación funcional del sistema con una arquitectura sencilla pero completa. A futuro, esta estructura modular facilitará la migración hacia esquemas más distribuidos o escalables conforme evolucionen las necesidades del sistema.
# 5. Estrategias Arquitectónicas
## 5.1. Estrategias Clave
La estrategia arquitectónica del sistema de control de asistencia estudiantil se basa inicialmente en una arquitectura de monolito modular. Esta decisión permite aprovechar los beneficios inmediatos del monolito, tales como simplicidad de desarrollo, facilidad en la implementación inicial y reducción en la complejidad operativa. Sin embargo, se ha diseñado con módulos claramente separados por responsabilidad funcional, lo que facilita futuras transiciones arquitectónicas.

El enfoque modular permite que, en etapas posteriores, ciertos módulos puedan evolucionar de forma independiente hacia una arquitectura de microservicios, particularmente aquellos que experimenten mayor demanda o requieran escalabilidad independiente. Esto asegurará que el sistema mantenga su rendimiento y disponibilidad, adaptándose gradualmente a necesidades crecientes sin implicar rediseños profundos o interrupciones significativas del servicio..

# 6. Arquitectura del Sistema
## 6.1. Resumen de Capas/Módulos
El sistema de control de asistencia está organizado en una arquitectura por capas, lo que permite una separación clara de responsabilidades, una mayor mantenibilidad y una base sólida para futuras expansiones o migraciones tecnológicas. A continuación, se describen las principales capas o módulos que componen el sistema:

### 6.1.1. Capa de Presentación (Frontend)
Esta capa representa la interfaz directa con los usuarios finales, como docentes, personal administrativo y eventualmente padres de familia. Su función es facilitar la interacción con el sistema mediante pantallas intuitivas y accesibles desde navegadores web y dispositivos móviles. Incluye formularios de registro de asistencia, paneles de visualización de datos, generación de reportes y notificaciones.

Tecnologías: HTML, CSS, JavaScript, React.
Características clave: usabilidad, accesibilidad y diseño responsivo.
### 6.1.2. Capa de Lógica de Negocio (Backend)
Encargada de implementar las reglas de negocio del sistema, esta capa procesa las solicitudes provenientes del frontend, ejecuta las operaciones necesarias y retorna los resultados correspondientes. Controla el flujo de procesos como la validación de asistencia, generación de reportes, envío de notificaciones y administración de usuarios.

Tecnologías: Java.
Características clave: encapsulación de la lógica, validación de reglas y gestión de procesos.
### 6.1.3. Capa de Persistencia de Datos (Base de Datos)
Esta capa gestiona el almacenamiento estructurado de toda la información crítica del sistema, incluyendo registros de asistencia, información de estudiantes, docentes, usuarios, configuraciones y logs. Se asegura la integridad de los datos, su disponibilidad y la correcta relación entre entidades.

Tecnologías: MySQL
Características clave: consistencia, normalización, seguridad en el acceso a datos.

### 6.1.5. Módulo de Notificaciones
Responsable del envío de alertas automáticas a padres o tutores ante situaciones de inasistencia. Puede operar mediante correo electrónico, SMS o sistemas de mensajería instantánea. Este módulo se configura según las preferencias de cada institución.

Características clave: automatización, confiabilidad, flexibilidad de canales.
### 6.1.6. Módulo de Seguridad y Autenticación
Implementa mecanismos de autenticación de usuarios, control de acceso por roles, encriptación de datos sensibles y protección contra accesos no autorizados. Este módulo es esencial para garantizar la privacidad de la información y el cumplimiento de normativas de seguridad de datos.

Tecnologías: OAuth2.
Características clave: confidencialidad, integridad, autenticación robusta.

## 6.2 Diagramas de Componentes
Incluir cualquier diagrama de componentes relevante que ilustre partes significativas del sistema.

## 6.3 Diseño de la Base de Datos
Incluir el diseño y la estructura de la base de datos.

# 7. Decisiones Arquitectónicas Clave 
## 7.1. Registro de Decisiones
### 7.1.1 Utilización de Arquitectura Monolítica
#### 7.1.1.1 Pros y Contras

Pros:

Facilidad en el desarrollo inicial: Simplifica la estructura y gestión del código, acelerando la implementación inicial del sistema.
Despliegue sencillo: Al tener una sola aplicación unificada, las tareas de implementación, prueba y mantenimiento iniciales se facilitan considerablemente.
Consistencia de datos y lógica centralizada: Facilita la gestión de transacciones y la integridad referencial dentro de la aplicación.
Contras:

Escalabilidad limitada: A largo plazo, la arquitectura monolítica puede presentar problemas de escalabilidad al incrementar la demanda de ciertos componentes específicos.
Dificultad en actualizaciones independientes: Cualquier cambio o actualización afecta potencialmente a toda la aplicación, generando riesgos en el despliegue.
Dependencia tecnológica: Dificulta utilizar diferentes tecnologías para diferentes módulos.
#### 7.1.1.2 Alternativas y balance de factores

Una alternativa considerada es la arquitectura basada en microservicios. Aunque esta última ofrece mejor escalabilidad y flexibilidad tecnológica, implica mayor complejidad y esfuerzo inicial en desarrollo, despliegue e infraestructura. Dado el tamaño inicial y la necesidad de validar rápidamente la solución, se optó por un monolito modular que posteriormente permita una transición gradual hacia microservicios cuando el crecimiento del sistema lo amerite.

#### 7.1.1.3 Problemas potenciales

Posibles cuellos de botella en componentes específicos.
Dificultad para mantener equipos de desarrollo independientes trabajando simultáneamente.
Mayor impacto de fallas, ya que un error grave podría afectar la totalidad del sistema.
#### 7.1.1.4 Dependencias a considerar

Clara definición de interfaces y dependencias internas entre módulos para facilitar futuras separaciones.
Considerar herramientas y patrones de diseño que faciliten una futura migración a arquitecturas desacopladas, como uso de APIs internas claras y desacoplamiento funcional por módulos.
### 7.1.2 Decisión: Utilización de Base de Datos Compartida
#### 7.1.2.1 Pros y Contras

Pros:

Facilidad de implementación inicial: Un esquema centralizado simplifica considerablemente la gestión de datos, respaldos y recuperación.
Integridad y consistencia de datos: Asegura la consistencia referencial, ya que todos los módulos acceden directamente a una misma fuente.
Reducción de costos y complejidad operativa inicial: Una sola base de datos centralizada reduce gastos iniciales en infraestructura, licencias y mantenimiento.
Contras:

Limitaciones en escalabilidad futura: Una única base de datos puede convertirse en un cuello de botella si ciertos módulos requieren alta escalabilidad en términos de lectura/escritura.
Riesgos de rendimiento: A medida que aumente el volumen de datos y operaciones concurrentes, puede haber degradación del rendimiento general del sistema.
Mayor riesgo de bloqueos o conflictos: La concurrencia excesiva de consultas podría generar cuellos de botella o bloqueos frecuentes.
#### 7.1.2.2 Alternativas y balance de factores

La alternativa principal sería utilizar bases de datos independientes por módulo. Esto facilitaría la escalabilidad independiente y reduciría conflictos operativos. No obstante, esta opción añade complejidad al desarrollo inicial, gestión de transacciones distribuidas y operaciones. Dado el contexto actual del proyecto y la simplicidad requerida inicialmente, se optó por una base de datos compartida, asumiendo que en etapas posteriores se podrá segmentar o migrar la base de datos conforme sea necesario.

#### 7.1.2.3 Problemas potenciales

Posibles conflictos de acceso concurrente entre módulos del sistema.
Incremento significativo en tiempo y esfuerzo requerido para optimizar consultas conforme crezca el volumen de datos.
Dificultades potenciales para migrar posteriormente a bases de datos distribuidas, si las dependencias internas no están bien definidas desde un inicio.
#### 7.1.2.4 Dependencias a considerar

Claridad en los esquemas de datos utilizados por cada módulo para facilitar futuras migraciones o divisiones del modelo de datos.
Uso cuidadoso y controlado de transacciones para minimizar bloqueos o conflictos internos.
Estrategias tempranas de segmentación lógica dentro de la base de datos para facilitar la posterior separación física de módulos o servicios según las necesidades de escalabilidad.


# 8. Atributos de Calidad 
## 8.1. Rendimiento
### Descripción: Medida de la capacidad del sistema para responder en tiempo y manejar carga de trabajo sin degradar su funcionamiento.
 - Fuente: Usuario o componente interno genera una petición al sistema
 - Estímulo: Llegada de eventos concurrentes o picos de carga (p. ej., inicio de ciclo escolar)
 - Entorno: Modo operativo normal o de máxima demanda 
 - Respuesta: El sistema atiende las solicitudes dentro de los límites de latencia acordados 
 - Métrica: El 95 % de las respuestas debe tener una latencia < 200 ms bajo pico de carga 

 ### Nota
 - Se tomará como mecanismos de rendimiento, la utilizacion de cache en memoria para menor tiempo en acceso a la data.

## 8.2. Escalabilidad
### Descripción: Capacidad del sistema para crecer en usuarios, datos y transacciones sin perder calidad de servicio.
 - Fuente: Administración de una nueva escuela solicita integración masiva 
 - Estímulo: Registro de cientos de usuarios y volcado histórico de datos 
 - Entorno: Períodos de alta concurrencia (pico de ciclos académicos) 
 - Respuesta: La arquitectura escala automáticamente mediante particionamiento y réplicas  
 - Métrica: Soporta linealmente ≥ 50 profesores simultáneos con degradación < 10 % en rendimiento

### Nota
 - Se realizará la utilizacion de un proceso de normalizacion de hasta 3 o 4 grados de la base de datos, para soportar la escalabilidad del sistema

## 8.3. Seguridad
### Descripción: Protección de la confidencialidad, integridad y disponibilidad de los datos.
 - Fuente: Actor malicioso o usuario no autenticado intenta acceso 
 - Estímulo: Petición de recursos sensibles (datos personales, administrativos) 
 - Entorno: Operación normal del sistema o ataque dirigido (inyección, fuerza bruta) 
 - Respuesta:
 - - Autenticación robusta (AuthN) con múltiples factores  
 - - Encriptación de datos en reposo (AES‑256) y en tránsito (TLS 1.2+) 
 - Métrica:
 - - 100 % de las peticiones a datos sensibles requieren autenticación.
 - - Cumplimiento de ASVS nivel 2 para controles críticos

## 8.4. Mantenibilidad
### Descripción: Facilidad con que el sistema puede modificarse, corregirse o extenderse tras su entrega.
 - Fuente: Equipo de desarrollo requiriendo cambios o correcciones 
 - Estímulo: Bug reportado o nueva funcionalidad solicitada 
 - Entorno: Ciclo de mantenimiento o sprint de mejora continua 
 - Respuesta:
 - - Código modularizado y desacoplado según principios SOLID 
 - - Cobertura de pruebas automatizadas y documentación técnica actualizada 
 - Métrica:
 - - Reducción ≥ 30 % en tiempo medio de implementación de cambios gracias a modularidad y tests

# 9. Riesgos y Deuda Técnica 
## 9.1. Riesgos Identificados
### A continuación, se presentan los principales riesgos detectados en el desarrollo del sistema de control de asistencia, junto con su posible impacto:
- ####  Cambio frecuente de requerimientos funcionales
 - Impacto: Retrasos en el desarrollo, aumento de costos y re-trabajo en módulos ya implementados.
 - Mitigación: Establecer una fase de levantamiento de requerimientos bien definida y validada con las partes interesadas antes de iniciar el desarrollo.
- #### Limitaciones de la arquitectura monolítica en escalabilidad futura
 - Impacto: Dificultad para adaptar el sistema a múltiples instituciones o escenarios de alta demanda.
 - Mitigación: Modularizar desde el inicio y planificar una futura transición hacia microservicios si el crecimiento lo requiere.
- #### Problemas de rendimiento en momentos de alta concurrencia
 - Impacto: Latencia elevada o fallas del sistema durante picos de uso (por ejemplo, inicio de jornada escolar).
 - Mitigación: Implementar caching en memoria y diseñar consultas optimizadas desde el backend y la base de datos.
- #### Fallas en la seguridad de datos personales y académicos
 - Impacto: Posibles vulneraciones de privacidad y pérdida de confianza por parte de la comunidad educativa.
 - Mitigación: Uso de autenticación robusta, cifrado de datos (AES-256 y TLS 1.2+), y control estricto de accesos.
- #### Dependencia de tecnologías específicas o versiones de software
 - Impacto: Dificultades para actualizar o integrar nuevos componentes en el futuro.
 - Mitigación: Mantener un registro de versiones, aplicar principios de bajo acoplamiento y usar tecnologías estándar ampliamente soportadas.

## 9.2. Deuda Técnica
### Durante la planificación y desarrollo del prototipo, se identifican las siguientes áreas donde podría generarse deuda técnica:


# 10. Apéndices 
## 10.1. Glosario
### Proporcionar un glosario de términos utilizados a lo largo del documento.
 - ASVS: Estándar de verificación de seguridad de aplicaciones, utilizado para evaluar controles de seguridad en software.
 - AES-256: Algoritmo de encriptación de alta seguridad utilizado para proteger datos en reposo.
 - AuthN: Abreviatura de “Authentication”; se refiere al proceso de autenticación de usuarios.
 - Backend: Parte lógica del sistema que maneja procesos internos, reglas de negocio y gestión de datos.
 - Base de Datos Normalizada: Estructura de datos optimizada para evitar redundancias y mejorar la integridad de la información.
 - Cache: Memoria temporal utilizada para acelerar el acceso a datos frecuentemente solicitados.
 - Ciclo de Mantenimiento: Etapa del ciclo de vida del software dedicada a correcciones, mejoras y ajustes posteriores al despliegue.
 - Control de Accesos: Mecanismo para restringir el acceso a información o funcionalidades del sistema según el rol del usuario.
 - Códigos QR: Códigos visuales bidimensionales escaneables, utilizados para automatizar procesos como el registro de asistencia.
 - Documentación Técnica: Conjunto de archivos que describen cómo funciona un sistema, destinado a desarrolladores y equipos técnicos.
 - Disponibilidad: Medida del tiempo en que un sistema está accesible y operativo para los usuarios.
 - Frontend: Interfaz gráfica del sistema que permite la interacción directa del usuario.
 - Latencia: Tiempo de respuesta entre una solicitud realizada y la respuesta entregada por el sistema.
 - Microservicios: Estilo arquitectónico que divide una aplicación en servicios independientes y especializados.
 - OAuth2: Protocolo de autorización que permite compartir información segura entre sistemas.
 - Persistencia de Datos: Capacidad del sistema para almacenar y conservar información de forma permanente.
 - Rendimiento: Habilidad del sistema para responder con eficiencia ante la carga de usuarios o procesos.
 - RFID: Tecnología de identificación por radiofrecuencia usada para automatizar el registro de objetos o personas.
 - Roles: Perfiles de usuario con permisos y accesos definidos dentro del sistema.
 - Escalabilidad: Capacidad del sistema para adaptarse al crecimiento de usuarios, datos o transacciones sin degradar su desempeño.
 - Sistema Monolítico: Modelo de arquitectura donde todos los componentes de software están integrados en una sola aplicación.
 - SOLID: Conjunto de cinco principios para escribir código limpio, mantenible y escalable.
 - TLS 1.2+: Protocolo criptográfico utilizado para asegurar la comunicación entre cliente y servidor.
 - Usabilidad: Facilidad con la que los usuarios pueden aprender a usar y operar un sistema eficientemente.

## 10.2. Índice
Incluir un índice de términos y secciones para facilitar la navegación.

# 10.3. Historial de Revisión
Documentar el historial de revisiones de este documento.
- Fecha	Versión	Descripción	Autor
- 2025‑04‑12	1.0	Creación del documento y tabulación de encabezados.	Equipo Arquitectura
- 2025‑04‑20	1.1	Creacion de glosario, atributos de calidad, riesgos y deuda técnica. Equipo Arquitectura
