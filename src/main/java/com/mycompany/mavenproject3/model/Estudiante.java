package com.mycompany.mavenproject3.model;

public class Estudiante {
    private String nombre;
    private int edad;
    private double nota;

    public Estudiante(String nombre, int edad, double nota) {
        // Cuando creemos un estudiante, guardamos sus datos en el objeto.
        this.nombre = nombre;
        this.edad = edad;
        this.nota = nota;
    }

    // Estos metodos sirven para cambiar la informacion del estudiante si hiciera falta.
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setNota(double nota) {
        this.nota = nota;
    }

    // Estos metodos permiten leer los datos del estudiante.
    public String getNombre() {
        return nombre;
    }

    public int getEdad() {
        return edad;
    }

    public double getNota() {
        return nota;
    }

    public String getEstadoAcademico() {
        // Si la nota es 3.0 o mas, el estudiante aprueba.
        if (nota >= 3.0) {
            return "Aprobado";
        }
        // Si no llega a 3.0, queda reprobado.
        return "Reprobado";
    }

    public String getResumen() {
        return "Nombre: " + nombre + " | Edad: " + edad + " | Nota: " + nota;
    }

    @Override
    public String toString() {
        // Cuando Java necesite mostrar este objeto como texto, devolvemos un JSON sencillo.
        return "{"
                + "\"nombre\":\"" + nombre + "\"," 
                + "\"edad\":" + edad + ","
                + "\"nota\":" + nota + ","
                + "\"estado\":\"" + getEstadoAcademico() + "\""
                + "}";
    }

}
