<?php

    session_start();
    
    function AutoLoader($clase){
        include 'clases/'.$clase.'.php';
    }

    spl_autoload_register('AutoLoader');
?>

<?php

    require 'config/config.php';
    $usuario = new Usuario();
    
    if($usuario->autenticar()){
?>

<?php } else {include 'vistas/formLogin.php'; }    ?>

<?php

    class Usuario{
        
        public function autenticar(){
            if(isset($_SESSION['logueado']))
                return true;
            else
                return false;
        }
    }

?>

<html ng-app="appLogin">
    <head>
        <meta charset="UTF-8"/>
        <title>Pedidos</title>
        <link href="css/login.css" rel="stylesheet"/>
        <script src="js/login.js"></script>
    </head>
    <body ng-controler="loginController">
        
    </body>
</html>