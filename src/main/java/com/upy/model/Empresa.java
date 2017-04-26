package com.upy.model;

public class Empresa {
	private String nombre;
	private String rif;
	private String telefono;
	private String email;
	private String estatus;
	
	
	public Empresa() {
		super();
	}

	public Empresa(String nombre, String rif, String telefono, String email,
			String estatus) {
		super();
		this.nombre = nombre;
		this.rif = rif;
		this.telefono = telefono;
		this.email = email;
		this.estatus = estatus;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getRif() {
		return rif;
	}

	public void setRif(String rif) {
		this.rif = rif;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	
}
