<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BD 1 - Conceptos y conexion</title>
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="contenedor">
    <header class="encabezado encabezado-api">
        <h1>Paso 1: Conceptos y conexion a la base de datos</h1>
        <p>Antes de escribir codigo, entendemos el mapa. Sin mapa, el codigo no tiene sentido.</p>
        <nav class="nav-ejercicios">
            <a href="index.jsp">Menu unidad</a>
            <a href="2-dao-dto.jsp">Siguiente: DAO y DTO</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Por que necesitamos una base de datos</h2>
        <ol class="lista">
            <li>La memoria del servidor se borra al reiniciar. La base de datos no.</li>
            <li>Una base de datos puede guardar millones de registros sin agotar la RAM.</li>
            <li>Muchos usuarios pueden escribir y leer al mismo tiempo sin perder datos.</li>
            <li>Podemos hacer consultas complejas: filtrar, ordenar, agrupar.</li>
        </ol>
    </section>

    <section class="seccion">
        <h2>Que es JDBC</h2>
        <p>JDBC (Java Database Connectivity) es la API estandar de Java para hablar con bases de datos relacionales.
           No importa si usas MySQL, PostgreSQL o MariaDB: el codigo Java es casi identico.
           Lo que cambia es el driver (el JAR que agregamos en el pom.xml) y la URL de conexion.</p>
        <div class="tarjetas">
            <article class="tarjeta">
                <h3>DriverManager</h3>
                <p>Crea la conexion usando la URL, el usuario y la contrasena.</p>
            </article>
            <article class="tarjeta">
                <h3>Connection</h3>
                <p>Representa la sesion abierta con la base de datos. Hay que cerrarla siempre.</p>
            </article>
            <article class="tarjeta">
                <h3>PreparedStatement</h3>
                <p>Ejecuta una consulta SQL con parametros seguros. Nunca concatenes SQL manualmente.</p>
            </article>
            <article class="tarjeta">
                <h3>ResultSet</h3>
                <p>Las filas que devuelve un SELECT. Se recorre con rs.next() y se lee columna por columna.</p>
            </article>
        </div>
    </section>

    <section class="seccion">
        <h2>La URL de conexion explicada</h2>
        <div class="codigo">
            <pre>jdbc:mysql://db4free.net:3306/nombre_bd?useSSL=false&amp;serverTimezone=UTC
  |     |       |              |       |
  |     |       |              |       +-- parametros opcionales
  |     |       |              +---------- nombre de la base de datos
  |     |       +------------------------- host:puerto
  |     +--------------------------------- motor de base de datos
  +--------------------------------------- protocolo JDBC</pre>
        </div>
    </section>

    <section class="seccion">
        <h2>Como se abre y cierra una conexion correctamente</h2>
        <div class="codigo">
            <pre>// try-with-resources cierra la conexion automaticamente al salir del bloque
try (Connection con = DatabaseConfig.getConexion()) {

    String sql = "SELECT nombre FROM estudiantes WHERE id = ?";

    try (PreparedStatement ps = con.prepareStatement(sql)) {
        ps.setInt(1, 1);  // reemplaza el ? con el valor 1

        try (ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                String nombre = rs.getString("nombre");
                System.out.println(nombre);
            }
        }
    }

} catch (SQLException e) {
    // Nunca ignorar esta excepcion: aqui vive el mensaje de error real
    System.err.println("Error: " + e.getMessage());
}</pre>
        </div>
    </section>

    <section class="seccion">
        <h2>Base de datos gratuita para la clase</h2>
        <div class="nota">
            <p><strong>Servicio recomendado:</strong> db4free.net</p>
            <p><strong>Como registrarse:</strong> entrar a db4free.net, crear una cuenta gratuita, anotar el usuario, contrasena y nombre de BD.</p>
            <p><strong>Host:</strong> db4free.net &nbsp; | &nbsp; <strong>Puerto:</strong> 3306</p>
            <p>El docente crea una sola cuenta y comparte las credenciales con todos los estudiantes.
               Todos veran los mismos datos en tiempo real: eso hace la clase mas interactiva.</p>
            <p><strong>Limite:</strong> Es un servidor de pruebas. No usar para produccion ni datos reales.</p>
        </div>
    </section>

    <section class="seccion">
        <h2>Configuracion en el proyecto</h2>
        <p>Abrir el archivo <strong>db/DatabaseConfig.java</strong> y cambiar estos cuatro valores:</p>
        <div class="codigo">
            <pre>private static final String HOST    = "db4free.net";
private static final String PUERTO  = "3306";
private static final String NOMBRE  = "nombre_bd_aqui";   // &lt;-- cambiar
private static final String USUARIO = "usuario_aqui";     // &lt;-- cambiar
private static final String CLAVE   = "contrasena_aqui";  // &lt;-- cambiar</pre>
        </div>
    </section>

    <section class="seccion">
        <h2>SQL para crear la tabla</h2>
        <p>Ejecutar en phpMyAdmin o en cualquier cliente MySQL conectado a db4free.net:</p>
        <div class="codigo">
            <pre>CREATE TABLE IF NOT EXISTS estudiantes (
    id     INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    edad   INT          NOT NULL,
    nota   DOUBLE       NOT NULL
);</pre>
        </div>
        <p>db4free.net incluye phpMyAdmin en la misma web: acceder con el mismo usuario y contrasena.</p>
    </section>
</div>
</body>
</html>
