<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>

<head>


</head>

<customTags:page bodyClass="" title="Registro de Tipo de Gastos" >


<jsp:attribute name="extraScripts">

<style type="text/css">
[ng\:cloak], [ng-cloak], .ng-cloak {
  display: none !important;
}</style>


<!-- <link rel="stylesheet" href="/lightsoft/resources/css/ingreso_gasto.css"> -->
<!-- <script type="text/javascript" src="/lightsoft/resources/js/angular_main.js"></script> -->
<!-- <script type="text/javascript" src="/lightsoft/resources/js/controllers/ingresoController.js"></script> -->

<script type="text/javascript">

angular.module("pantallaInforme",[]);
angular.module("pantallaInforme").controller("informeController",function($scope,$http){

	$scope.generarInformeIG=function(i,tipo){
 	var	fecha_inicio=i.fecha_inicio.toJSON();
 	var	fecha_fin=i.fecha_fin.toJSON();
		window.open('http://localhost:8080/lightsoft/ingresogastos/reporteIngresoGasto/?format='+tipo+'&fecha_inicio='+fecha_inicio+'&fecha_fin='+fecha_fin,
				  '_blank' // <- This is what makes it open in a new window.
				);
	};
	
	$scope.i={fecha_inicio:new Date(),fecha_fin:new Date()};
	
});


</script>

</jsp:attribute>



<jsp:body >
<div ng-app="pantallaInforme">
<div ng-controller="informeController">


  

<div class="col-md-12">

<table class="table table-striped">
<thead>
<tr>
<th>Listado e Informes</th>
<th>Rango Inicio</th>
<th>Rango Fin</th>
<th>PDF</th>
<th>2003</th>
<th>Excel</th>
<th>HTML</th>
<th>CSV</th>
</tr>




</thead>


<tbody>

<tr>
<td>Listado de Ingresos y gastos</td>
<td><input type="date" value="" ng-model="i.fecha_inicio" class="form-control"></td>
<td><input type="date" value="" ng-model="i.fecha_fin" class="form-control"></td>
<td><a ng-click="generarInformeIG(i,'pdf')"><span class="icon-file-pdf"></span></a></td>
<td><a ng-click="generarInformeIG(i,'xls')"><span class="icon-file-excel"></span></a></td>
<td><a ng-click="generarInformeIG(i,'xlsx')"><span class="icon-file-excel"></span></a></td>
<td><a ng-click="generarInformeIG(i,'html')"><span class="icon-file-text2"></span></a></td>
<td><a ng-click="generarInformeIG(i,'csv')"><span class="icon-file-openoffice"></span></a></td>


</tr>



</tbody>

<tfoot>
</tfoot>


</table>
</div>

</div>
</div>
</jsp:body>


</customTags:page>