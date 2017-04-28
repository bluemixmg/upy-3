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
		String sucursal = (String) session.getAttribute("sucursal");
		
		//solicitudes = solicitud_dao.get(Integer.parseInt(sucursal));
		solicitudes = solicitud_dao.get(1);
		  for(int i=0; i<solicitudes.size(); i++){
			  solicitudes.get(i).setPasajeros(solicitud_dao.getPasajerosPorSolicitud(solicitudes.get(i).getId()));
			  System.out.println(solicitudes.get(i).getId());
			  System.out.println(solicitudes.get(i).getHora());
			  //solicitudes.get(i).setDias(solicitud_dao.getDiasPorSolicitud(solicitudes.get(i).getId()));
		  }
		  
		  
		  session.setAttribute("solicitudes", solicitudes);
 
		  
		processRequest(request, response);
	}
	


}
