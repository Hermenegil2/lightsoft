
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>

<head>


</head>

<customTags:page bodyClass="" title="Registro de Tipo de Gastos" >


<jsp:attribute name="extraScripts">


<link rel="stylesheet" href="/lightsoft/resources/css/ingreso_gasto.css">
<script type="text/javascript" src="/lightsoft/resources/js/angular_main.js"></script>

<script type="text/javascript" src="/lightsoft/resources/js/controllers/ingresoController.js"></script>


<script type="text/javascript" src="/lightsoft/resources/js/lib/modal/registrarModal.js"></script>

<script type="text/javascript" src="/lightsoft/resources/js/lib/modal/confirmar.js"></script>


</jsp:attribute>



<jsp:body >

<div class="row" ng-app="registroIngreso">
<div ng-controller="ingresoController" >



		
<!-- <ventana title="Ventana de Confirmación" message="Desea Eliminar el Elemento?"> -->

<!-- Hola Mundo -->

<!-- </ventana> -->










<!--   <button ng-click="toggleModal()" class="btn btn-default">Open modal</button> -->
    
<!--     {{$id}} -->
<!--   <modal title="Login form" visible="showModal"> -->
  
<!--   {{$id}} -->
<%--     <form role="form"> --%>
<!--       <div class="form-group"> -->
<!--         <label for="email">Email address</label> -->
<!--         <input type="email" class="form-control" id="email" placeholder="Enter email" ng-model="entidad.email" /> -->
<!--       </div> -->
<!--       <div class="form-group"> -->
<!--         <label for="password">Password</label> -->
<!--         <input type="password" class="form-control" id="password" placeholder="Password" ng-model="entidad.pass" /> -->
<!--       </div> -->
<!--       <button type="submit" class="btn btn-default" ng-click="registrar(entidad)">Submit</button> -->
<%--     </form> --%>
<!--   </modal> -->



<!-- {{mostrar}} -->






<div class="col-md-4">
<h5 ng-bind="app"></h5>


<form>
<input class="form-control" type="text" ng-model="ingreso.usuario.login">
 <input class="form-control" type="date" ng-model="ingreso.fechaIngreso" placeholder="Fecha Evento">

 <input class="form-control" type="text" ng-model="ingreso.descripcionIG.descripcion" placeholder="Seleccione un tipo de Gasto " disabled="disabled">
 <input class="form-control" type="text" ng-model="ingreso.monto"  placeholder="Monto" id="monto">
 <input class="form-control" type="text" ng-model="ingreso.observacion"  placeholder="Observación" id="observacion">



<button class="btn btn-primary" ng-click="registrarIngreso(ingreso)">Registrar</button>
<button class="btn btn-defauld" ng-click="cancelar()">Cancelar</button>
<button class="btn btn-danger" ng-click="eliminarIngreso(ingresos)" ng-if="isIngresoSeleccionado(ingresos)">Eliminar</button>


</form>

<!-- {{ingreso}} -->
</div>



<div class="col-md-7">
<label for="search">Busqueda de Tipo de Gasto</label> 
					<input id="search" type="search" required
						ng-model="criterioDeBuscadescripcionIG"> 

<h5 align="center">Seleccione el tipo de Gasto</h5>

<div class="scroll">
<table class="table table-striped">

<thead>
<tr>
<th>#</th>
<th>Descripcion</th>
<th>Tipo</th>
<th>Observacion</th>
<th>Agregar	</th>
</tr>

</thead>

<tbody >
<tr ng-repeat="descripcionIG in descripcions | filter:criterioDeBuscadescripcionIG">
<td>{{descripcionIG.id}}</td>
<td>{{descripcionIG.descripcion}}</td>
<td>{{descripcionIG.tipo}}</td>
<td>{{descripcionIG.observacion}}</td>
<td><a ng-click="agregarDescripcion(ingreso,descripcionIG)" class="icon-arrow-left"></a></td>

</tr>


</tbody>




</table>
</div>

</div>


<!--                        -->




<div class="col-md-12">

<h5>Historial de Ingresos y Gastos</h5>

					<label for="search">Busqueda</label> 
					<input id="search" type="search" required
						ng-model="criterioDeBusca"> 
				

<hr>


<div class="scroll">
<table class="table">

<thead>
<tr > 
<th>Eliminar</th>
<th>#</th>
<th>Descripcion</th>
<th>Fecha Registro</th>
<th>Debe</th>
<th>Haber</th>
<th>Observación</th>
<th>Editar</th>


</tr>

</thead>



<tbody >
<tr ng-class="{'seleccionado negrita':ingreso.seleccionado}" ng-repeat="ingreso in ingresos | filter:criterioDeBusca | orderBy:criterioDeOrdenacion:direccionDeOrdenacion">
<td><input type="checkbox" ng-model="ingreso.seleccionado"></input><span ng-class="{'icon-bin':ingreso.seleccionado}"></span></td>
<td>{{ingreso.id}}</td>
<td>{{ingreso.descripcionIG.descripcion}}</td>
<td>{{ingreso.fechaIngreso | date:'dd/MM/yyyy HH:mm'}}</td>
<td >{{ingreso.debe |number}}</td>
<td>{{ingreso.haber |number}}</td>

<td>{{ingreso.observacion}}</td>

<td><a ng-click="editarIngreso(ingreso)" class="icon-pencil"></a></td>



</tbody>

<tfoot>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td><input id="totalDebe" type="number" ng-model="totalDebe" class="form-control" placeholder="Total Debe" disabled="disabled"></td>
<td><input id="totalHaber" type="number" ng-model="totalHaber" class="form-control" placeholder="Total Haber" disabled="disabled"></td>
<td></td>

</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td></td>
<td>Saldo</td>
<td><input type="number" ng-model="saldo" class="form-control" placeholder="Saldo" id="saldo" disabled="disabled"></td>
<td></td>
</tr>

</tfoot>


</table>

</div>






<!-- <div class="row" > -->
<!-- <div class="col-xs-1"> -->
<!-- </div> -->

<!-- </div> -->








</div>
</div>
</div>

</jsp:body>

</customTags:page>