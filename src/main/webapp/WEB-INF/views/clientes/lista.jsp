<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%-- <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> --%>
<%-- <%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%> --%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" type="text/css" href="resources/css/bootstrap-3.3.6-dist/css/bootstrap.css">
</head>
<body>

	<div>
		${success}
	</div>

<div class="table-responsive">
<table class="table">

<thead>



<tr>
<td>Nombre</td>
<td>Celular</td>
<td>Dirección</td>
<td>Email</td>
<td>Observación</td>
</tr>


</thead>

<tbody>


<%-- <a href="${spring:mvcUrl('CC#show').arg(0,cli.id).build()}">${cli.nombre}</a> --%>

<c:forEach items="${clientes}" var="cli">
<tr>
<td>${cli.nombre}</td>
<td>${cli.celular}</td>
<td>${cli.direccion}</td>
<td>${cli.email}</td>
<td>${cli.observacion}</td>
</tr>

</c:forEach>
</tbody>

<tfoot></tfoot>



</table>
</div>



</body>
</html>