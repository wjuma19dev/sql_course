# Trigger
Fuente: [www.markdownguide.org](https://www.markdownguide.org/basic-syntax/#links)

**¿Qué es un TRIGGER SQL?**

  Un TRIGGER, también conocido como disparador, es una especie de script de programación SQL para base de datos. Los TRIGGER son procedimientos que se ejecutarán según nuestras indicaciones cuando se realicen operaciones sobre la información de la base de datos. Estas operaciones pueden ser de actualización (UPDATE), inserción (INSERT) y borrado (DELETE).

  Los TRIGGER además pueden modificar la información de la base de datos e incluso detener la ejecución de consultas erróneas. 

>Los TRIGGER son procedimientos que se ejecutarán según nuestras indicaciones cuando se realicen operaciones sobre la información de la base de datos. Estas operaciones pueden ser de actualización (UPDATE), inserción (INSERT) y borrado (DELETE).

__¿Para qué sirve un TRIGGER SQL?__

Los TRIGGERS son una de las funcionalidades más útiles de las que disponemos cuando diseñamos y mantenemos bases de datos. Gracias a ellos podremos implementar ciertas características de nuestra base de datos sin necesidad de desarrollar programación en otros lenguajes externos. 

Imagínate por ejemplo que quieres duplicar en una segunda tabla toda la información que se inserte en otra. No existe ninguna forma de indicarle a la base de datos que lo realice de forma automática. Sin embargo, gracias a un TRIGGER que se ejecute tras un INSERT, podemos insertar esa información en la segunda tabla, todo esto sin que el usuario/programador que lanzó el INSERT tenga que hacer nada.

Las posibilidades de los TRIGGER son muy grandes, y siempre debemos tenerlos en mente como recurso para manipular la información de INSERT, UPDATE o DELETE.

__Cómo crear TRIGGER SQL__

Crear un TRIGGER con SQL es sencillo, casi todos los sistemas de bases de datos (SGBD) están preparados para ello, e incluso algunos pueden incorporar  un asistente que nos guie en el proceso. A continuación voy a explicarte como crearlo paso a paso, verás como en 5 minutos serás capaz de crear tu primer TRIGGER.

#### Estructura de un trigger

La creación de un TRIGGER sigue las bases de crear un procedimiento almacenado o una función almacenada. Primero declaramos un delimitador y usamos la sentencia CREATE:

> CREATE TRIGGER
>1. DELIMITER $$
>2. CREATE TRIGGER trigger_historico

En estas líneas SQL he creado un TRIGGER con el nombre trigger_historico. Este nombre me servirá después para identificarlo, pudiendo así borrarlo o buscarlo en la base de datos.

A continuación debemos indicar CUANDO DEBE EJECUTARSE el TRIGGER. Las indicaciones posibles en este punto son AFTER o BEFORE para indicar si  el disparador se ejecutará ANTES o DESPUÉS de la orden lanzada por el usuario. Estas órdenes serán: INSERT, DELETE o UPDATE. Por último indicaremos sobre que tabla actuará.

Vamos a completar el código anterior indicando que la ejecución será tras un INSERT en la tabla usuario:

>1. DELIMITER $$
>2. CREATE TRIGGER trigger_historico
>3. AFTER INSERT ON usuario
>4. FOR EACH ROW

Como puedes ver he añadido las dos últimas líneas: la primera indica que la ejecución será tras una inserción en la tabla usuario, mientras que la segunda forma parte de la estructura de un TRIGGER e indica que se debe aplicar a cada fila insertada.

Por último mediante el comando BEGIN y END indicamos las líneas de código SQL que ejecutará el TRIGGER:

>1. DELIMITER $$
>2. CREATE TRIGGER trigger_historico
>3. AFTER INSERT ON usuario
>4. FOR EACH ROW
>5. BEGIN
>6. //líneas de código SQL que se ejecutarán
>7. END; $$

#### Datos nuevos y antiguos. El OLD y el NEW

Para que nuestras líneas de código SQL puedan acceder a la información que interviene en el TRIGGER, es decir, la información a la que afecta un UPDATE, INSERT o DELETE, disponemos de dos variables especiales NEW y OLD.

***La variable NEW de un TRIGGER***

NEW es la variable que almacena la nueva información que aporta la consulta a la base de datos, es decir, cada una de las filas que intervienen en un INSERT O UPDATE. Si por ejemplo se ha realizado un INSERT, gracias a NEW podremos acceder a los datos introducidos para cada columna de la tabla. NEW.nombre por ejemplo almacena la información de la columna nombre que tendrá el nuevo registro insertado en la tabla. 

Hay que tener en cuenta que NEW no estará disponible en todos los tipos de TRIGGER. En concreto los TRIGGER relacionados con un DELETE no dispondrán de información en esta variable ya que tan solo tendremos información antigua que es eliminada.

***La variable OLD de un TRIGGER***

OLD es la variable que almacena la información antigua relacionada con la consulta que ejecuta el TRIGGER, esta información la componen las filas que van a ser borradas o modificadas. En un DELETE por ejemplo, OLD tendrá la información de todas las columnas de los registros borrados.

Al igual que NEW no está disponible para todos los TRIGGER que creemos, la variable OLD no podrá ser utilizada para un INSERT, ya que en este tan solo existe nueva información que va a ser insertada en la base de datos.

**Ejemplo de un TRIGGER sencillo**

Vamos a resolver un TRIGGER que nos permita mantener una copia de todos los clientes que se inserten en una base de datos de una tienda online. Para esto tendremos dos tablas: cliente y cliente_historico. Así, el siguiente TRIGGER insertará toda la información del cliente (nombre, dni, direccion) más una columna extra: fecha_registro.

>1. DELIMITER $$
>2. CREATE TRIGGER trigger_cliente_historico 
>3. AFTER INSERT ON cliente
>4. FOR EACH ROW
>5. BEGIN 
>6. INSERT INTO cliente_historico(nombre, dni, direccion)
>7. VALUES (NEW.nombre, NEW.dni, NEW.direccion, CURDATE());
>8. END; $$

__Ejemplo 2 de un TRIGGER sencillo__

El siguiente TRIGGER insertará un valor nuevo en un campo único identificador tras una actualización de datos en la tabla usuario_web:

>1. DELIMITER $$
>2. CREATE TRIGGER trigger_usuario_identificador
>3. AFTER UPDATE ON usuario
>4. FOR EACH ROW
>5. BEGIN 
>6. UPDATE usuario SET identificador = CONCAT(NEW.id, '_', NEW.nombre, '_', NEW.dni)
>7. WHERE id = OLD.id;
>8. END; $$
