workspace {

  model {
    docente = person "Docente" {
      description "Registra y gestiona asistencia de estudiantes."
    }

    administrativo = person "Administrativo" {
      description "Monitorea reportes y configura el sistema."
    }

    bdEscolar = person "Base de Datos Escolar" {
      description "Recibe notificaciones por inasistencias."
      tags "Database"
    }
    padre = person "Padre de Familia" {
      description "Recibe notificaciones por inasistencias."
    }
    dispositivo = person "Dispositivo QR/RFID"{
        description "Estudiante registra asistencia en dispositivo"
    }



    sistema = softwareSystem "Sistema de Control de Asistencia" {
      
      
      appWeb = container "Aplicación Web Monolítica" {
        technology "React + Node.js + PostgreSQL"
        description "Aplicación unificada con todas las funcionalidades del sistema."

        logica = component "Logica de Negocios" {
          description "Permite registrar y consultar las asistencias."
          technology "Spring Boot"
        }

        reportes = component "Gestión de Reportes" {
          description "Genera reportes diarios, semanales, mensuales y a demanda."
          technology "Backend + Motor de reportes"
        }

        notificaciones = component "Notificaciones" {
          description "Envía alertas automáticas a padres."
          technology "Servicio de mensajería (Email/SMS)"
        }

        seguridad = component "Seguridad y Autenticación" {
          description "Controla el acceso al sistema."
          technology "JWT + Roles"
        }

        integracion = component "Integración de Datos" {
          description "Sincroniza datos con sistemas escolares de Docentes y Estudiantes"
          technology "Spring Batch"
        }

        baseDeDatos = component "Base de Datos" {
          description "Base de Datos"
          tags "Database"
          technology "Mysql"
        }

        controladorWeb = component "Interfaz de Usuario" {
          description "Registro y visualizacion de las asistencias y reportes"
          technology "React"
        }
        
        registroAutomatico = component "Registro Automatico de Asistencia"{
            description "Procesa los mensajes de los dispositivos sin contacto para asistencia automatica"
            technology "Java"
        }        
        broker = component "Broker de Eventos"{
            description "Recibe los mensajes de los dispositivos sin contacto para asistencia automatica"
            tags "Broker"
            technology "MQTT"
        }

        // Relaciones entre personas y componentes
        docente -> controladorWeb "Registra asistencia"
        docente -> controladorWeb "Consulta reportes de asistencia"
        administrativo -> controladorWeb "Importa datos institucionales"
                
        controladorWeb -> logica "Registra asistencia"
        controladorWeb -> reportes "Consulta reportes de asistencia"
        
        padre -> notificaciones "Recibe notificaciones por inasistencias"

        // Relaciones internas entre componentes
        controladorWeb -> seguridad "Autoriza Usuarios"
        logica -> baseDeDatos "Almacena y consulta asistencia"
        reportes -> baseDeDatos "Obtiene datos para reportes"
        notificaciones -> baseDeDatos "Consulta ausencias para alertas"
        seguridad -> baseDeDatos "Consulta credenciales y roles"
        
        dispositivo -> broker "Dispositivo publica asistencias"
        registroAutomatico -> broker "Se suscribe a recibir asistencias"
        registroAutomatico -> baseDeDatos "Registra asistencia"
        
        bdEscolar -> integracion "Importa datos por medio de polling"
        integracion -> baseDeDatos "Persiste los datos importados"
      }
    }
  }

  views {
    systemContext sistema {
      include *
      autolayout lr
      title "Diagrama de Componentes - Sistema de Control de Asistencia"
    }
    container sistema {
      include *
      autolayout lr
      title "Diagrama de Componentes - Sistema de Control de Asistencia"
    }
    component appWeb {
      include *
      autolayout lr
      title "Diagrama de Componentes - Sistema de Control de Asistencia"
    }

    styles {
      element "Component" {
        shape roundedbox
        background #1168bd
        color #ffffff
      }

      element "Container" {
        shape hexagon
        background #438dd5
        color #ffffff
      }

      element "Person" {
        shape person
        background #08427b
        color #ffffff
      }

      element "Database" {
        shape cylinder
        background #589de1
        color #ffffff
      }

      element "Broker" {
        shape pipe
        background #589de1
        color #ffffff
      }
    }
  }
  
    configuration {
        scope softwareSystem
    }
}
