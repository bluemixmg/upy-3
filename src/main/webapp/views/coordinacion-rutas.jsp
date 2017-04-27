<html>
	<head>
		<meta charset="UTF-8">
		<title>UPY3 | Panel de Control</title>
		<link rel="icon" type="image/png" href="assets/images/ic_launcher.png" />
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
		<link href="assets/css/jquery-ui.min.css" rel="stylesheet" type="text/css" media="all" />
		<link href="assets/css/sweetalert.css" rel="stylesheet" type="text/css" media="all" />
		<link href="assets/css/material-kit.css" rel="stylesheet"/>
		<link href="assets/css/bootcards-desktop.css" rel="stylesheet"/>
		<link href="assets/css/steps.css" rel="stylesheet"/>
		<link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datepicker.css">
		<link rel="stylesheet" type="text/css" href="assets/css/jquery.timepicker.css"></link>
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="assets/js/jquery-2.2.3.min.js"></script>
		<script src="assets/js/jquery-ui.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/sweetalert.min.js"></script>
		<script src="assets/js/jquery.steps.min.js"></script>
		<script src="assets/js/jquery.validate.min.js"></script>
		<script src="assets/js/bootcards.min.js"></script>
		<script src="assets/js/jquery.timepicker.min.js"></script>

		<script type="text/javascript" src="assets/js/functions.js"></script>
		<!--Google Maps API-->
		<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
		
        <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEbmBMEdo7M5E4Y5XSMY5sDxaQ7g6ZITc&callback=initMap">
        </script>	

		<script src="assets/js/locationpicker.jquery.js"></script>
		<!-- Custom Theme files -->
		<!--timedropper jQuery plugin-->
		<script src="assets/js/timedropper.min.js"></script>
		<link rel="stylesheet" type="text/css" href="assets/css/timedropper.min.css">
		<!--theme-style-->
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet"/>
		<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />
	    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
		<link href="assets/css/style.css" rel="stylesheet" type="text/css" media="all" />
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

	    <header class="Header">
		    <div class="container">
		        <dir class="row">
		            <div class="col-sm-12">
		            
		                <div class="menu info-top">
		                   <a href="logout.php" class="boton boton-sesion">Cerrar sesi√≥n</a>
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
	        <div id="solicitudes" class="tab-pane fade">
	            <div class="container">
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
						            <p class="list-group-item-text">DÌas(s):L M V</p>
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
						            <p class="list-group-item-text">DÌas(s):L M J V</p>
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
						            <p class="list-group-item-text">DÌas(s):L M V</p>
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

	            	<div class="col-sm-4">
							<div class="panel panel-primary">
				                <div class="panel-heading clearfix">
				                	<h3 class="panel-title pull-left">Ruta #1</h3> 
				                </div>
				              	<div id="lista-paradas" class="list-group">

					                <div class="list-group-item">
					                  <strong><font size="2">A: Sucursal</font></strong>
					                </div>

					                <!--DRAG & DROP-->

					                <ul id="sortable1" class="connectedSortable">

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

					                </ul>

					                <!--DRAG & DROP-->

				              	</div>
   
				            </div>
                     </div>

                     <div class="col-sm-4">
							<div class="panel panel-primary">
				                <div class="panel-heading clearfix">
				                	<h3 class="panel-title pull-left">Ruta #2</h3> 
				                </div>
				              	<div id="lista-paradas" class="list-group">

					                <div class="list-group-item">
					                  <strong><font size="2">A: Sucursal</font></strong>
					                </div>

					                <!--DRAG & DROP-->

					                <ul id="sortable1" class="connectedSortable">

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

					                </ul>

					                <!--DRAG & DROP-->

				              	</div>
   
				            </div>
                     </div>

                     <div class="col-sm-4">
							<div class="panel panel-primary">
				                <div class="panel-heading clearfix">
				                	<h3 class="panel-title pull-left">Ruta #3</h3> 
				                </div>
				              	<div id="lista-paradas" class="list-group">

					                <div class="list-group-item">
					                  <strong><font size="2">A: Sucursal</font></strong>
					                </div>

					                <!--DRAG & DROP-->

					                <ul id="sortable1" class="connectedSortable">

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

					                </ul>

					                <!--DRAG & DROP-->

				              	</div>
   
				            </div>
                     </div>

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

		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
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
				  	<p class="modal-footer text-center">&copy;Copyright 2016, <b>upy3</b> <br class="hidden-lg hidden-md hidden-sm">| Dise√±ado y Desarrollado por:<a class="btn btn-link" href="http://www.marnagarage.com">Marna Garage</a> <br class="hidden-lg hidden-md hidden-sm">| <a href="terminos_de_uso.php">T√©rminos de uso</a></p>
			  	</div>
			</div>
		</footer>

	</body>
	<script src="assets/js/material.min.js"></script>

	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/nouislider.min.js" type="text/javascript"></script>

	<!-- Control Center for Material Kit: activating the ripples, parallax effects, scripts from the example pages etc -->
	<script src="assets/js/material-kit.js" type="text/javascript"></script>

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