<?php
class Config
{
    public $tipo;
    public $host;
    public $dbname;
    public $user;
    public $pw;
    public $opciones;

    public function __construct()
    {
        $this->tipo = "mysql";
        $this->host = "localhost";
        $this->dbname = "SaporitiWeb";
        $this->user = "root";
        $this->pw = "";
        $this->opciones = array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES utf8");
    }
}
?>
