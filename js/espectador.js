$( document ).ready(inicializar);

function inicializar()
{
	 var pusher = new Pusher('f9846fc047fb7f9caa86', {
      cluster: 'us2',
    });

    var channel = pusher.subscribe('sinavi');
    channel.bind('new-comment', actualizarComentarios);
}

function actualizarComentarios(rpta){
	$('#trini').after("<tr><td>"+rpta.minuto+"</td><td>"+rpta.comentario+"</td></tr>");
}
