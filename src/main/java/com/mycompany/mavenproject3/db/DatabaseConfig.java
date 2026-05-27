package com.mycompany.mavenproject3.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Unico lugar donde viven los datos de conexion a la base de datos.
 * Si cambia el servidor, la contrasena o el nombre de la BD,
 * solo se modifica este archivo y todo lo demas sigue funcionando igual.
 */
public class DatabaseConfig {

    // Cambiar estos tres valores segun la base de datos que use el docente.
    private static final String HOST     = "db4free.net";
    private static final String PUERTO   = "3306";
    private static final String NOMBRE   = "nombre_bd_aqui";
    private static final String USUARIO  = "usuario_aqui";
    private static final String CLAVE    = "contrasena_aqui";

    private static final String URL =
        "jdbc:mysql://" + HOST + ":" + PUERTO + "/" + NOMBRE
        + "?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";

    public static Connection getConexion() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, CLAVE);
    }

    public static String getEstadoConexion() {
        try (Connection con = getConexion()) {
            return "Conexion exitosa al servidor: " + HOST;
        } catch (SQLException e) {
            return "Error al conectar: " + e.getMessage();
        }
    }
}
