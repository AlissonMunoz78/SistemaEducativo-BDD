# Sistema de Gestión Educativa - Base de Datos

Este repositorio contiene el diseño e implementación de una base de datos para un sistema de gestión educativa en SQL Server.

## **Estructura de la Base de Datos**

### **Tablas Principales**

1. **Instituciones**: Registra las instituciones educativas
2. **Estudiantes**: Almacena información de los estudiantes
3. **Responsables**: Contiene datos de padres/tutores
4. **Estudiante_Responsable**: Relación estudiantes-responsables
5. **Docentes**: Información del personal docente
6. **Cursos**: Catálogo de cursos ofertados
7. **Materias**: Asignaturas por curso
8. **Matriculas**: Registro de matrículas
9. **Asistencias**: Control de asistencia
10. **Calificaciones**: Registro de notas
11. **Log_Auditoria**: Registro de cambios

### **Componentes Adicionales**

#### **Vistas**
- `v_ReporteCalificaciones`: Reporte consolidado de notas
- `v_AsistenciasEstudiantes`: Registro de asistencia
- `v_ResumenAcademico`: Resumen estudiantil
- `v_EstudianteDatosPropios`: Autoconsulta estudiantes
- `v_ResponsableDatosEstudiantes`: Vista para padres

#### **Procedimientos Almacenados**
- `sp_RegistrarEstudianteCompleto`: Registro completo
- `sp_ActualizarCalificacionesMasiva`: Actualización notas
- `sp_GenerarReporteCurso`: Generación de reportes
- `sp_AsignarDocenteMasivo`: Asignación docentes
- `sp_PromocionarEstudiantes`: Promoción automática

## **Requisitos**

- SQL Server 2016 o superior
- 50 MB de espacio disponible
- Permisos de administrador

## **Configuración Inicial**

1. Ejecutar por orden los modulos 
