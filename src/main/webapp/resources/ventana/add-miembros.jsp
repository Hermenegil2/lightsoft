<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="modal-header">
<button type="button" class="close" ng-click="cancel()" data-dismiss="modal" aria-hidden="true">&times;</button>
<h1>Añadir un miembro</h1>
</div>

<div class="modal-body">
<label>Nombre</label><input type="text" ng-model="nuevoMiembro.nombre"></input>
<br>
<button class="btn btn-success" ng-click="salvarNuevoMiembro()">Salvar Miembro</button>

</div>


</body>
</html>