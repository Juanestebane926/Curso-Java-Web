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
        <h1>Paso 3: Ejercicio para completar</h1>
        <p>Este ejercicio esta pensado para que cada estudiante escriba su propia version del endpoint.</p>
        <nav class="nav-ejercicios">
            <a href="index.jsp">Menu unidad</a>
            <a href="2-netbeans.jsp">Anterior: Crearlo en NetBeans</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Plantilla incompleta</h2>
        <div class="codigo">
            <pre>package com.mycompany.mavenproject3.api;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "____________", urlPatterns = {"/api/____________"})
public class ____________ extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");

        try (PrintWriter out = response.getWriter()) {
            out.print("{");
            out.print("\"mensaje\":\"____________\",");
            out.print("\"total\":____________");
            out.print("}");
        }
    }
}</pre>
        </div>
    </section>

    <section class="seccion">
        <h2>Que debe completar el alumno</h2>
        <ol class="lista">
            <li>Escribir el nombre real de la clase.</li>
            <li>Definir la ruta del endpoint con <strong>/api/...</strong>.</li>
            <li>Agregar un mensaje propio en la respuesta JSON.</li>
            <li>Cambiar el valor de <strong>total</strong> por la cantidad real que quiera mostrar.</li>
            <li>Opcional: convertir este mismo ejercicio a <strong>productos</strong> en lugar de estudiantes.</li>
        </ol>
    </section>

    <section class="seccion">
        <h2>Version final esperada</h2>
        <div class="resultado">
            <p>Al terminar, la idea es que el alumno tenga una clase parecida a:</p>
            <p><strong>EstudianteApiServlet</strong> o <strong>ProductoApiServlet</strong></p>
            <p>Y una URL tipo:</p>
            <p><strong>/api/estudiantes</strong> o <strong>/api/productos</strong></p>
        </div>
    </section>
</div>
</body>
</html>