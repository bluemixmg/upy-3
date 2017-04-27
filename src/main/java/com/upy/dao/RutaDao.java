package com.upy.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;

import com.upy.config.ConexionBD;
import com.upy.model.Pasajero;
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
	
	//Tablas Puente
	public ArrayList<Pasajero> getPasajerosPorRutaPorSolicitud(int idSS, int idRuta) {
		ArrayList<Pasajero> aPasajeros = new ArrayList<Pasajero>();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT p.* FROM pasajero p";
					sql+=" JOIN pasajero_solicitud_servicio pss on pss.id_pasajero = p.id";
					sql+=" JOIN ruta_pasajero_solicitud_servicio rpss on rpss.id_pasajero_solicitud_servicio = pss.id";
    				sql+=" JOIN ruta r  on r.id = rpss.id_ruta";
					sql+=" JOIN solicitud_servicio ss on r.id_solicitud_servicio= ss.id";
					sql+=" WHERE ss.id="+idSS;
					sql+=" AND r.id="+idRuta;
					rs = st.executeQuery(sql);
					try{
						SucursalDao sucDao = new SucursalDao();
						CargoDao cargoDao = new CargoDao();
						while(rs.next()){
							Pasajero pasajero= new Pasajero();
							pasajero.setId(rs.getInt("id"));
							pasajero.setCedula(rs.getString("cedula"));
							pasajero.setDireccion(rs.getString("direccion"));
							pasajero.setEmail(rs.getString("email"));
							pasajero.setEstatus(rs.getString("estatus"));
							pasajero.setLatitud(rs.getDouble("latitud"));
							pasajero.setLongitud(rs.getDouble("longitud"));
							pasajero.setTelefono(rs.getString("telefono"));
							pasajero.setSucursal(sucDao.getUnaSucursal(rs.getInt("id_sucursal")));
							pasajero.setCargo(cargoDao.getUnCargo(rs.getInt("id_cargo")));
							aPasajeros.add(pasajero);
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

		return aPasajeros;
	}
	
	public ArrayList<Ruta> getRutasPorSolicitud(int idSS) {
		ArrayList<Ruta> aRuta = new ArrayList<Ruta>();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM ruta";
					sql+=" WHERE id_solicitud_servicio="+idSS;
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							Ruta ruta = new Ruta();
							ruta.setId(rs.getInt("id"));
							ruta.setTarifa(rs.getDouble("tarifa"));
							ruta.setPasajeros(getPasajerosPorRutaPorSolicitud(idSS, ruta.getId()));
							aRuta.add(ruta);
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

		return aRuta;
	}

}
