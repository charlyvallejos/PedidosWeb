//Constantes
var READY_STATE_COMPLETE = 4;
var STATUS_OK = 200;

function objetoAJAX()
{
    if(window.XMLHttpRequest)
        return new XMLHttpRequest();
    else if (window.ActiveXObject)
        return new ActiveXObject('Microsoft.XMLHTTP');
}

function datosRecibidos()
{
    precarga.style.display = "block";
    precarga.innerHTML = "<img src='img/loader.gif' />";
    if (ajax.readyState == READY_STATE_COMPLETE)
    {
        if(ajax.status == STATUS_OK)
        {
            precarga.style.display = 'none';                          
            respuesta.style.display = 'block';
            respuesta.innerHTML = ajax.responseText;

            if(ajax.responseText.indexOf('data-insertar') > -1)
                document.querySelector('#alta-pedido').addEventListener('submit', insertarPedido);
            if(ajax.responseText.indexOf('data-editar') > -1)
                document.querySelector('#editar-pedido').addEventListener('submit',modificarPedido);
            if(ajax.responseText.indexOf('data-recargar') > -1)
                setTimeout(window.location.reload(),15000);
//                               
        }
        else
        {
            alert('El servidor no contestó\nError '+ ajax.status + ': ' + ajax.statusText);
        }
    }
}

function ejecutarAJAX(datos)
{
    ajax = objetoAJAX();
    
    ajax.open('POST','controlador.php',true);
    ajax.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
    ajax.send(datos);
    ajax.onreadystatechange = datosRecibidos;        
}

function insertarPedido(evento)
{
    evento.preventDefault();
    
    var nombre = new Array(),
        valor = new Array(),
        datos = "";        

    for(var i = 1; i < evento.target.length; i++)
    {
        nombre[i] = evento.target[i].name;
        valor[i] = evento.target[i].value;
        
        datos += nombre[i] + '=' + valor[i] + '&'; 
        
    }
    //alert('prueba');
    console.log(datos);
    ejecutarAJAX(datos);    
}

function altaPedido(evento)
{
    evento.preventDefault();   
    var datos = "transaccion=alta";
    
    
    ejecutarAJAX(datos);
    
    //alert("alta usuario");
}

function eliminarPedido(evento)
{
    evento.preventDefault();
    
    var nroPedido = evento.target.dataset.id;
    var eliminar = confirm('Esta seguro que desea eliminar el Pedido Nro:' + nroPedido);
    
    if(eliminar)
    {
        var datos = "nroPedido="+ nroPedido +"&transaccion=baja";
        ejecutarAJAX(datos);
    }
            
}

function modificarPedido(evento)
{
    evento.preventDefault();
    
    var nombre = new Array(),
        valor = new Array(),
        datos = "";

    for(var i = 0; i < evento.target.length; i++)
    {
        nombre[i] = evento.target[i].name;
        valor[i] = evento.target[i].value;
        
        datos += nombre[i] + '=' + valor[i] + '&';
    }
    //console.log(datos);
    ejecutarAJAX(datos);
}

function editarPedido(evento)
{
    evento.preventDefault();
    
    var nroPedido = evento.target.dataset.id;
    var datos = "transaccion=editar&nroPedido=" + nroPedido;
    
    //console.log(datos);
    ejecutarAJAX(datos);    
}

/*
function alCargarDocumento()
{
    $('#insertar').click(altaPedido);       
    $('.eliminar').click(eliminarPedido);
    $('.editar').click(editarPedido);       
}*/
//window.addEventListener("load",alCargarDocumento);    

//$(document).ready(alCargarDocumento);

