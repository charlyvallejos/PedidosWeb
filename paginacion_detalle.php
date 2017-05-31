<?php

if ($totalPaginas > 1)
{ ?>
    <p>
        <?php if($pagina != 1){  ?>
            <a href='?pag=<?php echo ($pagina-1)?>'>&laquo</a>
        <?php }
        for($i=1; $i <= $totalPaginas;$i++)
        {
            if($i == $pagina){ ?>
                <span class='actual'><?php echo $pagina ?></span>
            <?php }else{  ?>
                <a href='?pag=<?php echo $i ?>'><?php echo $i ?></a><?php }
        }

        if($pagina != $totalPaginas){ ?>
            <a href='?pag=<?php echo ($pagina+1) ?>'>&raquo</a> <?php
        } ?>
    </p>
<?php } ?>