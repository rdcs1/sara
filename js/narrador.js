var base_url="/sinavi";


$( document ).ready(inicializar);

function inicializar()
{
	$('#btncomentar').on('click',comentar);
	
}

function comentar(event)
{
	var tiempo=$('#minuto').val();
	var texto=$('#comentario').val();
	$('#minuto').val('');
	$('#comentario').val('');
	var parametros={
					url:base_url+'/comentar',
					method:'post',
					data:{minuto:tiempo,comentario:texto},
					type:'json',
					processRpta:actualizarComentarios
				}
	enviarSolicitudAjax(parametros);
}

function enviarSolicitudAjax(parametros)
{
	var request = $.ajax({
  							url: parametros.url,
  							type: parametros.method,
  							data: parametros.data,
  							dataType: parametros.type
					});
	request.done(parametros.processRpta);
	request.fail(function( jqXHR, textStatus ) {
  					alert( "Request failed: " + textStatus );
				});
}

function actualizarComentarios(rpta)
{
	if(rpta.result=='ok'){
		$('#trini').after("<tr><td>"+rpta.minuto+"</td><td>"+rpta.comentario+"</td></tr>");
	}
	else{
		alert("Problemas con el servidor");
	}
}



