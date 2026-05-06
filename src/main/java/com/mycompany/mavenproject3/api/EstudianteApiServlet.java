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
        // La respuesta se envia en UTF-8 y en formato JSON.
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=UTF-8");

        // Usamos ArrayList porque ya fue visto en clases anteriores.
        // Asi podemos agregar estudiantes de forma ordenada.
        ArrayList<Estudiante> estudiantes = new ArrayList<>();
        estudiantes.add(new Estudiante("Ana", 18, 4.6));
        estudiantes.add(new Estudiante("Pedro", 20, 3.1));
        estudiantes.add(new Estudiante("Luisa", 19, 2.8));

        try (PrintWriter out = response.getWriter()) {
            // Construimos el JSON manualmente para que se vea la estructura.
            out.print("{");
            out.print("\"mensaje\":\"Listado basico de estudiantes\",");
            out.print("\"total\":" + estudiantes.size() + ",");
            out.print("\"estudiantes\":[");

            // Recorremos la lista y escribimos cada estudiante como JSON.
            for (int i = 0; i < estudiantes.size(); i++) {
                Estudiante estudiante = estudiantes.get(i);
                out.print("{");
                out.print("\"nombre\":\"" + estudiante.getNombre() + "\",");
                out.print("\"edad\":" + estudiante.getEdad() + ",");
                out.print("\"nota\":" + estudiante.getNota() + ",");
                out.print("\"estado\":\"" + estudiante.getEstadoAcademico() + "\"");
                out.print("}");

                if (i < estudiantes.size() - 1) {
                    out.print(",");
                }
            }

            // Cerramos el arreglo y el objeto principal.
            out.print("]");
            out.print("}");
        }
    }
}