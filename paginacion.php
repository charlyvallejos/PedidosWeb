<?php
//PAGINACION
$numxPag = 2;
$pagina = false;

if(isset($_GET['pag']))
{
    $pagina = $_GET['pag'];
}

if(!$pagina)
{
    $pagina = 1;
    $inicio = 0;
}
else
{
    $inicio = ($pagina - 1) * $numxPag;
}

$totalPaginas = ceil($totalRegistros / $numxPag);

$pedidos = $pedido_ca->consultaPedidoLimitado($inicio, $numxPag);
?>