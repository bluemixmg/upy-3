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
		
		<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
		<script src="../assets/js/jquery-2.2.3.min.js"></script>
		<script src="../assets/js/jquery-ui.min.js"></script>
		<script src="../assets/js/bootstrap.min.js"></script>
		<script src="../assets/js/sweetalert.min.js"></script>
		<script src="../assets/js/jquery.validate.min.js"></script>

		<script type="text/javascript" src="../assets/js/functions.js"></script>
		<!--Google Maps API-->
		<link href="https://developers.google.com/maps/documentation/javascript/examples/default.css" rel="stylesheet">
		
        <script async defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDEbmBMEdo7M5E4Y5XSMY5sDxaQ7g6ZITc&callback=initMap">
        </script>	
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
	</head>
	<body>

	    <header class="header-login">
		    <div class="container">
		        <dir class="row">
		            <div class="col-sm-12">
		            
		                <figure class="logo">
		                   <a href="index.php"><img src="http://upy3.com/wp-content/themes/upy3/img/logo-upy3.png" height="88" width="116"></a>
		                </figure>
		            </div>
		        </dir>
		    </div>
		</header>
	    

	
		<div class="container-fluid login-center">
			<div class="col-sm-4 col-sm-offset-8">
				<div class="login-panel">
					<div class="container-fluid">
						<div class="row">
							<div class="col-sm-12 panel-header">
								<h3>Ingresa a UPY3</h3>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12 panel-body">
								<form action="/login" method="POST">
								  <div class="form-group">
								    <input name="email" type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
								  </div>
								  <div class="form-group">
								    <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
								  </div>
								  <div class="checkbox">
								    <label>
								      <input name="rememberMe" type="checkbox"> Recordarme
								    </label>
								  </div>
								  <div style="text-align: center;">
								  	<button type="submit" class="btn btn-primary">Ingresar</button>	
								  </div>
								  
								</form>
							</div>
						</div>
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
				  	<p class="modal-footer text-center">&copy;Copyright 2016, <b>upy3</b> <br class="hidden-lg hidden-md hidden-sm">| Diseñado y Desarrollado por:<a class="btn btn-link btn-sm" href="http://www.marnagarage.com">Marna Garage</a> <br class="hidden-lg hidden-md hidden-sm">| <a href="terminos_de_uso.php">Términos de uso</a></p>
			  	</div>
			</div>
		</footer>

	</body>
	<script src="../assets/js/material.min.js"></script>


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


		});
		
	</script>
</html>