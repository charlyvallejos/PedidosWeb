<?php

class Usuario
{
    private $Id_Usuario;
    private $Nombre_Vendedor;
    private $Codigo_Vendedor;
    private $Usuario_Login;
    private $Clave;

    public function login(){
        $sql = "SELECT Nombre_Vendedor FROM usuarios WHERE Usuario_Login = :Usuario_Login AND Clave = :Clave";
        $conexion = Conexion::conectar();
        $query = $conexion->prepare($sql);

        $usuLogin = $_POST['Usuario_Login'];
        $usuClave = $_POST['Clave'];

        $query->bindParam(':Usuario_Login',$usuLogin,PDO::PARAM_STR);
        $query->bindParam(':Clave',$usuClave,PDO::PARAM_STR);

        $query->execute();
        if($query->rowCount() > 0)
        {
            $_SESSION['logueado'] = 1;
            $_SESSION['Nombre_Vendedor'] = $query->fetch(PDO::FETCH_ASSOC)['Nombre_Vendedor'];
            header('location:index.php');
        }
        else
            header('location: formLogin.php?error=1');

        return $query->execute();
    }
}