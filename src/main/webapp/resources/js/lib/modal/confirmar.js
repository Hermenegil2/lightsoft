/**
 * 
 */

angular.module("confirmar",[]);

console.log('Ingrese a confirmar');

angular.module("confirmar").run(function($templateCache){

	$templateCache.put("view/confirmar.html",'<div class="modal fade">  {{$id}}' + 
		      '<div class="modal-dialog">' + 
		      '<div class="modal-content">' + 
		        '<div class="modal-header">' + 
		          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
		          '<h4 class="modal-title">{{ title }}</h4>' + 
		        '</div>' + 
		        '<div  class="modal-body" ng-transclude> '+
		        '<h5 class="">{{message}}</h5>' +
		        '<button class="button" value="SI"></button>'+
		        '<button class="button" value="NO"></button>'
		        +'</div>' + 
		      '</div>' + 
		    '</div>' + 
		  '</div>');


	});

angular.module("confirmar").directive('ventana', function () {
	
	return{
		templateUrl:"view/confirmar.html",
		restrict:"AE",
		scope:{
			title:"@",
			message:"@"

		},
		transclude:true,
		link:function(scope,element,attrs,ctrl){
		//	$(element).ventana('show');
			  scope.$parent[attrs.visible] = true;
		}
		
		
		
	};

  });