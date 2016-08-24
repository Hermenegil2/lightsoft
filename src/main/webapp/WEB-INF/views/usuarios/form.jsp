
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


<script type="text/javascript" src="/lightsoft/resources/css/bootstrap-3.3.6-dist/js/bootstrap.js"></script>

<script type="text/javascript" src="/lightsoft/resources/js/directives/confirmar.js"></script>


<script type="text/javascript">



angular.module("registroUsuario",["confirmar"]);

angular.module("registroUsuario").controller("usuarioController",function($scope,$http){
	
	$scope.app="Registro de Usuario";
	
	
	
	
$scope.registrarUsuario=function(usuario){
	
	$http.post("http://localhost:8080/lightsoft/usuarios",usuario).success(function(){
		
		console.log(usuario);
		delete $scope.usuario;
		cargarUsuarios();
		
	});
	
	
};


var cargarUsuarios=function(){
	
	console.log('Ingrese');
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


// 		$scope.showModal=function(){
// 			$scope.nuevoMiembro={};
// 			var modalInstance=$modal.open({
// 				templateURL:'/lightsoft/resources/ventana/add-miembros.html'
// 			})};
				
// 				 $scope.modalInstance = {};
// 			        $scope.showModal= function () {
			  
			        	
			        	
// 			            $scope.modalInstance = $modal.open({
// 			                templateUrl: '/lightsoft/resources/ventana/add-miembros.html',
// 			                controller: 'ModalInstanceCtrl'
// 			            });
// 			        };



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
	cargarUsuarios();
	
});

//var mymodal = angular.module('mymodal', []);

// angular.module("registroUsuario").controller('usuarioController', function ($scope) {
//     $scope.showModal = false;
  
//     $scope.toggleModal = function(){
//         $scope.showModal = !$scope.showModal;
//     };    
    
//     $scope.registrar=function(entidad){
//     	console.log(entidad);
//     	$scope.mostrar=entidad;
//     	$scope.cancel();
    	
//     };
//     $scope.cancel = function (){
//     $scope.showModal=false;
//     };
    
//   });

angular.module("registroUsuario").directive('modal', function () {
// 	{{$id}}
    return {
      template: '<div class="modal fade">  {{$id}}' + 
      '<div class="modal-dialog">' + 
      '<div class="modal-content">' + 
        '<div class="modal-header">' + 
          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
          '<h4 class="modal-title">{{ title }}</h4>' + 
        '</div>' + 
        '<div class="modal-body" ng-transclude></div>' + 
      '</div>' + 
    '</div>' + 
  '</div>' ,
      restrict: 'E',
      transclude: true,
      replace:true,
      scope:true,
      
      link: function postLink(scope, element, attrs) {
        scope.title = attrs.title;
        

        scope.$watch(attrs.visible, function(value){
          if(value==true){
        	  
        	  console.log($(element));
            $(element).modal('show');
          } else{
            $(element).modal('hide');
          }
        });

        $(element).on('shown.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = true;
          });
        });

        $(element).on('hidden.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = false;
          });
        });
      }
    };
  });



// '<div class="modal fade">' + 
// '<div class="modal-dialog">' + 
//   '<div class="modal-content">' + 
//     '<div class="modal-header">' + 
//       '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
//       '<h4 class="modal-title">{{ title }}</h4>' + 
//     '</div>' + 
//     '<div class="modal-body" ng-transclude></div>' + 
//   '</div>' + 
// '</div>' + 
// '</div>'

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

.ui-alert {
	background-color: #F2DEDE;
	padding: 20px;
	border-radius: 5px;
	margin-top: 20px;
	margin-bottom: 20px;
}

.ui-alert-title {
	color: #AF4341;
	font-weight: bold;
	font-size: 24px;
}

.ui-alert-message {
	color: #AF4341;
}

.ui-accordion-title {
	border: 1px solid #CCCCCC;
	cursor: pointer;
	background: -moz-linear-gradient(top, #CCCCCC, #EEEEEE);
	padding: 10px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 5px 5px 0px 0px;
	margin-top: 10px;
	text-align: left;
}
.ui-accordion-content {
	border: 1px dashed #CCCCCC;
	border-top: 0px;
	border-radius: 0px 0px 5px 5px;
	background-color: #FFFFFF;
	padding: 10px;
	margin-bottom: 10px;
	font-size: 14px;
	text-align: left;
}



</style>


</jsp:attribute>

<jsp:body>













<div ng-app="registroUsuario">

<div ng-controller="usuarioController">




<di-confirmar title="Confirmar Eliminacion" message="Hola mundo">

Desea Eliminar el Registro?
</di-confirmar>

<!-- <div  ng-app="mymodal"> -->
<!-- <div  ng-controller="MainCtrl" class="container"> -->


<!-- <div ng-include="'http://localhost:8080/lightsoft/resources/ventana/externo.html'"> -->

<!-- </div> -->


  <button ng-click="toggleModal()" class="btn btn-default">Open modal</button>
    
    {{$id}}
  <modal title="Login form" visible="showModal">
  
  {{$id}}
    <form role="form">
      <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" class="form-control" id="email" placeholder="Enter email" ng-model="entidad.email" />
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" placeholder="Password" ng-model="entidad.pass" />
      </div>
      <button type="submit" class="btn btn-default" ng-click="registrar(entidad)">Submit</button>
    </form>
  </modal>

<!-- </div> -->
<!-- </div> -->





{{mostrar}}
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
