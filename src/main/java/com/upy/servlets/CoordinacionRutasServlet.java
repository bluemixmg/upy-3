package controller;

import java.io.IOException;
import java.util.List;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Random;

import com.google.gson.JsonObject; 

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.RutaDao;
import dao.SolicitudServicioDao;
import dao.PasajeroDao;
import model.SolicitudServicio;
import model.Ruta;
import model.Pasajero;
import model.Sucursal;

/**
 * Servlet implementation class IdeaServlet
 */
@WebServlet(name = "CoordinacionRutas", urlPatterns = { "/coordinacion-rutas" })
public class IdeasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String COORDINACION_RUTAS_JSP =  "coordinacion-rutas.jsp";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IdeasServlet() {
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
		// TODO Auto-generated method stub
	    //response.getWriter().append("Served at: ").append(request.getContextPath());
		processRequest(request, response);
		//response.getWriter().append("Estoy en el GET");
		//service(request, response);
	}


}
