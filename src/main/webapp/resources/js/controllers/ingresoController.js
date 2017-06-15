/**
 * 
 */


angular.module("registroIngreso").controller("ingresoController",function($scope,$http){
	
	$scope.app="Registar Ingresos y Gastos";
	
	
	
	
	function isDefined(variable) {
	    return (typeof(variable) == "null")?  false: true;
	}

	
$scope.registrarIngreso=function(ingreso){

	ingreso.debe=undefined;
	ingreso.haber=undefined;
	

	console.log(ingreso);
	
	$http.post("http://localhost:8080/lightsoft/ingresogastos",ingreso).success(function(){
		
		$scope.ingreso=undefined;
		cargarIngresos();
		
		
	});
};	



var cargarIngresos=function(){

		$http.get("http://localhost:8080/lightsoft/ingresogastos.json").success(function(datos){
			var lista=datos.ingresoGastos;
			var totalDebe=0;
			var totalHaber=0;
			
			for(ingreso in lista){
				
//				lista[ingreso].descripcionIG!=null
				if(lista[ingreso].descripcionIG!=null){
				
					
					
				if(lista[ingreso].descripcionIG.tipo=="positivo"){
						
					lista[ingreso].debe=lista[ingreso].monto;
					totalDebe=totalDebe+lista[ingreso].monto;
				}else{
					lista[ingreso].haber=lista[ingreso].monto
					totalHaber=totalHaber+lista[ingreso].monto;
				}
				
				}
				
				
			}
			$scope.saldo=totalDebe-totalHaber;
			
			$scope.totalDebe=totalDebe;
			$scope.totalHaber=totalHaber;
			
			$scope.ingresos=lista;
			
//			$scope.ingreso={fechaIngreso:new Date()}
			

			$scope.ingreso={usuario:{login:"magzoaa@gmail.com"},fechaIngreso:new Date()};
			
		});
};

var cargarDescripcion=function(){
	
	$http.get("http://localhost:8080/lightsoft/descripcionigs.json").success(function(dato){
		//console.log(dato.descripcion);
		
		$scope.descripcions=dato.descripcion;
		
	});
};

$scope.agregarDescripcion=function(ingreso,descripcionIG){
	if(ingreso==undefined){
		ingreso=new Object();
	}
	ingreso.descripcionIG=descripcionIG;
	$scope.ingreso=ingreso;
	
};

$scope.isIngresoSeleccionado=function(ingresos){
	return ingresos.some(function(ingreso){
		return ingreso.seleccionado;
	});
	
};

$scope.editarIngreso=function(ingreso){
	$scope.ingreso=ingreso;
	$scope.ingreso.fechaIngreso=new Date(ingreso.fechaIngreso);
	
	requesFocus('monto');
	
};

$scope.eliminarIngreso=(function(ingresos){
	
	if(confirm("Esta seguro de eliminar? el tota de registros es: "+ingresos.length)){
	
	$scope.ingresos=ingresos.filter(function(ingreso){
		if(!ingreso.seleccionado)return ingreso;
		});
	
	
	var eliminados=ingresos.filter(function(ingreso){
		
		if(ingreso.seleccionado){
			
			delete ingreso.seleccionado;
			ingreso.debe=undefined;
			ingreso.haber=undefined;

			return ingreso
		}
			
	});
	
//		$scope.message=eliminados;
		
	console.log(eliminados)
	$http.post("http://localhost:8080/lightsoft/ingresogastos/eliminarMasivo",eliminados).success(function(ingresos){
	
		
	}).error(function(eliminados){

		$scope.message="Ocurrio un problema"+ingresos;
	});
	
	
	return false;
	}
});

$scope.cancelar=function(){
	
	
$scope.ingreso=undefined;
	
};

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


var requesFocus=	function foco(idElemento){
	 document.getElementById(idElemento).focus();
	}
			                
     $scope.showModal = false;

	
	cargarIngresos();
	cargarDescripcion();
	
	
});
