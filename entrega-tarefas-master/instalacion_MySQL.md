CREACION BASE DE DATOS CON ELEPHANTSQL
=====================================
ElephantSQL es una plataformade hosting de bases de datos, la cual usaremos para para nuestra base

## Hostear BD
Lo primero que tendremos que hacer es registrrnos en ElephantSQL. Una vez registrado, solo tendremos que darle al boton de crear una nueva instancia.
Tras esto nos mandará que elijamos el plan de la instancia. Cada plan indica las limitaciones que tendra nuestra base de datos, en este caso usaremos el plan Tiny Turtle ya que es el plan gratuito.
Una vez seleccionado el plan, solo tendremos que introducir los datos de la base de datos como su nombre y donde queremos que sea hosteada.
Finalmente podremos ver en panel de datos, todo lo necesario para entrar en ella.

## Instalar PGAdmin y SQLShell
Descargaremos el archivo de instalacion desde la pagina de  https://www.postgresql.org/download/
Una vez descargado iniciaremos la instlación indicando la ruta de instalacion y despues indicando cuales elementos queremos instlar, en este caso psql y PGAdmin.

## Acceder a la base de Datos
Para acceder a la base de datos desde comandos debemos abrir una pestaña de CMD e introducir el sigueinte comando
RutaDeLaInstalacion\psql.exe -h servidor -U usuario -d basededatospordefecto -p puerto
