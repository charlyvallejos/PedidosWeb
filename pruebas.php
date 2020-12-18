<?php

    session_start();
    
    function AutoLoader($clase){
        include 'clases/'.$clase.'.php';
    }

    spl_autoload_register('AutoLoader');
