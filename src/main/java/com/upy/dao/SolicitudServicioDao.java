package com.upy.dao;

import java.util.ArrayList;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;
import com.upy.config.ConexionBD;
import com.upy.config.Validacion;
import com.upy.model.Pasajero;
import com.upy.model.SolicitudServicio;

public class SolicitudServicioDao {

	//CRUD
	public boolean insert(SolicitudServicio solicitud) {
		
		boolean registrado=false;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "INSERT INTO solicitud_servicio (clasifica_vehiculo, id_sucursal, id_sentido, id_frecuencia, hora, fecha_inicio, fecha_fin, estatus, id_turno) VALUES (";
					sql += solicitud.getClasifVeh().getId()+",";
					sql += solicitud.getSucursal().getId()+",";
					sql += solicitud.getSentido().getId()+",";
					sql += solicitud.getFrecuencia().getId()+",";
					sql += Validacion.Apost(Validacion.CnvHoraString(solicitud.getHora()))+",";
					sql += Validacion.Apost(Validacion.formatDate(solicitud.getFechaInicio()))+",";
					sql += Validacion.Apost(Validacion.formatDate(solicitud.getFechaFin()))+",";
					sql += Validacion.Apost("APROBADA")+",";
					sql += solicitud.getTurno().getId()+");";
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

	
	public ArrayList<SolicitudServicio> get(int id) {
		
		ArrayList<SolicitudServicio> aSolicitudesS = new ArrayList<SolicitudServicio>();
		ResultSet solicitudes = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM solicitud_servicio WHERE estatus = '1' AND id_sucursal="+id;
					solicitudes = st.executeQuery(sql);
					try{
						ClasificacionVehiculoDao cVehDao = new ClasificacionVehiculoDao();
						SucursalDao sucDao = new SucursalDao();
						FrecuenciaDao frecDao = new FrecuenciaDao();
						SentidoDao sentDao = new SentidoDao();
						TurnoDao turnDao = new TurnoDao();
						while(solicitudes.next()){
							SolicitudServicio ss= new SolicitudServicio();
							ss.setId(id);
							//ss.setClasifVeh(cVehDao.getUnaClasificacion(solicitudes.getInt("clasificacion_vehiculo")));
							//System.out.println("Clasi. Veh.: "+solicitudes.getInt("id"));
							ss.setEstatus(solicitudes.getString("estatus"));
							ss.setFechaFin(solicitudes.getDate("fecha_fin"));
							System.out.println("fecha fin: "+solicitudes.getDate("fecha_fin"));
							ss.setFechaInicio(solicitudes.getDate("fecha_inicio"));
							System.out.println("fecha inicio: "+solicitudes.getDate("fecha_inicio"));
							ss.setFrecuencia(frecDao.getUnaFrecuencia(solicitudes.getInt("id_frecuencia")));
							ss.setHora(solicitudes.getTime("hora"));
							ss.setSentido(sentDao.getUnSentido(solicitudes.getInt("id_sentido")));
							ss.setSucursal(sucDao.getUnaSucursal(solicitudes.getInt("id_sucursal")));
							ss.setTurno(turnDao.getUnTurno(solicitudes.getInt("id_turno")));
							ss.setPasajeros(this.getPasajerosPorSolicitud(id));
							ss.setDias(this.getDiasPorSolicitud(id));
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
					sql += "hora="+Validacion.Apost(Validacion.CnvHoraString(solicitud.getHora()))+",";
					sql += "id_frecuencia="+solicitud.getFrecuencia().getId()+",";
					sql += "id_sentido="+solicitud.getSentido().getId()+",";
					sql += "fecha_final="+Validacion.formatDate(solicitud.getFechaInicio())+",";
					sql += " WHERE id="+solicitud.getId();
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
					String sql = "UPDATE solicitud_servicio SET estatus ='E' WHERE id="+solicitud.getId();
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

	//Tablas puente
	
	
	public ArrayList<Pasajero> getPasajerosPorSolicitud(int idSolicitud) {
		
		ArrayList<Pasajero> aPasajeros = new ArrayList<Pasajero>();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT * FROM pasajero_solicitud_servicio WHERE id_solicitud_servicio="+idSolicitud;
					rs = st.executeQuery(sql);
					try{
						PasajeroDao pasaDao = new PasajeroDao();
						while(rs.next()){
							aPasajeros.add(pasaDao.getUnPasajero(rs.getInt("id_pasajero")));
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
	
public ArrayList<String> getDiasPorSolicitud(int idSolicitud) {
		
		ArrayList<String> aDias = new ArrayList<String>();
		ResultSet rs = null;
		try{
			try {
				ConexionBD bd = new ConexionBD();
				Connection c = bd.getConexion();
				if(c!= null){
					Statement st;
					st = c.createStatement();
					String sql = "SELECT dia.id, dia.nombre as nombredia FROM dia, solicitud_dia WHERE  solicitud_dia.id_solicitud="+idSolicitud;
					sql += " AND dia.id=solicitud_dia.id_dia";
					rs = st.executeQuery(sql);
					try{
						while(rs.next()){
							aDias.add(rs.getString("nombredia"));
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

		return aDias;
	}



}
