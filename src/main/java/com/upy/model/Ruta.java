package com.upy.model;

public class Ruta {
	private SolicitudServicio solicitudServicio;
	

	public Ruta() {
		super();
	}

	public Ruta(SolicitudServicio solicitudServicio) {
		super();
		this.solicitudServicio = solicitudServicio;
	}

	public SolicitudServicio getSolicitudServicio() {
		return solicitudServicio;
	}

	public void setSolicitudServicio(SolicitudServicio solicitudServicio) {
		this.solicitudServicio = solicitudServicio;
	}
	
	

}
