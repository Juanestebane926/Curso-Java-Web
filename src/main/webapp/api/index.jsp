<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Clase 3 - API de estudiantes con GET y POST</title>
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="contenedor">
    <header class="encabezado encabezado-api">
        <h1>Clase 3: API de estudiantes con GET y POST</h1>
        <p>
            Esta clase muestra un servlet completo que responde JSON, primero con GET y luego con POST,
            para que el estudiante vea un flujo real de entrada, validacion y respuesta.
        </p>
        <nav class="nav-ejercicios">
            <a href="../index.jsp">Menu principal</a>
            <a href="1-endpoint.jsp">1) Endpoint completo</a>
            <a href="2-netbeans.jsp">2) Crearlo en NetBeans</a>
            <a href="3-ejercicio.jsp">3) Ejercicio para completar</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Ruta sugerida para la clase</h2>
        <ol class="lista">
            <li>Ver el GET terminado y probar la URL en el navegador.</li>
            <li>Crear el servlet en NetBeans y ubicarlo en el paquete correcto.</li>
            <li>Agregar el POST con lectura de parametros y validacion basica.</li>
            <li>Entregar el ejercicio final como actividad para los estudiantes.</li>
        </ol>
    </section>

    <section class="seccion">
        <h2>Objetivo pedagogico</h2>
        <div class="tarjetas">
            <article class="tarjeta">
                <h3>GET</h3>
                <p>Crear un listado basico de 3 estudiantes usando ArrayList y JSON.</p>
            </article>
            <article class="tarjeta">
                <h3>POST</h3>
                <p>Recibir nombre, edad y nota desde un formulario o Postman.</p>
            </article>
            <article class="tarjeta">
                <h3>Validacion</h3>
                <p>Responder con error 400 cuando falten datos o no sean numericos.</p>
            </article>
        </div>
    </section>

    <p class="pie">Ruta sugerida: 1 -> 2 -> 3.</p>
</div>
</body>
</html>