<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>


<customTags:page bodyClass="" title="Registro de Cliente" >


<jsp:attribute name="extraScripts">


<script type="text/javascript">

	angular.module("registroCliente",[]);
	angular.module("registroCliente").controller("clienteController",function($scope,$http){
		
	
		$scope.app="Registro de Cliente";
		
	
	$scope.registrarCliente=(function(cliente){
		
		$http.post("http://localhost:8080/lightsoft/clientes",cliente).success(function(){
			
			delete $scope.cliente;
			
			
		});
		
		
	});	
	
	var cargarClientes=(function(){

		$http.get("http://localhost:8080/lightsoft/clientes.json").success(function(datos){
			
			$scope.clientes=datos.clientes;
			
		});
		
		
	});
		
	cargarClientes();	
		
	});
	



</script>

<style type="text/css">
/* .form-control{ */

/*  margin-bottom: 5px; */
/* } */
/* .table{ */
/* margin-top: 20px; */
/* text-align: left; */

/* } */

</style>

</jsp:attribute>
<jsp:body >

<div ng-app="registroCliente">

<div ng-controller="clienteController">


<div class="col-md-8">

<table class="table table-striped">

<thead>



</thead>


<tr>

<th>Nombre</th>
<th>Celular</th>
<th>Dirección</th>
<th>Email</th>
<th>Observación</th>
</tr>

<tr ng-repeat="cliente in clientes">
<td>{{cliente.nombre}}</td>
<td>{{cliente.celular}}</td>
<td>{{cliente.direccion}}</td>
<td>{{cliente.email}}</td>
<td>{{cliente.observacion}}</td>

</tr>


</table>

</div>




<div class="col-md-4">

<h3>{{app}}</h3>


<form action="">

<input class="form-control" type="text" ng-model="cliente.nombre" placeholder="Nombre">
<input class="form-control" type="text" ng-model="cliente.celular" placeholder="Celular" >
<input class="form-control" type="text" ng-model="cliente.direccion" placeholder="Dirección">
<input class="form-control" type="email" ng-model="cliente.email" placeholder="Email">
<textarea class="form-control" placeholder="Observación" ng-model="cliente.observacion"></textarea>



<button class="btn btn-block" ng-click="registrarCliente(cliente)">Registrar</button>


</form>
</div>


</div>
</div>
</jsp:body>
</customTags:page>
