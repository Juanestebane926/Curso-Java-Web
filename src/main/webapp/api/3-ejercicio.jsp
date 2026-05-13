<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API 3 - Ejercicio para completar</title>
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="contenedor">
    <header class="encabezado encabezado-api">
        <h1>Paso 3: Ejercicio de clase</h1>
        <p>Actividad final para que el estudiante reutilice lo aprendido con GET, POST, validacion y JSON.</p>
        <nav class="nav-ejercicios">
            <a href="index.jsp">Menu unidad</a>
            <a href="2-netbeans.jsp">Anterior: Crearlo en NetBeans</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Objetivo</h2>
        <div class="resultado">
            <p>Que el estudiante reutilice lo que ya vio en la clase anterior, pero ahora:</p>
            <p>- lea un endpoint GET ya conocido,</p>
            <p>- simplifique la construccion del JSON,</p>
            <p>- y agregue un endpoint POST que reciba datos y responda en JSON.</p>
        </div>
    </section>

    <section class="seccion">
        <h2>Lo que deben construir</h2>
        <ol class="lista">
            <li>Clase modelo <strong>Estudiante</strong> con nombre, edad y nota.</li>
            <li>Constructor, getters y metodo <strong>getEstadoAcademico()</strong>.</li>
            <li>Servlet principal <strong>EstudianteApiServlet</strong>.</li>
            <li>Rutas <strong>GET /api/estudiantes</strong> y <strong>POST /api/estudiantes</strong>.</li>
            <li>GET con una lista de 3 estudiantes fijos en JSON.</li>
            <li>POST con lectura de parametros, validacion basica y respuesta JSON.</li>
        </ol>
    </section>

    <section class="seccion">
        <h2>Validacion minima</h2>
        <div class="resultado">
            <p>Antes de crear el objeto, verificar que:</p>
            <p>- nombre no venga vacio,</p>
            <p>- edad y nota se puedan convertir a numero.</p>
            <p>Si falla, devolver JSON de error con codigo HTTP 400.</p>
        </div>
    </section>

    <section class="seccion">
        <h2>Pruebas</h2>
        <div class="tarjetas">
            <article class="tarjeta">
                <h3>GET</h3>
                <p>Probar desde el navegador en una URL parecida a <strong>http://localhost:8080/.../api/estudiantes</strong>.</p>
            </article>
            <article class="tarjeta">
                <h3>POST</h3>
                <p>Enviar desde Postman o similar usando <strong>body x-www-form-urlencoded</strong>.</p>
            </article>
            <article class="tarjeta">
                <h3>Respuesta</h3>
                <p>El servidor debe devolver JSON limpio, sin construir cada campo con muchos out.print.</p>
            </article>
        </div>
    </section>

    <section class="seccion">
        <h2>Enunciado para el estudiante</h2>
        <div class="nota">
            <p>Crea un servlet /api/estudiantes que responda con GET mostrando una lista de 3 estudiantes en JSON, usando un metodo auxiliar para convertir cada estudiante a JSON. Luego agrega POST para recibir un estudiante nuevo con nombre, edad y nota, y devuelve el objeto en JSON. Si el nombre viene vacio o los numeros no son validos, responde con error 400.</p>
        </div>
    </section>
</div>
</body>
</html>