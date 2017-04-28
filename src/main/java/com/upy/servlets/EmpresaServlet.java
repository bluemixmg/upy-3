package com.upy.servlets;

import java.io.IOException;
import java.util.List;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Random;
 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.upy.model.Pasajero;
import com.upy.model.SolicitudServicio;

import generacionRutas.Agrupamiento;
//import org.json.simple.JsonArray;
//import org.json.simple.JsonObject;
//import com.google.gson.JsonArray;
//import com.google.gson.JsonObject;

/**
 * Servlet implementation class IdeaServlet
 */
@WebServlet(name = "Empresa", urlPatterns = { "/empresa" })
public class EmpresaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String EMPRESA_JSP =  "Empresa.jsp";
	private ArrayList<SolicitudServicio> solicitudes;
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpresaServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    @Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
    	response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
    	try{
	    	response.setContentType("text/html;charset=UTF-8");
    		RequestDispatcher rq=request.getRequestDispatcher("/views/"+EMPRESA_JSP);
    		rq.forward(request, response);

    	}catch(IOException ioe){
    		//throw new ServletException(ioe);
    		response.getWriter().print("Genero un error en IOException");
    		response.getWriter().print(ioe.getMessage());
    	}
    }
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int idSolicitud = 1;
		//ArrayList<ArrayList<Pasajero>> grupos = this.generarRutas(idSolicitud);
		//JsonArray rutas = this.jsonArrayLatLon(grupos);
		//session.setAttribute("rutas_json", grupos);
		//response.getWriter().println(grupos);
		processRequest(request, response);
	}
	
	public ArrayList<ArrayList<Pasajero>> generarRutas(int idSolicitud){
		ArrayList<ArrayList<Pasajero>> grupos = new ArrayList<ArrayList<Pasajero>>();
		ArrayList<Pasajero> pasajeros_solicitud = new ArrayList<Pasajero>();
		boolean encontrado = false;
		ArrayList<Pasajero> ubicaciones = new ArrayList<Pasajero>();
		SolicitudServicio solicitud_servicio;
		
		int i=0;
		while(!encontrado){
			solicitud_servicio = new SolicitudServicio();
			solicitud_servicio = solicitudes.get(i);
			if(solicitud_servicio.getId() == idSolicitud){
				encontrado=true;
			}
			i++;
		}
		
		//pasajeros_solicitud = solicitud_servicio.getPasajeros();
		
		  for(int j=0; j<pasajeros_solicitud.size(); j++){
			  ubicaciones.add(pasajeros_solicitud.get(i));
		  }
		Agrupamiento clustering = new Agrupamiento(ubicaciones);
		grupos = clustering.dbscanClustering();
		//Guardar rutas
		//Guardar pasajeros por rutas
		
		return grupos;
	}
	
	/*public JsonArray jsonArrayLatLon(ArrayList<ArrayList<Pasajero>> grupos){
		JsonArray rutas = new JsonArray();
		JsonArray waypoints;
		JsonObject obj;
		 for(int i=0; i<grupos.size(); i++){
			 
			 waypoints = new JsonArray();
			 
			 for(int j=0; j<grupos.get(i).size(); j++){
				 obj = new JsonObject();
				 obj.addProperty("Latitud", grupos.get(i).get(j).getLatitud());
				 obj.addProperty("Longitud", grupos.get(i).get(j).getLongitud());
				 waypoints.add(obj);
			 }
			 
			 rutas.add(waypoints);
		 }
		return rutas;
	}*/


}
