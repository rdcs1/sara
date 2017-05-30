var base_url="/sinavi";
$( document ).ready(inicializar);

function inicializar()
{
	for(i=1;i<=18;i++){
	     var a = document.getElementById('salon'+i);
		var parametros={
						url:base_url+'/getcolor',
						method:'post',
						data:{},
						type:'json',
						processRpta:actualizarColores
					}
		enviarSolicitudAjax(parametros);

	}
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


function actualizarColores(rpta)
{
	if(rpta.result=='ok'){
		for(var i = 0; i<18 ; i++){
	     	var a = document.getElementById('salon'+(i+1));
	     	if(rpta.color[i]=="1"){
	        	a.style.backgroundColor = "orange";
	     	}
	     	else if(rpta.color[i]=="2"){
	        	a.style.backgroundColor = "yellow";
	     	}
	     	else if(rpta.color[i]=="3"){
	        	a.style.backgroundColor = "green";
	     	}
	     	else if(rpta.color[i]=="4"){
	        	a.style.backgroundColor = "gray";
	     	}
	     	else if(rpta.color[i]=="5"){
	        	a.style.backgroundColor = "red";
	     	}
		}
	}
	else{
		alert("Problemas con el servidor");
	}
}