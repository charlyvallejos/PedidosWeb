
    var apiURL = 'loadData.php';  // archivo en donde pasan los datos hacia las clases+

    //Variables jquery
    var btnInsertar = $("#insertar"),
        precarga = $("#precarga"),
        respuesta = $("#respuesta"),
        mostrar = $("#mostrar"),
        ajax = null;

    var today = new Date();
    var day = today.getDate() + "";
    var month = (today.getMonth() + 1) + "";
    var year = today.getFullYear() + "";
    var hour = today.getHours() + "";
    var minutes = today.getMinutes() + "";
    var seconds = today.getSeconds() + "";

    day = checkZero(day);
    month = checkZero(month);
    year = checkZero(year);
    hour = checkZero(hour);
    mintues = checkZero(minutes);
    seconds = checkZero(seconds);

    var fechaHoy = year + "-" + month + "-" + day + " " + hour + ":" + minutes + ":" + seconds;

    function checkZero(data){
        if(data.length == 1){
            data = "0" + data;
        }
        return data;
    }

    var formUp = $('.formData'),
        btnPlus = $('.agregar'),
        clienteSeleccion = $("#clienteSeleccion"),
        productoSeleccion = $("#productoSeleccion"),
        inputCantidad = $("#CantProd"),
        divMjeCliente = $(".msgCliente"),
        divMjeProd = $(".msgProducto"),        
        buscarProducto = $("#buscarProducto"),
        buscarCliente = $("#buscarCliente"),
        modalCliente = $("#modalCliente"),
        RubroProdInput = $("#RubroProd"),
        modalRadio = $("#modalRadio"),
        AgrupCliInput = $("#AgrupCli"),
        $radioFR = $("#radioFR"),
        $radioSF = $("#radioSF"),
        $radioPed = $("#radioPedido"),
        $radioCoti = $("#radioCoti"),
        $radioPresu = $("#radioPresu"),
        $radioMostro = $("#radioMostra"),
        modalCliente2 = $("#modalCliente2"),
        $exito = $(".exito"),
        $error = $(".error"),
        cantProd = $("#cantprod");

    btnPlus.on('click',function(e){
        e.preventDefault();
        formUp.slideToggle();
    });


// Funcion que encontre por ahi que hace lo un PADLEFT
// nr: string a utilizar
// n: cantidad de caracteres
// str: string que se le agrega (en caso de no pasarle nada agrega '0')

    function padLeft(nr, n, str){
        return new Array(n-String(nr).length+1).join(str||'0')+nr;
    }
    //or as a Number prototype method:
    Number.prototype.padLeft = function (n,str){
        return new Array(n-String(this).length+1).join(str||'0')+this;
    };
    
        
