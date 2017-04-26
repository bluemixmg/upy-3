package com.upy.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;

public class ConexionBD {
private Connection connection = null;
    
    public ConexionBD() throws ClassNotFoundException, SQLException {
        //Paso 1
        Class.forName("org.postgresql.Driver");
        
        //Paso 2
        String host = "echo-01.db.elephantsql.com";
        String dbName = "";
        int port = 5432;
        String urlConnection = "jdbc:postgresql://" +  host + ":" 
                + port + "/" + dbName;
        
        //Paso 3
        String username = "";
        String password = "";
        connection = DriverManager.getConnection(urlConnection, username, password);
        connection.setAutoCommit(true);
        System.out.println("Conexion Exitosa");
    }
    
    public Connection getConexion() {
        return this.connection;
    }
    
    public void closeConexion() {
        if(connection != null) {
            try {
                connection.close();
                System.out.println("Conexion Cerrrada");
            } catch(SQLException ex) {
                java.util.logging.Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

}
