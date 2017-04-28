//Scripts para el modulo de sucursales de la empresa

$(document).ready(function(){
	$.fn.modal.Constructor.prototype.enforceFocus = function () {};
	$('a[href="#empresa_ubicaciones"]').on('shown.bs.tab', function (e) {
	  //e.target // newly activated tab
	  //e.relatedTarget // previous active tab
		$('#mapa-ubicaciones').css("visibility","visible");
		el = $('#listado_ubicaciones').find('button.list-group-item.active');
		$('#us2-telefono').val($(el).attr("data-tel"));
		$('#us2-nombre').val($(el).attr("data-nom"));
		$('#mapa-ubicaciones').locationpicker("location", {latitude: $(el).attr("data-lat"), longitude: $(el).attr("data-lon")});
		$('#mapa-ubicaciones').locationpicker("autosize");
	});

	$('a[href="#empresa_ubicaciones"]').on('hide.bs.tab', function (e) {
	  //e.target // newly activated tab
	  //e.relatedTarget // previous active tab
		$('#mapa-ubicaciones').css("visibility","hidden");
	});

	$('#myModal').on('shown.bs.modal', function () {
	    
		   $('#myModal').on('shown.bs.modal', function () {
		    var form = $("#example-advanced-form").show();
	 
						form.steps({
						    headerTag: "h3",
						    bodyTag: "fieldset",
						    transitionEffect: "slideLeft",
						    labels: {
						        current: "Actual",
						        pagination: "Paginación",
						        finish: "Finalizar",
						        next: "Siguiente",
						        previous: "Anterior",
						        loading: "Cargando ...",
						    },
						    onStepChanging: function (event, currentIndex, newIndex)
						    {
						        // Allways allow previous action even if the current form is not valid!
						        if (currentIndex > newIndex)
						        {
						            return true;
						        }
						        // Needed in some cases if the user went back (clean up)
						        if (currentIndex < newIndex)
						        {
						            // To remove error styles
						            form.find(".body:eq(" + newIndex + ") label.error").remove();
						            form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
						        }
						        if (newIndex === 2){
						            //aqui va el codigo para cargar la pantalla de resumen
						        }
						        form.validate().settings.ignore = ":disabled,:hidden";
						        return form.valid();
						    },
						    onStepChanged: function (event, currentIndex, priorIndex)
						    {
						        // Used to skip the "Warning" step if the user is old enough.
						        if (currentIndex === 2 && Number($("#age-2").val()) >= 18)
						        {
						            form.steps("next");
						        }
						        // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
						        if (currentIndex === 2 && priorIndex === 3)
						        {
						            form.steps("previous");
						        }
						    },
						    onFinishing: function (event, currentIndex)
						    {
						        form.validate().settings.ignore = ":disabled";
						        return form.valid();
						    },
						    onFinished: function (event, currentIndex)
						    {
						        swal({
								  title: "Esta seguro que desea realizar la solicitud de traslado?",
								  type: "warning",
								  showCancelButton: true,
								  confirmButtonColor: "#DD6B55",
								  confirmButtonText: "Si!",
								  cancelButtonText: "No!",
								  closeOnConfirm: false,
								  closeOnCancel: false
								},
								function(isConfirm){
								  if (isConfirm) {
								    swal("Actualizado!", "La solicitud se ha registrado exitosamente.", "success");
								  } else {
								    swal("Cancelado", "Solicitud de traslado cancelada.", "error");
								  }
								});
						    }
						}).validate({
						    errorPlacement: function errorPlacement(error, element) { element.before(error); },
						    rules: {
						        confirm: {
						            equalTo: "#password-2"
						        }
						    }
						});

						$('[data-toggle="tooltip"]').tooltip();
						$('#myModal').on('focus',".date", function(){
						    $(this).datepicker({
						    	'minDate': "+ 2d",
						    });
						})

						$('#myModal').on('focus',".time", function(){
						    $(this).timepicker({
						    	'minDate': "+ 2d"
						    });
						})



		});


	});

	$('#myModal').on('focus',".date", function(){
	    $(this).datepicker({
	    	'minDate': "+ 2d",
	    });
	})

	$('#myModal').on('focus',".time", function(){
	    $(this).timepicker({
	    	'minDate': "+ 2d"
	    });
	})


});

