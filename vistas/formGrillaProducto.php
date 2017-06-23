<fieldset class="grillaProd"><legend>Grilla Producto</legend>
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
        </tr>
        </thead>
        <tbody>
        <tr dir-paginate="prod in pedidoTemporal.Productos | filter:buscar|orderBy:sortKey:reverse | itemsPerPage: 5" pagination-id="prod" ng-click="selectProducto(prod)">
            <td>{{prod.Codigo_Producto}}</td>
            <td>{{prod.Descripcion_Producto}}</td>
            <td>{{prod.Cantidad}}</td>
            <td>{{prod.Precio}}</td>
            <td>{{prod.Cantidad * prod.Precio | number: 3}} </td>
            <td>{{prod.Estado}}</td>
            <td>{{prod.Fecha_Cotizacion}}</td>
            <td>{{prod.Nro_Cotizacion}}</td>
        </tr>
        </tbody>
    </table>
    <dir-pagination-controls
        boundary-links="true"
        pagination-id="prod">
    </dir-pagination-controls>
</fieldset>