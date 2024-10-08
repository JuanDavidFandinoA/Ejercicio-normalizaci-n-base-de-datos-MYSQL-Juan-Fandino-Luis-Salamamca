CREATE DATABASE UniversidadDB;
USE UniversidadDB;

CREATE TABLE Docente (
    Docente_ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Edad INTEGER
);

CREATE TABLE Estudiante (
    Estudiante_ID INTEGER PRIMARY KEY,
    Nombre VARCHAR(100),
    Apellido VARCHAR(100),
    Edad INTEGER
);

CREATE TABLE Horario (
    Horario_ID INTEGER PRIMARY KEY,
    Dia DATE,
    Hora_inicio TIME,
    Hora_final TIME,
    Activo BOOLEAN
);

CREATE TABLE Curso (
    Curso_ID INTEGER PRIMARY KEY,
    Materia VARCHAR(100),
    Horario_ID INTEGER,
    FOREIGN KEY (Horario_ID) REFERENCES Horario(Horario_ID)
);

CREATE TABLE Estudiante_curso (
    Estudiante_curso_ID INTEGER PRIMARY KEY,
    Estudiante_ID INTEGER,
    Curso_ID INTEGER,
    FOREIGN KEY (Estudiante_ID) REFERENCES Estudiante(Estudiante_ID),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Curso_ID)
);

CREATE TABLE Docente_Curso (
    Docente_curso_ID INTEGER PRIMARY KEY,
    Docente_ID INTEGER,
    Curso_ID INTEGER,
    FOREIGN KEY (Docente_ID) REFERENCES Docente(Docente_ID),
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Curso_ID)
);

CREATE TABLE Dia (
    Dia_ID INTEGER PRIMARY KEY,
    Dia_semana INTEGER
);

CREATE TABLE Dias_horario (
    Dias_horario_ID INTEGER PRIMARY KEY,
    Dia_ID INTEGER,
    Horario_ID INTEGER,
    FOREIGN KEY (Dia_ID) REFERENCES Dia(Dia_ID),
    FOREIGN KEY (Horario_ID) REFERENCES Horario(Horario_ID)
);

CREATE TABLE Universidad (
    AulaID INTEGER PRIMARY KEY
);

CREATE TABLE Cursos_universidad (
    Cursos_universidad_ID INTEGER PRIMARY KEY,
    Curso_ID INTEGER,
    AulaID INTEGER,
    FOREIGN KEY (Curso_ID) REFERENCES Curso(Curso_ID),
    FOREIGN KEY (AulaID) REFERENCES Universidad(AulaID)
);

CREATE TABLE Universidad_horarios (
    Universidad_horarios_ID INTEGER PRIMARY KEY,
    AulaID INTEGER,
    Horario_ID INTEGER,
    FOREIGN KEY (AulaID) REFERENCES Universidad(AulaID),
    FOREIGN KEY (Horario_ID) REFERENCES Horario(Horario_ID)
);
