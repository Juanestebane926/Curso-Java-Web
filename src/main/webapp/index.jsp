<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Plantilla de Clase - Java JSP</title>
    <link rel="stylesheet" href="css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="contenedor">
    <header class="encabezado">
        <h1>Plantilla de practicas Java con JSP</h1>
        <p>
            Este inicio separa el contenido en dos clases para mantener el proyecto ordenado y facil de seguir.
        </p>
        <nav class="nav-ejercicios">
            <a href="fundamentos/index.jsp">Clase 1: Fundamentos</a>
            <a href="objetos/index.jsp">Clase 2: Objetos</a>
            <a href="api/index.jsp">Clase 3: API basica</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Estructura recomendada</h2>
        <ol class="lista">
            <li>Abre primero la carpeta de la clase que vas a dictar.</li>
            <li>Sigue las paginas en orden numerico.</li>
            <li>Usa los menus internos para no perder a los estudiantes.</li>
            <li>Evita mezclar temas de ambas clases en la misma sesion.</li>
        </ol>
    </section>

    <section class="seccion">
        <h2>Resumen de clases</h2>
        <div class="tarjetas">
            <article class="tarjeta">
                <h3>Clase 1: Fundamentos</h3>
                <p>Variables, condicionales, ciclos y reto inicial.</p>
            </article>
            <article class="tarjeta">
                <h3>Clase 2: Objetos</h3>
                <p>Clase Estudiante, instancias, listas y reto integrador.</p>
            </article>
            <article class="tarjeta">
                <h3>Clase 3: API basica</h3>
                <p>Servlets, endpoint GET y ejercicio guiado para estudiantes.</p>
            </article>
        </div>
    </section>

    <p class="pie">Inicio general del curso. Elige una clase para comenzar.</p>
</div>
</body>
</html>
