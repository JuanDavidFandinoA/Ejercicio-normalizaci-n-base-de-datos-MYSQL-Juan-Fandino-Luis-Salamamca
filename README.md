# Gestión de Asignaturas, Docentes y Horarios - Base de Datos Normalizada

Este repositorio contiene el proyecto de una base de datos normalizada para la gestión de asignaturas, estudiantes, docentes y horarios en una universidad. El objetivo es eliminar redundancias y mejorar la eficiencia en el manejo de la información. La normalización se ha llevado a cabo en tres formas normales (1NF, 2NF y 3NF).

## Estructura del Proyecto

El proyecto contiene los siguientes archivos:

- **UNIVERSIDAD DB.sql**: Archivo con el código SQL para crear la base de datos y las tablas, e insertar los datos de ejemplo.
- **README.md**: Archivo que contiene esta explicación detallada.
- **Diagrama ER.png**: Diagrama que muestra las relaciones entre las tablas.

## Normalización

La base de datos ha sido normalizada para evitar redundancias y garantizar la integridad de los datos. A continuación, se describen las tres formas normales aplicadas:

1. **Primera Forma Normal (1NF)**:
   Se eliminan los grupos repetidos. Todos los atributos contienen valores atómicos, es decir, no hay múltiples valores en una misma columna.

2. **Segunda Forma Normal (2NF)**:
   Se eliminan las dependencias parciales. Se han separado los datos de estudiantes, cursos y docentes en tablas diferentes, de modo que cada tabla tiene su propia clave primaria y evita duplicaciones innecesarias.

3. **Tercera Forma Normal (3NF)**:
   Se eliminan las dependencias transitivas. Los atributos no clave dependen únicamente de la clave primaria de cada tabla. Por ejemplo, las aulas y los horarios dependen del curso, por lo que están en la tabla `Cursos`, mientras que los docentes están en su propia tabla `Docentes`.

### Estructura, tablas y relaciones

La base de datos modela el sistema de gestión de cursos en una universidad con los siguientes componentes:

- **Docentes**: Información personal sobre los docentes.
- **Estudiantes**: Datos de los estudiantes matriculados.
- **Cursos**: Asignaturas ofrecidas, vinculadas a un docente y a un horario.
- **Horarios**: Tiempos y días en los que se imparten los cursos.
- **Universidad**: Información sobre las aulas y su disponibilidad.

Este proyecto está basado en un diagrama Entidad-Relación (E-R) que modela las relaciones entre los distintos componentes. Las tablas y las relaciones están implementadas en SQL.

## Pasos para la Creación de la Base de Datos

1. **Crear la base de datos**:

   ```sql
   CREATE DATABASE UniversidadDB;
   USE UniversidadDB;
   ```

2. **Crear las tablas**:

   ### Tabla `Docente`
   ```sql
   CREATE TABLE Docente (
       Docente_ID INTEGER PRIMARY KEY,
       Nombre VARCHAR(100),
       Apellido VARCHAR(100),
       Edad INTEGER
   );
   ```

   ### Tabla `Estudiante`
   ```sql
   CREATE TABLE Estudiante (
       Estudiante_ID INTEGER PRIMARY KEY,
       Nombre VARCHAR(100),
       Apellido VARCHAR(100),
       Edad INTEGER
   );
   ```

   ### Tabla `Curso`
   ```sql
   CREATE TABLE Curso (
       Curso_ID INTEGER PRIMARY KEY,
       Materia VARCHAR(100),
       Horario_ID INTEGER,
       FOREIGN KEY (Horario_ID) REFERENCES Horario(Horario_ID)
   );
   ```

   ### Tabla `Estudiante_curso`
   ```sql
   CREATE TABLE Estudiante_curso (
       Estudiante_curso_ID INTEGER PRIMARY KEY,
       Estudiante_ID INTEGER,
       Curso_ID INTEGER,
       FOREIGN KEY (Estudiante_ID) REFERENCES Estudiante(Estudiante_ID),
       FOREIGN KEY (Curso_ID) REFERENCES Curso(Curso_ID)
   );
   ```

   ### Tabla `Docente_Curso`
   ```sql
   CREATE TABLE Docente_Curso (
       Docente_curso_ID INTEGER PRIMARY KEY,
       Docente_ID INTEGER,
       Curso_ID INTEGER,
       FOREIGN KEY (Docente_ID) REFERENCES Docente(Docente_ID),
       FOREIGN KEY (Curso_ID) REFERENCES Curso(Curso_ID)
   );
   ```

   ### Tabla `Horario`
   ```sql
   CREATE TABLE Horario (
       Horario_ID INTEGER PRIMARY KEY,
       Dia DATE,
       Hora_inicio TIME,
       Hora_final TIME,
       Activo BOOLEAN
   );
   ```

   ### Tabla `Dia`
   ```sql
   CREATE TABLE Dia (
       Dia_ID INTEGER PRIMARY KEY,
       Dia_semana INTEGER
   );
   ```

   ### Tabla `Dias_horario`
   ```sql
   CREATE TABLE Dias_horario (
       Dias_horario_ID INTEGER PRIMARY KEY,
       Dia_ID INTEGER,
       Horario_ID INTEGER,
       FOREIGN KEY (Dia_ID) REFERENCES Dia(Dia_ID),
       FOREIGN KEY (Horario_ID) REFERENCES Horario(Horario_ID)
   );
   ```

   ### Tabla `Universidad`
   ```sql
   CREATE TABLE Universidad (
       AulaID INTEGER PRIMARY KEY
   );
   ```

   ### Tabla `Cursos_universidad`
   ```sql
   CREATE TABLE Cursos_universidad (
       Cursos_universidad_ID INTEGER PRIMARY KEY,
       Curso_ID INTEGER,
       AulaID INTEGER,
       FOREIGN KEY (Curso_ID) REFERENCES Curso(Curso_ID),
       FOREIGN KEY (AulaID) REFERENCES Universidad(AulaID)
   );
   ```

   ### Tabla `Universidad_horarios`
   ```sql
   CREATE TABLE Universidad_horarios (
       Universidad_horarios_ID INTEGER PRIMARY KEY,
       AulaID INTEGER,
       Horario_ID INTEGER,
       FOREIGN KEY (AulaID) REFERENCES Universidad(AulaID),
       FOREIGN KEY (Horario_ID) REFERENCES Horario(Horario_ID)
   );
   ```

3. **Ejecutar las consultas**:
