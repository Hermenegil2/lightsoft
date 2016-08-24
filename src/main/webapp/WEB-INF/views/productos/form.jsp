<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>



<customTags:page bodyClass="" title="Registro de Tipo de Gastos" >


<jsp:attribute name="extraScripts">
<script type="text/javascript">
angular.module("registroProducto",[]);
angular.module("registroProducto").controller("productoController",function($scope,$http){
	$scope.app="Registro de Productos";
	$scope.productos=[];
	$scope.eliminados=[];
	
	var iniciar=function(){

		$scope.producto={descripcion:''};
		$scope.producto={fechaVencimiento:''};
		$scope.producto={precio:''};
		$scope.producto={cantidad:''};
		$scope.producto={id:''};
		
	};
	
	var cargarProductos=function(){
		$http.get("http://localhost:8080/lightsoft/productos.json").success(
		function(data,status){
			$scope.productos=data.productos;
		
		}		
		
		);
		
		
	};
	
	$scope.registrarProducto=(function(producto){
		//| date:'dd/MM/yyyy HH:mm
// 			$scope.message="Ocurrio"+producto;
		$http.post("http://localhost:8080/lightsoft/productos/jsone",producto).success(function(){
		
// 			alert($scope.producto)
			console.log($scope.producto)
			 delete $scope.producto;
			$scope.productoForm.$setPristine();
			cargarProductos();
			
			
		});
		
	});
	$scope.eliminarProducto=(function(productos){
		
		if(confirm("Esta seguro de eliminar? el tota de registros es: "+productos.length)){
		
		$scope.productos=productos.filter(function(producto){
			if(!producto.seleccionado)return producto;
 		});
		
		
		var eliminados=productos.filter(function(producto){
			
			if(producto.seleccionado){
				
				delete producto.seleccionado;

				return producto
			}
				
		});
		
//  		$scope.message=eliminados;
 		
		$http.post("http://localhost:8080/lightsoft/productos/jeliminar",eliminados).success(function(productos){
		
			
		}).error(function(eliminados){

			$scope.message="Ocurrio un problema"+productos;
		});
		
		
		return false;
		}
		
	});
	$scope.isProductoSeleccionado=function(productos){
		return productos.some(function(producto){
			return producto.seleccionado;
		});
		
	};

	
	$scope.editarProducto=(function(producto){
		iniciar();
// 		console.log('Editar'+producto.descripcion);
//  		$scope.message=producto.fechaVencimiento;
// 		document.getElementById('descripcion').innertHTML=producto.descripcion; | date:'dd/MM/yyyy HH:mm'
		
	$scope.producto.id=producto.id;	
	$scope.producto.descripcion =producto.descripcion;
	$scope.producto.fechaVencimiento=new Date(producto.fechaVencimiento)  ;
	$scope.producto.cantidad=producto.cantidad;
	$scope.producto.precio=producto.precio;
		
	});
	
	cargarProductos();
	iniciar();
	
});




</script>

<style type="text/css">

.form-control{

margin-bottom: 5px;

}


.seleccionado{
background-color: gray;
}

.negrita{

font-weight: bold;
color: white;
}


</style>

</jsp:attribute>



<jsp:body >




<div class="row" ng-app="registroProducto">
<div ng-controller="productoController">



<div class="col-md-8">
<!--  table-striped -->
<table class="table">

<thead>
<tr>
<th>Eliminar</th>
<th>Descripcion</th>
<th>Fecha Vencimiento</th>
<th>Cantidad</th>
<th>Precio</th>
<th>Editar</th>
</tr>
</thead>

<tbody>
<tr ng-class="{'seleccionado negrita':producto.seleccionado}" ng-repeat="producto in productos">

<td><input type="checkbox" ng-model="producto.seleccionado"></input></td>
<td>{{producto.descripcion}}</td>
<td>{{producto.fechaVencimiento  | date:'dd/MM/yyyy HH:mm'}}</td>
<td>{{producto.cantidad}}</td>
<td>{{producto.precio}}</td>
<td><a ng-click="editarProducto(producto)" class="icon-pencil"></a></td>


</tr>


</tbody>

</table>



</div>

<div class="col-md-3">
<h3>{{app}}</h3>
<form action="" name="productoForm">

<!-- <h2 ng-bind="descripcion"></h2> -->
<div>
<label for="id">Codigo</label>
<input type="text" id="id" name="id" ng-model="producto.id" class="form-control" placeholder="Codigo" disabled="disabled">
</div>

<div >
<label for="descripcion">Descripción</label>
<input   type="text" name="descripcion" id="descripcion" ng-model="producto.descripcion" placeholder="Descripción" class="form-control" ></input>
</div>

<div>
<label for="fechaVencimiento">Fecha Vencimiento</label>
<input type="date" id="fechaVencimiento" name="fechaVencimiento" ng-model="producto.fechaVencimiento" placeholder="Fecha Vencimiento" class="form-control">
</div>

<div>
<label for="cantidad">Cantidad</label>
<input type="text" id="cantidad" name="cantidad" ng-model="producto.cantidad" placeholder="Cantidad" class="form-control">
</div>

<div>
<label for="precio">Precio</label>
<input  type="text" id="precio" name="precio" ng-model="producto.precio" placeholder="Precio" class="form-control">

</div>


</form>



<button class="btn btn-primary btn-block" ng-click="registrarProducto(producto)">Registrar</button>
<button class="btn btn-primary btn-block" ng-click="eliminarProducto(productos)" ng-if="isProductoSeleccionado(productos)">Eliminar</button>
<!-- <button class="btn btn-primary btn-block" ng-click="editarProducto(producto)">Editar</button> -->

</div>




</div>
</div>

</jsp:body>
</customTags:page>



