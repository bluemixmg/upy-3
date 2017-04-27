package com.upy.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;

import com.upy.config.ConexionBD;
import com.upy.model.Pasajero;

public class PasajeroDao {

	
	public boolean insert(Pasajero pasajero) {
		
		return false;
	}
	
	public ArrayList<Pasajero> get() {
		
		return null;
	}

	public boolean update(Pasajero pasajero) {
		
		return false;
	}

	public boolean delete(Pasajero pasajero) {
		
		return false;
	}
	
	public Pasajero getUnPasajero(int id){
		Pasajero pasajero = new Pasajero();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM pasajero WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						SucursalDao sucDao = new SucursalDao();
						CargoDao cargoDao = new CargoDao();
						while(rs.next()){
							pasajero.setId(id);
							pasajero.setCedula(rs.getString("cedula"));
							pasajero.setDireccion(rs.getString("direccion"));
							pasajero.setEmail(rs.getString("email"));
							pasajero.setEstatus(rs.getString("estatus"));
							pasajero.setLatitud(rs.getDouble("latitud"));
							pasajero.setLongitud(rs.getDouble("longitud"));
							pasajero.setTelefono(rs.getString("telefono"));
							pasajero.setSucursal(sucDao.getUnaSucursal(rs.getInt("id_sucursal")));
							pasajero.setCargo(cargoDao.getUnCargo(rs.getInt("id_cargo")));
							//Faltan agregar los atributos de tipo objeto pertenecientes a este modelo
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
		return pasajero;
	}

}