//////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////// APLICACION ANGULAR ///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////

    var app = angular.module('appSapo', ['angularUtils.directives.dirPagination','appLogin','appCliente','appProducto','ngMessages']) // aplicacion de angular

        app.filter('porcentaje', ['$filter', function ($filter) {
            return function (input) {
                if(input != undefined)
                return input + '%';
            };
        }])
        .controller('pedidosController',function($scope,$http, $filter){ //controlador pedidos
            $scope.date = new Date();
            $scope.date = $filter('date')(Date.now(),'dd/MM/yyyy');

            $scope.pedidos = [];
            $scope.pedidoTemporal = {};
            $scope.productoTemporal = {};
            $scope.pedidoTemporal.Productos = [];
            $scope.produ_ma = {};
            $scope.produ_frac = {};
            $scope.mostrarC = false;
            $scope.mostrarP = false;
            $scope.pedidoTemporal.id_Moneda = "1";
            $scope.pedidoTemporal.Valor_Moneda = 1;
            $scope.clienteBuscado = "";
            $scope.pedidoTemporal.Generado_Por = $scope.Generado_Por = "pedido";
            $scope.config = {headers : {'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'}};


            //// Para ordenar por nro pedido, fecha o cliente /////
            $scope.sort = function(keyname){
                $scope.sortKey = keyname;
                $scope.reverse = !$scope.reverse;
            };

            ///////////
            // PAGINACION --- es para que puedan seleccionar q cantidad x pag///////////
            $scope.numXpag = 5; //(default)

            $scope.consultaPedidos = function(codVend){
                //console.log(codVend);
                $http.get(apiURL+"?a=get&t=ped&codVend="+codVend)
                    .then(function(resp){
                        $scope.pedidos = resp.data;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });
            };


            /////////
            // PEDIDO
            $scope.selectPedido = function (ped) {
                $scope.pedidoTemporal = ped;                
                if(ped.Estado != "BAJ")
                {
                    $scope.index = $scope.pedidos.indexOf(ped);

                    if($scope.pedidoTemporal.Generado_Por == 0)
                    {
                        if($scope.pedidoTemporal.Id_Reparto == 45)
                        {
                            $radioFR.prop('checked',true);
                            $scope.pedidoTemporal.Generado_Por = "fr";
                        }
                        else if($scope.pedidoTemporal.Id_Reparto == 227)
                        {
                            $radioSF.prop('checked',true);
                            $scope.pedidoTemporal.Generado_Por = "sf";
                        }
                        else
                        {
                            $radioPed.prop('checked',true);
                            $scope.pedidoTemporal.Generado_Por = "pedido";
                        }
                    }
                    else if($scope.pedidoTemporal.Generado_Por == 1)
                    {
                        $radioCoti.prop('checked',true);
                        $scope.pedidoTemporal.Generado_Por = "cotizacion";
                    }
                    else if($scope.pedidoTemporal.Generado_Por == 3)
                    {
                        $scope.pedidoTemporal.Generado_Por = "presupuesto";
                        $radioPresu.prop('checked',true);
                    }
                    else if($scope.pedidoTemporal.Generado_Por == 2)
                    {
                        $scope.pedidoTemporal.Generado_Por = "mostrador";
                        $radioMostro.prop('checked',true);
                    }
                    $scope.Generado_Por = $scope.pedidoTemporal.Generado_Por;


                    //Traigo el detalle del pedido
                    //Tambien traigo el cliente

                    $http.get(apiURL+"?a=get&t=pedide&n="+ped.Nro_Pedido)
                        .then(function(resp){
                            $scope.pedidoTemporal.Productos = resp.data; ///////PEDID_DE
                            $http.get(apiURL+"?a=get&t=cli&idCli="+ped.id_Cliente)
                                .then(function(resp){
                                    $scope.pedidoTemporal.Cliente = resp.data; ////////CLIEN_MA
                                    $scope.calculaTotal();
                                })
                                .catch(function(resp){
                                    console.log(resp);
                                });
                        })
                        .catch(function(resp){
                            console.log(resp);
                        });
                        
                    //Capturo el indice del array pedidos que seleccione
                    $scope.index = $scope.pedidos.indexOf(ped);

                    formUp.slideDown();
                }


            };
            $scope.listadoPedido = function(){

                $http.get(apiURL+"?a=get&t=ped&codVend="+codVend+"desde="+$scope.fechaDesde+"hasta="+$scope.fechaHasta)
                    .then(function(resp){
                        $scope.pedidos = resp.data;
                    })
                    .catch(function(resp){
                        console.log(resp);
                    });

            };
            $scope.altaPedido = function(){
                if($scope.pedidoTemporal != undefined && $scope.pedidoTemporal != null)
                {
                    if($scope.pedidoTemporal.Cliente != undefined && $scope.pedidoTemporal.Cliente != null)
                    {
                        if($scope.pedidoTemporal.Productos.length > 0)
                        {
                            if($scope.pedidoTemporal.Nro_Pedido == 0 || $scope.pedidoTemporal.Nro_Pedido == undefined)
                            {
                                $scope.pedidoTemporal.Id_Tomado_Por =0;
                                $scope.pedidoTemporal.id_Usuario = 0;

                                $scope.pedidoTemporal.Fecha_Operacion = $scope.pedidoTemporal.Fecha_Pedido = fechaHoy;
                                $scope.pedidoTemporal.Nro_Cotizacion = 0;
                                $scope.pedidoTemporal.Nro_Presupuesto = 0;
                                $scope.pedidoTemporal.Nro_Pedido = 0;
                                $scope.pedidoTemporal.Id_Grupo_Cliente = 0;
                                $scope.pedidoTemporal.Codigo_Vendedor = CodVendedor;
                                $scope.pedidoTemporal.Id_Moneda = $scope.pedidoTemporal.id_Moneda;
                                $scope.pedidoTemporal.Cotizacion_Moneda = $scope.pedidoTemporal.Valor_Moneda;
                                $scope.pedidoTemporal.Estado = 'CAR';
                                $scope.pedidoTemporal.Nro_Orden_Compra = 0;
                                $scope.pedidoTemporal.Id_Condicion = $scope.pedidoTemporal.Cliente.Id_Condicion_Vta;
                                $scope.pedidoTemporal.Id_Lista = $scope.pedidoTemporal.Cliente.Id_Lista_Precio;
                                $scope.pedidoTemporal.Id_Reparto = $scope.pedidoTemporal.Cliente.Id_Reparto;
                                if(!$scope.pedidoTemporal.Id_Transporte)
                                    $scope.pedidoTemporal.Id_Transporte = $scope.pedidoTemporal.Cliente.Id_Transporte;

                                $scope.verificaGenerado();

                                var pedido = $.param({
                                    'pedido':$scope.pedidoTemporal
                                });

                                $http.post("sendData.php",pedido)
                                    .then(function(response){
                                        if(response.data.ok)
                                        {
                                            //$scope.agregarPedidoGrilla('alta',response.data.pedido);
                                            $scope.consultaPedidos(CodVendedor);
                                            $exito.html("<p>Exito!! Se dio de alta el pedido " + response.data.nroPedido + " </p>");
                                            $exito.fadeIn();
                                            $exito.fadeOut(5000);
                                            formUp.slideToggle();
                                        }
                                        else
                                        {
                                            formUp.slideToggle();
                                            $error.fadeIn();
                                            $error.fadeOut(5000);
                                        }

                                    })
                                    .catch(function(response){
                                        console.log(response);
                                    });

                                $scope.pedidoTemporal = {};

                            }
                        }
                    }
                }
            };
            $scope.verificaGenerado = function(){
                switch ($scope.pedidoTemporal.Generado_Por)
                {
                    case 'pedido':
                        $scope.pedidoTemporal.Generado_Por = 0;
                        break;
                    case 'cotizacion':
                        $scope.pedidoTemporal.Generado_Por = 1;
                        break;
                    case 'presupuesto':
                        $scope.pedidoTemporal.Generado_Por = 3;
                        break;
                    case 'mostrador':
                        $scope.pedidoTemporal.Generado_Por = 2;
                        break;
                    case 'fr':
                        $scope.pedidoTemporal.Generado_Por = 0;
                        $scope.pedidoTemporal.Id_Reparto = 45;
                        break;
                    case 'sf':
                        $scope.pedidoTemporal.Generado_Por = 0;
                        $scope.pedidoTemporal.Id_Reparto = 227;
                        break;
                }
            };
            
            $scope.agregarPedidoGrilla = function(accion,pedido){
                if(accion === 'alta')
                {
                    $scope.pedidos.unshift({
                        Codigo_Cliente:pedido.Cliente.Codigo_Cliente,
                        Nombre_Fantasia:pedido.Cliente.Nombre_Fantasia,
                        Codigo_Vendedor:pedido.Codigo_Vendedor,
                        Cotizacion_Moneda:pedido.Cotizacion_Moneda,
                        Descuento:pedido.Descuento,
                        Estado:pedido.Estado,
                        Fecha_Operacion:pedido.Fecha_Operacion,
                        Fecha_Pedido:pedido.Fecha_Pedido,
                        Generado_Por:pedido.Generado_Por,
                        Id_Condicion:pedido.Id_Condicion,
                        Id_Grupo_Cliente:pedido.Id_Grupo_Cliente,
                        Id_Lista:pedido.Id_Lista,
                        Id_Reparto:pedido.Id_Reparto,
                        Id_Tomado_Por:pedido.Id_Tomado_Por,
                        Id_Transporte:pedido.Id_Transporte,
                        IngBr_Cba:pedido.IngBr_Cba,
                        IngBr_Mis:pedido.IngBr_Mis,
                        IngBr_Pba:pedido.IngBr_Pba,
                        Iva:pedido.Iva,
                        Iva_Ins:pedido.Iva_Ins,
                        Iva_NoIns:pedido.Iva_NoIns,
                        Nro_Cotizacion:pedido.Nro_Cotizacion,
                        Nro_Orden_Compra:pedido.Nro_Orden_Compra,
                        Nro_Pedido:pedido.Nro_Pedido,
                        Nro_Presupuesto:pedido.Nro_Presupuesto,
                        Porc_IngBr_Cba:pedido.Porc_IngBr_Cba,
                        Porc_IngBr_Mis:pedido.Porc_IngBr_Mis,
                        Porc_Iva:pedido.Porc_Iva,
                        Porc_Iva_Ins:pedido.Porc_Iva_Ins,
                        Porc_Iva_NoIns:pedido.Porc_Iva_NoIns,
                        Total_Exento:pedido.Total_Exento,
                        Total_Gravado:pedido.Total_Gravado,
                        Total_Neto:pedido.Total_Neto,
                        Total_Producto_Ex:pedido.Total_Producto_Ex,
                        id_Cliente:pedido.Cliente.id,
                        id_Moneda:pedido.id_Moneda,
                        id_Usuario:pedido.id_Usuario
                    });
                }
                else
                {
                    $scope.pedidos[$scope.index].Codigo_Cliente=pedido.Cliente.Codigo_Cliente;
                    $scope.pedidos[$scope.index].Nombre_Fantasia=pedido.Cliente.Nombre_Fantasia;
                    $scope.pedidos[$scope.index].Codigo_Vendedor=pedido.Codigo_Vendedor;
                    $scope.pedidos[$scope.index].Cotizacion_Moneda=pedido.Cotizacion_Moneda;
                    $scope.pedidos[$scope.index].Descuento=pedido.Descuento;
                    $scope.pedidos[$scope.index].Estado=pedido.Estado;
                    $scope.pedidos[$scope.index].Fecha_Operacion=pedido.Fecha_Operacion;
                    $scope.pedidos[$scope.index].Fecha_Pedido=pedido.Fecha_Pedido;
                    $scope.pedidos[$scope.index].Generado_Por=pedido.Generado_Por;
                    $scope.pedidos[$scope.index].Id_Condicion=pedido.Id_Condicion;
                    $scope.pedidos[$scope.index].Id_Grupo_Cliente=pedido.Id_Grupo_Cliente;
                    $scope.pedidos[$scope.index].Id_Lista=pedido.Id_Lista;
                    $scope.pedidos[$scope.index].Id_Reparto=pedido.Id_Reparto;
                    $scope.pedidos[$scope.index].Id_Tomado_Por=pedido.Id_Tomado_Por;
                    $scope.pedidos[$scope.index].Id_Transporte=pedido.Id_Transporte;
                    $scope.pedidos[$scope.index].IngBr_Cba=pedido.IngBr_Cba;
                    $scope.pedidos[$scope.index].IngBr_Mis=pedido.IngBr_Mis;
                    $scope.pedidos[$scope.index].IngBr_Pba=pedido.IngBr_Pba;
                    $scope.pedidos[$scope.index].Iva=pedido.Iva;
                    $scope.pedidos[$scope.index].Iva_Ins=pedido.Iva_Ins;
                    $scope.pedidos[$scope.index].Iva_NoIns=pedido.Iva_NoIns;
                    $scope.pedidos[$scope.index].Nro_Cotizacion=pedido.Nro_Cotizacion;
                    $scope.pedidos[$scope.index].Nro_Orden_Compra=pedido.Nro_Orden_Compra;
                    $scope.pedidos[$scope.index].Nro_Pedido=pedido.Nro_Pedido;
                    $scope.pedidos[$scope.index].Nro_Presupuesto=pedido.Nro_Presupuesto;
                    $scope.pedidos[$scope.index].Porc_IngBr_Cba=pedido.Porc_IngBr_Cba;
                    $scope.pedidos[$scope.index].Porc_IngBr_Mis=pedido.Porc_IngBr_Mis;
                    $scope.pedidos[$scope.index].Porc_Iva=pedido.Porc_Iva;
                    $scope.pedidos[$scope.index].Porc_Iva_Ins=pedido.Porc_Iva_Ins;
                    $scope.pedidos[$scope.index].Porc_Iva_NoIns=pedido.Porc_Iva_NoIns;
                    $scope.pedidos[$scope.index].Total_Exento=pedido.Total_Exento;
                    $scope.pedidos[$scope.index].Total_Gravado=pedido.Total_Gravado;
                    $scope.pedidos[$scope.index].Total_Neto=pedido.Total_Neto;
                    $scope.pedidos[$scope.index].Total_Producto_Ex=pedido.Total_Producto_Ex;
                    $scope.pedidos[$scope.index].id_Cliente=pedido.Cliente.id;
                    $scope.pedidos[$scope.index].id_Moneda=pedido.id_Moneda;
                    $scope.pedidos[$scope.index].id_Usuario=pedido.id_Usuario
                }

            };
            
            $scope.modificarPedido = function(){
                if($scope.pedidoTemporal != undefined && $scope.pedidoTemporal != null)
                {
                    if($scope.pedidoTemporal.Cliente != undefined && $scope.pedidoTemporal.Cliente != null)
                    {
                        if($scope.pedidoTemporal.Productos.length > 0)
                        {
                            console.log($scope.pedidoTemporal);
                            $scope.verificaGenerado();
                            var pedido = $.param({
                                'pedido':$scope.pedidoTemporal
                            });
                            $http.post("sendData.php",pedido)
                                .then(function(response) {
                                    if(response.data.ok)
                                    {                                       
                                        $scope.agregarPedidoGrilla('modifica',response.data.pedido);
                                        formUp.slideToggle();
                                        $exito.html("<p>Exito!! Se ha modificado el pedido " + response.data.pedido.Nro_Pedido + " </p>");
                                        $exito.fadeIn();
                                        $exito.fadeOut(5000);
                                    }
                                    else
                                    {
                                        formUp.slideToggle();
                                        $error.fadeIn();
                                        $error.fadeOut(5000);
                                    }
                                    $scope.pedidoTemporal.id_Moneda = "1";
                                    $scope.pedidoTemporal.Valor_Moneda = "1";
                                })
                                .catch(function(response){
                                    console.log(response);
                                });
                                
                            $scope.pedidoTemporal = {};
                                        
                        }
                    }
                }
            };
            
            $scope.bajaPedido = function(){
              $scope.pedidoTemporal.Estado = "BAJ";
              $scope.modificarPedido();
            };

            //////////
            // PRODUCTO
            
            buscarProducto.autocomplete({
                source: apiURL+"?producto",
                select: function(event,ui){
                      var codProducto = [];
                      codProducto = ui.item.value.split('-');
                      //angular.element($('#vistaPedidos')).scope().seleccionProducto(codProducto[0]);
                      $scope.seleccionProducto(codProducto[0]);
                   }
            });
     
            $scope.selectProducto = function(prod){
                $scope.index = $scope.pedidoTemporal.Productos.indexOf(prod);
                $scope.productoTemporal = prod;
            };
            
            $scope.seleccionProducto = function(prod){

                if($scope.pedidoTemporal.Cliente !== undefined)
                {
                    divMjeProd.hide();
                    if(prod !== null)
                    {
                        $http.get(apiURL+"?a=get&t=prodma&cod="+prod)
                            .then(function(resp){
                                $scope.poneColorRubro(resp.data.Rubro_Color);
                                $scope.productoTemporal = resp.data;
                                //Convierto a float
                                $scope.productoTemporal.Precio_Moneda = parseFloat($scope.productoTemporal.Precio_Moneda).toFixed(2);
                                $scope.productoTemporal.Precio_Lista = parseFloat($scope.productoTemporal.Precio_Lista).toFixed(2);
                                $scope.productoTemporal.Precio_Pesos = parseFloat($scope.productoTemporal.Precio_Pesos).toFixed(2);
                                $scope.productoTemporal.Precio_Moneda = parseFloat($scope.productoTemporal.Precio_Moneda).toFixed(2);

                                //Calculo precio_lista
                                if($scope.productoTemporal.Precio_Moneda <= 0 && $scope.pedidoTemporal.id_Moneda == 1)
                                    $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Pesos;
                                else if($scope.productoTemporal.Precio_Moneda <= 0 && $scope.pedidoTemporal.id_Moneda == 2)
                                    $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Pesos * $scope.pedidoTemporal.Valor_Moneda;
                                else if($scope.productoTemporal.Precio_Moneda > 0 && ($scope.pedidoTemporal.id_Moneda == 2 && $scope.productoTemporal.id_Moneda == 2))
                                    $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Moneda;
                                else if($scope.productoTemporal.Precio_Moneda > 0 && $scope.pedidoTemporal.id_Moneda == 2)
                                {
                                    var precio = $scope.productoTemporal.Precio_Moneda / $scope.productoTemporal.Valor_Moneda;
                                    $scope.productoTemporal.Precio_Lista = precio * $scope.pedidoTemporal.Valor_Moneda;
                                }
                                else if($scope.productoTemporal.Precio_Moneda > 0 && $scope.pedidoTemporal.id_Moneda == 1)
                                    $scope.productoTemporal.Precio_Lista = $scope.productoTemporal.Precio_Moneda / $scope.productoTemporal.Valor_Moneda;

                                //Calculo precio venta
                                
                                //var Precio_Lista = parseFloat($scope.productoTemporal.Precio_Lista)
                                //var Precio_Lista2 = parseFloat((parseFloat($scope.productoTemporal.Precio_Lista) * parseFloat(($scope.pedidoTemporal.Cliente.Porcentaje_Iva) /100)))
                                if($scope.productoTemporal.Tipo_Iva != "E")
                                    $scope.productoTemporal.Precio = parseFloat($scope.productoTemporal.Precio_Lista) +  parseFloat((parseFloat($scope.productoTemporal.Precio_Lista) * parseFloat(($scope.pedidoTemporal.Cliente.Porcentaje_Iva) /100)));
                                else
                                    $scope.productoTemporal.Precio = $scope.productoTemporal.Precio_Lista;


                                $scope.productoTemporal.Precio = parseFloat($scope.productoTemporal.Precio).toFixed(2);

                                buscarProducto.val('');
                                inputCantidad.focus();
                            })
                            .catch(function(){
                                console.log("ERROR BUSQUEDA PRODUCTO POR CODIGO");
                            });
                    }
                }
                else
                {
                    buscarProducto.val('');
                    divMjeProd.show();
                    
                    //divMjeProd.text = "Debe seleccionar el cliente";
                    divMjeProd.append("Debe seleccionar el cliente");
                    divMjeProd.fadeIn(5);
                    divMjeProd.fadeOut(6000);

                }

            };
            $scope.borraProductoGrilla = function(prodTemporal){

                $scope.index = $scope.pedidoTemporal.Productos.indexOf(prodTemporal);

                if($scope.index >= 0){                                        
                    $scope.pedidoTemporal.Productos.splice($scope.index,1);
                    $scope.productoTemporal = null;
                    angular.forEach($scope.pedidoTemporal.Productos,function(v,k){
                        if(v.Renglon > $scope.index + 1 )
                            v.Renglon -= 1;
                    });
                    $scope.calculaTotal();
                }                
                else
                {
                    $scope.productoTemporal = null;
                    buscarProducto.val('');
                    pedidoForm.buscarProducto.focus();
                }
            };
            
            $scope.agregarProductoGrilla = function(event){
                if(event.which === 13 )                
                {
                    $scope.msjProducto = "";
                    if($scope.productoTemporal.Cantidad > 0 && productoSeleccion != "")
                    {
                        if($scope.productoTemporal.Estado_PF !== "BAJ"){

                        
                            if(parseFloat($scope.productoTemporal.Minimo) > 0 && parseFloat($scope.productoTemporal.Cantidad) >= parseFloat($scope.productoTemporal.Minimo))
                            {
                                var resto = parseFloat($scope.productoTemporal.Cantidad) % parseFloat($scope.productoTemporal.Minimo);//(parseFloat($scope.productoTemporal.Cantidad)/parseFloat($scope.productoTemporal.Minimo))*parseFloat($scope.productoTemporal.Minimo);

                                if(resto !== 0)//(parseFloat($scope.productoTemporal.Cantidad) !== resto)
                                {
                                    $scope.muestraMsjProducto = true;
                                    $scope.msjProducto = "La cantidad debe ser multiplo de: " + $scope.productoTemporal.Minimo;
                                    $scope.productoTemporal.Cantidad = "";
                                    return;
                                }
                                else
                                {


                                    var encontrarProducto = false;

                                    if($scope.pedidoTemporal.Productos !== undefined && $scope.pedidoTemporal.Productos.length > 0)
                                    {
                                        encontrarProducto = $filter('filter')($scope.pedidoTemporal.Productos,{Id_Producto:$scope.productoTemporal.Id_Producto,Id_Fraccio:$scope.productoTemporal.Id_Fraccio})[0];
                                    }

                                    //Chequear si esta en FALTA

                                    $http.get(apiURL+"?a=get&t=falta&idPro="+$scope.productoTemporal.Id_Producto+"idFrac="+$scope.productoTemporal.Id_Fraccio)
                                        .then(function(resp){
                                            if(resp.data.falta)
                                                $scope.productoTemporal.Precio = 0;
                                        })
                                        .catch(function(){
                                            console.log("ERROR");
                                        });

                                    if($scope.pedidoTemporal.Generado_Por == "cotizacion")
                                    {
                                        if($scope.productoTemporal.Habil_Cot == "0")
                                        {
                                            $scope.muestraMsjProducto = true;
                                            $scope.msjProducto = "No puede agregar el producto para cotizaciones";
                                            $scope.productoTemporal = {};
                                        }
                                    }
                                    else if($scope.pedidoTemporal.Generado_Por == "presupuesto")
                                    {
                                        if($scope.productoTemporal.Habil_Pre == "0")
                                        {
                                            $scope.muestraMsjProducto = true;
                                            $scope.msjProducto = "No puede agregar el producto para presupuestos";
                                            $scope.productoTemporal = {};
                                        }
                                    }
                                    else if($scope.pedidoTemporal.Generado_Por == "pedido" || $scope.pedidoTemporal.Generado_Por == "sf" || $scope.pedidoTemporal.Generado_Por == "fr")
                                    {
                                        if($scope.productoTemporal.Habil_Ped == "0")
                                        {
                                            $scope.muestraMsjProducto = true;
                                            $scope.msjProducto = "No puede agregar el producto para pedidos";
                                            $scope.productoTemporal = {};
                                        }
                                    }
                                    
                                    if($scope.pedidoTemporal.Productos !== undefined && $scope.pedidoTemporal.Productos.length > 0)
                                    {                                        
                                        if(encontrarProducto)
                                            $scope.productoTemporal.Renglon = encontrarProducto.Renglon;
                                        else
                                            $scope.productoTemporal.Renglon = $scope.pedidoTemporal.Productos.length + 1;
                                    }
                                    else
                                    {
                                        $scope.productoTemporal.Renglon = 1;
                                    }

//                                    if($scope.pedidoTemporal.Productos.length <= 0)
//                                        $scope.productoTemporal.Renglon = 1;
//                                    else
//                                        $scope.productoTemporal.Renglon = $scope.pedidoTemporal.Productos.length + 1;

                                    if($scope.productoTemporal != null)
                                    {

                                        if(encontrarProducto)
                                        {
                                            $scope.pedidoTemporal.Productos.indexOf(encontrarProducto).cantidad = $scope.productoTemporal.Cantidad;
                                        }
                                        else
                                        {
                                            if($scope.productoTemporal.Precio == 0)
                                                $scope.productoTemporal.Estado = "FAL";
                                            else
                                                $scope.productoTemporal.Estado = "CAR";


                                            //Fecha cotizacion
                                            //Precio Lista en el caso que sea codigo oferta 7

                                            $scope.productoTemporal.Nro_Despacho = "";
                                            $scope.productoTemporal.Nro_Lote = "";
                                            $scope.productoTemporal.Nro_Cotizacion = 0;
                                            $scope.productoTemporal.Fecha_Cotizacion = "";
                                            $scope.productoTemporal.Id_Origen = 0;
                                            $scope.productoTemporal.Nro_Pedido = $scope.pedidoTemporal.Nro_Pedido;

                                            $scope.productoTemporal.Total = parseFloat($scope.productoTemporal.Cantidad,3) * parseFloat($scope.productoTemporal.Precio,3);
                                            $scope.pedidoTemporal.Productos.push($scope.productoTemporal);
                                        }

                                    }

                                    $scope.calculaTotal();
                                }

                            }
                            else
                            {
                                divMjeProd.html("");
                                divMjeProd.append("Cantidad inferior al mínimo permitido");                                
                                divMjeProd.fadeIn(5);
                                divMjeProd.fadeOut(6000);
                                cantProd.focus();
                                return;
                            }

                        }
                        else
                        {
                            divMjeProd.html("");
                            divMjeProd.append("Producto dado de baja");
                            //divMjeProd.hide();                        
                            divMjeProd.fadeIn(5);
                            divMjeProd.fadeOut(6000);
                        }
                        
                        $scope.productoTemporal = {};
                        buscarProducto.val('');
                        buscarProducto.focus();
                    }
                    else
                    {
                        //divMjeProd.text = "";
                        //divMjeProd.show();
                        divMjeProd.html("");
                        divMjeProd.append("Debe ingresar una cantidad mayor a cero");
                        //divMjeProd.hide();                        
                        divMjeProd.fadeIn(5);
                        divMjeProd.fadeOut(6000);
                        cantProd.focus();
                    }
                }
            };
            $scope.calculaTotal = function(){
                $scope.pedidoTemporal.Total_Gravado = 0;

                angular.forEach($scope.pedidoTemporal.Productos,function(v,k){
                    $scope.pedidoTemporal.Total_Gravado += parseFloat(v.Total,3);                    
                });
                
                $scope.Iva_IngBr = null;//$scope.calculaIngBrutos($scope.pedidoTemporal.Cliente,$scope.pedidoTemporal.Productos);
                
                //--------------------------------------------------------------------------------------
                //--------------------------------------------------------------------------------------
                //Esto se agrego hasta ver lo de calcula Ingreso Brutos
                $scope.pedidoTemporal.Porc_Iva_Ins = $scope.pedidoTemporal.Cliente.Porcentaje_Iva;   
                $scope.pedidoTemporal.Iva_Ins = ($scope.pedidoTemporal.Total_Gravado) * $scope.pedidoTemporal.Cliente.Porcentaje_Iva / 100;
                
                $scope.pedidoTemporal.Total_Exento =  0;
                $scope.pedidoTemporal.IngBr_Cba = 0;
                $scope.pedidoTemporal.Porc_IngBr_Cba = 0;
                $scope.pedidoTemporal.IngBr_Pba = 0;
                $scope.pedidoTemporal.Porc_IngBr_Pba = 0;
                $scope.pedidoTemporal.Porc_IngBr_Mis = 0;
                $scope.pedidoTemporal.IngBr_Mis = 0;
                
                $scope.pedidoTemporal.PorcDcto =  0;
                $scope.pedidoTemporal.Descuento = 0;                
                $scope.pedidoTemporal.Total_Producto_Ex = 0;
                                
                $scope.pedidoTemporal.Porc_Iva_NoIns = 0;
                $scope.pedidoTemporal.Iva_NoIns = 0;
                
                $scope.pedidoTemporal.Porc_Iva = $scope.pedidoTemporal.Cliente.Porcentaje_Iva;
                $scope.pedidoTemporal.Iva = $scope.pedidoTemporal.Iva_Ins;
                $scope.pedidoTemporal.SubTotal = $scope.pedidoTemporal.Total_Gravado + $scope.pedidoTemporal.Iva_Ins;
                $scope.pedidoTemporal.Total_Neto = $scope.pedidoTemporal.Total_Gravado + $scope.pedidoTemporal.Iva_Ins;
                //-------------------------------------------------------------------------------------
                //-------------------------------------------------------------------------------------
                
                
                if($scope.Iva_IngBr != null)
                {
                    $scope.pedidoTemporal.Total_Gravado = $filter('number')($scope.Iva_IngBr.Bruto,2);
                    
                    if(parseFloat($scope.Iva_IngBr.Iva_Ins,3) > 0)
                    {
                        $scope.pedidoTemporal.Porc_Iva = $scope.Iva_IngBr.Porc_Iva_Ins;
                        $scope.pedidoTemporal.Iva = $scope.Iva_IngBr.Iva_Ins;
                    }
                    else
                    {
                        $scope.pedidoTemporal.Porc_Iva = $scope.Iva_IngBr.Porc_Iva_NoIns;
                        $scope.pedidoTemporal.Iva = $scope.Iva_IngBr.Iva_NoIns;
                    }


                    $scope.pedidoTemporal.Total_Exento =  $scope.Iva_IngBr.Total_Prod_Exento;
                    $scope.pedidoTemporal.IngBr_Cba = $scope.Iva_IngBr.IngBr_Cba;
                    $scope.pedidoTemporal.Porc_IngBr_Cba = $scope.Iva_IngBr.Porc_IngBr_Cba;
                    $scope.pedidoTemporal.IngBr_Pba = $scope.Iva_IngBr.IngBr_Pba0 + $scope.Iva_IngBr.IngBr_Pba1;
                    $scope.pedidoTemporal.Porc_IngBr_Pba = 0;
                    $scope.pedidoTemporal.Porc_IngBr_Mis = $scope.Iva_IngBr.Porc_IngBr_Mis;
                    $scope.pedidoTemporal.IngBr_Mis = $scope.Iva_IngBr.IngBr_Mis;
                    $scope.pedidoTemporal.SubTotal = $scope.Iva_IngBr.SubTotal;
                    $scope.pedidoTemporal.PorcDcto =  $scope.Iva_IngBr.PorcDcto;
                    $scope.pedidoTemporal.Descuento = $scope.Iva_IngBr.Descuento;
                    $scope.pedidoTemporal.Total_Neto = $scope.Iva_IngBr.Total_Neto;
                    $scope.pedidoTemporal.Total_Producto_Ex = $scope.Iva_IngBr.Total_Prod_Exento;
                    $scope.pedidoTemporal.Porc_Iva_Ins = $scope.Iva_IngBr.Porc_Iva_Ins;
                    $scope.pedidoTemporal.Iva_Ins = $scope.pedidoTemporal.Iva;
                    $scope.pedidoTemporal.Porc_Iva_NoIns = $scope.Iva_IngBr.Porc_Iva_NoIns;
                    $scope.pedidoTemporal.Iva_NoIns = $scope.Iva_IngBr.Iva_NoIns;

                }
                
                
                $scope.formatoPorcentaje();


            };
            
            $scope.formatoPorcentaje = function(){
                $scope.pedidoTemporal.Porc_IngBr_Cba = parseFloat($scope.pedidoTemporal.Porc_IngBr_Cba,2).toFixed(2);
                $scope.pedidoTemporal.Porc_IngBr_Mis = parseFloat($scope.pedidoTemporal.Porc_IngBr_Mis,2).toFixed(2);
            };
            
            $scope.calculaIngBrutos = function(cliente,productos){

                var Porc_Max_CBA = 6;
                var Porc_Max_PBA = 5;
                var PF_Pcia_Tipo_0_RI = 2.5;
                var PF_Pcia_Tipo_0_MT = 3;
                var Porc_CBA = 3.5;
                var Porc_Mis = 3.31;

                var Total_Prod_Ex = 0;
                var Total_Exento = 0;
                var sLetra = "";
                var Tot_Gravado_B = 0;
                var Total_Prod_0 = 0;
                var Total_Prod_1 = 0;
                var Total_Bruto = 0;
                var Iva_B = 0;
                var Iva = 0;
                var Total_Gravado = 0;


                if(productos.length > 0){
                    //IVA y CM
                    //.....


                    //IVA
                    //......
                        
                    angular.forEach(productos,function(v,k){
                        if(v.Tipo_Iva == "G") //PRODUCTO GRAVADO
                        {
                            
                            var Precio_SINiva = v.Precio;
                            switch (cliente.Tipo_Iva){
                                case 'RI':
                                case 'NI':
                                    Total_Gravado += v.Cantidad * v.Precio;

                                    Iva += (v.Cantidad * v.Precio ) * cliente.Porcentaje_Iva / 100;
                                    sLetra="B";
                                    break;
                                case 'NC':
                                    v.Precio += parseFloat((v.Precio * cliente.Porcentaje_Iva / 100),2);
                                    Total_Exento += v.Cantidad * v.Precio;
                                    Iva += parseFloat(((v.Cantidad * v.Precio) * cliente.Porcentaje_Iva_2 /100),2);
                                    Tot_Gravado_B += v.Cantidad * Precio_SINiva;
                                    Iva_B += ((v.Cantidad * Precio_SINiva) * cliente.Porcentaje_Iva / 100);
                                    sLetra = "B";
                                    break;
                                case 'CF':
                                case 'EX':
                                case 'MT':
                                    v.Precio = parseFloat((v.Precio * cliente.Porcentaje_Iva / 100),2);
                                    Total_Exento += v.Cantidad * v.Precio;
                                    Tot_Gravado_B += v.Cantidad * Precio_SINiva;
                                    Iva_B += ((v.Cantidad * Precio_SINiva) * cliente.Porcentaje_Iva / 100);
                                    sLetra = "B";
                                    break;
                                case 'FE':
                                    Total_Prod_Ex += v.Cantidad * v.Precio;
                                    sLetra = 'E';
                                    break;
                            }
                        }
                        else
                            Total_Prod_Ex += v.Cantidad * v.Precio;


                        if(v.Tipo_Ing_Br == 0)
                            Total_Prod_0 += v.Cantidad * v.Precio;
                        else
                            Total_Prod_1 += v.Cantidad * v.Precio;

                        Total_Bruto = Total_Prod_0 + Total_Prod_1;

                    });

                    var Iva_IngBr = {};
                    Iva_IngBr.Total_Gravado = parseFloat(Total_Gravado,3).toFixed(2);

                    Iva_IngBr.Total_Exento = (Tot_Gravado_B + Iva_B).toFixed();
                    Iva_IngBr.Total_Prod_Exento = Total_Prod_Ex.toFixed(2);
                    Iva_IngBr.Porc_Iva_Ins = parseFloat(cliente.Porcentaje_Iva,2).toFixed(2);
                    Iva_IngBr.Porc_Iva_NoIns = parseFloat(cliente.Porcentaje_Iva_2,2).toFixed(2);
                    Iva_IngBr.Iva_Ins = Iva.toFixed(2);
                    Iva_IngBr.IngBr_Cba = 0;
                    Iva_IngBr.IngBr_Mis = 0;
                    Iva_IngBr.IngBr_Pba0 = 0;
                    Iva_IngBr.IngBr_Pba1 = 0;
                    Iva_IngBr.Iva_NoIns = 0;
                    Iva_IngBr.PorcDcto = 0;
                    Iva_IngBr.Descuento = 0;
                    Iva_IngBr.SubTotal = 0;
                    Iva_IngBr.Porc_IngBr_Cba = 0;
                    Iva_IngBr.Impuestos = 0;




                    var Total_Pedido = 0;

                    if(sLetra == "A")
                        Total_Pedido = Total_Gravado + (Total_Exento / (1 + cliente.Porcentaje_Iva / 100)) + Total_Prod_Ex;
                    else
                        Total_Pedido = Total_Gravado + Total_Exento + Total_Prod_Ex;


                    //CALCULO DE IIBB
                    //......

                    if(productos[0].Id_Producto != 4 && productos[0].Id_Producto != 3880)
                    {
                        if(cliente.Convenio)
                        {
                            if(cliente.Padron_Reg_Gral != null && cliente.Padron_Reg_Gral > 0)
                            {
                                Iva_IngBr.Porc_IngBr_Cba = cliente.Alicuota_Percepcion;
                                Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;

                            }
                            else
                            {
                                Iva_IngBr.Porc_IngBr_Cba = Porc_Max_CBA;
                                Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;

                            }

                            if(cliente.CM_J902)
                            {
                                if(cliente.CM_J902 >= 0.1)
                                {
                                    switch (cliente.Tipo_Iva)
                                    {
                                        case 'RI':
                                            PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_RI;
                                            break;
                                        case 'NI':
                                        case 'NC':
                                        case 'EX':
                                        case 'MT':
                                            PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                            break;
                                        default:
                                            PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                            break;
                                    }

                                    Iva_IngBr.Porc_IngBr_Pba0 = PF_Pcia_Tipo_0;
                                    Iva_IngBr.Porc_IngBr_Pba1 = cliente.Porcentaje_Pcia;
                                    Iva_IngBr.IngBr_Pba0 = Total_Prod_0 * PF_Pcia_Tipo_0 / 100;
                                    Iva_IngBr.IngBr_Pba1 = Total_Prod_1 * cliente.Porcentaje_Pcia / 100;
                                    Iva_IngBr.Base_Pba0 = Total_Prod_0;
                                    Iva_IngBr.Base_Pba1 = Total_Prod_1;
                                }else
                                {
                                    Iva_IngBr.Porc_IngBr_Pba0 = 0;
                                    Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                    Iva_IngBr.IngBr_Pba0 = 0;
                                    Iva_IngBr.IngBr_Pba1 = 0;
                                    Iva_IngBr.Base_Pba0 = 0;
                                    Iva_IngBr.Base_Pba1 = 0;
                                }
                            }
                            else
                            {
                                Iva_IngBr.Porc_IngBr_Pba0 = Porc_Max_PBA;
                                Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                Iva_IngBr.IngBr_Pba0 = Total_Bruto * Iva_IngBr.Porc_IngBr_Pba0 / 100;
                                Iva_IngBr.IngBr_Pba1 = 0;
                                Iva_IngBr.Base_Pba0 = Total_Bruto;
                                Iva_IngBr.Base_Pba1 = 0;
                            }
                        }
                        else
                        {
                            if(cliente.Id_Provincia_CatIngBr == 2)
                            {
                                if(cliente.Id_Cat_Ing_Br == 8)
                                {
                                    Iva_IngBr.Porc_IngBr_Cba = 0;
                                    Iva_IngBr.IngBr_Cba = 0;
                                }
                                else
                                {
                                    if(cliente.Padron_Reg_Gral)
                                    {
                                        Iva_IngBr.Porc_IngBr_Cba = cliente.Alicuota_Percepcion;
                                        Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;
                                    }
                                    else
                                    {
                                        Iva_IngBr.Porc_IngBr_Cba = Porc_Max_CBA;
                                        Iva_IngBr.IngBr_Cba = Total_Bruto * Iva_IngBr.Porc_IngBr_Cba / 100;
                                    }
                                }
                            }
                            if(cliente.Id_Provincia_CatIngBr == 1)
                            {
                                if(cliente.Id_Cat_Ing_Br == 8)
                                {
                                    Iva_IngBr.Porc_IngBr_Pba0 = 0;
                                    Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                    Iva_IngBr.IngBr_Pba0 = 0;
                                    Iva_IngBr.IngBr_Pba1 = 0;
                                }
                                else
                                {
                                    if(cliente.Porcentaje_Pcia > 0)
                                    {
                                        switch (cliente.Tipo_Iva)
                                        {
                                            case "RI":
                                                PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_RI;
                                                break;
                                            case "NI":
                                            case "NC":
                                            case "EX":
                                            case "MT":
                                                PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                                break;
                                            default:
                                                PF_Pcia_Tipo_0 = PF_Pcia_Tipo_0_MT;
                                                break;
                                        }

                                        Iva_IngBr.Porc_IngBr_Pba0 = PF_Pcia_Tipo_0;
                                        Iva_IngBr.Porc_IngBr_Pba1 = cliente.Porcentaje_Pcia;
                                        Iva_IngBr.IngBr_Pba0 = Total_Prod_0 * PF_Pcia_Tipo_0 / 100;
                                        Iva_IngBr.IngBr_Pba1 = Total_Prod_1 * cliente.Porcentaje_Pcia / 100;
                                        Iva_IngBr.Base_Pba0 = Total_Prod_0;
                                        Iva_IngBr.Base_Pba1 = Total_Prod_1;
                                    }
                                    else
                                    {
                                        Iva_IngBr.Porc_IngBr_Pba0 = 0;
                                        Iva_IngBr.Porc_IngBr_Pba1 = 0;
                                        Iva_IngBr.IngBr_Pba0 = 0;
                                        Iva_IngBr.IngBr_Pba1 = 0;
                                        Iva_IngBr.Base_Pba0 = 0;
                                        Iva_IngBr.Base_Pba1 = 0;
                                    }
                                }

                            }
                        }
                    }
                    else
                    {
                        Iva_IngBr.Porc_IngBr_Cba = 0;
                        Iva_IngBr.IngBr_Cba = 0;

                        Iva_IngBr.Porc_IngBr_Pba0 = 0;
                        Iva_IngBr.Porc_IngBr_Pba1 = 0;
                        Iva_IngBr.IngBr_Pba0 = 0;
                        Iva_IngBr.IngBr_Pba1 = 0;
                        Iva_IngBr.Base_Pba0 = 0;
                        Iva_IngBr.Base_Pba1 = 0;
                    }

                    //Misiones

                    if(cliente.provincia == 14 && cliente.Id_Cat_Ing_Br != 8)
                    {
                        Iva_IngBr.Porc_IngBr_Mis = Porc_Mis;
                        Iva_IngBr.IngBr_Mis = Total_Bruto * Iva_IngBr.Porc_IngBr_Mis / 100;
                    }
                    else
                    {
                        Iva_IngBr.Porc_IngBr_Mis = 0;
                        Iva_IngBr.IngBr_Mis = 0;
                    }

                    //______________________________________
                    var dBruto = 0;
                    var dImpuestos = 0;
                    var dSubTotal = 0;
                    var dPorcDcto = parseFloat(cliente.Dcto,3);
                    var dDescuento = 0;
                    var dTotalNeto = 0;

                    dBruto = parseFloat(Iva_IngBr.Total_Gravado,3) + parseFloat(Iva_IngBr.Total_Exento,3);
                    dImpuestos = parseFloat(Iva_IngBr.IngBr_Cba,3) + parseFloat(Iva_IngBr.IngBr_Mis,3) + parseFloat(Iva_IngBr.IngBr_Pba0,3)+ parseFloat(Iva_IngBr.IngBr_Pba1,3) +
                        parseFloat(Iva_IngBr.Iva_Ins,3) + parseFloat(Iva_IngBr.Iva_NoIns,3);
                    dSubTotal = dBruto + parseFloat(Iva_IngBr.Total_Prod_Exento,3) + dImpuestos;
                    dDescuento = (dBruto + parseFloat(Iva_IngBr.Total_Prod_Exento,3)) * dPorcDcto / 100;
                    dTotalNeto = dSubTotal - dDescuento;

                    Iva_IngBr.Bruto = dBruto.toFixed(2);
                    Iva_IngBr.Impuestos = dImpuestos.toFixed(2);
                    Iva_IngBr.SubTotal = dSubTotal.toFixed(2);
                    Iva_IngBr.Total_Prod_Exento = Total_Prod_Ex.toFixed(2);
                    Iva_IngBr.PorcDcto = dPorcDcto.toFixed(2);
                    Iva_IngBr.Descuento = dDescuento.toFixed(2);
                    Iva_IngBr.Total_Neto = dTotalNeto.toFixed(2);



                    return Iva_IngBr;
                }
            };


            /////////////////////////////////////////
            // CLIENTE

            buscarCliente.autocomplete({
                source: apiURL+"?cliente",
                select: function(event,ui){
                    var codCliente = [];

                    codCliente = ui.item.value.split('-');
                    //$scope.clie = codCliente;
                    //console.log($scope.clie);
                    //angular.element($('#vistaPedidos')).scope().seleccionCliente(codCliente[0]);
                    $scope.seleccionCliente(codCliente[0]);
                }
            });
            $scope.clientes = [];
            $scope.clienteSeleccionado = [];
            $scope.consultaClienteDescripcion = function(des){                                
                if(des !== ""){
                    //Debe controlar primero que no haya productos cargados en la grilla de productos
                    //para evitar que modifiquen el cliente habiendo ya productos cargados.
                    if($scope.pedidoTemporal.Productos == undefined || $scope.pedidoTemporal.Productos.length == 0){
                        divMjeCliente.hide();
                        $http.get(apiURL+"?a=get&t=cli&des="+des)
                            .then(function(resp){
                                //console.log(resp.data);
                                $scope.clientes = resp.data;
                                $scope.mostrarC = $scope.clientes.length > 0;
                                clienteSeleccion.attr('size', 5);
                            })
                            .catch(function(){
                                console.log("ERROR");
                            });
                    }
                    else
                    {
                        divMjeCliente.text = "No se puede modificar el cliente si existen productos cargados";
                        divMjeCliente.show();
                    }
                }
                else
                {
                    $scope.mostrarC = false;
                }
                
            };
            $scope.desplegarCliente = function(){
                $("#buscarCliente")[0].value = "";

            };
            $scope.seleccionCliente = function(cod){
                if($scope.pedidoTemporal.Productos == undefined || $scope.pedidoTemporal.Productos.length == 0){
                    divMjeCliente.hide();
                    /*
                    if(event != null && event.which === 13){
                        cod = $scope.clienteBuscado;
                        if(!isNaN($scope.clienteBuscado) && $scope.clienteBuscado.length < 7)
                        {
                            while($scope.clienteBuscado.length < 7)
                                $scope.clienteBuscado = padLeft($scope.clienteBuscado,7);

                            cod = $scope.clienteBuscado;
                        }
                    }
                    */
                    if(cod !== undefined)
                    {
                        $http.get(apiURL+"?a=get&t=cli&cod="+cod)
                                .then(function(resp){
                                    //$scope.pedidoTemporal.Cliente = resp.data;
                                    //console.log($scope.pedidoTemporal.Cliente[0].Fecha_Vto_Psico);
                                    if(resp.data.Fecha_Vto_Psico == '01/01/1900' || resp.data.Fecha_Vto_Psico >= $scope.date)
                                    {
                                        if(resp.data.Fecha_Facturar_Hasta == '01/01/1900' || resp.data.Fecha_Facturar_Hasta >= $scope.date)
                                        {
                                            if(CodVendedor == resp.data.Codigo_Vendedor)
                                            {
                                                $scope.poneColorAgrup(resp.data.Id_Agrupacion);
//////////////////////////PROBLEM
                                                $scope.pedidoTemporal.Cliente = resp.data;
                                                $scope.pedidoTemporal.Id_Reparto = resp.data.Id_Reparto;
                                                $scope.pedidoTemporal.Id_Condicion = resp.data.Id_Condicion;
                                                $scope.pedidoTemporal.Id_Lista = resp.data.Id_Lista;
                                                $scope.pedidoTemporal.Id_Grupo_Cliente = resp.data.Id_Grupo_Cliente;
                                                $scope.pedidoTemporal.Id_Transporte = resp.data.Id_Transporte;

                                                var encontrado = false;
                                                angular.forEach($scope.pedidos, function(v,k){
                                                    encontrado = v.id_Cliente == $scope.pedidoTemporal.Cliente.id;
                                                    if(encontrado) {
                                                        modalCliente2.attr('data-pedido',v);
                                                        $scope.pedAgrega = v;
                                                        modalCliente2.modal('show');
                                                    }
                                                });
                                                buscarCliente.val('');
                                                buscarProducto.focus();
                                            }
                                            else
                                            {
                                                modalCliente.attr('data-codCli',cod);
                                                modalCliente.modal('show');
                                            }
                                        }
                                        else
                                        {
                                            divMjeCliente.text("");
                                            divMjeCliente.append("Este cliente no dispone permiso de compra");
                                            divMjeCliente.fadeIn(5);
                                            divMjeCliente.fadeOut(6000);
                                        }
                                    }
                                    else
                                    {
                                        divMjeCliente.text("");
                                        divMjeCliente.append("Este cliente se encuentra inhabilitado, su fecha de psicotrópicos caduco");
                                        divMjeCliente.fadeIn(5);
                                        divMjeCliente.fadeOut(6000);
                                    }
                        })
                        .catch(function(){
                            console.log('ERROR BUSQUEDA CLIENTE POR CODIGO');
                        });

                    }
                }
                else
                {
                    divMjeCliente.text("");
                    divMjeCliente.append("No se puede modificar el cliente si existen productos cargados");
                    divMjeCliente.fadeIn(5);
                    divMjeCliente.fadeOut(6000);
                }
            };
            $scope.poneColorAgrup = function(idAgrup){
                if(idAgrup == 2)
                {
                    if(!AgrupCliInput.hasClass('colorAgrup'))
                        AgrupCliInput.addClass('colorAgrup');
                }
                else
                {
                    if(AgrupCliInput.hasClass('colorAgrup'))
                        AgrupCliInput.removeClass('colorAgrup');
                }

            };
            $scope.seleccionClienteModal2 = function(){
                modalCliente2.modal('hide');
                $scope.selectPedido($scope.pedAgrega);
            };
            $scope.seleccionClienteModal = function(){
                modalCliente.modal('hide');
                var cod = modalCliente.attr('data-codCli');
                    if(cod !== null && cod.length > 0)
                    {
                        $http.get(apiURL+"?a=get&t=cli&cod="+cod)
                            .then(function(resp){
                                    $scope.pedidoTemporal.Cliente = resp.data;
                                    $scope.poneColorAgrup(resp.data.Id_Agrupacion);
    //////////////////////////PROBLEM
                                    $scope.pedidoTemporal.Cliente = resp.data;
                                    $scope.pedidoTemporal.Id_Reparto = resp.data.Id_Reparto;
                                    $scope.pedidoTemporal.Id_Condicion = resp.data.Id_Condicion;
                                    $scope.pedidoTemporal.Id_Lista = resp.data.Id_Lista;
                                    $scope.pedidoTemporal.Id_Grupo_Cliente = resp.data.Id_Grupo_Cliente;
                                    $scope.pedidoTemporal.Id_Transporte = resp.data.Id_Transporte;

                                    $http.get(apiURL+"?a=get&t=cli_obs&cod="+cod)
                                        .then(function(r){
                                            if(r.data.Imprimir == "1")
                                                $scope.pedidoTemporal.Cliente.Obs_Imprimir = r.data.Obs;
                                            if(r.data.Imprimir == "0")
                                                $scope.pedidoTemporal.Cliente.Obs_No_Imprimir = r.data.Obs;
                                        }).catch(function(){

                                    });

                                    buscarCliente.val('');
                                    buscarProducto.focus();
                            })
                            .catch(function(){
                                console.log('ERROR BUSQUEDA CLIENTE MODAL');
                            });

                    }
                    else
                        console.log('ERROR BUSQUEDA CLIENTE MODAL');
            };
            $scope.poneColorRubro = function(color){
              if(color == "0")
              {
                  if(RubroProdInput.hasClass('produ_sedronar'))
                      RubroProdInput.removeClass('produ_sedronar');
                  if(RubroProdInput.hasClass('produ_sico'))
                      RubroProdInput.removeClass('produ_sico');

                  RubroProdInput.addClass('produ_normales');
              }
              else if(color == "1")
              {
                  if(RubroProdInput.hasClass('produ_normales'))
                      RubroProdInput.removeClass('produ_normales');
                  if(RubroProdInput.hasClass('produ_sico'))
                      RubroProdInput.removeClass('produ_sico');

                  RubroProdInput.addClass('produ_sedronar');
              }
              else if(color == "2")
              {
                  if(RubroProdInput.hasClass('produ_normales'))
                      RubroProdInput.removeClass('produ_normales');
                  if(RubroProdInput.hasClass('produ_sedronar'))
                      RubroProdInput.removeClass('produ_sedronar');

                  RubroProdInput.addClass('produ_sico');
              }
            };
            $scope.changeRadio = function(){
                if($scope.pedidoTemporal.Nro_Pedido != undefined || $scope.pedidoTemporal.Cliente != undefined)
                    modalRadio.modal('show');

            };
            $scope.radioChangeSi = function(){
                var gen = $scope.pedidoTemporal.Generado_Por;
                $scope.pedidoTemporal = {};
                $scope.productoTemporal = {};
                modalRadio.modal('hide');

                $scope.pedidoTemporal.Generado_Por = gen;
                if($radioFR[0].checked)
                    $scope.pedidoTemporal.Id_Reparto = 45;
                else if($radioSF[0].checked)
                    $scope.pedidoTemporal.Id_Reparto = 227;

                return true;
            };
            $scope.radioChangeNo = function(){
                modalRadio.modal('hide');
                $scope.pedidoTemporal.Generado_Por = $scope.Generado_Por;

                if($scope.pedidoTemporal.Generado_Por == 0)
                {
                    if($radioFR.prop('checked'))
                        $scope.pedidoTemporal.Id_Reparto = 45;
                    else if($radioSF.prop('checked',true))
                        $scope.pedidoTemporal.Id_Reparto = 227;
                }
                else if($scope.pedidoTemporal.Generado_Por == "cotizacion")
                {
                    $radioCoti.prop('checked',true);
                }
                else if($scope.pedidoTemporal.Generado_Por == "presupuesto")
                {
                    $radioPresu.prop('checked',true);
                }
                else if($scope.pedidoTemporal.Generado_Por == "mostrador")
                {
                    $radioMostro.prop('checked',true);
                }

                return false;
            };
            $scope.buscaCotizacion = function(idMoneda){
                $scope.productoTemporal = {};
                if(idMoneda > 1)
                {
                    $http.get(apiURL+"?a=get&t=monedde&idMoneda="+idMoneda)
                        .then(function(resp){
                            $scope.pedidoTemporal.Valor_Moneda = resp.data.Valor_Moneda;
                        })
                        .catch(function(resp){
                            console.log(resp);
                        });
                }
                else
                    $scope.pedidoTemporal.Valor_Moneda = 1;

            };

            $scope.resetearFormulario = function(pedidoForm){
                $('input').val('').removeAttr('selected');
                formUp.slideUp();
                $scope.pedidoTemporal = {};
                $scope.pedidoTemporal.Generado_Por = "pedido";
                $scope.pedidoTemporal.id_Moneda = "1";
                $scope.pedidoTemporal.Valor_Moneda = "1";
                $scope.pedidoTemporal.Productos = [];
                divMjeProd.hide();
                divMjeCliente.hide();
                pedidoForm.$setPristine();
                pedidoForm.$setUntouched();
            };
        });
