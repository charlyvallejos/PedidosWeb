<?php
function actual($seccion){
    $file = $_SERVER["SCRIPT_NAME"]; // nombre del archivo
    $break = Explode('/', $file); // quitar nombre del directorio
    $pfile = $break[count($break) - 1];
    $pfile = substr($pfile, 0, -4); // quitar extension
    if ($pfile == $seccion) {
        echo 'class="actualNav"';
    }
}
?>
<ul>
    <li><a <?php actual('index.php'); ?> href="index.php">Pedidos</a></li>
    <li><a <?php actual('vistaClientes'); ?>href="vistaClientes.php">Clientes</a></li>
    <li><a <?php actual('vistaListados'); ?>href="vistaListados.php">Listados</a></li>

</ul>