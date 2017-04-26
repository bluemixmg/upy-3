package com.upy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.upy.config.ConexionBD;
import com.upy.model.Sentido;

public class SentidoDao {
	
	public Sentido getUnSentido(int id) {
		
		Sentido sentido = new Sentido();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM sentido WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							sentido.setId(id);
							sentido.setNombre(rs.getString("nombre"));
							sentido.setEstatus(rs.getString("estatus"));
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

		return sentido;
	}

}
