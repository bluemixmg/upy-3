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

import com.upy.dao.RutaDao;
import com.upy.dao.SolicitudServicioDao;
import com.upy.dao.PasajeroDao;
import com.upy.model.SolicitudServicio;
import com.upy.model.Ruta;
import com.upy.model.Pasajero;
import com.upy.model.Sucursal;

import generacionRutas.*;

/**
 * Servlet implementation class IdeaServlet
 */
@WebServlet(name = "CoordinacionRutas", urlPatterns = { "/coordinacion-rutas" })
public class CoordinacionRutasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String COORDINACION_RUTAS_JSP =  "RutasCoordinacion.jsp";
	
	private ArrayList<SolicitudServicio> solicitudes;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CoordinacionRutasServlet() {
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
    		RequestDispatcher rq=request.getRequestDispatcher("/views/"+COORDINACION_RUTAS_JSP);
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
		ArrayList<Pasajero> ubicaciones = new ArrayList<Pasajero>();
		HttpSession session = request.getSession();
		
		ArrayList<Pasajero> pasajeros = new ArrayList<Pasajero>();
		SolicitudServicioDao solicitud_dao = new SolicitudServicioDao();
		String sucursal = request.getParameter("sucursal");
		
		solicitudes = solicitud_dao.get(Integer.parseInt(sucursal));
		  for(int i=0; i<solicitudes.size(); i++){
			  //solicitudes.get(i).setPasajeros(solicitud_dao.getPasajerosPorSolicitud(solicitudes.get(i).getId()));
		  }
		  
		  session.setAttribute("solicitudes", solicitudes);
 
		  
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


}
