package com.upy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.upy.config.ConexionBD;
import com.upy.model.ClasificacionVehiculo;

public class ClasificacionVehiculoDao {
	
	public ClasificacionVehiculo getUnaClasificacion(int id) {
		
		ClasificacionVehiculo clasiVeh = new ClasificacionVehiculo();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM clasificacion_vehiculo WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							clasiVeh.setId(id);
							clasiVeh.setNombre(rs.getString("nombre"));
						}
					}catch(SQLException e){
						e.printStackTrace();
					}
					st.close();
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}

		return clasiVeh;
	}

}
