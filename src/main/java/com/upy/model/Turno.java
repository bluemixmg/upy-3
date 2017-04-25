package com.upy.model;

import java.util.Date;

public class Turno {
	
	private String nombre;
	private Date hora_inicio;
	private Date hora_fin;
	private String estatus;
	
	public Turno() {
		super();
	}
	public Turno(String nombre, Date hora_inicio, Date hora_fin, String estatus) {
		super();
		this.nombre = nombre;
		this.hora_inicio = hora_inicio;
		this.hora_fin = hora_fin;
		this.estatus = estatus;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public Date getHora_inicio() {
		return hora_inicio;
	}
	public void setHora_inicio(Date hora_inicio) {
		this.hora_inicio = hora_inicio;
	}
	public Date getHora_fin() {
		return hora_fin;
	}
	public void setHora_fin(Date hora_fin) {
		this.hora_fin = hora_fin;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	

}
