<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.upy.model.Pasajero" %>
<%@ page import="com.upy.model.SolicitudServicio" %>
<%@ page import="com.upy.model.Ruta" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
<% session.setAttribute("sucursal", "1"); %>
<% /*request.setAttribute("sucursal", 1);*/ %>
		<title>UPY3 | Panel de Control</title>
		
		<link rel="icon" type="image/png" href="../assets/images/ic_launcher.png" />
		<!-- Archivos CSS Bootstrap -->
		<link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
		<link href="../assets/css/jquery-ui.min.css" rel="stylesheet" type="text/css" media="all" />
		<link href="../assets/css/sweetalert.css" rel="stylesheet" type="text/css" media="all" />
		<link href="../assets/css/material-kit.css" rel="stylesheet"/>
		<link href="../assets/css/bootcards-desktop.css" rel="stylesheet"/>
		<link href="../assets/css/steps.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="../assets/css/bootstrap-datepicker.css">
		<link rel="stylesheet" type="text/css" href="../assets/css/jquery.timepicker.css"></link>
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="../assets/js/jquery-2.2.3.min.js"></script>
		<script src="../assets/js/jquery-ui.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/sweetalert.min.js"></script>
		<script src="../assets/js/jquery.steps.min.js"></script>
		<script src="../assets/js/jquery.validate.min.js"></script>
		<script src="../assets/js/bootcards.min.js"></script>
		<script src="../assets/js/jquery.timepicker.min.js"></script>

		<script type="text/javascript" src="../assets/js/functions.js"></script>
		<!--Google Maps API-->
		<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
		
        <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEbmBMEdo7M5E4Y5XSMY5sDxaQ7g6ZITc&callback=initMap">
        </script>	

		<script src="../assets/js/locationpicker.jquery.js"></script>
		<!-- Custom Theme files -->
		<!--timedropper jQuery plugin-->
		<script src="../assets/js/timedropper.min.js"></script>
		<link rel="stylesheet" type="text/css" href="../assets/css/timedropper.min.css">
		<!--theme-style-->
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet"/>
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
		<link href="../assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
		<style type="text/css">
		    html, body {
              height: 100%;
              margin: 0;
              padding: 0;
             }
            #map {
             height: 50%;
             float: center;
             width: 100%;
             margin-top: 20px;
            }

            #sortable1, #sortable2 {
             border: 1px solid #eee;
             width: 100%;
             min-height: 20px;
             list-style-type: none;
             margin: 0;
             padding: 5px 0 0 0;
             float: left;
             margin-right: 10px;
            }
            #sortable1 li, #sortable2 li {
             margin: 0 5px 5px 5px;
             padding: 5px;
             font-size: 1.2em;
           }
		</style>
		<!--//theme-style-->
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="keywords" content="Responsive web template, Service Logic, UPY, UPY3, Servicios de transporte, transporte, transporte de personal, transporte para
		estudiantes, transporte Venezuela, Caracas, Barquisimeto, Valencia, web design, Android" />
		<script type="application/x-javascript"> 
			addEventListener("load", function() { 
				setTimeout(hideURLbar, 0);
			}, false); 
			function hideURLbar(){ 
				window.scrollTo(0,1); 
			} 
		</script>
		<script>
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 14,
          center: {lat: 10.0582636, lng: -69.3568179}
        });
        directionsDisplay.setMap(map);

        
        calculateAndDisplayRoute(directionsService, directionsDisplay, map);
        
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay, map) {
        var waypts = [
        [{
           location:new google.maps.LatLng(10.0628694,-69.3532989),
           stopover:true
          }, {
           location:new google.maps.LatLng(10.0628694,-69.3532989),
           stopover:true
          }, {
           location:new google.maps.LatLng(10.0715739,-69.3280646),
           stopover:true
          }, {
           location:new google.maps.LatLng(10.0753345,-69.3175075),
           stopover:true
          }], 

          [{
           location:new google.maps.LatLng(10.0702328,-69.3352104),
           stopover:true
          }]

          ];

            var origins = [{
             location:new google.maps.LatLng(10.0636925,-69.3143244)
            }, {
             location:new google.maps.LatLng(10.075735,-69.3171568)
            }];
        
           for (var i=0; i<waypts.length; i++) {

          	directionsService.route({
              origin: origins[i],
              destination: new google.maps.LatLng(10.0679506, -69.2997834),
              waypoints: waypts[i],
              optimizeWaypoints: true,
              travelMode: 'DRIVING'
                }, function(response, status) {
                  if (status === 'OK') {
                  	directionsDisplay = new google.maps.DirectionsRenderer({map:map, preserveViewport: true});
                    directionsDisplay.setDirections(response);
                    var route = response.routes[0];
                 } else {
                    window.alert('Directions request failed due to ' + status);
                  }
               });            

           } <!--//For--> 

      }
    </script>

    <script>
      $( function() {
       $( "#sortable1, #sortable2" ).sortable({
        connectWith: ".connectedSortable"
       }).disableSelection();
      } );
    </script>    	
	</head>
	<body>

	    <header class="header">
		    <div class="container">
		        <dir class="row">
		            <div class="col-sm-12">
		            
		                <div class="menu info-top">
		                   <a href="logout.php" class="boton boton-sesion">Cerrar sesión</a>
		                </div>
		                <figure class="logo">
		                   <a href="index.php"><img src="http://upy3.com/wp-content/themes/upy3/img/logo-upy3.png" height="88" width="116"></a>
		                </figure>
		            </div>
		        </dir>
		    </div>
		</header>
	    
	    <!--TABS-->
	    <div class="container">
	        <ul class="nav nav-tabs">           
				<li class="active"><a data-toggle="tab" href="#empre">Empresa</a></li>
	            <li><a data-toggle="tab" href="#empleados">Pasajeros</a></li>
	            <li><a data-toggle="tab" href="#solicitudes">Solicitudes</a></li>
	        </ul>
	    </div>
	    
	    <!--TABS'S CONTENT-->
	    <br>
	    <div class="tab-content">
			        <!--ORDEN DE SERVICIO-->
	      <!--EMPRESA-->
	        <div id="empre" class="tab-pane active">
	            
	        </div>
	        <!--EMPLEADOS-->
	        <div id="empleados" class="tab-pane fade">
	        	
	        </div>
	        
	        <!--ORDEN DE SERVICIO-->
	        <div id="solicitudes" class="tab-pane fade">
	        <% ArrayList<SolicitudServicio> solicitudes = new ArrayList<SolicitudServicio>(); %>
	        <% solicitudes = (ArrayList<SolicitudServicio>)session.getAttribute("solicitudes"); %>
	            <div class="cont5ainer">
	            	<div class="col-sm-4">
	            		<div class="bootcards-list">
						  <div class="panel panel-default">
						  <div class="search-form">
				             <div class="row container-fluid">
				                <div class="col-xs-6">
				                  <div class="form-group">
				                    <input type="text" class="form-control" placeholder="Buscar solicitud...">
				                    <i class="fa fa-search"></i>
				                  </div>
				                </div>
				                <div class="col-xs-6">
				                  <button class="btn btn-primary" type="button" id="btn-modal">
				                    <i class="fa fa-plus"></i> 
				                    <span>Nueva</span>
				                  </button>
				                </div>
				              </div>                
				            </div>
						    <div class="list-group">
						    <% int i=0; %>
						    <% for(SolicitudServicio solicitud : solicitudes) { %>
						    <% i++; %>
						      <a class="list-group-item active" href="#">
						        <div class="row">
						          <div class="col-sm-6">
						          	<div class="col-sm-4">
						          		<i class="fa fa-3x fa-address-book pull-left"></i>	
						          	</div>
						          	<div class="col-sm-8">
							            <h4 class="list-group-item-heading"><%= i %></h4>
							            <p class="list-group-item-text" value="<%= solicitud.getSucursal().getId() %>">Sucursal: <%= solicitud.getSucursal().getNombre() %></p>   						          		
						          	</div>
						          </div>
						          <div class="col-sm-6">
						          <%-- String dias=""; --%>
						          <%-- for(String dia: solicitud.getDias()){ --%>
						          <%--	dias+=dia.charAt(0)+" "; --%>
						          <%-- } --%>
						            <p class="list-group-item-text">Día(s):<%-- dias --%></p>
						            <p class="list-group-item-text">Hora: <%= solicitud.getHora() %></p>
						            <p class="list-group-item-text">Pasajeros: <%= (int)solicitud.getPasajeros().size() %></p>
						          </div>
						        </div>
						      </a>
						      <% } %>
						      <!--  <a class="list-group-item" href="#">
						        <div class="row">
						          <div class="col-sm-6">
						          	<div class="col-sm-4">
						          		<i class="fa fa-3x fa-address-book pull-left"></i>	
						          	</div>
						          	<div class="col-sm-8">
							            <h4 class="list-group-item-heading">#2</h4>
							            <p class="list-group-item-text">Sucursal: Las Trinitarias</p>					          		
						          	</div>
						            

						          </div>
						          <div class="col-sm-6">
						            <p class="list-group-item-text">Día(s):L M J V</p>
						            <p class="list-group-item-text">Hora: 11:00 AM</p>
						            <p class="list-group-item-text">Pasajeros: 6</p>	
						          </div>
						        </div>
						      </a>
						      <a class="list-group-item" href="#">
						        <div class="row">
						          <div class="col-sm-6">
						          	<div class="col-sm-4">
						          		<i class="fa fa-3x fa-address-book pull-left"></i>	
						          	</div>
						          	<div class="col-sm-8">
							            <h4 class="list-group-item-heading">#3</h4>
							            <p class="list-group-item-text">Sucursal: Sambil</p>
							            						          		
						          	</div>
						            

						          </div>
						          <div class="col-sm-6">
						            <p class="list-group-item-text">Día(s):L M V</p>
						            <p class="list-group-item-text">Hora: 10:00 PM</p>
						            <p class="list-group-item-text">Pasajeros: 3</p>
						          </div>
						        </div>
						      </a>
							  <a class="list-group-item" href="#">
						        <div class="row">
						          <div class="col-sm-6">
						          	<div class="col-sm-4">
						          		<i class="fa fa-3x fa-address-book pull-left"></i>	
						          	</div>
						          	<div class="col-sm-8">
							            <h4 class="list-group-item-heading">#4</h4>
							            <p class="list-group-item-text">Sucursal: Sambil</p>
							            						          		
						          	</div>
						            

						          </div>
						          <div class="col-sm-6">
						            <p class="list-group-item-text">Día(s):L M V</p>
						            <p class="list-group-item-text">Hora: 10:00 PM</p>
						            <p class="list-group-item-text">Pasajeros: 3</p>
						          </div>
						        </div>
						      </a>-->
						    </div>
						  </div>
						</div>
	            	</div>
					
					
	            	<div class="col-sm-8 bootcards-cards">
					
					<div id="paginacion" class="col-sm-8">
					<div id="elementos" class="row">
						<div class="col-sm-6">
						<%-- ArrayList<Ruta> rutas =(ArrayList<Ruta>)session.getAttribute("rutas"); --%>
						<%-- for(Ruta ruta: rutas){ --%>
							<div class="panel panel-primary">
				                <div class="panel-heading clearfix">
				                	<h3 class="panel-title pull-left">Ruta #<%--ruta.getId() --%></h3>
									<div class="my-icon pull-right" style="margin-top: 10px"><i id="ic-verModal" class="fa fa-hand-pointer-o" aria-hidden="true"></i></div> 
				                </div>
				              	<div id="lista-paradas" class="list-group">

					                <div class="list-group-item">
					                  <strong><font size="2">A: Sucursal</font></strong>
					                </div>

					                <!--DRAG & DROP-->

					                <ul id="sortable1" class="connectedSortable">
										<%-- ArrayList<Pasajero> pasajeros = new ArrayList<Pasajero>(); --%>
										<%-- pasajeros = (ArrayList<Pasajero>)ruta.getPasajeros(); --%>
										<%--for(Pasajero pasajero: pasajeros){ --%>
					                  <li class="ui-state-default">					                  	
					                   <div class="list-group-item">
					                     <strong><font size="2">C: <%--pasajero.getDireccion() --%></font></strong>
					                     <label><%--pasajero.getNombres()+" "+pasajero.getApellidos()+" "+pasajero.getTelefono() --%></label>
					                   </div>
					                  </li>
					                  <%-- } --%>

					                  <!-- <li class="ui-state-default">
					                   <div class="list-group-item">
					                     <strong><font size="2">D: Urb. Central</font></strong>
					                     <label>Oscar Perez, Masculino, 0414-4059301</label>
					                   </div>
					                  </li>

					                  <li class="ui-state-default">	
					                   <div class="list-group-item">
					                     <strong><font size="2">E: Urb. Este</font></strong>
					                     <label>Jose Luis Ramirez, 0414-4059306</label>
					                   </div>
					                  </li>

					                  <li class="ui-state-default">
					                   <div class="list-group-item">
					                     <strong><font size="2">F: Urb. Oeste</font></strong>
					                     <label>Jesus Gutierrez, 0414-4059302</label>
					                   </div>
					                  </li>-->

					                </ul>

					                <!--DRAG & DROP-->

				              	</div>
   
				            </div>
				            <%-- /*}*/ --%>
						</div>

						<!-- <div class="col-sm-6">
							<div class="panel panel-primary">
				                <div class="panel-heading clearfix">
				                	<h3 class="panel-title pull-left">Ruta #2</h3> 
									<div class="my-icon pull-right" style="margin-top: 10px"><i id="ic-verModal" class="fa fa-hand-pointer-o" aria-hidden="true"></i></div> 
				                </div>
				              	<div id="lista-paradas" class="list-group">

					                <div class="list-group-item">
					                  <strong><font size="2">A: Sucursal</font></strong>
					                </div>-->

					                <!--DRAG & DROP-->

					                <!-- <ul id="sortable1" class="connectedSortable">

					                  <li class="ui-state-default">					                  	
					                   <div class="list-group-item">
					                     <strong><font size="2">C: Urb. Nueva Segovia, Calle 3</font></strong>
					                     <label>William Alvarez, 0414-3059301</label>
					                   </div>
					                  </li>

					                  <li class="ui-state-default">
					                   <div class="list-group-item">
					                     <strong><font size="2">D: Urb. Central</font></strong>
					                     <label>Oscar Perez, Masculino, 0414-4059301</label>
					                   </div>
					                  </li>

					                  <li class="ui-state-default">	
					                   <div class="list-group-item">
					                     <strong><font size="2">E: Urb. Este</font></strong>
					                     <label>Jose Luis Ramirez, 0414-4059306</label>
					                   </div>
					                  </li>

					                  <li class="ui-state-default">
					                   <div class="list-group-item">
					                     <strong><font size="2">F: Urb. Oeste</font></strong>
					                     <label>Jesus Gutierrez, 0414-4059302</label>
					                   </div>
					                  </li>

					                </ul>-->

					                <!--DRAG & DROP-->

				              	<!--</div>
				            </div>
						</div>-->
						</div>
						<div class="col-sm-2">
						</div>
						<div id="paginador" class="col-sm-10">
							<ul class="pagination pagination-primary">
								<li><a href="#"><</a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">5</a></li>
								<li><a href="#">></a></li>
							</ul>
						</div>
						<div class="col-sm-1">
						</div>
					</div>
						<div class="col-sm-4">
							<div class="panel">
				                <div class="panel-heading clearfix" style="background-color: #768b94; color: white">
				                	<h3 class="panel-title pull-left" style="text-align:left">Ubicaciones</h3> 
									<span style="margin-top: 10px" class="pull-right glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="left" title="Arrastre acá las ubicaciones que desea mover a otras rutas"></span>
				                </div>
				              	<div id="lista-paradas" class="list-group">

					                

					                <!--DRAG & DROP-->

					                <ul id="sortable1" class="connectedSortable">

					                  

					                </ul>

					                <!--DRAG & DROP-->
								
				              	</div>
   
				            </div>
						</div>
		            	
                     	<script type="text/javascript">
					      function initMap() {
					        var directionsService = new google.maps.DirectionsService;
					        var directionsDisplay = new google.maps.DirectionsRenderer;
					        var map = new google.maps.Map(document.getElementById('map'), {
					          zoom: 14,
					          center: {lat: 10.0582636, lng: -69.3568179}
					        });
					        directionsDisplay.setMap(map);

					        
					        calculateAndDisplayRoute(directionsService, directionsDisplay, map);
					        
					      }

				      		function calculateAndDisplayRoute(directionsService, directionsDisplay, map) {
						        var waypts = [
						        [{
						           location:new google.maps.LatLng(10.0628694,-69.3532989),
						           stopover:true
						          }, {
						           location:new google.maps.LatLng(10.0628694,-69.3532989),
						           stopover:true
						          }, {
						           location:new google.maps.LatLng(10.0715739,-69.3280646),
						           stopover:true
						          }, {
						           location:new google.maps.LatLng(10.0753345,-69.3175075),
						           stopover:true
						          }], 

						          [{
						           location:new google.maps.LatLng(10.0702328,-69.3352104),
						           stopover:true
						          }]

						          ];

						            var origins = [{
						             location:new google.maps.LatLng(10.0636925,-69.3143244)
						            }, {
						             location:new google.maps.LatLng(10.075735,-69.3171568)
						            }];
						        
						           for (var i=0; i<waypts.length; i++) {

						          	directionsService.route({
						              origin: origins[i],
						              destination: new google.maps.LatLng(10.0679506, -69.2997834),
						              waypoints: waypts[i],
						              optimizeWaypoints: true,
						              travelMode: 'DRIVING'
						                }, function(response, status) {
						                  if (status === 'OK') {
						                  	directionsDisplay = new google.maps.DirectionsRenderer({map:map, preserveViewport: true});
						                    directionsDisplay.setDirections(response);
						                    var route = response.routes[0];
						                 } else {
						                    window.alert('Directions request failed due to ' + status);
						                  }
						               });            

						           } <!--//For--> 

						      }

				    	</script>
		            	<div id="map">		            		
		            	</div>
		            	 <br>

			        </div><!--list-details-->
					
					
					
	            </div>
	        </div>
	        
	    </div><!--//Tab Content-->
	    <!-- Modal -->
		<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Nueva Solicitud</h4>
		      </div>
		      <div class="modal-body">
				<form id="example-advanced-form" action="#">
				    <h3>Solicitud</h3>
				    <fieldset>
				        <legend>Información del Traslado</legend>
				 		<div class="container-fluid">
				 			<div class="row">
				 				<div class="col-sm-4">
				 					Hora: <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="Seleccione la hora del día a la que se llevará a cabo el traslado. (Hora y minutos)"></span>
				 					<div class="container-fluid">
				 						<div class="col-sm-4 no-padding">
						 					<select class="form-control" id="solicitud-hora" name="solicitud-hora">
										    	<option value="01">01</option>
										    	<option value="02">02</option>
										    	<option value="03">03</option>
										    	<option value="04">04</option>
										    	<option value="05">05</option>
										    	<option value="06">06</option>
										    	<option value="07">07</option>
										    	<option value="08">08</option>
										    	<option value="09">09</option>
										    	<option value="10">10</option>
										    	<option value="11">11</option>
										    	<option value="12">12</option>
										  	</select>				 							
				 						</div>
				 						<div class="col-sm-4 no-padding">
						 					<select class="form-control" id="solicitud-minutos" name="solicitud-minutos">
										    	<option value="0">00</option>
										    	<option value="15">15</option>
										    	<option value="30">30</option>
										    	<option value="45">45</option>
										  	</select>				 							
				 						</div>
				 						<div class="col-sm-4 no-padding">
										  	<select class="form-control" id="solicitud-turno" name="solicitud-turno">
										    	<option value="AM">AM</option>
										    	<option value="PM">PM</option>
										  	</select>				 							
				 						</div>
				 					</div>
				 				</div>
				 				<div class="col-sm-4">
				 					Días:<span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="Seleccione los días de la semana en los que se llevará a cabo el traslado. (L:Lunes, Ma:Martes, Mi:Miercoles, J:Jueves, V:Viernes, S:Sábado, D:Domingo)"></span>
				 					<br>
				 					<div class="checkbox">
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="1">
											L
										</label>
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="2">
											Ma
										</label>
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="3">
											Mi
										</label>
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="4">
											J
										</label>
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="5">
											V
										</label>
									</div>
									<div class="checkbox">
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="6">
											S
										</label>
										<label>
											<input type="checkbox" name="solicitud-dias[]" value="7">
											D
										</label>
									</div>
			
				 				</div>
				 				<div class="col-sm-4">
				 					Sentido: <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="left" title="Seleccione el sentido del traslado. (Normal: Traslado desde la sucursal hasta la dirección de cada pasajero. Inverso: Traslado desde la ubicación de los pasajeros hasta la sucursal.)"></span>
				 					<br>
				 					<div class="radio">
										<label>
											<input type="radio" name="solicitud-sentido" value="1" checked="">
											Normal
										</label>
									</div>
									<div class="radio">
										<label>
											<input type="radio" name="solicitud-sentido" value="2">
											Inverso
										</label>
									</div>
				 				</div>
				 			</div>
				 			<div class="row">
				 				<div class="col-sm-4">
				 					Apartir de:<span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="Seleccione la fecha desde la cual se empezarán a realizar los traslados."></span> 
				 					<input type="text" class="date form-control" name="solicitud-fecha" id="solicitud-fecha" required/>
				 				</div>
				 				<div class="col-sm-4">
				 					Repetir: <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="Seleccione las veces que se realizará el traslado solicitado. (No repetir: solo se realizará el traslado solicitado la semana seleccionada. Semanalmente: Se repetirá el traslado cada semana. Mensualmente: Se repetirá el traslado la misma semana de cada mes)"></span>
				 					<select class="form-control" id="solicitud-repetir" name="solicitud-repetir">
								    	<option value="1">No repetir</option>
								    	<option value="2">Semanalmente</option>
								    	<option value="3">Mensualmente</option>
								  	</select>
				 				</div>
				 				<div class="col-sm-4">
				 					Repetir hasta: <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="left" title="Seleccione hasta cuando se repetirán los traslados (en caso de repetirse)"></span>
				 					<select class="form-control" id="solicitud-repetir-hasta" name="solicitud-repetir-hasta">
								    	<option value="1">Fin del Mes Actual</option>
								    	<option value="2">Fin del Próximo Mes</option>
								    	<option value="3">Fin del Año Actual</option>
								    	<option value="4">Fecha Específica</option>
								  	</select>
								  	<input type="text" class="date hide" name="solicitud-repetir-hasta-fecha" id="solicitud-repetir-hasta-fecha"/>
				 				</div>
				 			</div>
				 			<br>
				 			<div class="row">
				 				<div class="col-sm-12">
				 					<label>Especificaciones del Auto <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="Seleccione las especificaciones el auto que desea que le haga el traslado. (Clase A:, Clase B:, Clase C:)"></span></label>
				 				</div>
				 				<div class="col-sm-12">

				 					<div class="radio">

										<label>
											<input type="radio" name="solicitud-auto" value="1" checked>
											Clase A
										</label>
										<label>
											<input type="radio" name="solicitud-auto" value="2">
											Clase B
										</label>
										<label>
											<input type="radio" name="solicitud-auto" value="3">
											Clase C
										</label>
									</div>
				 				</div>
				 			</div>
				 		</div>
				        <p>(*) Campo obligatorio</p>
				    </fieldset>
				 
				    <h3>Pasajeros</h3>
				    <fieldset>
				        <legend>Lista de Pasajeros <span class="glyphicon glyphicon-question-sign" data-toggle="tooltip" data-placement="right" title="Seleccione los pasajeros a los cuales se les hará el traslado solicitado."></span></legend>
				 		<div class="checkbox">
						  <label><input type="checkbox" name="pasajeros[]" value="1">Juan Castillo, 21.432.4522</label>
						</div>
						<div class="checkbox">
						  <label><input type="checkbox" name="pasajeros[]" value="2">Carmen Hernandez, 17.234.642</label>
						</div>
						<div class="checkbox">
						  <label><input type="checkbox" name="pasajeros[]" value="3">Maikel Zambrano, 24.214.618</label>
						</div>
				    </fieldset>
				 				 
				    <h3>Confirmación</h3>
				    <fieldset>
				        <legend>Confirmación de la solicitud</legend>
				 		<div class="container-fluid">
				 			<div class="row">
				 				<div class="col-sm-4 form-resumen-hora">
				 					Hora: <p> 08:00 AM </p> 
				 				</div>
				 				<div class="col-sm-4 form-resumen-dias">
				 					Días: <p> L M V </p> 
				 				</div>
				 				<div class="col-sm-4 form-resumen-sentido">
				 					Sentido: <p> Normal </p> 
				 				</div>
				 			</div>
				 			<div class="row">
				 				<div class="col-sm-4 form-resumen-fecha-inicio">
				 					A partir de: <p> 29/04/2017 </p> 
				 				</div>
				 				<div class="col-sm-4 form-resumen-repeticion">
				 					Repetir: <p> Semanalmente </p> 
				 				</div>
				 				<div class="col-sm-4 form-resumen-hasta">
				 					Hasta: <p> Fin del Mes Actual </p> 
				 				</div>
				 			</div>
				 			<div class="row">
				 				<div class="col-sm-4 form-resumen-fecha-auto">
				 					Auto: <p> Clase A </p> 
				 				</div>
				 				<div class="col-sm-4 form-resumen-sucursal">
				 					Sucursal: <p> Sambil </p> 
				 				</div>
				 				<div class="col-sm-4 form-resumen-cantidad">
				 					Cantidad de Pasajeros: <p> 2 </p> 
				 				</div>
				 			</div>
				 			<br>
				 			<div class="row">
				 				<div class="col-sm-12">
				 					Listado de Pasajeros:
				 					<div class="container-fluid">
					 					<ul>
					 						<li>Juan Castillo, 21.432.4522</li>
					 						<li>Maikel Zambrano, 24.214.618</li>
					 					</ul> 				 						
				 					</div>

				 				</div>
				 				
				 			</div>
				 			<br>
				 			<div class="row">
				 				<div class="col-sm-12">
				        			<input id="acceptTerms-2" name="acceptTerms" type="checkbox" class="required"> <strong for="acceptTerms-2">Estoy de acuerdo con la solicitud de la orden.</strong>				 					
				 				</div>
				 			</div>
				 		</div>

				    </fieldset>
				</form>		  
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		      </div>
		    </div>
		  </div>
		</div>

		<!-- Modal por Ruta -->
		<div class="modal fade" id="myModalRuta" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		  <div class="modal-dialog modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Ruta #1</h4>
		      </div>
		      <div class="modal-body">
		         <div class="col-sm-4">
		                           Chofer asignado: 
				 				    <select class="form-control" id="chofer-asignado" name="chofer-asignado">
								    	<option value="1">Jose Miguel</option>
								    	<option value="2">Maria Jose</option>
								    	<option value="3">Jose Maria</option>
								  	</select>
				
			     </div>
			     <div class="col-sm-2">
			     </div>
			     <div class="col-sm-4">
			      Tarifa: 5.000,00
			     </div>
			   
		      <legend>Lista de pasajeros</legend>

		         <table id="tb-pasajeros" class="table table-fixed table-hover">
                  <thead>
                    <tr>
                     <th class="col-xs-2">Nombres</th><th class="col-xs-2">Apellidos</th><th class="col-xs-2">Cedula</th><th class="col-xs-3">Cargo</th><th class="col-xs-3">Telefono</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                     <td class="col-xs-2">Luis Jose</td><td class="col-xs-2">Perez Suarez</td><td class="col-xs-2">20.768.456</td><td class="col-xs-3">Gerente</td><td class="col-xs-3">0412-223-4444</td>
                    </tr>
                    <tr>
                     <td class="col-xs-2">Luis Jose</td><td class="col-xs-2">Perez Suarez</td><td class="col-xs-2">20.768.456</td><td class="col-xs-3">Gerente</td><td class="col-xs-3">0412-223-4444</td>
                    </tr>
                     <tr>
                     <td class="col-xs-2">Luis Jose</td><td class="col-xs-2">Perez Suarez</td><td class="col-xs-2">20.768.456</td><td class="col-xs-3">Gerente</td><td class="col-xs-3">0412-223-4444</td>
                    </tr>
                                      
                  </tbody>
                </table>

		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-dismiss="modal">Guardar</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
		      </div>
		    </div>
		  </div>
		</div>
	    <!-- FOOTER -->
		<footer class="panel-footer">
		  	<div class="container-fluid">
			    <div class="row">
				    <ul class="list-inline social">
				        <li><a href="https://www.facebook.com/Upy3-562249513940554"><i class="facebook"></i></a></li>
				        <li><a href="https://twitter.com/UpyDriver"><i class="twitter"></i></a></li>
				   	</ul>
				  	<p class="modal-footer text-center">&copy;Copyright 2016, <b>upy3</b> <br class="hidden-lg hidden-md hidden-sm">| Diseñado y Desarrollado por:<a class="btn btn-link" href="http://www.marnagarage.com">Marna Garage</a> <br class="hidden-lg hidden-md hidden-sm">| <a href="terminos_de_uso.php">Términos de uso</a></p>
			  	</div>
			</div>
		</footer>

	</body>
	<script src="../assets/js/material.min.js"></script>

	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="../assets/js/nouislider.min.js" type="text/javascript"></script>

	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="../assets/js/material-kit.js" type="text/javascript"></script>

	<script type="text/javascript">

		$().ready(function(){
			// the body of this function is in assets/material-kit.js
			materialKit.initSliders();
            window_width = $(window).width();

            if (window_width >= 992){
                big_image = $('.wrapper > .header');

				$(window).on('scroll', materialKitDemo.checkScrollForParallax);
			}

			bootcards.init( {
		        offCanvasBackdrop : true,
		        offCanvasHideOnMainClick : true,
		        enableTabletPortraitMode : true,
		        disableRubberBanding : true,
		        disableBreakoutSelector : 'a.no-break-out'
		      });



		});
		$("#btn-modal").click(function(){
			$("#myModal").modal('toggle');
		});
		$("#ic-verModal").click(function(){
			$("#myModalRuta").modal('toggle');
		});;
	</script>
</html>