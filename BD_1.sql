
DROP SCHEMA IF EXISTS ProxectoDeInvestigacion;
CREATE DATABASE ProxectoDeInvestigacion;
USE ProxectoDeInvestigacion;

CREATE TABLE Sede(
  Nome_Sede VARCHAR(30) PRIMARY KEY,
  Campus VARCHAR(30) NOT NULL
);

CREATE TABLE Departamento(
  Nome_Departamento VARCHAR(30)  PRIMARY KEY,
  Teléfono CHAR(9) NOT NULL,
  Director CHAR(9)
);

CREATE TABLE Ubicacion(
  Nome_Sede VARCHAR(30),
  Nome_Departamento VARCHAR(30),
    CONSTRAINT `PK&Ubicacion`
    PRIMARY KEY (Nome_Sede, Nome_Departamento),
  CONSTRAINT `FK_Sede_Ubiacion`
    FOREIGN KEY (Nome_Sede)
    REFERENCES Sede(Nome_Sede) 
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `FK_Departamento_Ubicacion`
    FOREIGN KEY (Nome_Departamento) 
    REFERENCES Departamento (Nome_Departamento)
    ON DELETE CASCADE
    ON UPDATE CASCADE  
);

CREATE TABLE Grupo(
  Nome_Grupo VARCHAR(30),
  Nome_Departamento VARCHAR(30),
  Área VARCHAR(30) NOT NULL,
  Lider CHAR(9),
  PRIMARY KEY (Nome_Grupo, Nome_Departamento),
  CONSTRAINT `FK_Departamento_Grupo`
    FOREIGN KEY (Nome_Departamento)
    REFERENCES Departamento (Nome_Departamento)
      ON DELETE CASCADE 
      ON UPDATE CASCADE
);

CREATE TABLE Profesor(
  DNI            CHAR(9)    PRIMARY KEY,
  Nome_Profesor  VARCHAR(30) NOT NULL, 
  Titulación     VARCHAR(20) NOT NULL,
  Experiencia    Integer,
  N_Grupo        VARCHAR(30),
  N_Departamento VARCHAR(30),
  CONSTRAINT FK_Grupo_Profesor
    FOREIGN KEY      (N_Grupo,    N_Departamento)
    REFERENCES Grupo (Nome_Grupo, Nome_Departamento)
    ON DELETE SET NULL
    ON UPDATE Cascade
);

CREATE TABLE Proxecto(
  Código_Proxecto CHAR(5)  PRIMARY KEY,
  Nome_Proxecto VARCHAR(30) NOT NULL,
  Orzamento NUMERIC NOT NULL,
  Data_Inicio DATE NOT NULL,
  Data_Fin DATE,
  N_Gr VARCHAR(30),
  N_Dep VARCHAR(30),
  UNIQUE (Nome_Proxecto),
  CONSTRAINT Check_Dates
    CHECK (Data_Inicio < Data_Fin),
  CONSTRAINT `FK_Proxecto_Grupo`
    FOREIGN KEY (N_Gr, N_Dep)
    REFERENCES Grupo (Nome_Grupo, Nome_Departamento)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

ALTER TABLE Departamento
  ADD CONSTRAINT `FK_Profesor_Departamento`
	FOREIGN KEY (Director) 
	REFERENCES Profesor (DNI)
    ON DELETE SET NULL
    ON UPDATE CASCADE;

ALTER TABLE Grupo
  ADD CONSTRAINT `FK_Profesor_Grupo`
  FOREIGN KEY (Lider)
  REFERENCES Profesor (DNI)
  ON DELETE SET NULL
  ON UPDATE CASCADE;

CREATE TABLE Participa(
  DNI             CHAR(9),
  Código_Proxecto CHAR(5),
  Data_Inicio     DATE        NOT NULL,
  Data_Cese       DATE,
  Dedicación      INTEGER     NOT NULL,
  PRIMARY KEY (DNI, Código_Proxecto),
  CHECK (Data_Inicio < Data_Cese),
  FOREIGN KEY (DNI)
    REFERENCES Profesor (DNI)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  FOREIGN KEY (Código_Proxecto)
    REFERENCES Proxecto (Código_Proxecto)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

CREATE TABLE Programa(
  Nome_Programa VARCHAR(30) PRIMARY KEY
); 

CREATE TABLE Financia(
  Nome_Programa        VARCHAR(30),
  Código_Proxecto      CHAR(5),
  Número_Programa      CHAR(5) NOT NULL,
  Cantidade_Financiada NUMERIC       NOT NULL,
  PRIMARY KEY (Nome_Programa, Código_Proxecto)
);

ALTER TABLE Financia
  ADD CONSTRAINT FK_Proxecto_Financia
    FOREIGN KEY (Código_Proxecto)
    REFERENCES Proxecto (Código_Proxecto)
    ON DELETE Cascade
    ON UPDATE Cascade;

ALTER TABLE Financia
  ADD CONSTRAINT `FK_Programa_Financia`
  FOREIGN KEY (Nome_Programa)
    REFERENCES Programa(Nome_Programa)
    ON DELETE CASCADE
    ON UPDATE CASCADE;




