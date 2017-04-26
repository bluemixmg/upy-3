package com.upy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.upy.config.ConexionBD;
import com.upy.model.Sucursal;

public class SucursalDao {

	public Sucursal getUnaSucursal(int id) {
		
		Sucursal sucursal = new Sucursal();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM sucursal WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							sucursal.setId(id);
							sucursal.setNombre(rs.getString("nombre"));
							sucursal.setLatitud(rs.getDouble("latitud"));
							sucursal.setLongitud(rs.getDouble("longitud"));
							sucursal.setDireccion(rs.getString("direccion"));
							sucursal.setEmail(rs.getString("email"));
							sucursal.setTelefono(rs.getString("telefono"));
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

		return sucursal;
	}

}
