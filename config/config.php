<?php
//Esto nos va a servir cuando hagamos el tema del login
session_start();


//Esto hace
function AutoLoader($archivoClase){
    require_once "clases/".$archivoClase.".php";
}

spl_autoload_register('AutoLoader');
