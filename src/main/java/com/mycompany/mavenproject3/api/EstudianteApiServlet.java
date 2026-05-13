package com.mycompany.mavenproject3.api;

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
        // Le decimos al navegador que vamos a devolver texto en formato JSON.
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        // Creamos una lista con tres estudiantes fijos para mostrar un ejemplo simple.
        ArrayList<Estudiante> estudiantes = new ArrayList<>();
        estudiantes.add(new Estudiante("Ana", 18, 4.6));
        estudiantes.add(new Estudiante("Pedro", 20, 3.1));
        estudiantes.add(new Estudiante("Luisa", 19, 2.8));

        // Vamos armando el texto JSON poco a poco.
        StringBuilder respuesta = new StringBuilder();
        respuesta.append("{");
        respuesta.append("\"mensaje\":\"Listado basico de estudiantes\",");
        respuesta.append("\"total\":").append(estudiantes.size()).append(",");
        respuesta.append("\"estudiantes\":[");

        for (int i = 0; i < estudiantes.size(); i++) {
            // Agregamos una coma solo entre un estudiante y el siguiente.
            if (i > 0) {
                respuesta.append(",");
            }
            // toString() de Estudiante ya devuelve un JSON listo para usar.
            respuesta.append(estudiantes.get(i));
        }

        respuesta.append("]");
        respuesta.append("}");

        // Escribimos la respuesta final para que el navegador la vea.
        try (PrintWriter out = response.getWriter()) {
            out.print(respuesta.toString());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // El POST tambien responde en JSON.
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        // Leemos lo que viene desde el formulario o desde Postman.
        String nombre = request.getParameter("nombre");
        String edadTexto = request.getParameter("edad");
        String notaTexto = request.getParameter("nota");

        // Si el nombre esta vacio, paramos aqui y devolvemos un error claro.
        if (nombre == null || nombre.trim().isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"mensaje\":\"El nombre es obligatorio\"}");
            }
            return;
        }

        // Si edad o nota no se pueden convertir a numero, tambien devolvemos error.
        try {
            int edad = Integer.parseInt(edadTexto);
            double nota = Double.parseDouble(notaTexto);

            // Creamos el estudiante con los datos recibidos.
            Estudiante estudiante = new Estudiante(nombre.trim(), edad, nota);

            // Armamos la respuesta final.
            StringBuilder respuesta = new StringBuilder();
            respuesta.append("{");
            respuesta.append("\"mensaje\":\"Estudiante recibido correctamente\",");
            respuesta.append("\"estudiante\":").append(estudiante);
            respuesta.append("}");

            response.setStatus(HttpServletResponse.SC_OK);
            try (PrintWriter out = response.getWriter()) {
                out.print(respuesta.toString());
            }
        } catch (NumberFormatException ex) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            try (PrintWriter out = response.getWriter()) {
                out.print("{\"mensaje\":\"Edad y nota deben ser numericas\"}");
            }
        }
    }
}