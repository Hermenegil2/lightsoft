<%@taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<head>

<title>Menu</title>
<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

<link rel="stylesheet" href="/lightsoft/resources/css/estilos.css">
<link rel="stylesheet" href="/lightsoft/resources/css/fonts.css">

<script type="text/javascript" src="/lightsoft/resources/js/jquery-latest.js"></script>
<script type="text/javascript" src="/lightsoft/resources/js/main.js"></script>

</head>


<header>
		<div class="menu_bar">
			<a href="#" class="bt-menu"><span class="icon-menu"></span>Menu</a>
		</div>
 
		<nav>
			<ul>
				<li><a href="/lightsoft/"><span class="icon-home"></span>Inicio<span class=""></span></a></li>
				<li class="submenu"><a href="#"><span class="icon-pencil2"></span>Trabajos<span class=""></span></a>
				
				<ul class="children">
					<li><a href="#">Sub Elemento #1 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #2 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked2"></span></a></li>
					</ul>
				

				</li>
				<li class="submenu">
<!-- 				Agregar icono de navegaciï¿½n si necesario    icon-circle-down-->
				<a href="#"><span class="icon-list"></span>Registro<span class=""></span></a>
					<ul class="children">
<!-- 					ng-class="{active:agregar('clientes/formulario')}" -->
					<li ><a  href="/lightsoft/clientes/form">Registrarse como Cliente<span class="icon-radio-checked"></span></a></li>
					<li ><a  href="/lightsoft/descripcionigs/form">Registro de Tipo de Gasto<span class="icon-radio-checked"></span></a></li>
					<li><a href="/lightsoft/productos/form">Registrar Producto<span class="icon-radio-checked"></span></a></li>
					<li><a href="/lightsoft/usuarios/form">Registrar Usuario<span class="icon-radio-checked"></span></a></li>
					</ul>
				</li>
				<li class="submenu">
				<a href="#"><span class="icon-stack"></span>Servicios<span class=""></span></a>
				
				<ul class="children">
					<li><a href="/lightsoft/ingresogastos/form">Registrar Gastos e Ingresos<span class="icon-radio-checked"></span></a></li>
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
				
				<li class="submenu"><a href="#"><span class="icon-pencil2"></span>Listados<span class=""></span></a>
				
				<ul class="children">
					<li><a href="/lightsoft/ingresogastos/helloReport2" target="_blank">Listado de Ingresos y Gastos<span class="icon-radio-checked2"></span></a></li>
					<li><a href="/lightsoft/pantalla_informe">Informes<span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #3 <span class="icon-radio-checked2"></span></a></li>
					<li><a href="#">Sub Elemento #4 <span class="icon-radio-checked2"></span></a></li>
					</ul>
				

				</li>
				
				<li class="submenu"><a href="/lightsoft/login"><span class="icon-home2"></span>Cerrar Seción<span class=""></span></a>
				
				</li>
				
				
			</ul>
		</nav>
	</header>
