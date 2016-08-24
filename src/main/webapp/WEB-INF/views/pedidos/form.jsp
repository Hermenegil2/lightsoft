<!DOCTYPE html>
<html ng-app="registroPedido">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<script type="text/javascript" src="/lightsoft/resources/js/angular/angular.js"></script>

<link rel="stylesheet" type="text/css" href="/lightsoft/resources/css/bootstrap-3.3.6-dist/css/bootstrap.css">

<script type="text/javascript">

angular.module("registroPedido",[]);

angular.module("registroPedido").controller("pedidoController",function($http,$scope){
	
$scope.app="Registro de Pedido";	
	
	$scope.registrarPedido=function(pedido){
		
		$http.post("http://localhost:8080/lightsoft/pedido",pedido).success(function(){
			
			$scope.pedido=undefined;
			
			cargarPedido();
			
		});
		
	};
	
	
	var cargarPedido=function(){
		
		
		$http.get("http://localhost:8080/lightsoft/pedido").success(function(datos){
			
			
			$scope.pedidos=datos.pedidos;
		});
		
		
		
	};
	
	
	
cargarPedido();	
});






</script>

<style type="text/css">


.jumbotron{

width: 600px;
margin-right: auto;

margin-left: auto;

}


</style>



</head>
<body ng-controller="pedidoController">


<div class="jumbotron">
{{app}}

<form ng-submit="registrarPedido(pedido)">

<input type="date" ng-model="pedido.fechaToma" placeholder="Fecha Toma" class="form-control">
<input type="date" ng-model="pedido.fechaEntrega" placeholder="Fecha Entrega" class="form-control">
<input type="text" ng-model="pedido.total" placeholder="Total" class="form-control">



<input type="submit" class="btn btn-primary btn-block">


</form>


<table class="table table-striped">
<thead>
<tr>

<th>Fecha Toma</th>
<th>Fecha Entrega</th>
<th>Total</th>
</tr>

</thead>

<tbody>



<tr ng-repeat="pedido in pedidos">
<td>{{pedido.fechaToma}}</td>
<td>{{pedido.fechaEntrega}}</td>
<td>{{pedido.total}}</td>

</tr>


</tbody>

<tfoot></tfoot>

</table>





</div>






</body>
</html>