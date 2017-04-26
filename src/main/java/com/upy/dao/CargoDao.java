package com.upy.dao;


import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.sql.ResultSet;
import com.upy.config.ConexionBD;
import com.upy.model.Cargo;
import com.upy.model.Pasajero;

public class CargoDao{

	
	public boolean insert() {
		// TODO Auto-generated method stub
		return false;
	}

	
	public <T> ArrayList<T> get() {
		// TODO Auto-generated method stub
		return null;
	}

	
	public boolean update() {
		// TODO Auto-generated method stub
		return false;
	}

	
	public boolean delete() {
		// TODO Auto-generated method stub
		return false;
	}
	
	public Cargo getUnCargo(int id){
		Cargo cargo = new Cargo();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM cargo WHERE id="+id;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							cargo.setId(id);
							cargo.setNombre(rs.getString("nombre"));
							cargo.setEstatus(rs.getString("estatus"));
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
		return cargo;
	}

}
