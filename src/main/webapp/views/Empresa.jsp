<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<head>
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

		<script type="text/javascript" src="../assets/js/functions2.js"></script>
		<!--Google Maps API-->
		<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
		
        <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEbmBMEdo7M5E4Y5XSMY5sDxaQ7g6ZITc&callback=iniciar_Mapas">
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
		    var geocoder1;
		    var map1;
		    var mapOptions1 = {
		        zoom: 14,
		        //center: new google.maps.LatLng(10.09785571410395, -69.3480375455078),
		        mapTypeId: google.maps.MapTypeId.ROADMAP
		      }
		    var marker1;
		    function initialize_emp() {
		        geocoder1 = new google.maps.Geocoder();
		        map1 = new google.maps.Map(document.getElementById('mapa_remple'), mapOptions1);
		        codeAddress_emp();
		        google.maps.event.addListener(map1, "idle", function()
		        {
		            google.maps.event.trigger(map1, 'resize');
		        });

		        map1.setZoom( map1.getZoom() - 1 );
		        map1.setZoom( map1.getZoom() + 1 );
		    }
		    function codeAddress_emp() {
		      var address1 = document.getElementById('direccion_remple').value;
		      geocoder1.geocode( { 'address': address1}, function(results1, status1) {
		        if (status1 == google.maps.GeocoderStatus.OK) {
		          map1.setCenter(results1[0].geometry.location);
		          if(marker1)
		            marker1.setMap(null);
		          marker1 = new google.maps.Marker({
		              map: map1,
		              position: results1[0].geometry.location,
		              draggable: true
		          });
		          google.maps.event.addListener(marker1, "dragend", function() {
		            document.getElementById('lat_emp').value = marker1.getPosition().lat();
		            document.getElementById('lng_emp').value = marker1.getPosition().lng();
		          });
		          document.getElementById('lat_emp').value = marker1.getPosition().lat();
		          document.getElementById('lng_emp').value = marker1.getPosition().lng();
		        } else {
		          alert('Geocode no pudo ejecutarse por el siguiente motivo: ' + status1);
		        }
		      });
		    }
		    function codeAddress_editar_empleado() {
		      geocoder1 = new google.maps.Geocoder();
		      map1 = new google.maps.Map(document.getElementById('mapa_editar_emple'), mapOptions1);
		      var address1 = document.getElementById('txtdireccion_eemple').value;
		      geocoder1.geocode( { 'address': address1}, function(results1, status1) {
		        if (status1 == google.maps.GeocoderStatus.OK) {
		          map1.setCenter(results1[0].geometry.location);
		          if(marker1)
		            marker1.setMap(null);
		          marker1 = new google.maps.Marker({
		              map: map1,
		              position: results1[0].geometry.location,
		              draggable: true
		          });
		          google.maps.event.addListener(marker1, "dragend", function() {
		            document.getElementById('lat_eemp').value = marker1.getPosition().lat();
		            document.getElementById('lng_eemp').value = marker1.getPosition().lng();
		          });
		          document.getElementById('lat_eemp').value = marker1.getPosition().lat();
		          document.getElementById('lng_eemp').value = marker1.getPosition().lng();
		        } else {
		          alert('Geocode no pudo ejecutarse por el siguiente motivo: ' + status1);
		        }
		      });
		    }
		</script>
		<script>
		    function iniciar_Mapas(){
		            initialize_emp();	
		    }
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
	        
	        <!--EMPRESA-->
	        <div id="empre" class="tab-pane active">
	            <div class="container">
	            	<div class="panel panel-primary">
					  <div class="panel-heading"><h3>Empresa: <i>Nombre de Empresa</i></h3></div>
					  <div class="panel-body">
					    <div> 
	                        <!--Menu Izquierdo-->
	                        <div class="col-md-3">
	                            <ul class="nav nav-pills nav-stacked">
	                                <li class="active"><a data-toggle="pill" href="#empresa_datos_basicos">Datos Básicos</a></li>
	                                <li><a data-toggle="pill" href="#empresa_ubicaciones">Ubicaciones</a></li>
	                            </ul>
	                        </div>
	                        <div class="col-md-9">
		                        <!--//Menu Izquierdo-->
		                        <div class="tab-content">
		                            <!--TAB DATOS BASICOS-->
		                            <div id="empresa_datos_basicos" class="tab-pane active">
		                            	<div class="panel panel-info">
										  <!-- Default panel contents -->
										  <div class="panel-body">
										    <form class="form-horizontal" id="form-datos-empresa">
											  <div class="form-group">
											    <label for="inputRif" class="col-sm-2 control-label">Rif</label>
											    <div class="col-sm-9">
											      <input class="form-control" id="inputRif" placeholder="Rif" value="J-21421023-3">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputNombre" class="col-sm-2 control-label">Nombre</label>
											    <div class="col-sm-9">
											      <input class="form-control" id="inputNombre" placeholder="Nombre" value="Nombre de la Empresa">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputTelefono" class="col-sm-2 control-label">Teléfono</label>
											    <div class="col-sm-9">
											      <input type="tel" class="form-control" id="inputTelefono" placeholder="Teléfono" value="582512345434">
											    </div>
											  </div>
											  <div class="form-group">
											    <label for="inputEmail" class="col-sm-2 control-label">Email</label>
											    <div class="col-sm-9">
											      <input type="email" class="form-control" id="inputEmail" placeholder="Email" value="miempresa@miempresa.com">
											    </div>
											  </div>
											  <div class="form-group">
											    <div class="col-sm-offset-5 col-sm-2">
											      <button type="button" onclick="actualizarDatosEmpresa();" class="btn btn-primary">Actualizar</button>
											    </div>
											  </div>
											</form>
										  </div>
										</div>
		                            </div>
		                            
		                            
		                            <!--TAB UBICACIONES-->
		                            <div id="empresa_ubicaciones" class="tab-pane fade">
		                            	<div class="panel panel-info">
										  <!-- Default panel contents -->
										  <div class="panel-body">
										  	<div class="container-fluid">
										  		<div class="col-sm-3">
										  			<div class="list-group" id="listado_ubicaciones">
													  <button onclick="actualizarMapa(this)" type="button" class="list-group-item active" data-lat="10.073107" data-lon="-69.293147" data-tel="0251-2515642" data-nom="Sambil"><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Sambil</button>
													  <button onclick="actualizarMapa(this)" type="button" class="list-group-item" data-lat="10.079480" data-lon="-69.281268" data-tel="0251-2515523" data-nom="Las Trinitarias"><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Las Trinitarias</button>
													  <button onclick="actualizarMapa(this)" type="button" class="list-group-item" data-lat="10.062538" data-lon="-69.364611" data-tel="0251-2456642" data-nom="Metrópolis"><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Metrópolis</button>
													  <button onclick="registrarUbicacion(this)" type="button" class="list-group-item" data-lat="10.062538" data-lon="-69.364611" data-tel=""><span class="badge"><span class="glyphicon glyphicon-plus"></span></span>Agregar Ubicación</button>
													</div>
										  		</div>
										  		<div class="col-sm-9">
										  			<div class="container-fluid">
										  				<div class="col-sm-6">
											  				<div class="input-group input-group-lg">
															  	<span class="input-group-addon" id="sizing-addon3"><span class="glyphicon glyphicon-home"></span></span>
															  	<input type="text" id="us2-nombre" class="form-control" placeholder="Nombre de la Sucursal" aria-describedby="sizing-addon3"/>												
															</div>	
											  			</div>
											  			<div class="col-sm-6">
											  				<div class="input-group input-group-lg">
															  	<span class="input-group-addon" id="sizing-addon2"><span class="glyphicon glyphicon-earphone"></span></span>
															  	<input type="text" id="us2-telefono" class="form-control" placeholder="Teléfono" aria-describedby="sizing-addon2"/>												
															</div>		
											  			</div>	
										  			</div>
										  			
										  			<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon1"><span class="glyphicon glyphicon-map-marker"></span></span>
													  	<input type="text" id="us2-address" class="form-control" placeholder="Dirección" aria-describedby="sizing-addon1"/>
														<input type="hidden" id="us2-lat"/>
														<input type="hidden" id="us2-lon"/>														
													</div>
													
													<div id="mapa-ubicaciones" style="height:400px; width: 100%;visibility: hidden;display:block;">
									  				
									  				</div>
													
										  			
										  			<div class="">
										  				<div style="text-align: center;">
										  					<button class="btn btn-primary" onclick="actualizarUbicacion();">Actualizar Ubicación</button>
										  					<button class="btn btn-danger" onclick="eliminarUbicacion();">Eliminar Ubicación</button>
										  				</div>
										  			</div>
										  			<script>
													    $('#mapa-ubicaciones').locationpicker({
													        location: {
													            latitude: 46.15242437752303,
													            longitude: 2.7470703125
													        },
													        radius: 100,
													        inputBinding: {
													            latitudeInput: $('#us2-lat'),
													            longitudeInput: $('#us2-lon'),
													            locationNameInput: $('#us2-address')
													        },	
													        enableAutocomplete: true,
													        markerInCenter: true,
													        addressFormat: 'full'
													    });
													</script>
										  		</div>
										  	</div>
										  </div>
										</div>

		                            </div>
		                        </div>	                        	
	                        </div>

	                	</div>
					  </div>
					</div>
	                
	                
	            </div>
	        </div>
	        <!--EMPLEADOS-->
	        <div id="empleados" class="tab-pane fade">
	        	<div class="container">
	            	<div class="panel panel-primary">
					  <div class="panel-heading"><h3>Pasajeros</h3></div>
					  <div class="panel-body">
					    <div> 
	                        <div id="empleados" class="tab-pane active">
                            	<div class="panel panel-info">
								  <!-- Default panel contents -->
								  <div class="panel-body">
								  	<div class="container-fluid">
								  		<div class="col-sm-3">
								  			<div class="list-group" id="listado_empleados">
											  <button onclick="actualizarMapaEmpleado(this)" type="button" class="list-group-item active" data-lat="10.073107" data-lon="-69.293147" data-tel="0251-2515642" data-nom="Juan" data-id="23.432.422" data-suc="1" data-car="Gerente" data-sex="1"><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Juan</button>
											  <button onclick="actualizarMapaEmpleado(this)" type="button" class="list-group-item" data-lat="10.079480" data-lon="-69.281268" data-tel="0251-2515523" data-nom="Jose Castillo" data-id="20.432.983" data-suc="2" data-car="Cajero" data-sex="1"><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Jose Castillo</button>
											  <button onclick="actualizarMapaEmpleado(this)" type="button" class="list-group-item" data-lat="10.062538" data-lon="-69.364611" data-tel="0251-2456642" data-nom="Alejandra Martinez" data-id="21.499.192" data-suc="3" data-car="Dueña" data-sex="2"><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Alejandra Castillo</button>
											  <button onclick="registrarEmpleado(this)" type="button" class="list-group-item" data-lat="10.062538" data-lon="-69.364611" data-tel="" data-id="" data-suc="0" data-car="" data-sex="1"><span class="badge"><span class="glyphicon glyphicon-plus"></span></span>Agregar Pasajero</button>
											</div>
								  		</div>
								  		<div class="col-sm-9">
								  			<div class="container-fluid">
								  				<div class="col-sm-6">
								  					<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon31"><span class="glyphicon glyphicon-home"></span></span>
													  	<input type="text" id="us3-nombre" class="form-control" placeholder="Nombre del pasajero" aria-describedby="sizing-addon31"/>												
													</div>
								  				</div>
								  				<div class="col-sm-6">
								  					<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon41"><span class="glyphicon glyphicon-tag"></span></span>
													  	<input type="text" id="us3-identificacion" class="form-control" placeholder="Identificación del pasajero" aria-describedby="sizing-addon41"/>												
													</div>
								  				</div>

								  			</div>

								  			<div class="container-fluid">
								  				<div class="col-sm-6">
								  					<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon21"><span class="glyphicon glyphicon-earphone"></span></span>
													  	<input type="text" id="us3-telefono" class="form-control" placeholder="Teléfono" aria-describedby="sizing-addon21"/>												
													</div>
								  				</div>
								  				<div class="col-sm-6">
										  			<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon61"><span class="glyphicon glyphicon-user"></span></span>
													  	<div class="radio">
															<label>
																<input type="radio" name="sexo" value="1"><span class="circle"></span><span class="check"></span>
																Masculino
															</label>
															<label>
																<input type="radio" name="sexo" value="2"><span class="circle"></span><span class="check"></span>
																Femenino
															</label>
														</div>
													</div>								  					
								  				</div>
								  			</div>

								  			<div class="container-fluid">
								  	
								  				<div class="col-sm-6">
										  			<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon11"><span class="glyphicon glyphicon-copy"></span></span>
														<select class="form-control" id="us3-sucursal" aria-describedby="sizing-addon11">
														    <option value="0">Selecciones la sucursal</option>
														    <option value="1">Sambil</option>
														    <option value="2">Las Trinitarias</option>
														    <option value="3">Metrópolis</option>
														  </select>														
													</div>								  					
								  				</div>
								  				<div class="col-sm-6">
								  					<div class="input-group input-group-lg">
													  	<span class="input-group-addon" id="sizing-addon71"><span class="glyphicon glyphicon-copy"></span></span>
													  	<input type="text" id="us3-cargo" class="form-control" placeholder="Cargo" aria-describedby="sizing-addon71"/>												
													</div>
								  				</div>
								  			</div>
								  			
								  			<div class="input-group input-group-lg">
											  	<span class="input-group-addon" id="sizing-addon51"><span class="glyphicon glyphicon-map-marker"></span></span>
											  	<input type="text" id="us3-address" class="form-control" placeholder="Dirección" aria-describedby="sizing-addon51"/>
																										
											</div>


											
											<div id="mapa-empleados" style="height:400px; width: 100%;visibility: hidden;display:block;">
							  				
							  				</div>
											
								  			
								  			<div class="">
								  				<div style="text-align: center;">
								  					<button class="btn btn-primary" onclick="actualizarEmpleado();">Actualizar Pasajero</button>
								  					<button class="btn btn-danger" onclick="eliminarEmpleado();">Eliminar Pasajero</button>
								  				</div>
								  			</div>
								  			<script>
											    $('#mapa-empleados').locationpicker({
											        location: {
											            latitude: 46.15242437752303,
											            longitude: 2.7470703125
											        },
											        radius: 100,
											        inputBinding: {
											            latitudeInput: $('#us3-lat'),
											            longitudeInput: $('#us3-lon'),
											            locationNameInput: $('#us3-address')
											        },	
											        enableAutocomplete: true,
											        markerInCenter: true,
											        addressFormat: 'full'
											    });
											</script>
								  		</div>
								  	</div>
								  </div>
								</div>

                            </div>

	                	</div>
					  </div>
					</div>
	                
	                
	            </div>
	        </div>
	        
	        <!--ORDEN DE SERVICIO-->
	        <div id="solicitudes" class="tab-pane fade">
	            <div class="container-fluid">
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
						      <a class="list-group-item active" href="#">
						        <div class="row">
						          <div class="col-sm-6">
						          	<div class="col-sm-4">
						          		<i class="fa fa-3x fa-address-book pull-left"></i>	
						          	</div>
						          	<div class="col-sm-8">
							            <h4 class="list-group-item-heading">#1</h4>
							            <p class="list-group-item-text">Sucursal: Sambil</p>
							            						          		
						          	</div>
						            

						          </div>
						          <div class="col-sm-6">
						            <p class="list-group-item-text">Día(s):L M V</p>
						            <p class="list-group-item-text">Hora: 9:00 AM</p>
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
						    </div>
						  </div>
						</div>
	            	</div>
	            	<div class="col-sm-8 bootcards-cards hidden-xs">
	            		<div class="container-fluid">
	            			<div class="col-sm-12">
	            				<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
								  <div class="panel panel-primary">
								    <div class="panel-heading" role="tab" id="headingOne">
								      <h4 class="panel-title">
								        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
								          Datos de la orden
								        </a>
								      </h4>
								    </div>
								    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
								      <div class="panel-body">
								        <div class="container-fluid">
								        	<div class="col-sm-6">
							            	  <!--contact details -->
									          <div id="pasajerosCard">

									            <div class="panel panel-primary">
									                <div class="panel-heading clearfix">
									                	<h3 class="panel-title pull-left">Pasajeros</h3> 
									                </div>
									              	<div id="lista-pasajeros" class="list-group">
										                <div class="list-group-item">
										                  <label>Juan Jimenez, 21.432.345, Masculino, 0414-3059201</label>
										                  <strong>Av. Venezuela con Bracamonte</strong>
										                </div>

										                <div class="list-group-item">
										                  <label>William Alvarez, 16.243.876, Masculino, 0414-3059301</label>
										                  <strong>Urb. Nueva Segovia, Calle 3</strong>
										                </div>

										                <div class="list-group-item">
										                  <label>Luisa Panto, Femenino, 0414-4059301</label>
										                  <strong>Urb. La Rosaleda</strong>
										                </div>

									              	</div>
					   
									            </div>

									          </div><!--contact card-->
									          <br>
									          <div id="tarifaOrdenCard">

									            <div class="panel panel-primary">
									                <div class="panel-heading clearfix">
									                	<h3 class="panel-title pull-left">Tarifa</h3> 
									                </div>
									              	<div id="tarifa-total-list-group" class="list-group">
										                <div class="list-group-item">
										                  <strong>Total a pagar:</strong>
										                  <label>25.000,00 Bs</label>
										                </div>

									              	</div>
					   
									            </div>

									          </div>

							            	</div>

							            	<div class="col-sm-6">
							            	  <!--contact details -->
									          <div id="detallesCard">

									            <div class="panel panel-primary">
									              <div class="panel-heading clearfix">
									                <h3 class="panel-title pull-left">Detalles de Orden</h3>  
									              </div>
									              <div id="listado-detalles" class="list-group">
									                <div class="list-group-item">
									                  <label>Sucursal</label>
									                  <h4 class="list-group-item-heading">Sambil</h4>
									                  <label><strong>Avenida Venezuela con Bracamonte</strong></label>
									                </div>
									                <div class="list-group-item">
									                  <label>Teléfono</label>
									                  <h4 class="list-group-item-heading"><a href="tel://+58 2512547645">0251-2547645</a></h4>
									                </div>

									                <div class="list-group-item">
									                  <label>Email</label>
									                  <h4 class="list-group-item-heading"><a href="mailto:sambil@sambil.com">sambil@sambil.com</a></h4>
									                </div>
									                <div class="list-group-item">
									                  <label>Días</label>
									                  <h4 class="list-group-item-heading">L Mi J</h4>
									                </div>

									                <div class="list-group-item">
									                  <label>Hora</label>
									                  <h4 class="list-group-item-heading">9:00 AM</h4>
									                </div>

									                <div class="list-group-item">
									                  <label>Frecuencia</label>
									                  <h4 class="list-group-item-heading">Semanalmente</h4>
									                </div>
									                <div class="list-group-item">
									                  <label>Duración</label>
									                  <h4 class="list-group-item-heading">Este Mes</h4>
									                </div>
									                <div class="list-group-item">
									                  <label>Especificaciones de Auto</label>
									                  <h4 class="list-group-item-heading">Aire Acondicionado, Radio</h4>
									                </div>
									                

									              </div>
					   
									            </div>

									          </div>
									          <!--contact card-->
							            	</div>
								        </div>
								      </div>
								    </div>
								  </div>
								  <div class="panel panel-primary">
								    <div class="panel-heading" role="tab" id="headingTwo">
								      <h4 class="panel-title">
								        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
								          Rutas
								        </a>
								      </h4>
								    </div>
								    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
								      <div class="panel-body">
								        <div class="container-fluid">
								        	<div class="col-sm-3">
									  			<div class="list-group" id="listado_rutas">
												  <button onclick="actualizarRuta(this)" type="button" class="list-group-item active" data-ruta='{"paradas":[{"orden":"A","direccion":"Sucursal","nombre":"","telefono":"", "sexo":"", "cedula":""},{"orden":"B","direccion":"Urb. Nueva Segovia 2, Calle 31","nombre":"Walter Alvarado","telefono":"0416-3059301", "sexo":"Masculino", "cedula":"20.423.623"}], "chofer":{"nombre":"John Jacobo", "sexo":"Masculino", "telefono":"0414-3059201", "auto":"Ford focus azul 4 puestos"}, "tarifa":"25.000 Bs. F"}'><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Ruta #1</button>
												  <button onclick="actualizarRuta(this)" type="button" class="list-group-item" data-ruta='{"paradas":[{"orden":"A","direccion":"Sucursal","nombre":"","telefono":"", "sexo":"", "cedula":""},{"orden":"B","direccion":"Urb. Nueva Segovia 2, Calle 31","nombre":"William Altuve","telefono":"0412-3059301", "sexo":"Masculino", "cedula":"12.423.423"}], "chofer":{"nombre":"John Jacob", "sexo":"Masculino", "telefono":"0416-3059201", "auto":"Ford fiesta azul 4 puestos"}, "tarifa":"35.000 Bs. F"}'><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Ruta #2</button>
												  <button  onclick="actualizarRuta(this)" type="button" class="list-group-item" data-ruta='{"paradas":[{"orden":"A","direccion":"Sucursal","nombre":"","telefono":"", "sexo":"", "cedula":""},{"orden":"B","direccion":"Urb. El Tabure, Avenida el Placer","nombre":"Carlos Peraza","telefono":"0251-3059301", "sexo":"Masculino", "cedula":"22.623.423"},{"orden":"C","direccion":"Urb. La Mendera 2, Sector la Mendera","nombre":"Alexandra Oropeza","telefono":"0426-3329301", "sexo":"Femenino", "cedula":"24.323.423"}], "chofer":{"nombre":"Ismael Martinez", "sexo":"Masculino", "telefono":"0424-3559201", "auto":"Toyota Corolla gris 4 puestos"}, "tarifa":"15.000 Bs. F"}'><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Ruta #3</button>
												  <button  onclick="actualizarRuta(this)" type="button" class="list-group-item" data-ruta='{"paradas":[{"orden":"A","direccion":"Sucursal","nombre":"","telefono":"", "sexo":"", "cedula":""},{"orden":"B","direccion":"Urb. Rio Lama, Av. Herman Garmendia","nombre":"Voris Valvuena","telefono":"0451-3249301", "sexo":"Masculino", "cedula":"22.521.423"}], "chofer":{"nombre":"Cecilia Ganda", "sexo":"Femenino", "telefono":"0426-3059201", "auto":"Mazda 6 azul 4 puestos"}, "tarifa":"18.000 Bs. F"}'><span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Ruta #4</button>
												</div>
											</div>

											<div class="col-sm-6">
												<div class="panel panel-primary">
									                <div class="panel-heading clearfix">
									                	<h3 class="panel-title pull-left">Recorrido</h3> 
									                </div>
									              	<div id="lista-paradas" class="list-group">
										                <div class="list-group-item">
										                  <strong>A: Sucursal</strong>
										                </div>

										                <div class="list-group-item">
										                  <strong>C: Urb. Nueva Segovia, Calle 3</strong>
										                  <label>William Alvarez, 16.243.876, Masculino, 0414-3059301</label>
										                </div>

										                <div class="list-group-item">
										                  <strong>D: Urb. Central</strong>
										                  <label>Oscar Perez, Masculino, 0414-4059301</label>
										                </div>

										                <div class="list-group-item">
										                  <strong>E: Urb. Este</strong>
										                  <label>Jose Luis Ramirez, Masculino, 0414-4059306</label>
										                </div>

										                <div class="list-group-item">
										                  <strong>F: Urb. Oeste</strong>
										                  <label>Jesus Gutierrez, Masculino, 0414-4059302</label>
										                </div>

									              	</div>
					   
									            </div>
				                           </div>
				                           <div class="col-sm-3">
					                           	<div class="panel panel-primary">
									                <div class="panel-heading clearfix">
									                	<h3 class="panel-title pull-left">Chofer asignado</h3> 
									                </div>
									              	<div id="chofer" class="list-group">
										                <div class="list-group-item">
										                  <strong id="ruta-chofer">Juan Jimenez, Masculino, 0414-3059201</strong>
										                  <label id="ruta-chofer-auto">Ford Focus azul 4 puertas</label>
										                </div>

									              	</div>
					   
									            </div>
									            <br>
									            <div class="panel panel-primary">
									                <div class="panel-heading clearfix">
									                	<h3 class="panel-title pull-left">Tarifa</h3> 
									                </div>
									              	<div id="tarifa" class="list-group">
										                <div class="list-group-item">
										                  <strong>Total a pagar:</strong>
										                  <label id="ruta-tarifa">5.000,00 Bs</label>
										                </div>

									              	</div>
					   
									            </div>
				                           </div>

								        </div>
								      </div>
								    </div>
								  </div>
								</div>	
	            			</div>
	            		</div>
		            		
		            	

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
	</script>
</html>