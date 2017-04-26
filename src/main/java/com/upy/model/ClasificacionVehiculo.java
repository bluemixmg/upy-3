package com.upy.model;

public class ClasificacionVehiculo {
	private int id;
	private String nombre;
	private SolicitudServicio solicitudServicio;
	
	public ClasificacionVehiculo() {
		super();
	}

	public ClasificacionVehiculo(String nombre,
			SolicitudServicio solicitudServicio) {
		super();
		this.nombre = nombre;
		this.solicitudServicio = solicitudServicio;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public SolicitudServicio getSolicitudServicio() {
		return solicitudServicio;
	}

	public void setSolicitudServicio(SolicitudServicio solicitudServicio) {
		this.solicitudServicio = solicitudServicio;
	}
	
	

}
