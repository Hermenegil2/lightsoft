<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>

<!-- DESCRIPCIONIGS -->

<customTags:page bodyClass="" title="Registro de Tipo de Gastos" >


<jsp:attribute name="extraScripts">

<style type="text/css">

.jumbotron{
width: 500px;
text-align: center;
margin-left: auto;
margin-right: auto;

}
.form-control{
margin-bottom: 5px;


}
</style>

<script type="text/javascript">

angular.module("registroDescripcion",["confirmar"]);


angular.module("registroDescripcion").controller("descripcionController",function($scope,$http){
	
	$scope.app="Registro de Tipo de Ingresos o Gastos";
	
	$scope.opciones=[
	           "positivo",
			   "negativo"  
				];
	
$scope.registrarDescripcion=function(descripcion){
	console.log($scope.descripcion);
$http.post("http://localhost:8080/lightsoft/descripcionigs",descripcion).success(function(){
	
	
	
	$scope.descripcion=undefined;
	
	cargarDescripcion();
	
	});
	
	
};


$scope.editarDescripcion=function(descripcion){
	
	$scope.descripcion=angular.copy(descripcion);
	
};
$scope.eliminarDescripcion=function(descripcion){
	
	if (confirm("Desea eliminar el registro?")){
	$http.post("http://localhost:8080/lightsoft/descripcionigs/eliminar",descripcion).success(function(){
		
		console.log($scope.descripcion);
		$scope.descripcion=undefined;
		cargarDescripcion();
		
	});
	return false;
	}
	
};




var cargarDescripcion=function(){
	
	$http.get("http://localhost:8080/lightsoft/descripcionigs.json").success(function(dato){
		console.log(dato.descripcion);
		
		$scope.descripcions=dato.descripcion;
		
	});
	
	
};
	
	
$scope.toggleModal = function(){
    $scope.showModal = !$scope.showModal;
};    

$scope.registrar=function(entidad){
	console.log(entidad);
	$scope.mostrar=entidad;
	$scope.cancel();
	
};
$scope.cancel = function (){
$scope.showModal=false;
};
			                
     $scope.showModal = false;
	
	
	cargarDescripcion();
	
});








</script>


<script type="text/javascript" src="/lightsoft/resources/js/lib/modal/confirmar.js"></script>

</jsp:attribute>







<jsp:body >

<div ng-app="registroDescripcion">

<div ng-controller="descripcionController">


<ventana title="Ventana de Confirmación" message="Desea Eliminar el Elemento?" visible="showModal">

<h1>Ventana</h1>

</ventana>


  <button ng-click="toggleModal()" class="btn btn-default">Open modal</button>
<!-- <h1>Miembros</h1> -->
<!-- <button class="btn btn-success" ng-click="showModal">Añadir Nuevo Miembro</button> -->
<!-- <div class="gridStyles" ng-grid="gridOptions"> -->

<!-- </div> -->



<!-- <button ng-click="mostrarModal()">Ver Modal</button> -->
<!--   <br>{{ resultadoModal }} -->



<!-- <div ng-include="'/lightsoft/resources/include/menu.html'"></div>	 -->
<div class="jumbotron">

<h4 ng-bind="app"></h4>
<form ng-submit="registrarDescripcion(descripcion)">

<input class="form-control" type="text" ng-model="descripcion.id">

<input class="form-control" type="text" ng-model="descripcion.descripcion" placeholder="Descripcion">

<select class="form-control" ng-model="descripcion.tipo" ng-options="opcion for opcion in opciones">
<option value="">Seleccione un tipo de Gasto</option>
<!-- <option>negativo</option> -->
<!-- <option>positivo</option> -->

</select>

<!-- <input class="form-control" type="text" ng-model="descripcion.tipo" placeholder="Tipo"> -->
<input class="form-control" type="text" ng-model="descripcion.observacion" placeholder="Observacion">

<input class="btn btn-block btn-primary" type="submit" value="Registrar">

</form>

<table class="table table-striped">

<thead>
<tr>
<th>#</th>
<th>Descripcion</th>
<th>Tipo</th>
<th>Observacion</th>
<th>Eliminar</th>
<th>Editar</th>
</tr>

</thead>

<tbody>
<tr ng-repeat="descripcion in descripcions">
<td>{{descripcion.id}}</td>
<td>{{descripcion.descripcion}}</td>
<td>{{descripcion.tipo}}</td>
<td>{{descripcion.observacion}}</td>
<td><a ng-click="editarDescripcion(descripcion)">Editar</a></td>
<td><a ng-click="eliminarDescripcion(descripcion)">Eliminar</a></td>

</tr>


</tbody>




</table>
</div>

</div>


</div>
</jsp:body>


</customTags:page>


</html>