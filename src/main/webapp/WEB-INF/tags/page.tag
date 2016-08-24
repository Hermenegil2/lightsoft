<%@attribute name="title" required="true" %>
<%@attribute name="bodyClass" required="true" %>
<%@attribute name="extraScripts" fragment="true" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<!doctype html>
<!--[if lt IE 7]><html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="pt"><![endif]-->
<!--[if IE 7]><html class="no-js lt-ie9 lt-ie8" lang="pt"><![endif]-->
<!--[if IE 8]><html class="no-js lt-ie9" lang="pt"><![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="pt">
<!--<![endif]-->
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<!-- <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"> -->
	


<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">


<script type="text/javascript" src="/lightsoft/resources/js/jquery-latest.js"></script>
<link rel="stylesheet" href="/lightsoft/resources/css/bootstrap-3.3.6-dist/css/bootstrap.css">
<script type="text/javascript" src="/lightsoft/resources/css/bootstrap-3.3.6-dist/js/bootstrap.js"></script>
<!-- <script src="https://rawgit.com/dwmkerr/angular-modal-service/master/dst/angular-modal-service.js"></script> -->

<script type="text/javascript" src="/lightsoft/resources/js/angular/angular.js"></script>
<link rel="stylesheet" href="/lightsoft/resources/css/fonts.css">
<!-- <link rel="stylesheet" href="/lightsoft/resources/css/estilos.css"> -->


<!-- <script type="text/javascript" src="/lightsoft/resources/js/main.js"></script>	 -->
	
	<style type="text/css">
	
	footer{
/* 	background-color:gray; */
/* 	margin-top: 180px; */
/* 	margin-right: auto; */
	
/* 	margin-left: auto; */
	
	}
	
	</style>
	

<title>${title}</title>
</head>


<body class="${bodyClass}">
    
    

	<%@include file="/WEB-INF/views/inicio/index.jsp" %>

	<jsp:doBody/>

	<%@include file="/WEB-INF/footer.jsp" %>
	
</body>
</html>
<jsp:invoke fragment="extraScripts"/>
<%-- <jsp:invoke fragment="extra"/> --%>


