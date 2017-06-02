<?php

    function listaEditoriales()
    {
        $controladorEditoriales = new controladorEditoriales();
        $editoriales = $controladorEditoriales->listar();

        if($editoriales->num_rows > 0)
        {
            $comboBox = "<select id='editorial' name='slc_editorial' required>";
                $comboBox .= "<option value=''>- - -</option>";
                while($row = mysqli_fetch_array($editoriales))
                {
                    $comboBox .= sprintf("<option value='%d'>%s</option>",$row['id_editorial'], $row['editorial']);
                }
            $comboBox .= "</select>";

            $editoriales->free();
        }

        $controladorEditoriales = NULL;
        return ($comboBox);
    }

    function listaEditorialesActual($editorial)
    {
        $controladorEditoriales = new controladorEditoriales();
        $editoriales = $controladorEditoriales->listar();

        if($editoriales->num_rows > 0)
        {
            $comboBox = "<select id='editorial' name='slc_editorial' required>";
                $comboBox .= "<option value=''>- - -</option>";
                while($row = mysqli_fetch_array($editoriales))
                {
                    $selected = ($row['id_editorial'] == $editorial) ? "selected " : "";
                    $comboBox .= sprintf("<option value='%d' $selected >%s</option>",$row['id_editorial'], $row['editorial']);
                }
            $comboBox .= "</select>";

            $editoriales->free();
        }

        $controladorEditoriales = NULL;
        return ($comboBox);
    }

    function altaPedido()
    {
        $form = "<form id='alta-pedido' class='formulario' data-insertar>";
            $form .= "<fieldset>";
                $form .= "<legend>Alta de Pedidos:</legend>";
                $form .= "<div>";
                    $form .= "<label for='nombre'>Nombre: </label>";
                    $form .= "<input type='text' id='nombre' name='txt_nombre' required />";
                $form .= "</div>"; 
                $form .= "<div>";
                    $form .= "<label for='imagen'>Imagen: </label>";
                    $form .= "<input type='text' id='imagen' name='txt_imagen' required />";
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<label for='descripcion'>Descripcion: </label>";
                    $form .= "<textarea id='descripcion' name='txa_descripcion' required ></textarea>";
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<label for='editorial'>Editorial: </label>";
                    //$form .= listaEditoriales();
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<input type='submit' id='btn-insertar' name='btn_insertar' value='Insertar' />";
                    $form .= "<input type='hidden' id='transaccion' name='transaccion' value='insertar' />";
                $form .= "</div>";
            $form .= "</fieldset>";
        $form .= "</form>";
        
        return printf($form);
    }
    
    function editarHeroe($datos)
    {
        $datos = mysqli_fetch_array($datos);
        $form = "<form id='editar-pedido' class='formulario' data-editar>";
            $form .= "<fieldset>";
                $form .= "<legend>Alta de Super Héroe:</legend>";
                $form .= "<div>";
                    $form .= "<label for='nombre'>Nombre: </label>";
                    $form .= "<input type='text' id='nombre' name='txt_nombre' value ='".$datos['nombre']."' required />";
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<label for='imagen'>Imagen: </label>";
                    $form .= "<input type='text' id='imagen' name='txt_imagen' value='".$datos['imagen']."'required />";
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<label for='descripcion'>Descripcion: </label>";
                    $form .= "<textarea id='descripcion' name='txa_descripcion' required >".$datos['descripcion']."</textarea>";
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<label for='editorial'>Editorial: </label>";
                    $form .= listaEditorialesActual($datos['editorial']);
                $form .= "</div>";
                $form .= "<div>";
                    $form .= "<input type='submit' id='btn-modificar' name='btn_modificar' value='Modificar' />";
                    $form .= "<input type='hidden' id='transaccion' name='transaccion' value='modificar' />";
                    $form .= "<input type='hidden' id='idHeroe' name='idHeroe' value='".$datos['id_heroe']."' />";
                $form .= "</div>";
            $form .= "</fieldset>";
        $form .= "</form>";

        //$datos->free();
        return printf($form);
    }

    function mostrarPedido()
    {
        $pedido_ca = new Pedid_Ca();
        $pedidos = $pedido_ca->consultaTodos();
        $totalRegistros = $pedido_ca->CantidadPedidos;

        if($totalRegistros == 0)
        {
            $respuesta = "<div class='error'>NO HAY REGISTRO DE PEDIDOS</div>";
        }
        else
        {
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

            $pedidos = $pedido_ca->consultaTodos();
            
            $paginacion = "<div class='paginacion'>";
                $paginacion .= "<p>";
                    $paginacion .= "Número de resultados: <b>$totalRegistros</b>.";
                    $paginacion .= "Mostrando <b>$numxPag</b> resultados por página.";
                    $paginacion .= "Página <b>$pagina</b> de <b>$totalPaginas</b>.";
                $paginacion .= "</p>";

                if ($totalPaginas > 1)
                {
                    $paginacion .= "<p>";
                        $paginacion .= ($pagina != 1) ? "<a href='?pag=".($pagina-1)."'>&laquo</a>" :"";
                        for($i=0; $i <= $totalPaginas;$i++)
                        {
                            $actual = "<span class='actual'>$pagina</span>";
                            $enlace = "<a href='?pag=$i'>$i</a>";
                            $paginacion .= ($i == $pagina) ? $actual : $enlace;
                        }
                        $paginacion .= ($pagina != $totalPaginas) ? "<a href='?pag=".($pagina+1)."'>&raquo</a>" : "";
                    $paginacion .= "</p>";
                }
            $paginacion .= "</div>";
            //FIN DE PAGINACION
            //TABLA

            $tabla = "<table id='tabla-heroes' class='tabla' data-mostrar>";
                $tabla .= "<thead>";
                    $tabla .= "<tr>";
                        $tabla .= "<th>Nro Pedido</th>";
                        $tabla .= "<th>Id Cliente</th>";
                        $tabla .= "<th>Fecha Pedido</th>";
                        $tabla .= "<th>Codigo Vendedor</th>";
                        $tabla .= "<th>Estado</th>";
                        $tabla .= "<th></th>";
                        $tabla .= "<th></th>";
                    $tabla .= "</tr>";
                $tabla .= "</thead>";
                $tabla .= "<tbody>";
                foreach($pedidos as $pedido)
                {
                    $tabla .= "<tr>";
                        $tabla .= "<td><h3>".$pedido['Nro_Pedido']."</h3></td>";
                        $tabla .= "<td><h3>".$pedido['id_Cliente']."</h3></td>";
                        $tabla .= "<td><h3>".$pedido['Fecha_Pedido']."</h3></td>";
                        $tabla .= "<td><h3>".$pedido['Codigo_Vendedor']."</h3></td>";
                        $tabla .= "<td><h3>".$pedido['Estado']."</h3></td>";
                        $tabla .= "<td><a href='#' class='editar' data-id=".$pedido['Nro_Pedido'].">Editar</a></td>";
                        $tabla .= "<td><a href='#' class='eliminar' data-id=".$pedido['Nro_Pedido'].">Eliminar</a></td>";
                    $tabla .= "</tr>"; 
                }
                //$pedidos->free();
                $tabla .= "</tbody>";            
            $tabla .= "</table>";

            //FIN DE TABLA

            $respuesta = $tabla.$paginacion;
        }
        
        //$pedidos->free();
        
//        $controladorEditoriales = null;
//        $controladorSA = null;
        return printf($respuesta);
    }

?>

