package com.upy.model;

import java.util.Date;

public class SolicitudServicio {
	private int id;
	private ClasificacionVehiculo clasifVeh;
	private Sucursal sucursal;
	private Sentido sentido;
	private Frecuencia frecuencia;
	private Date hora;
	private Date fechaInicio;
	private Date fechaFin;
	private String estatus;
	private Turno turno;
	
	
	public SolicitudServicio() {
		super();
	}
	public SolicitudServicio(ClasificacionVehiculo clasifVeh,
			Sucursal sucursal, Sentido sentido, Frecuencia frecuencia,
			Date hora, Date fechaInicio, Date fechaFin, String estatus,
			Turno turno) {
		super();
		this.clasifVeh = clasifVeh;
		this.sucursal = sucursal;
		this.sentido = sentido;
		this.frecuencia = frecuencia;
		this.hora = hora;
		this.fechaInicio = fechaInicio;
		this.fechaFin = fechaFin;
		this.estatus = estatus;
		this.turno = turno;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public ClasificacionVehiculo getClasifVeh() {
		return clasifVeh;
	}
	public void setClasifVeh(ClasificacionVehiculo clasifVeh) {
		this.clasifVeh = clasifVeh;
	}
	public Sucursal getSucursal() {
		return sucursal;
	}
	public void setSucursal(Sucursal sucursal) {
		this.sucursal = sucursal;
	}
	public Sentido getSentido() {
		return sentido;
	}
	public void setSentido(Sentido sentido) {
		this.sentido = sentido;
	}
	public Frecuencia getFrecuencia() {
		return frecuencia;
	}
	public void setFrecuencia(Frecuencia frecuencia) {
		this.frecuencia = frecuencia;
	}
	public Date getHora() {
		return hora;
	}
	public void setHora(Date hora) {
		this.hora = hora;
	}
	public Date getFechaInicio() {
		return fechaInicio;
	}
	public void setFechaInicio(Date fechaInicio) {
		this.fechaInicio = fechaInicio;
	}
	public Date getFechaFin() {
		return fechaFin;
	}
	public void setFechaFin(Date fechaFin) {
		this.fechaFin = fechaFin;
	}
	public String getEstatus() {
		return estatus;
	}
	public void setEstatus(String estatus) {
		this.estatus = estatus;
	}
	public Turno getTurno() {
		return turno;
	}
	public void setTurno(Turno turno) {
		this.turno = turno;
	}
	
}
