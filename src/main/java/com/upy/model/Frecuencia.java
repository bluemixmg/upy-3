package com.upy.model;

public class Frecuencia {
	private int id;
	
	private String nombre;
	private String estatus;
	public Frecuencia() {
		super();
	}
	public Frecuencia(String nombre, String estatus) {
		super();
		this.nombre = nombre;
		this.estatus = estatus;
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
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

}
