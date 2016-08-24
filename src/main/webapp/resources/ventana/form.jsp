
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>

<head>


</head>

<customTags:page bodyClass="" title="Registro de Usuarios" >


<jsp:attribute name="extraScripts">

<script type="text/javascript">

angular.module("registroUsuario",[]);

angular.module("registroUsuario").controller("usuarioController",['$scope', '$modal','$modalInstance',function($scope,$http,$modal){
	
	$scope.app="Registro de Usuario";
	
	
$scope.registrarUsuario=function(usuario){
	
	$http.post("http://localhost:8080/lightsoft/usuarios",usuario).success(function(){
		
		console.log(usuario);
		delete $scope.usuario;
		cargarUsuarios();
		
	});
	
	
};


var cargarUsuarios=function(){
	
	$http.get("http://localhost:8080/lightsoft/usuarios.json").success(function(datos){
		$scope.usuarios=datos.usuarios;
		
	});
}



$scope.editarUsuario=function(usuario){
	
	console.log(usuario);
	$scope.usuario=usuario;
	
	
};

$scope.cancelar=function(){
	
   delete $scope.usuario;
};

$scope.eliminar=function(usuario){
	
	if (confirm("Desea eliminar el registro?")){
		$http.post("http://localhost:8080/lightsoft/usuarios/eliminar",usuario).success(function(){
			
			console.log($scope.usuario);
			$scope.usuario=undefined;
			cargarUsuarios();
			
		});
		return false;
		}
};


		$scope.showModal=function(){
			$scope.nuevoMiembro={};
			var modalInstance=$modal.open({
				templateURL:'http://localhost:8080/lightsoft/resources/ventana/add-miembros.html'
			})}
				
// 				 $scope.modalInstance = {};
// 			        $scope.showModal= function () {
			  
			        	
			        	
// 			            $scope.modalInstance = $modal.open({
// 			                templateUrl: '/lightsoft/resources/ventana/add-miembros.html',
// 			                controller: 'ModalInstanceCtrl'
// 			            });
// 			        };



			        
			                
			        
			        
			        
			        

	cargarUsuarios();
	
}]);


(function () {
	var app = angular.module('registroUsuario');

	app.controller('ModalInstanceCtrl',  function ($scope, $modalInstance) {
	        $scope.submit = function (myForm) {
	            //submit code goes here
	        };

	        $scope.cancel = function () {
	          $modalInstance.close();
	        };
	    }
	); })();
</script>

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

.scroll{
overflow: scroll;
max-height: 400px;


}

</style>


</jsp:attribute>

<jsp:body>

<div ng-app="registroUsuario">

<div ng-controller="usuarioController">

<h1>Miembros</h1>
<button class="btn btn-success" ng-click="showModal()">Añadir nuevo Miembro </button>

<div class="gridStyles" ng-grid="gridOptions"></div>



<div class="jumbotron">

<h3 ng-bind="app"></h3>

<form ng-submit="registrarUsuario(usuario)">

<input class="form-control" ng-model="usuario.login" placeholder="Correo">
<input class="form-control" ng-model="usuario.name" placeholder="Nombre">
<input class="form-control" ng-model="usuario.password" placeholder="Contraseña">

<button class="btn btn-primary btn-block"  >Registrar  <span class="icon-floppy-disk"></span> </button>

</form>
<button ng-click="cancelar(usuario)" class="btn btn_defauld btn-block">Cancelar  <span class="icon-cross"></span></button>


<table class="table">

<thead>
<tr>
<th>Eliminar</th>
<th>Correo</th>
<th>Nombre</th>
<th>Contraseña</th>
<th>Editar</th>

</tr>

</thead>

<!-- class="scroll" -->
<tbody >
<tr ng-repeat="usuario in usuarios">

<td><a ng-click="eliminar(usuario)"><span class="icon-bin"></span></a></td>
<td>{{usuario.login}}</td>
<td>{{usuario.name}}</td>
<td>{{usuario.password}}</td>
<td><a ng-click="editarUsuario(usuario)"><span class="icon-pencil"></span></a></td>

</tr>



</tbody>



</table>


</div>






</div>
</div>
</jsp:body>
</customTags:page>
