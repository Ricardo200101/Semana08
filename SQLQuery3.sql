USE recursoshumanos; 
CREATE TABLE desarrolloHumano.empleado(
     idEmpleado INT IDENTITY(1,1) PRIMARY KEY, 
	 nombres VARCHAR (20), 
	 apellidos VARCHAR (20), 
	 direccion VARCHAR (50), 
	 dui VARCHAR (10) UNIQUE, 

);

--agregar campo codCargo 

ALTER TABLE
desarrolloHumano.empleado
ADD codCargo INT; 