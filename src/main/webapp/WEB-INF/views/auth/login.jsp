<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<title>Login Page</title>


<link rel="stylesheet" type="text/css" href="http://localhost:8080//lightsoft/resources/css/bootstrap-3.3.6-dist/css/bootstrap.css">

<script type="text/javascript" src="http://localhost:8080//lightsoft/resources/js/angular/angular.min.js"></script>
<script type="text/javascript">

var mymodal = angular.module('mymodal', []);

mymodal.controller('MainCtrl', function ($scope) {
    $scope.showModal = false;
//     $scope.toggleModal = function(){
//         $scope.showModal = !$scope.showModal;
//     };
    
    
    
    $scope.toggleModal = function() {
    	  $scope.showDialogFavoriteSelect = true;
    	};
    
    
    
    
    
  });

mymodal.directive('modal', function () {
    return {
      template: '<div class="modal fade">' + 
          '<div class="modal-dialog">' + 
            '<div class="modal-content">' + 
              '<div class="modal-header">' + 
                '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
                '<h4 class="modal-title">{{ title }}</h4>' + 
              '</div>' + 
              '<div class="modal-body" ng-transclude></div>' + 
            '</div>' + 
          '</div>' + 
        '</div>',
      restrict: 'E',
      transclude: true,
      replace:true,
      scope:true,
      link: function postLink(scope, element, attrs) {
        scope.title = attrs.title;

        scope.$watch(attrs.visible, function(value){
          if(value == true)
            $(element).modal('show');
          else
            $(element).modal('hide');
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


mymodal.directive("modalShow", function () {
    return {
        restrict: "A",
        scope: {
            modalVisible: "="
        },
        link: function (scope, element, attrs) {
            //Hide or show the modal
            scope.showModal = function (visible) {
                if (visible)
                {
                    element.modal("show");
                }
                else
                {
                    element.modal("hide");
                }
            }
            //Check to see if the modal-visible attribute exists
            if (!attrs.modalVisible)
            {
                //The attribute isn't defined, show the modal by default
                scope.showModal(true);
            }
            else
            {
                //Watch for changes to the modal-visible attribute
                scope.$watch("modalVisible", function (newValue, oldValue) {
                    scope.showModal(newValue);
                });

                //Update the visible value when the dialog is closed through UI actions (Ok, cancel, etc.)
                element.bind("hide.bs.modal", function () {
                    // scope.modalVisible = false;
                    _.defer(function(){scope.$apply(scope.modalVisible = false);});
                });
            }
        }
    };
});



</script>




<style type="text/css">

#formulario{

padding-top:30px;
width: 200px;
margin: 0 auto;

}

body {

	
	width:450px;
	height:300px;
	margin: 0 auto;
	margin-top: 30px;
}



</style>



</head>
<!-- panel panel-primary -->
<body class="" ng-app="mymodal">

















<div  >
<div  ng-controller="MainCtrl" class="container">

<button ng-click='toggleModal()'></button>
       <div modal-show modal-visible="showDialogFavoriteSelect" class='modal fade'>
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h3>My Modal</h3>
            </div>
            <div class="modal-body">
              </div>
            </div>
          </div>
        </div>
       </div>











  <h1>Modal example</h1>
  <button ng-click="toggleModal()" class="btn btn-default">Open modal</button>
    
  <modal title="Login form" visible="showModal">
    <form role="form">
      <div class="form-group">
        <label for="email">Email address</label>
        <input type="email" class="form-control" id="email" placeholder="Enter email" />
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" class="form-control" id="password" placeholder="Password" />
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
  </modal>
</div>
</div>




	<div class="panel-heading">
	Login with Username and Password
	</div>
	
<!-- 	action="<c:url value="/shopping"/>"  name='username'  name='password'-->
	
	<div id="formulario">
	<form:form servletRelativeAction="/login"  >
	
	<div class="form-group">
				<label>User:</label>
				<input type="text" name="username" class="form-control"/>
			</div>
			
			
			<div class="form-group">
			<label>Password:</label>
				
				<input type="password" name="password" class="form-control" />
				</div>
				
			<input name="submit" type="submit" value="Login" class="btn btn-primary" />
	</form:form>
</div>
</body>
</html>