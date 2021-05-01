# Apuntes-SQL

### Selectores Basicos
**SELECT**{atributo de la tabla a selecionar} AS {como se va a llamar}<br>
**FROM**{tabla de donde salen los datos}<br>
**WHERE**{condiciones a cumplir} <br>
**GROUP BY** {característica} ___agrupa los qie tengas eso igual___<br>
**HAVING** {expresión a lo WHERE} ___filtra el GROUP segin la expresion de aqui____<br>
**ORDER BY** {parametro a ordenar} {expresion de orden} ___ordena el parametro de la lista segun la expresion de orden___<br> 
### Textos
String = String ___que sean iguales a la cadena exacta___<br>
String **Like**(texto o expresión común) ___que sean iguales a la cadena o la expresion___<br>
String **NOT Like**(texto o expresión común)___que distintos iguales cadena o la expresion___ <br>
**CONCAT**(parteA, parteB) los suma<br>
**DISTINCT**(atributo) ___seleccionara cada valor distinto de ese atributo___<br>
**REPLACE**(lo que se quita, el texto original, lo que se va aponer)
> - "%" algo, algos o nada<br>
> - "_" espacio<br>
>
### Numeros
**SUM**(atributo de la tabla) ___suma todos los valores del atributo seleccionado___<br>
**AVG**(atributo de la tabla) ___realiza la media de los valores del atributo seleccionado___<br>
{numero} **AND** {otro numero}<br>
**BETWEEN**(numero pequeño, numero grande)<br>
**ROUND**(valor, numero positivo) ___redonde x decimales___<br>
**ROUND**(valor, numero negativo) ___redonde a 10^(x)___<br>
**LENGTH**(texto) ___numero de caracteres___<br>
> - "**<**"menor<br>
> - "**>**"mayor<br>
> - "**=**" igual<br>
> - "**<>**"distinto<br>
>
### Expresiones para condiciones
**IN**(lista) comprueba si esta dentro<br>
**ALL**(lista) compara con todos los de la lista<br>
{condicion}**OR**{condicion} ___que se cumpla una o las dos condiciones___<br>
{condicion}**XOR**{condicion} ___que se cumpla solo una de las condiciones___<br>
**IS NULL**   ___es null___<br>
**IS NOT NULL**   ___no es null___<br>
### Join
**FROM** {tabla} INNER **JOIN** {otra tabla}**ON**{condición}   ___coge datos de las tablas qie cumplan la condición___<br>
**LEFR JOIN**    ___coincidentes y dos los de la izquierda___<br>
**RIGHR JOIN**    ___coincidented y todos los de la derecha___<br>

