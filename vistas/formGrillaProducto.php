<fieldset class="grillaProd"><legend>Grilla Producto</legend>
    <table data-mostrar class="table table-striped">
        <thead>
        <tr>
            <th>Codigo</th>
            <th>Renglon</th>
            <th>Descripcion</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Total</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody>
        <tr dir-paginate="prod in pedidoTemporal.Productos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: 5" pagination-id="prod" ng-click="selectProducto(prod)">
            <td>{{prod.Codigo_Producto}}</td>
            <td>{{prod.Renglon}}</td>
            <td>{{prod.Descripcion_Producto}}</td>
            <td>{{prod.Cantidad | number:3}}</td>
            <td>{{prod.Precio | number: 3}}</td>
            <td>{{prod.Total | number: 2}} </td>
            <td>{{prod.Estado}}</td>
        </tr>
        </tbody>
    </table>
    <dir-pagination-controls
        boundary-links="true"
        pagination-id="prod">
    </dir-pagination-controls>
</fieldset>