//Actualiza el mapa de las ubicaciones de la empresa con los datos que tiene el boton sobre la latitud y longitud de la ubicación
function actualizarMapa(el){
	$('#mapa-ubicaciones').locationpicker("location", {latitude: $(el).attr("data-lat"), longitude: $(el).attr("data-lon")});
	$('#us2-telefono').val($(el).attr("data-tel"));
	$('#us2-nombre').val($(el).attr("data-nom"));
	$(el).parent().find('button.list-group-item.active').removeClass('active');
	$(el).addClass('active');
}

function actualizarDatosEmpresa(){
	swal({
	  title: "Esta seguro que desea actualizar los datos de la empresa?",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "Si!",
	  cancelButtonText: "No!",
	  closeOnConfirm: false,
	  closeOnCancel: false
	},
	function(isConfirm){
	  if (isConfirm) {
	    swal("Actualizado!", "Los datos de la empresa se han actualizado exitosamente.", "success");
	  } else {
	    swal("Cancelado", "Los datos de la empresa no fueron actualizados.", "error");
	  }
	});
}

function actualizarUbicacion(){
	swal({
	  title: "Esta seguro que desea actualizar la ubicación?",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "Si!",
	  cancelButtonText: "No!",
	  closeOnConfirm: false,
	  closeOnCancel: false
	},
	function(isConfirm){
	  if (isConfirm) {
	    swal("Actualizado!", "Los datos de la ubicación se han actualizado exitosamente.", "success");
	  } else {
	    swal("Cancelado", "Los datos de la ubicación no fueron actualizados.", "error");
	  }
	});
}

function eliminarUbicacion(){
	swal({
	  title: "Esta seguro que desea eliminar la ubicación?",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "Si!",
	  cancelButtonText: "No!",
	  closeOnConfirm: false,
	  closeOnCancel: false
	},
	function(isConfirm){
	  if (isConfirm) {
	  	$( "#listado_ubicaciones button.active").remove();
	  	$( "#listado_ubicaciones button:first-child" ).click();
	    swal("Eliminado!", "La ubicación se ha eliminado exitosamente.", "success");
	  } else {
	    swal("Cancelado", "La ubicación no se ha eliminado.", "error");
	  }
	});
}

function registrarUbicacion(el){
	$(el).parent().find('button.list-group-item.active').removeClass('active');
	btnNuevo = $( "#listado_ubicaciones button:first-child" ).clone();
	btnNuevo.attr('data-tel','');
	btnNuevo.attr('data-nom','Nueva Ubicación');
	btnNuevo.addClass('active');
	btnNuevo.html('<span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Nueva Ubicación');
	btnNuevo.insertBefore("#listado_ubicaciones button:last-child");
	btnNuevo.click();
	swal("Ubicación Agregada", 'Por favor modifique los detalles de la ubicación y presione el botón "Actualizar Ubicación"');
}


//Scripts para el modulo de empleados de la empresa

$(document).ready(function(){
	$('a[href="#empleados"]').on('shown.bs.tab', function (e) {
	  //e.target // newly activated tab
	  //e.relatedTarget // previous active tab
		$('#mapa-empleados').css("visibility","visible");
		el = $('#listado_empleados').find('button.list-group-item.active');
		$('#us3-telefono').val($(el).attr("data-tel"));
		$('#us3-nombre').val($(el).attr("data-nom"));
		$('#us3-identificacion').val($(el).attr("data-id"));
		$('#us3-cargo').val($(el).attr("data-car"));
		$('#us3-sucursal option:eq('+$(el).attr("data-suc")+')').prop('selected', true);
		$('input:radio[value='+$(el).attr("data-sex")+']').prop('checked', true);
		$('#mapa-empleados').locationpicker("location", {latitude: $(el).attr("data-lat"), longitude: $(el).attr("data-lon")});
		$('#mapa-empleados').locationpicker("autosize");
	});

	$('a[href="#empleados"]').on('hide.bs.tab', function (e) {
	  //e.target // newly activated tab
	  //e.relatedTarget // previous active tab
		$('#mapa-empleados').css("visibility","hidden");
	})
});

