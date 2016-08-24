<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="customTags"%>


<%-- <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> --%>
<%-- <%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>     --%>
    
<!-- <!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<!-- <title>Formulario de Registro de Cliente</title> -->


<!-- <link rel="stylesheet" type="text/css" href="resources/css/bootstrap-3.3.6-dist/css/bootstrap.css"> -->

<!-- </head> -->
<!-- class="panel panel-primary" -->

<customTags:page bodyClass="" title="Ejemplo Titulo" >


<jsp:attribute name="extraScripts">


<style type="text/css">

.panel-primary{
/* padding-top:30px; */

 	margin: 0 auto; 
 	margin-top: 20px; 
 	margin-bottom:20px;
 	width: 500px;
}
.form-group{


}
#formulario{

/* margin-top: 5px;  */
/*  	margin-bottom:5px; */
/*  	margin-right: 5	px; */
/*  	margin-left: 5	px; */


}

body {

	
/*  	width:450px;  */
/*  	height:300px;  */
/*  	margin: 0 auto;  */
/*  	margin-top: 30px;  */
}

.panel-heading{


}

</style>


</jsp:attribute>






<jsp:body>




<div class="panel-primary">
<!-- <body class="panel panel-primary"> -->

<div class="panel panel-heading">
			Registrese para una atención personalizada
	</div>

<div id="formulario">

<%-- ${spring:mvcUrl('saveCliente').build()} --%>
	<form:form action="" method="post" commandName="cliente" enctype="multipart/form-data">



<!-- INPUT DE SEGURIDAD AL TENER LA ANOTACION EN LA CLASE SECURITYCONFIGURATION ES OPCIONAL EL INPUT--> 
<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/> --%>

<%-- <security:csrfInput/> --%>

<div class="form-group">
<label for="nombre">Nombre</label>
<input type="text" name="nombre" id="nombre" class="form-control"/>
<form:errors path="nombre"/>
</div>

<div class="form-group">
<label for="celular">Celular</label>
<input type="text" name="celular" id="celular" class="form-control"/>
<form:errors path="celular"/>
</div>

<div class="form-group">
<label for="direccion">Dirección</label>
<input type="text" name="direccion" id="direccion" class="form-control"/>
<form:errors path="direccion"/>
</div>

<div class="form-group">
<label for="email">Email</label>
<input type="email" name="email" id="email" class="form-control"/>
<form:errors path="email"/>
</div>



<div class="form-group">
<label for="observacion">Observación</label>
<textarea   name="observacion" class="form-control"></textarea>
<form:errors path="observacion"/>
</div>

<div>
<input type="submit" value="Enviar" class="btn btn-primary">

</div>



</form:form>


	

			
	</div>



<!-- </body> -->

	</div>


</jsp:body>
</customTags:page>

<!-- </html> -->