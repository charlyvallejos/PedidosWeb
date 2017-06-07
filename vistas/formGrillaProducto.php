<fieldset><legend>Grilla Producto</legend>
    <table data-mostrar class="table table-striped">
        <thead>
        <tr>
            <th>Codigo</th>
            <th>Descripcion</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Total</th>
            <th>Estado</th>
            <th>Fecha Cot</th>
            <th>Nro Cotiz</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <tr dir-paginate="prod in pedidoSelected.productos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: numXpag" pagination-id="prod">
            <td>{{prod.Codigo}}</td>
            <td>{{prod.Descripcion}}</td>
            <td>{{prod.Cantidad}}</td>
            <td>{{prod.Precio}}</td>
            <td>{{prod.Total}}</td>
            <td>{{prod.Estado}}</td>
            <td>{{prod.Fecha_Cot}}</td>
            <td>{{prod.Nro_Cot}}</td>
            <td>
                <a href="" class="editar">Editar <img src="img/edit.png" alt="Editar" ng-click="consultaPedidoNro(ped)"></a>
                <a href="" class="eliminar">Eliminar <img src="img/drop.png" alt="Borrar"></a>
            </td>
        </tr>
        </tbody>
    </table>
    <dir-pagination-controls
        boundary-links="true"
        pagination-id="prod">
    </dir-pagination-controls>
</fieldset>