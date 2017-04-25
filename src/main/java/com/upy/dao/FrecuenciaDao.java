package com.upy.dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import com.upy.config.ConexionBD;
import com.upy.model.Frecuencia;


public class FrecuenciaDao {
	public boolean insert(Frecuencia frecuencia) {
		
		return false;
	}
	
	public ArrayList<Frecuencia> get() {
		
		return null;
	}

	public boolean update(Frecuencia frecuencia) {
		
		return false;
	}

	public boolean delete(Frecuencia frecuencia) {
		
		return false;
	}
	
	public Frecuencia getUnaFrecuencia (int id) {
		
		Frecuencia frecuencia = new Frecuencia();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM frecuencia WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							frecuencia.setId(id);
							frecuencia.setNombre(rs.getString("nombre"));
							frecuencia.setEstatus(rs.getString("estatus"));
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

		return frecuencia;
	}

}
