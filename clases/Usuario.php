<?php

class Usuario
{
    private $Id_Usuario;
    private $Nombre_Vendedor;
    private $Codigo_Vendedor;
    private $Usuario_Login;
    private $Clave;

    public function login(){
        $sql = "SELECT Nombre_Vendedor, Codigo_Vendedor FROM usuarios WHERE Usuario_Login = :Usuario_Login AND Clave = :Clave";
        $conexion = Conexion::conectar();
        $query = $conexion->prepare($sql);

        if(isset($_POST))
        {

            $usuLogin = $_POST['Usuario_Login'];
            $usuClave = $_POST['Clave'];

            $query->bindParam(':Usuario_Login',$usuLogin,PDO::PARAM_STR);
            $query->bindParam(':Clave',$usuClave,PDO::PARAM_STR);

            $query->execute();
            if($query->rowCount() > 0)
            {
                $_SESSION['logueado'] = 1;
                $_SESSION['Nombre_Vendedor'] = $query->fetch(PDO::FETCH_ASSOC)['Nombre_Vendedor'];
                $_SESSION['Codigo_Vendedor'] = $query->fetch(PDO::FETCH_ASSOC)['Codigo_Vendedor'];
            }

            return json_encode(true);
        }
        else
            return json_encode(false);
    }
    public function autenticar(){
        if(isset($_SESSION['logueado']))
            return true;
        else
            return false;
    }

    public function logout(){
        session_unset();
        session_destroy();
    }
}