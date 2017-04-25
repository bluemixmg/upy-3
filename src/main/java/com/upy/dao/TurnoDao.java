package com.upy.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.upy.config.ConexionBD;
import com.upy.model.Turno;

public class TurnoDao {

public Turno getUnTurno(int id) {
		
		Turno turno = new Turno();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM turno WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							turno.setId(id);
							turno.setNombre(rs.getString("nombre"));
							turno.setHora_inicio(rs.getDate("hora_inicio"));
							turno.setHora_fin(rs.getDate("hora_fin"));
							turno.setEstatus(rs.getString("estatus"));
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

		return turno;
	}
}
