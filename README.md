# Utilizando el bloque try/catch en SQL Server para manejar errores

Desde la versión 2005 de Sql Server se incorpora el bloque try/catch para el manejo de errores en el código T-SQL, esta característica similar a la que tienen los lenguajes .NET consiste de dos partes:


BEGIN TRY
 --Sentencias T-SQL de funcionalidad
END TRY

y el bloque CATCH
BEGIN CATCH
 --Sentencias T-SQL para el manejo de error
END CATCH
Cuando se genera un error dentro del bloque TRY, inmediatamente el flujo del programa continua en el bloque CATCH donde el error se procesa de diferentes maneras, sino se genera un error el flujo se salta el bloque CATCH y continua hasta terminar el programa.

Dentro del bloque CATCH puedes utilizar las siguientes funciones del sistema para obtener información del error.

ERROR_LINE() - El número de línea que causo el error o donde se ejecutó la orden RAISERROR.
ERROR_MESSAGE() - Un texto resumen que indica la naturaleza de error.
ERROR_SEVERITY() - Regresa la severidad del error.
ERROR_STATE() - Regresa un valor entero que regresa NULL si se ejecutó afuera de un bloque CATCH.
ERROR_NUMBER() - Regresa el número de error que causo el error. Esta función regresa el número de error cuando se ejecuta adentro de un bloque CATCH, sino se ejecuta dentro un bloque CATCH regresa NULL.
ERROR_PROCEDURE() - regresa el nombre del store procedure o trigger donde ocurrió el error.
ERROR_PROCEDURE() - Regresa NULL si el error no ocurre dentro de un STORE PROCEDURE, si se ejecuta dentro de un STORE PROCEDURE o TRIGGER regresa entonces el nombre del STORE PROCEDURE o TRIGGER.
Una de las recomendaciones para la utilización del bloque TRY/CATCH es poner una sentencia ROLLBACK TRANSACTION en el bloque CATCH para que en caso de transacciones parciales se conserve la integridad de la información.

Bien a continuación un ejemplo de como programar un bloque TRY/CATCH en T-SQL:



Cuando se ejecuta este código con el número 25 positivo el programa se ejecuta correctamente y no generará una excepción :

Fig 1 Ejecutándose con un número positivo no genera excepción.



En cambio si se ejecuta con un entero negativo se lanzará una excepción que el bloque CATCH procesará correctamente.

Fig 2 Ejecutándose con un numero negativo genera excepción.



Consultando el catalogo sys.messages
Se puede consultar el catalogo sys.messages para ver la lista completa de números de error y sus correspondientes mensajes con la siguiente sentencia:

SELECT *FROM sys.messages ORDER BY message_id
Fig 3 Consultando el catalogo sys.messages para ver la lista completa de errores y mensajes.

