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

# 1. Interfaz de Usuario (Frontend):
Desarrollada para ser accesible desde navegadores web y dispositivos móviles, esta interfaz proporcionará vistas personalizadas para docentes, personal administrativo y eventualmente padres de familia. Su diseño estará orientado a la usabilidad, con navegación clara y operaciones intuitivas.
# 2. Lógica de Negocio (Backend):
Este componente gestionará los procesos centrales del sistema, como el registro y validación de asistencias, generación de reportes, programación de notificaciones y gestión de roles y permisos de usuarios. Se encargará también de interactuar con las bases de datos y servicios externos necesarios.
# 3. Base de Datos:
Almacenará toda la información relacionada con los usuarios, estudiantes, docentes, secciones académicas, registros de asistencia y logs del sistema. Se diseñará bajo principios de normalización y seguridad, contemplando integridad referencial y acceso controlado.
# 4. Módulo de Integración:
Este componente permitirá la conexión del sistema con otras plataformas institucionales, como bases de datos académicas o sistemas de calificaciones. Se incluirán APIs o mecanismos de importación/exportación para facilitar dicha interoperabilidad.
# 5. Modulo de Notificaciones:
Encargado de emitir alertas automáticas a los padres de familia mediante correo electrónico, SMS o notificaciones dentro de una aplicación complementaria, este módulo garantizará una comunicación eficaz ante inasistencias.
# 6. Módulo de Seguridad y Autenticación:
Gestionará el acceso al sistema mediante mecanismos de autenticación (usuario y contraseña, y eventualmente autenticación de doble factor), control de sesiones y asignación de roles, asegurando que cada usuario acceda solo a la información que le corresponde.
Esta arquitectura de componentes está pensada para operar de manera cohesiva dentro de una estructura monolítica durante el prototipado inicial, permitiendo la validación funcional del sistema con una arquitectura sencilla pero completa. A futuro, esta estructura modular facilitará la migración hacia esquemas más distribuidos o escalables conforme evolucionen las necesidades del sistema.
# 5. Estrategias Arquitectónicas
## 5.1. Estrategias Clave
Describir las estrategias arquitectónicas clave y cómo abordan las preocupaciones específicas de las partes interesadas.

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
### 6.1.4. Módulo de Integración y APIs
Este módulo permite la comunicación del sistema con otras plataformas o servicios externos, como sistemas académicos existentes, plataformas de calificaciones o directorios institucionales. Proporciona interfaces de programación (APIs REST, por ejemplo) que permiten importar y exportar datos de forma segura y estandarizada.

Características clave: interoperabilidad, estandarización, seguridad en las comunicaciones.
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
Registrar las decisiones arquitectónicas clave tomadas y la justificación detrás de ellas:
### 7.1.1 Pros y Contras.
### 7.1.2 Alternativas y balance de factores.
### 7.1.3 Problemas potenciales.
### 7.1.4 Dependencias a considerar.


# 8. Atributos de Calidad 
## 8.1. Rendimiento
Describir los requisitos de rendimiento y cómo la arquitectura los respalda.

## 8.2. Escalabilidad
Describir las consideraciones y estrategias de escalabilidad.

## 8.3. Seguridad
Describir las medidas de seguridad y consideraciones dentro de la arquitectura.

## 8.4. Mantenibilidad
Describir cómo se ha diseñado el sistema para facilitar su mantenimiento.

# 9. Riesgos y Deuda Técnica 
## 9.1. Riesgos Identificados
Enumerar los riesgos identificados y su posible impacto en el proyecto.

## 9.2. Deuda Técnica
Describir cualquier área de deuda técnica y los planes para su resolución.

# 10. Apéndices 
##10.1. Glosario
Proporcionar un glosario de términos utilizados a lo largo del documento.

## 10.2. Índice
Incluir un índice de términos y secciones para facilitar la navegación.

# 10.3. Historial de Revisión
Documentar el historial de revisiones de este documento.
