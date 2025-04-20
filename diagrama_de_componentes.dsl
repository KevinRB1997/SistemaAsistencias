workspace {

  model {
    docente = person "Docente" {
      description "Registra y gestiona asistencia de estudiantes."
    }

    administrativo = person "Administrativo" {
      description "Monitorea reportes y configura el sistema."
    }

    padre = person "Padre de Familia" {
      description "Recibe notificaciones por inasistencias."
    }



    sistema = softwareSystem "Sistema de Control de Asistencia" {
      
      
      appWeb = container "Aplicación Web Monolítica" {
        technology "React + Node.js + PostgreSQL"
        description "Aplicación unificada con todas las funcionalidades del sistema."

        registroAsistencia = component "Registro de Asistencia" {
          description "Permite registrar la asistencia de los estudiantes."
          technology "React + Backend"
        }

        reportes = component "Gestión de Reportes" {
          description "Genera reportes diarios, semanales y mensuales."
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
          description "Sincroniza datos con sistemas escolares."
          technology "REST API / CSV"
        }

        accesoDatos = component "Acceso a Datos" {
          description "Gestiona las operaciones sobre la base de datos."
          technology "ORM + SQL"
        }

        controladorWeb = component "Controlador Web" {
          description "Gestiona las operacions http."
          technology "Http"
        }

        // Relaciones entre personas y componentes
        docente -> controladorWeb "Registra asistencia"
        docente -> controladorWeb "Consulta reportes de asistencia"
        administrativo -> controladorWeb "Monitorea estadísticas"
        administrativo -> controladorWeb "Importa datos institucionales"
                
        controladorWeb -> registroAsistencia "Registra asistencia"
        controladorWeb -> reportes "Consulta reportes de asistencia"
        controladorWeb -> reportes "Monitorea estadísticas"
        controladorWeb -> integracion "Importa datos institucionales"
        
        padre -> notificaciones "Recibe notificaciones por inasistencias"

        // Relaciones internas entre componentes
        registroAsistencia -> accesoDatos "Almacena y consulta asistencia"
        reportes -> accesoDatos "Obtiene datos para reportes"
        notificaciones -> accesoDatos "Consulta ausencias para alertas"
        seguridad -> accesoDatos "Consulta credenciales y roles"
        integracion -> accesoDatos "Sincroniza datos de estudiantes y docentes"
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
    }
  }
  
    configuration {
        scope softwareSystem
    }
}
