
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import = "model.Idea" %>
<%@ page import = "model.Categoria" %>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "com.google.gson.JsonObject"  %>
<%@ page import = "com.google.gson.JsonArray"  %>
<%@ page import = "dao.CategoriaDAO" %>
<%@ page import = "dao.IdeaDAO" %>
<%@ page import = "model.Desafio" %>
<%@ page import = "model.User" %>
<%@ page import = "nosql.IdeaNoSQL" %>
<%@ page import = "model.UserAdapter" %>

<!DOCTYPE html>

<html lang="es">

<head>
<%	 if(session.getAttribute("user") == null){
	  %>
	  <script type="text/javascript">
		window.location="pages/login.jsp";
		</script>
	  <%
	}
	Desafio des = (Desafio)session.getAttribute("desafio");
	User usuario = (User)session.getAttribute("user");
	//List<Idea> lis_i = (List<Idea>)session.getAttribute("ideas");
	List<Idea> lis_i = (List<Idea>)session.getAttribute("ver_ideas");
	System.out.println("Cantidad de ideas: "+lis_i.size());
    
    IdeaDAO daoIdea = new IdeaDAO();
    IdeaNoSQL ideaN = new IdeaNoSQL(); 
    JsonObject ideaJson = new JsonObject();
  
	
%>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>Ideas - Marna CIN</title>

	<!-- Bootstrap Core CSS -->
	<link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

	<!-- MetisMenu CSS -->
	<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

	<!-- Custom CSS -->
	<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

	<!-- Custom Fonts -->
	<link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<style type="text/css">
		.chip {
		    display: inline-block;
		    padding: 0 25px;
		    height: 20px;
		    font-size: 12px;
		    line-height: 20px;
		    border-radius: 25px;
		    background-color: #f1f1f1;
		}
	</style>

</head>

<body>

	<div id="wrapper">

		<!-- Barra de Navegacion -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp">Marna CIN</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<!-- /.dropdown notifacciones -->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-bell fa-fw"></i> <span class="hidden-xs"> Notificaciones </span>  <i class="fa fa-caret-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-messages">
						<li>
							<a href="#">
								<div>
									<i class="fa fa-thumbs-o-up fa-fw"></i><small> A Nombre Apellido le gusta tu idea</small>
									<span class="pull-right text-muted small"> 4 min</span>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i><small> 3 Nuevos Comentarios </small>
									<span class="pull-right text-muted small"> 12 min</small>
								</div>
							</a>
						</li>
						<li class="divider"></li>
						<li>
							<a class="text-center" href="#">
								<strong>Ver Todo</strong>
								<i class="fa fa-angle-right"></i>
							</a>
						</li>
					</ul>
					<!-- /.dropdown notificaciones -->
				</li>
				<!-- /.dropdown  de usuario-->
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="fa fa-user fa-fw"></i><span class="hidden-xs"> <%=usuario.getUsername() %> </span><i class="fa fa-caret-down"></i> 
					</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> Perfil</a>
						</li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Configuración</a>
						</li>
						<li><a href="#"><i class="fa fa-question fa-fw"></i> Ayuda</a>
						</li>
						<li class="divider"></li>
						<li><a href="/LogoutServlet"><i class="fa fa-sign-out fa-fw"></i> Cerrar Sesión</a>
						</li>
					</ul>
					<!-- /.dropdown usario -->
				</li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
					<!-- Barra de Busqueda -->
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Buscar ideas...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div>
							<!-- /input-group -->
						</li>
						<li>
							<a href="/pages/Home.jsp"><i class="fa fa-home fa-fw"></i> Inicio</a>
						</li>
						<li>
							<a href="/Desafio?id=<%=des.getId()%>"><i class="fa fa-flash fa-fw"></i> Actividad del desafío</a>
						</li>
						<%if (usuario.getTipo() <= 2) { %>
						<li>
							<a href="pages/publicarIdea.jsp" target="_blank"><i class="fa fa-pencil fa-fw"></i> Publicar Idea</a>
						</li>
						<% } %>
					</ul>

				</div>
				<!-- /.sidebar-collapse -->
				<hr />
				<div class="col-md-12">
					<div class="panel panel-primary">
						<div class="panel-heading">
							<%= des.getTitulo() %>
						</div>
						<div class="panel-body">
							<%= des.getDescripcion() %>
						</div>
						
					</div>
				</div>
			</div>
			<!-- /.navbar-static-side -->
		</nav>

		<!-- Page Content -->
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="page-header">
							<h2>Ideas
