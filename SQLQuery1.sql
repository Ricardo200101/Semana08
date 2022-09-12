--Victor Ricardo Alvarez Saravia



















CREATE DATABASE recursoshumanos;
USE recursoshumanos;

-- esquemas

CREATE SCHEMA recursoshumanos;
CREATE SCHEMA desarrolloHumanos; 

--login

CREATE LOGIN GerenteGeneral WITH PASSWORD='2020';
CREATE LOGIN GerenteRH WITH PASSWORD='2020'; 

--usuarios 

CREATE USER Jaime FOR LOGIN GerenteGeneral WITH DEFAULT_SCHEMA=desarrolloHumanos;
CREATE USER Amanda FOR LOGIN GerenteRH WITH DEFAULT_SCHEMA=recursoshumanos;

-- asignamos permisos a los esquemas

GRANT CREATE TABLE TO Jaime; 
GRANT ALTER ON SCHEMA::desarrolloHumano TO Jaime; 

--tabla de la base de datos

CREATE TABLE recursoshumanos.departamento(

      codDepartamento INT IDENTITY(1,1) PRIMARY KEY,
	  departamento VARCHAR(30) NOT NULL, 
);

CREATE TABLE recursoshumanos.cargo(

      codCargo INT IDENTITY(1,1) PRIMARY KEY,
	  cargo VARCHAR(20) NOT NULL, 
	  codDepartamento INT NOT NULL, 
	  FOREIGN KEY (codDepartamento)
	      REFERENCES recursoshumanos.departamento(codDepartamento), 
);

--agregar claves forenea

ALTER TABLE desarrolloHumano.empleado
ADD CONSTRAINT codCargo FOREIGN KEY(codCargo) REFERENCES 
recursohumanos.cargo(codCargo); 

-- podra insertar registro sobre las tablas del esquema 

GRANT SELECT ON SCHEMA::recursosHumanos To Amanda 

--revocar permiso  de seleccion de amanda
REVOKE SELECT ON SCHEMA::recursohumanos TO Amanda;

GRANT SELECT, INSERT, UPDATE, DELETE ON SCHEMA::desarrolloHumano TO Amanda; 

--ASIGNAR PERMISOS DE TABLA 
--ASIGNAR PERMISO DE INSERCION A LA TABLA DEPARTAMENTO

GRANT INSERT ON OBJECT::recursohumanos.departamento TO Amanda; 
GRANT INSERT ON OBJECT::recursohumanos.cargo TO Amanda; 
GRANT ALTER ON OBJECT::recursohumanos.departamento TO Amanda; 