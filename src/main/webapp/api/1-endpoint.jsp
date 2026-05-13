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
        <h1>Paso 1: Endpoint completo de estudiantes con GET y POST</h1>
        <p>Este es el servlet final, escrito de forma simple para que se entienda el flujo GET, POST y JSON. La conversion a JSON se hace con <strong>toString()</strong> en la clase <strong>Estudiante</strong>.</p>
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
            <p><strong>Metodos:</strong> GET para listar y POST para recibir datos</p>
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
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        ArrayList&lt;Estudiante&gt; estudiantes = new ArrayList&lt;&gt;();
        estudiantes.add(new Estudiante("Ana", 18, 4.6));
        estudiantes.add(new Estudiante("Pedro", 20, 3.1));
        estudiantes.add(new Estudiante("Luisa", 19, 2.8));

        StringBuilder json = new StringBuilder();
        json.append("{");
        json.append("\"mensaje\":\"Listado basico de estudiantes\",");
        json.append("\"total\":").append(estudiantes.size()).append(",");
        json.append("\"estudiantes\":[");

        for (int i = 0; i &lt; estudiantes.size(); i++) {
            if (i &gt; 0) {
                json.append(",");
            }
            json.append(estudiantes.get(i));
        }

        json.append("]");
        json.append("}");

        try (PrintWriter out = response.getWriter()) {
            out.print(json.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        String nombre = request.getParameter("nombre");
        String edadTexto = request.getParameter("edad");
        String notaTexto = request.getParameter("nota");

        if (nombre == null || nombre.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"mensaje\":\"El nombre es obligatorio\"}");
            }
            return;
        }

        try {
            int edad = Integer.parseInt(edadTexto);
            double nota = Double.parseDouble(notaTexto);

            Estudiante estudiante = new Estudiante(nombre.trim(), edad, nota);

            StringBuilder json = new StringBuilder();
            json.append("{");
            json.append("\"mensaje\":\"Estudiante recibido correctamente\",");
            json.append("\"estudiante\":").append(estudiante);
            json.append("}");

            response.setStatus(HttpServletResponse.SC_OK);
            try (PrintWriter out = response.getWriter()) {
                out.print(json.toString());
            }
        } catch (NumberFormatException ex) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"mensaje\":\"Edad y nota deben ser numericas\"}");
            }
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
                <h3>doPost</h3>
                <p>Lee nombre, edad y nota con request.getParameter() y devuelve un JSON nuevo.</p>
            </article>
            <article class="tarjeta">
                <h3>toString</h3>
                <p>La clase Estudiante devuelve su JSON desde toString(), algo que se puede generar desde el IDE.</p>
            </article>
        </div>
    </section>

    <section class="seccion">
        <h2>Prueba rapida</h2>
        <div class="resultado">
            <p><strong>GET</strong>: abre una URL parecida a esta:</p>
            <p><strong>http://localhost:8080/demo-web-1.0-SNAPSHOT/api/estudiantes</strong></p>
            <p><strong>POST</strong>: envia un body x-www-form-urlencoded con nombre, edad y nota.</p>
            <p>Si tu contexto cambia, usa el que te muestre NetBeans al ejecutar el proyecto.</p>
        </div>
    </section>
</div>
</body>
</html>