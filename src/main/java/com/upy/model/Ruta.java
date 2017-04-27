package com.upy.model;

import java.util.ArrayList;

public class Ruta {
	private int id;
	private double tarifa;
	private SolicitudServicio solicitudServicio;
	private ArrayList<Pasajero> pasajeros;

	public Ruta() {
		super();
	}

	public Ruta(SolicitudServicio solicitudServicio) {
		super();
		this.solicitudServicio = solicitudServicio;
	}
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getTarifa() {
		return tarifa;
	}

	public void setTarifa(double tarifa) {
		this.tarifa = tarifa;
	}

	public SolicitudServicio getSolicitudServicio() {
		return solicitudServicio;
	}

	public void setSolicitudServicio(SolicitudServicio solicitudServicio) {
		this.solicitudServicio = solicitudServicio;
	}

	public ArrayList<Pasajero> getPasajeros() {
		return pasajeros;
	}

	public void setPasajeros(ArrayList<Pasajero> pasajeros) {
		this.pasajeros = pasajeros;
	}
	
	

}