<!-- 								<section class="pull-right"> -->
<!-- 		                        	<button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown"> -->
<!-- 		                            	<i class="fa fa-filter fa-fw"></i> Filtrar -->
<!-- 		    	                    	<span class="caret"></span> -->
<!-- 		    	                    	  	<ul class="dropdown-menu pull-right" role="menu"> -->
<%-- 				                        	<% CategoriaDAO daoCat = new CategoriaDAO(); --%>
<%-- 				                        		List<Categoria> cats = daoCat.RetornarCategorias(); --%>
<%-- 				                        		for(Categoria c : cats){ --%>
<%-- 				                        	 %> --%>
<%-- 			                            	<li><a href="#" id=<%=c.getCodigo() %>><%=c.getNombre() %></a></li> --%>
<%-- 			                            	<% } %> --%>
<!-- 			                            	<li class="divider"></li> -->
<!-- 			                            	<li><a href="#">Sin filtro</a></li> -->
<!-- 		                        		</ul> -->
<!-- 		                        	</button> -->
<!-- 	                        	</section> -->
                        	</h2>
						</div>
					</div>
				<!-- /.col-lg-12 -->    
				</div>
				 <!--/.row -->

				    
				    
				    <!-- /.col-lg-4 -->
				    <% for(int i=0; i<lis_i.size(); i++){ 
				    	System.out.println(lis_i.size()+" indice: "+i);
				    	Idea idea = new Idea("", "", "", 0, "", "", null, null, '*');
				    	idea = lis_i.get(i);
				    	ideaJson = ideaN.getUnaIdea(idea.getCodigo());
				    %>			    
                <div class="col-lg-4">
                    <div class="well well-lg">
                        <div class="header">
	                       	<div class="media">
							   <a href="#" class="pull-left"  data-toggle="modal" data-target="#modalDescIdea">
							      <img src="../images/user2.png" class="media-object img-circle" alt="imagen">
							   </a>
							   <div class="media-body">
							    	<h6 class="media-heading">
							     		<a href="#">	
							     			<b><%= usuario.getUsername() %></b>	
							     			<% 
							     			String fecha =(String)ideaJson.get("fecha_creacion").getAsString();
							     			%>
					     				</a><small><i>  <%= fecha %></i></small>
				     				</h6>
				     				<h3>
     									<a href="#"  data-toggle="modal" data-target="#modalDescIdea">
	     									
	     									<b><%=idea.getTitulo() %></b>
	     								</a>
	     								<section class="pull-right"> 
	     									<button type="button" class="btn btn-success btn-sm"><i class="fa fa-thumbs-o-up fa-fw"></i> Me Gusta</button>
	     								</section>
	     							</h3>

	     							<p><%= idea.getDescripcion() %></p>
								</div>
							   <!-- ./media-body-->
							   
							   


							   
							   <!-- Modal -->
	                            <div class="modal fade" id="modalDescIdea" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	                                <div class="modal-dialog modal-lg">
	                                
	                                    <div class="modal-content col-xs-12 col-md-12">    
	                                        <div class="modal-header">
	                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
													
	                                            <h3 class="modal-title" id="myModalLabel"><b><%=idea.getTitulo() %></b></h3>
	                                        </div>
	                                        <!-- /.modal-header -->
	                                        <div class="modal-body">
		                                        <div class="col-xs-12 col-sm-6 col-md-8">

		                                        	<h4>
		                                        		<a href="#">
		                                        			<i class="fa fa-user fa-fw img-circle"></i><strong><%= usuario.getUsername() %></strong>
		       											</a>en
		                                        			
                                        	                    <a href="#"> 
		                                            			<% ArrayList<String> categorias = (ArrayList<String>)daoIdea.getCategoriasPorIdea(idea.getCodigo());
		                                            			for(String cat : categorias){%>
		                                            				<small><%= cat %></small>
	                                            				<% } %>
		                                            			</a>
		                            
		                                        		
		                                        		<section class="pull-right">
		                                        			<button class="btn btn-default btn-sm" type="submit" data-toggle="tooltip" data-placement="bottom" title="Editar"><i class="fa fa-pencil fa-fw"></i></button>
		                                        			<button class="btn btn-default btn-sm" type="submit" data-toggle="tooltip" data-placement="bottom" title="Compartir"><i class="fa fa-share fa-fw"></i></button>
		                                        			<button class="btn btn-success btn-sm" type="submit"><i class="fa fa-plus-circle fa-fw"></i>Seguir</button>
		                                        		</section>
		                                        	</h4>
		                                        	<br>
		                                        	<!-- Descripcion -->
		                                            <p><%=idea.getDescripcion() %></p>
		                                            <div>
		                                            	<i class="fa fa-key fa-fw"></i>
		                                            	<% JsonArray p_clave = (JsonArray)ideaJson.get("palabras_clave");
		                                            	   JsonObject pc_i=new JsonObject();
		                                            	   for(int j=0; j<p_clave.size();j++){
		                                            	   		System.out.println("Tamano de palabras clave: "+p_clave.size()+" y el indice: "+j);
		                                            	   		pc_i=(JsonObject)p_clave.get(j);
		                                            	 %>
		                                            		<div class="chip"><%= pc_i.get("key"+j) %></div>
	                                            		<%} %>
		                                            </div>		

		                                            <div class="panel-body">
							                            <!-- Nav tabs -->
							                            <ul class="nav nav-tabs">
							                                <li><a href="#comentarios" data-toggle="tab">Comentarios</a>
							                                </li>
							                            </ul>
						                                <div class="tab-content">
						                                	<div class="tab-pane fade" id="comentarios">
	
					                                    	<a href="#"><h4>Ver todos</h4></a>
	                                                        <!-- Seccion de comentarios -->
    	                                                      <div class="col-md-12">
		                                                        <div class="list-group">
		                                                         <span class="list-group-item">
		                                                        <h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       	                                                 <small>hace 20 minutos</small>
				                                             	<section class="pull-right">
						                                          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
						                                          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
					                                            </section>
		                                                       </h6>
		                                                       <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
		                                                          <br>
		                                                          <br>
		    	                                                 <ul class="list-group">
		    		                                              <li  class="list-group-item">
			    		                                             <div>
		    				                                           <h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       					                                       <small>hace 18 minutos</small>
								                                     <section class="pull-right">
									                                  <a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
									                                  <a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
								                                     </section>
		      				                                           </h6>
		      				                                          <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
			    		                                             </div>
		    		                                              </li>
		    	                                                </ul>
		                                                     </span>
		    
		                                                     <span class="list-group-item">
		                                                       <h6 class="list-group-item-heading"><a href="#">Nombre Apellido</a>
		       	                                               <small>hace 12 minutos</small>
					                                          <section class="pull-right">
						                                       <a href="#" data-toggle="tooltip" data-placement="bottom" title="Responder"><i class="fa fa-reply fa-fw"></i></a>
						                                       <a href="#" data-toggle="tooltip" data-placement="bottom" title="Favorito"><i class="fa fa-heart fa-fw"></i></a>
					                                          </section>
		                                                       </h6>
		                                                       <small class="list-group-item-text">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum tincidunt est vitae ultrices accumsan.</small>
		                                                       <br>
		                                                       <br>
		                                                      </span>


		    <span class="list-group-item">
		    	<div class="form-group" align="right">
			    	<textarea class="form-control" rows="1" placeholder="Escribe un comentario..." name="comentario"></textarea>
			    	<button class="btn btn-primary "></button>
		    	</div>
		    </span>
		  </div>
		</div>

		                                              
						                                	</div>
						                                </div>
						                            </div>
		                                        </div>
		                                        <div class="col-xs-12 col-sm-6 col-md-4">
			                                         <div class="panel-body">
							                            <!-- Nav tabs -->
							                            <ul class="nav nav-tabs">
							                                <li class="active"><a href="#info" data-toggle="tab">Info</a>
							                                </li>
							                                <li><a href="#evaluacion" data-toggle="tab">Evaluación</a>
							                                </li>
							                            </ul>

							                            <!-- Tab panes -->
							                            <div class="tab-content">
							                            			<% 
							                                 			String prog="25";
							                                    		System.out.println("Progreso"+prog+" Y"+"estatus:"+idea.getEstatus());
							                                    	 %>
							                                <div class="tab-pane fade in active" id="info">
							                                	<h5 align="center">Información</h5>
							                                    	<button type="button" class="btn btn-primary btn-circle"><i class="fa fa-thumbs-o-up fa-fw"></i>
							                                    	</button> <strong> <%= idea.getCantVotos() %> Me Gusta</strong>
							                                    <hr />
							                                    	<button type="button" class="btn btn-default btn-circle"><i class="fa fa-comments fa-fw"></i>
							                                    	</button> <strong> 5 Comentarios</strong>
							                                    <hr />
							                                    	<span>
							                                    		<i class="fa fa-flag fa-fw"></i><strong>Estatus: <%= idea.getNombreEstatus(idea.getEstatus()) %></strong> 
							                                    	</span>
							                                    	<div class="progress progress-striped">
                                        								<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        								</div>
                                    								</div>
						                                    	<hr />
							                                </div>
							                                <!-- Fin del tab Informacion -->
							                                <div class="tab-pane fade" id="evaluacion">
							                                    <h5 align="center">Criterios</h5>
							                                    <strong>Originalidad: </strong> 8
							                                    <br>
							                                    <strong>Factibilidad: </strong> 7
							                                    <br>
							                                    <strong>Impacto: </strong> 8
							                                    <br>
							                                    <strong>Desarrollo: </strong> 9
							                                    <br>
							                                    <strong>
							                                    	Promedio:
							                                    	<i class="fa fa-star fa-fw"></i>
							                                    	<i class="fa fa-star fa-fw"></i>
							                                    	<i class="fa fa-star fa-fw"></i>
							                                    	<i class="fa fa-star fa-fw"></i>
							                                    	<i class="fa fa-star-o fa-fw"></i>
							                                    </strong>
							                                </div>
							                                <!-- Fin del tab Evaluacion -->
							                            </div>
							                            <!-- Fin del tab -->
							                        </div>
							                        <!-- /.panel-body -->
		                                        </div>
                                        	</div>
                                        	<!-- /.modal-body -->
                                		</div>
                                    	<!-- /.modal-content -->
	                                
	                                </div>
	                                <!-- /.modal-dialog -->
	                            </div>
	                            <!-- /.modal -->
	                            
	                            
	                            
							</div>
							<!--./media-->
                        </div>
                        <!--./header -->
                        <div class="body">
		     				<div class="row">
		     					<h6>
		     				
		     						<b><i class="fa fa-flag"></i> Estatus: </b><%=idea.getNombreEstatus(idea.getEstatus()) %>
		     						<% ArrayList<String> ctg = (ArrayList<String>)daoIdea.getCategoriasPorIdea(idea.getCodigo());
		     						for(String c: ctg){ 
		     							System.out.println(c+"indice de las categorias: "+ctg.size());
		     						%>
		     						<a href="#">
		     							<i class="fa fa-bookmark fa-fw"></i> <%=c%>
	     							</a>
	     							<%} %>
	     							<section class="pull-right">
	     								<button type="submit" class="btn btn-default btn-xs">
	     									<b class="col-lg-6" > <%= idea.getCantVotos() %><i class="fa fa-thumbs-o-up fa-fw"></i></b>
	     								</button>
	     								<button type="submit" class="btn btn-default btn-xs">		
	     									<b class="col-lg-6" > 4 <i class="fa fa-comments fa-fw"></i></b>
     									</button>
 									</section>     							
		     					</h6>
		     				</div>
		     				<!-- ./row -->
                        </div>
                        <!-- ./body -->
                    </div>

                </div>
                <%} %>
                <!--./col-lg-4 -->
                
			</div>
			<!-- /.container-fluid -->
		</div>
		<!-- /#page-wrapper -->
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="../vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="../vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="../dist/js/sb-admin-2.js"></script>




</body>

</html>

