
angular.module("registrarModal",[]);



angular.module("registrarModal").run(function($templateCache){

	$templateCache.put("view/registrar.html",'<div ng-show="show" class="modal fade">  {{$id}}' + 
		      '<div class="modal-dialog">' + 
		      '<div class="modal-content">' + 
		        '<div class="modal-header">' + 
		          '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
		          '<h4 class="modal-title">{{ title }}</h4>' + 
		        '</div>' + 
		        '<div  class="modal-body" ng-transclude></div>' + 
		      '</div>' + 
		    '</div>' + 
		  '</div>');


	});

angular.module("registrarModal").directive('modal', function () {
// 	{{$id}}
    return {
    	templateUrl:"view/registrar.html",
      restrict: 'E',
      transclude: true,
      replace:true,
      scope:true,
      
      link: function postLink(scope, element, attrs) {
        scope.title = attrs.title;
        

        scope.$watch(attrs.visible, function(value){
          if(value==true){
        	 

        	// $(element).modal('show');
          } else{
        	  
        	  
         //  $(element).modal('hide');
          }
        });

        $(element).on('shown.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = true;
          });
        });

        $(element).on('hidden.bs.modal', function(){
          scope.$apply(function(){
            scope.$parent[attrs.visible] = false;
          });
        });
      }
    };
  });