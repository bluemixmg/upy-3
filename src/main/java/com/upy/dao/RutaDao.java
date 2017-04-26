package com.upy.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;

import com.upy.config.ConexionBD;
import com.upy.model.Ruta;

public class RutaDao {

	
	public boolean insert(Ruta ruta) {
		
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO ruta VALUES (";
					//Sentencia SQL faltante a partir de aqui
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

	
	public ArrayList<Ruta> get() {
		ArrayList<Ruta> aRutas = new ArrayList<Ruta>();
		ResultSet rutas = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					//Definir condicion para el WHERE del SELECT
					String sql = "SELECT * FROM ruta WHERE estatus != 'E'";
					rutas = st.executeQuery(sql);
					try{
						while(rutas.next()){
							Ruta ruta= new Ruta();
							//Settear cada Ruta traida en el ResultSet o pasar todo por parametros al constructor
							aRutas.add(ruta);
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

		return aRutas;
	}

	
	public boolean update(Ruta ruta) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE ruta SET ";
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

	
	public boolean delete(Ruta ruta) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE ruta SET estatus ="; //Completar SQL
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
