<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>	

<head>

<title>Menu</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<link rel="stylesheet" href="resources/css/estilos.css">
<!-- <link rel="stylesheet" href="resources/css/fonts.css"> -->

<script type="text/javascript" src="resources/js/jquery-latest.js"></script>
<script type="text/javascript" src="resources/js/main.js"></script>

</head>

<!-- id="layout-header" -->
	
	<header >
	

<div class="menu_bar">
			<a href="#" class="bt-menu"><span class="icon-menu"></span>Menu</a>
		</div>
 
		<nav>
			<ul>
				<li><a href="#"><span class="icon-home"></span>Inicio<span class=""></span></a></li>
				<li class="submenu"><a href="#"><span class="icon-pencil2"></span>Trabajos<span class=""></span></a>
				
				<ul class="children">
					<li><a href="#">Sub Elemento #1 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #2 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked2"></span></a></li>
					</ul>
				

				</li>
				<li class="submenu">
<!-- 				Agregar icono de navegación si necesario    icon-circle-down-->
				<a href="#"><span class="icon-list"></span>Registro<span class=""></span></a>
					<ul class="children">
<!-- 					target="principal" -->
					<li><a href="clientes/formulario" >Registrarse como Cliente<span class="icon-radio-checked"></span></a></li>
					<li><a href="productos/form">Registrar Producto<span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked"></span></a></li>
					</ul>
				</li>
				<li class="submenu">
				<a href="#"><span class="icon-stack"></span>Servicios<span class=""></span></a>
				
				<ul class="children">
					<li><a href="#">Sub Elemento #1 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #2 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked"></span></a></li>
					</ul>
				
				</li>
				<li class="submenu">
				
				<a href="#"><span class="icon-mail2"></span>Contactos<span class=""></span></a>
				
				<ul class="children">
					<li><a href="#">Sub Elemento #1 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #2 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked"></span></a></li>
					</ul>
				
				</li>
				
				<li class="submenu"><a href="#"><span class="icon-pencil2"></span>Trabajos<span class=""></span></a>
				
				<ul class="children">
					<li><a href="#">Sub Elemento #1 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #2 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked2"></span></a></li>
					</ul>
				

				</li>
				
				
				
			</ul>
		</nav>

	
	
	
	
<!-- 	<div class="embed-container"> -->
<!-- 	<iframe  id="principal" name="principal"> -->
    
<!--     </iframe> -->
	
<!-- 	</div> -->
	
	
</header>
