package com.upy.dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

import com.upy.config.ConexionBD;
import com.upy.model.Empresa;

public class EmpresaDao {

	
	public boolean insert(Empresa empresa) {
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO empresa VALUES (";
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

	
	public ArrayList<Empresa> get() {
		ArrayList<Empresa> aEmpresas = new ArrayList<Empresa>();
		ResultSet empresas = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					//Definir condicion para el WHERE del SELECT
					String sql = "SELECT * FROM solicitud_servicio WHERE estatus != 'E'";
					empresas = st.executeQuery(sql);
					try{
						while(empresas.next()){
							Empresa empresa= new Empresa();
							//Settear cada Empresa traida en el ResultSet o pasar todo por parametros al constructor
							aEmpresas.add(empresa);
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

		return aEmpresas;
	}

	
	public boolean update(Empresa empresa) {
		boolean modificado = false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE empresa SET ";
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

	
	public boolean delete(Empresa empresa) {
		boolean eliminado = false; 
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "UPDATE empresa SET estatus ="; //Completar SQL
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