//Actualiza el mapa de las empleados de la empresa con los datos que tiene el boton sobre la latitud y longitud de la ubicación
function actualizarMapaEmpleado(el){
	$('#mapa-empleados').locationpicker("location", {latitude: $(el).attr("data-lat"), longitude: $(el).attr("data-lon")});
	$('#us3-telefono').val($(el).attr("data-tel"));
	$('#us3-nombre').val($(el).attr("data-nom"));
	$('#us3-identificacion').val($(el).attr("data-id"));
	$('#us3-sucursal option:eq('+$(el).attr("data-suc")+')').prop('selected', true);
	$('#us3-cargo').val($(el).attr("data-car"));
	$('input:radio[value='+$(el).attr("data-sex")+']').prop('checked', true);
	$(el).parent().find('button.list-group-item.active').removeClass('active');
	$(el).addClass('active');
}

function actualizarEmpleado(){
	swal({
	  title: "Esta seguro que desea actualizar el pasajero?",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "Si!",
	  cancelButtonText: "No!",
	  closeOnConfirm: false,
	  closeOnCancel: false
	},
	function(isConfirm){
	  if (isConfirm) {
	    swal("Actualizado!", "Los datos del pasajero se han actualizado exitosamente.", "success");
	  } else {
	    swal("Cancelado", "Los datos del pasajero no fueron actualizados.", "error");
	  }
	});
}

function eliminarEmpleado(){
	swal({
	  title: "Esta seguro que desea eliminar el pasajero?",
	  type: "warning",
	  showCancelButton: true,
	  confirmButtonColor: "#DD6B55",
	  confirmButtonText: "Si!",
	  cancelButtonText: "No!",
	  closeOnConfirm: false,
	  closeOnCancel: false
	},
	function(isConfirm){
	  if (isConfirm) {
	  	$( "#listado_empleados button.active").remove();
	  	$( "#listado_empleados button:first-child" ).click();
	    swal("Eliminado!", "El pasajero se ha eliminado exitosamente.", "success");
	  } else {
	    swal("Cancelado", "El pasajero no se ha eliminado.", "error");
	  }
	});
}

function registrarEmpleado(el){
	$(el).parent().find('button.list-group-item.active').removeClass('active');
	btnNuevo = $( "#listado_empleados button:first-child" ).clone();
	btnNuevo.attr('data-tel','');
	btnNuevo.attr('data-id','');
	btnNuevo.attr('data-nom','Nuevo Pasajero');
	btnNuevo.attr('data-suc',0);
	btnNuevo.attr('data-car','');
	btnNuevo.attr('data-sex',1);
	btnNuevo.addClass('active');
	btnNuevo.html('<span class="badge"><span class="glyphicon glyphicon-chevron-right"></span></span>Nuevo Pasajero');
	btnNuevo.insertBefore("#listado_empleados button:last-child");
	btnNuevo.click();
	swal("Pasajero Agregado", 'Por favor modifique los detalles del pasajero y presione el botón "Actualizar Pasajero"');
}

function actualizarRuta(el){
	$("#listado_rutas button.active").removeClass("active");
	$(el).addClass("active");
	data = $(el).data("ruta");

	$("#ruta-chofer").html(data.chofer.nombre +", " + data.chofer.sexo + ", " + data.chofer.telefono);
	$("#ruta-chofer-auto").html(data.chofer.auto);
	$("#ruta-tarifa").html(data.tarifa);

	$("#lista-paradas").empty();

	$.each(data.paradas, function(i, item){
		$("#lista-paradas").append('<div class="list-group-item"><strong>' + item.orden 
									+ ': ' + item.direccion +'</strong><label>' + item.nombre 
									+ ', ' + item.cedula + ', ' + item.sexo + ', ' + item.telefono + '</label></div>');
	});
}
