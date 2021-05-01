DDL (Data Definition Lenguage)
================
este sublenguaje permite los objetos que conforman la base de datos

 CREATE
 -------------------
nos pertirá crear los objetos que posteriormente definiremos 

   ## CREAR SCHEMA o DATABASE
   para crear un schema o una database usaremos la estructura    
     `````sql
     CREATE (SCHEMA|DATABASE) [IF NOT EXISTS] [CHARACTER SET <Nombre Charset> [COLLATE <Nombre_Variante>]] << NombreBD >>;
     `````
      A la hora de crear el schema o la database podremos declarar algunas propiedades:
      - `IF NOT EXISTS` comprueba la si ya existe en el SGBD.
      -`CHARACTER OF` especifica el conjunto de caracteres a utilizar
      -`COLLATE` permite elegir variantes dentro del conjunto de caracteres
   ## CREAR TABLA
   para crear una tabla usaremos la estrucctura
   `````sql
   CREATE TABLE <NombreTabla> (
        //elementos de la tabla//
        );
   `````
   dentro de las tablas podemos definir diferentes elementos:
   ### CAMPOS
   utilizando la siguiente estrucctura dentro de la tabla
   `````sql
          <nombrecampo> tipoDato [PRIMARY KEY][UNIQUE][NOT NULL]  
   `````
   podremos crear un campo de la tabla el cual va a poder almacenar el tipo de dato que le indiquemos. Los tipos de datos                  predefinidos se pueden separar en:
   - ###### NUMERICOS  (INTEGER,BIGINT,SMALLINT,DECIMAL,REAL)
   - ###### TEXTO  (CHAR,VARCHAR,TEXT)
   - ###### FECHAS  (DATE,TIME,TIME WITH ZONE, TIMESTAMO, TIMESTAMP WITH TIME ZONE, INTERVAL)
   - ###### BOOLEAN  (BOOLEAN)
   - ###### MONEDA  (MONEY)
   - ###### OTROS  (UUID, JSON, CIDR, INET)
   a demas, podremos crear nuestros propios tipos de datos(en este caso se llman dominios) a partir de los tipos primitivos:
   `````sql
             CREATE DOMAIN <nombre_Tipo_Dato> Tipo;
   `````
   `Ej. CREATE DOMAIN Tipo_DNI CHAR(9);`
   igual que con los schema, a la hora de crear un campo podemos definir algunos atributos especiales, estos de denominan   
   CONTRAINTS.
   #### PRIMATE KEY        
   este CONTRAINT permite identificar cuales campos pertenecen a la clave primaria del la tabla. Este valor se puede definir de dos formas: 
   
   Dentro de la definicion del campo
`````sql
	id INTEGER PRIMARY KEY
`````
 Fuera de la definición
 ```sql
	id INTEGER ,
	PRIMARY KEY (id)
```

   #### FOREIGN KEY        
   este CONTRAINT permite marcar cuales campos forman la relación entre dos tablas. la estructura es:
   ```sql
[CONSTRAINT <nombreRestriccion>] FOREIGN KEY (<Atributos>) REFERENCES <Nombre_tabla_referenciada>[(<Atributos_referenciados>)]
```
A demas, este CONSTRAINT tiene dos atributos especiales que modifican el valor del campo en determinados casos: 
- _ON DELETE_ (modifica el valor del campo en caso de eliminar el campo del que procede la clave) 
- _ON UPDATE_ (modifica este campo al actualizar el valor en el campo de referencia de la tabla externa)

Estos comandos pueden tomar los siguientes valores:
- ##### CASCADE
 Al borrar el registro original, se eliminaran todos los registros de cualquier tabla que contenga una FOREIGN KEY relacionada con el registro original.
- ##### NO ACTION
Al borrar el registro original, no cambiara nada en el resto de registros con la FOREIGN KEY
- ##### SET DEFAULT
Al borrar el registro original, las FOREIGN KEY'S toman un valor por defecto.
- ##### SET NULL 
Al borrar el registro original, las FOREIGN KEY'S toman un valor null.

#### CONSTRAINT UNIQUE
Si a un campo le adjuntamos este CONTRAINT, todos los valores que introduzcamos en este campo deben ser direfentes
```sql
	idalternativa INTEGER UNIQUE
```
#### CONTRAINT DEFAULT
Este CONTRAINT permite establecer un valor por defecto a este campo en caso de que este no se especifique
```sql
	numero INTEGER DEFAULT 1,
```
#### CONTRAINT CHECK
Este permite realizar comprobaciones de los valores del campo tras ser modificados, borrados o insertados. Este CONTRAINT funciona como un valor booleano ya que en caso de pasar la restricción devueve un valor 'true'. Este CONTRAINT tiene dos clausulas:

