<?php
    require_once('Config.php');
    class Conexion
    {
        private static $conn = NULL;

        public static function conectar(){

            if(!self::$conn)
            {
                $conexion = new Config();
                self::$conn = new PDO("$conexion->tipo:host=$conexion->host;dbname=$conexion->dbname",$conexion->user,$conexion->pw,$conexion->opciones);
            }
            return self::$conn;
        }
    }
?>

