package com.upy.model;

public class Pasajero {
	
	private Sucursal sucursal;
	private Cargo cargo;
	private String cedula;
	private String telefono;
	private String email;
	private String direccion;
	private double latitud;
	private double longitud;
	private String estatus;
	private Sexo sexo;
	
	public Pasajero() {
		super();
	}

	public Pasajero(Sucursal sucursal, Cargo cargo, String cedula,
			String telefono, String email, String direccion, double latitud,
			double longitud, String estatus, Sexo sexo) {
		super();
		this.sucursal = sucursal;
		this.cargo = cargo;
		this.cedula = cedula;
		this.telefono = telefono;
		this.email = email;
		this.direccion = direccion;
		this.latitud = latitud;
		this.longitud = longitud;
		this.estatus = estatus;
		this.sexo = sexo;
	}

	public Sucursal getSucursal() {
		return sucursal;
	}

	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}

	public Cargo getCargo() {
		return cargo;
	}

	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}

	public String getCedula() {
		return cedula;
	}

	public void setCedula(String cedula) {
		this.cedula = cedula;
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

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public double getLatitud() {
		return latitud;
	}

	public void setLatitud(double latitud) {
		this.latitud = latitud;
	}

	public double getLongitud() {
		return longitud;
	}

	public void setLongitud(double longitud) {
		this.longitud = longitud;
	}

	public String getEstatus() {
		return estatus;
	}

	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}

	public Sexo getSexo() {
		return sexo;
	}

	public void setSexo(Sexo sexo) {
		this.sexo = sexo;
	}

}
