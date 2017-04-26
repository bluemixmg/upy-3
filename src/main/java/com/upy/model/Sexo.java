package com.upy.model;

public class Sexo {
	private String nombre;
	private String estatus;
	
	public Sexo() {
		super();
	}
	public Sexo(String nombre) {
		super();
		this.nombre = nombre;
	}

	public Sexo(String nombre, String estatus) {
		super();
		this.nombre = nombre;
		this.estatus = estatus;
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