- ##### DEFERRABLE:
	Determina si la comprobacion se realiza antes o despues de que los cambios se efectuen. Por defecto se encuentra en NOT DEFERRABLE, pero se puede espedificar DEFERRABLE para posponer el check
- ##### PREDICADO:
	Aquí se especifica los requisitos que debe cumplir el valor tras su modificación. en Caso de cumplirlo devolvera un valor booleano 'true'
```sql
CHECK (valor>0)
```
#### CONTRAINT ASSERTION
Permite realizar comprobaaciones con valores de multiples tablas

```sql
CREATE ASSERTION <NombreAsercion>
	CHECK (Predicado);
```

DROP
 -------------------
 El comando drop nos permite borrar elemetos directamente de la base de datos
 ## DROP SCHEMA o DATABESE
 ```sql
 DROP SCHEMA|DATABASE [IF EXIST] <nombre de la base de datos>;
 ```
 a este comando se le puede añadir la clausula _IF EXISTS_, que comprueba si el elemetno existe antes de borrarlo
 ## DROP TABLE
 ```sql
 DROP TABLE [IF EXISTS] <nombre tabla> [CASCADE|RESTRICT];
 ```
 Al borrar una tabla tambien tenemos la opcion _IF EXISTS_ y otras dos opciones:
 - _CASCADE_:
 Borra en cascada
 - _RESTRICT_:
 valor por defecto que no permite borrar la tabla si tiene objetos dependientes
ALTER
 -------------------
 permite modificar los elementos de una tabla
 ## ADD COLUMN
 Este comando nos permite añadir una nueva columna a la tabla que nosostros designemos.
 ```sql
 ALTER TABLE nombreTabla ADD [COLUMN] <campo> tipoDato [PRIMARY KEY][UNIQUE][NOT NULL][CHECK(predicado)];
 ```
 ## ALTER COLUMN
 permite cambiar el tipo de dato de una campo
  ```sql
 ALTER TABLE tabla ALTER COLUMN nombreCampo TYPE nuevoTipodeDato;
  ```
 ## DROP COLUMN
 Este comando nos permite eliminar un campo
  ``` sql
  ALTER TABLE nome-tabla DROP COLUMN <nombrecampo> [CASCADE|RESTRICT];
  ```
  igual que pasaba con DROP, podemos añadir las opciones _CASCADE_ y _RESTRICT_.
 ## ADD CONSTRAINT
 Permite añadir una restriccion
 ``` sql
 ALTER TABLE ADD [CONTRAINT <NombreRestriccion>] FOREIGN KEY/PRIMARY KEY...;
 ``` 
 ## DROP CONSTRAINT
 Este comando permite eliminar una restriccion
 ``` sql
 ALTER TABLE DROP CONSTRAINT <Nome_Restriccion>;
 ``` 
 
 DML (Data Manipulate Lenguage)
================
Este sublenguaje permite la modificación de los datos de una base de datos
 INSERT
 -------------------
 Para introducir datos en una tabla podemos de forma idividual;
  ```sql
  INSERT INTO <nombreT> [(Atrubuto,Atributo1,...)]VALUES(valorA,valorB...);
  INSERT INTO <nombreT> [(Atrubuto,Atributo1,...)]SELECT...;
  ``` 
  o por tupas:
  ``sql
  INSERT INTO <nome_da_taboa> VALUES (valor1A, valor2A....),(valor1B, valor2B....);
  ``
 	
UPDATE
-------------------
Update permite actulizar los valores de una tabla, para esto debemos indicar una clausula que permita cribar cuales valores seran cambidos. En caso de no poner la clausula, se cambiaran todos los valores de la tabla. 
``sql
UPDATE <NombreT> SET atributo1=valor1,
		          atributo2=valor2,

[WHERE clausula];
``

DELETE
 -------------------
 Este comando nos permite borrar tuplas, pero para ello siempre debemos indicar una clausula o predicado que diferenciará cuales tuplas se borrarán. En caso de no ponerlo,  el comando borrará toda la tabla
 ``sql
 DELETE FROM nombreT WHERE condicion;
 ``
 


