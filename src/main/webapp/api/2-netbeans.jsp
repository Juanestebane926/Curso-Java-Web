<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API 2 - Crear en NetBeans</title>
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="contenedor">
    <header class="encabezado encabezado-api">
        <h1>Paso 2: Como crearlo en NetBeans</h1>
        <p>Aqui va la ruta exacta para que el alumno sepa donde hacer clic y en que carpeta crear cada cosa.</p>
        <nav class="nav-ejercicios">
            <a href="index.jsp">Menu unidad</a>
            <a href="1-endpoint.jsp">Anterior: Endpoint completo</a>
            <a href="3-ejercicio.jsp">Siguiente: Ejercicio para completar</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Pasos exactos en NetBeans</h2>
        <ol class="lista">
            <li>Abre el proyecto Maven <strong>mavenproject3</strong> en la ventana <strong>Projects</strong>.</li>
            <li>Despliega <strong>Source Packages</strong> y ubica el paquete <strong>com.mycompany.mavenproject3</strong>.</li>
            <li>Clic derecho sobre <strong>com.mycompany.mavenproject3</strong> y elige <strong>New &gt; Java Package</strong>.</li>
            <li>Escribe <strong>api</strong> como nombre del paquete. Al guardar, quedara en <strong>src/main/java/com/mycompany/mavenproject3/api</strong>.</li>
            <li>Clic derecho sobre el paquete <strong>api</strong> y elige <strong>New &gt; Servlet...</strong>.</li>
            <li>Si no ves Servlet, usa <strong>Other...</strong>, luego <strong>Web</strong> y despues <strong>Servlet</strong>.</li>
            <li>Asigna el nombre <strong>EstudianteApiServlet</strong> y termina el asistente.</li>
            <li>Reemplaza el codigo generado por la version final del ejercicio.</li>
            <li>Verifica que la anotacion <strong>@WebServlet</strong> apunte a <strong>/api/estudiantes</strong>.</li>
            <li>Ejecuta el proyecto y prueba el GET en el navegador.</li>
            <li>Prueba el POST con un cliente como Postman usando <strong>body x-www-form-urlencoded</strong>.</li>
        </ol>
    </section>

    <section class="seccion">
        <h2>Carpetas que debes usar</h2>
        <table class="tabla-simple">
            <thead>
            <tr>
                <th>Carpeta</th>
                <th>Que va ahi</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>src/main/java/com/mycompany/mavenproject3/api</td>
                <td>La clase del servlet que responde el endpoint.</td>
            </tr>
            <tr>
                <td>src/main/webapp/api</td>
                <td>Las paginas JSP de esta clase didactica.</td>
            </tr>
            <tr>
                <td>src/main/webapp/WEB-INF</td>
                <td>Configuracion opcional si quieres registrar el servlet en web.xml.</td>
            </tr>
            </tbody>
        </table>
    </section>

    <section class="seccion">
        <h2>Lo mas importante</h2>
        <div class="tarjetas">
            <article class="tarjeta">
                <h3>Paquete</h3>
                <p>El paquete <strong>api</strong> separa esta clase de las paginas JSP del resto del proyecto.</p>
            </article>
            <article class="tarjeta">
                <h3>Ruta</h3>
                <p>La anotacion <strong>@WebServlet</strong> conecta el codigo Java con la URL del navegador.</p>
            </article>
            <article class="tarjeta">
                <h3>Prueba</h3>
                <p>Si el GET y el POST responden JSON, el endpoint quedo listo y la clase ya funciona.</p>
            </article>
        </div>
    </section>
</div>
</body>
</html>