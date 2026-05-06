<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>API 1 - Endpoint completo</title>
    <link rel="stylesheet" href="../css/estilos.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700;800&display=swap" rel="stylesheet">
</head>
<body>
<div class="contenedor">
    <header class="encabezado encabezado-api">
        <h1>Paso 1: Endpoint basico para estudiantes con ArrayList</h1>
        <p>Este es el codigo completo que se ejecuta en el servidor, usando ArrayList como en la clase anterior, y responde con JSON.</p>
        <nav class="nav-ejercicios">
            <a href="index.jsp">Menu unidad</a>
            <a href="2-netbeans.jsp">Siguiente: Crearlo en NetBeans</a>
        </nav>
    </header>

    <section class="seccion">
        <h2>Archivo real del endpoint</h2>
        <div class="nota">
            <p><strong>Ruta del archivo:</strong> src/main/java/com/mycompany/mavenproject3/api/EstudianteApiServlet.java</p>
            <p><strong>Ruta del endpoint:</strong> /api/estudiantes</p>
        </div>
    </section>

    <section class="seccion">
        <h2>Codigo completo del servlet</h2>
        <div class="codigo">
            <pre>package com.mycompany.mavenproject3.api;

import com.mycompany.mavenproject3.model.Estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "EstudianteApiServlet", urlPatterns = {"/api/estudiantes"})
public class EstudianteApiServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // La respuesta se envia en UTF-8 y en formato JSON.
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        // ArrayList permite agregar estudiantes como ya vimos antes.
        ArrayList&lt;Estudiante&gt; estudiantes = new ArrayList&lt;&gt;();
        estudiantes.add(new Estudiante("Ana", 18, 4.6));
        estudiantes.add(new Estudiante("Pedro", 20, 3.1));
        estudiantes.add(new Estudiante("Luisa", 19, 2.8));

        try (PrintWriter out = response.getWriter()) {
            // Armamos el JSON manualmente para entender la estructura.
            out.print("{");
            out.print("\"mensaje\":\"Listado basico de estudiantes\",");
            out.print("\"total\":" + estudiantes.size() + ",");
            out.print("\"estudiantes\":[");

            // Recorremos la lista y convertimos cada estudiante en JSON.
            for (int i = 0; i &lt; estudiantes.size(); i++) {
                Estudiante estudiante = estudiantes.get(i);
                out.print("{");
                out.print("\"nombre\":\"" + estudiante.getNombre() + "\",");
                out.print("\"edad\":" + estudiante.getEdad() + ",");
                out.print("\"nota\":" + estudiante.getNota() + ",");
                out.print("\"estado\":\"" + estudiante.getEstadoAcademico() + "\"");
                out.print("}");

                if (i &lt; estudiantes.size() - 1) {
                    out.print(",");
                }
            }

            // Cerramos el arreglo y el objeto principal.
            out.print("]");
            out.print("}");
        }
    }
}</pre>
        </div>
    </section>

    <section class="seccion">
        <h2>Que hace cada parte</h2>
        <div class="tarjetas">
            <article class="tarjeta">
                <h3>@WebServlet</h3>
                <p>Expone la ruta /api/estudiantes sin escribir la configuracion en web.xml.</p>
            </article>
            <article class="tarjeta">
                <h3>doGet</h3>
                <p>Responde cuando el navegador o una app hace una peticion GET.</p>
            </article>
            <article class="tarjeta">
                <h3>application/json</h3>
                <p>Le dice al cliente que la respuesta es JSON y no HTML.</p>
            </article>
            <article class="tarjeta">
                <h3>PrintWriter</h3>
                <p>Escribe el contenido que vera el cliente en la respuesta.</p>
            </article>
        </div>
    </section>

    <section class="seccion">
        <h2>Prueba rapida</h2>
        <div class="resultado">
            <p>Cuando ejecutes el proyecto, abre una URL parecida a esta:</p>
            <p><strong>http://localhost:8080/demo-web-1.0-SNAPSHOT/api/estudiantes</strong></p>
            <p>Si tu contexto cambia, usa el que te muestre NetBeans al ejecutar el proyecto.</p>
        </div>
    </section>
</div>
</body>
</html>