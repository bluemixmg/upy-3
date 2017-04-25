package com.upy.dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import com.upy.config.ConexionBD;

import com.upy.model.SolicitudServicio;

public class SolicitudServicioDao {

	
	public boolean insert(SolicitudServicio solicitud) {
		
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO solicitud_servicio VALUES (";
					//Aqui va el resto de la sentencia SQL
					st.executeUpdate(sql);
					st.close();
					registrado=true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			registrado=false;
			e.printStackTrace();
			
		}
		return registrado;
	}

	
	public ArrayList<SolicitudServicio> get() {
		
		ArrayList<SolicitudServicio> aSolicitudesS = new ArrayList<SolicitudServicio>();
		ResultSet solicitudes = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					//Definir condicion para el WHERE del SELECT
					String sql = "SELECT * FROM solicitud_servicio WHERE estatus != 'E'";
					solicitudes = st.executeQuery(sql);
					try{
						while(solicitudes.next()){
							SolicitudServicio ss= new SolicitudServicio();
							//Settear cada Solicitud de Servicio traida en el ResultSet
							aSolicitudesS.add(ss);
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

		return aSolicitudesS;
	}

	
	public boolean update(SolicitudServicio solicitud) {
		
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE solicitud_servicio SET ";
					//Completar SQL
					sql += " WHERE id=" +"CONDICION";
					st.executeUpdate(sql);
					st.close();
					modificado = true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			modificado = false;
		}
		return modificado;
	}

	
	public boolean delete(SolicitudServicio solicitud) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE solicitud_servicio SET estatus ="; //Completar SQL
					st.executeUpdate(sql);
					st.close();
					eliminado = true;
				}
			bd.closeConexion();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
			
		}catch(SQLException e){
			e.printStackTrace();
			eliminado = false;
		}
		return eliminado;
	}

	

}
