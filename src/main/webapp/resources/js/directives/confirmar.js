









angular.module("confirmar",[]);

//angular.module("confirmar").run(function($templateCache){
//
//	$templateCache.put();
//
//
//	});


angular.module("confirmar").directive("diConfirmar",function(){
	
	return{
		template:'<div class="ui-alert">{{$id}}<div class="ui-alert-title">{{title}}</div>'+
		'<div class="ui-alert-message" >{{message}}</div></div>',
	  replace:true,
	  retrict:"AE",
	  scope:{
		  title:"@",
		  message:"@"
	  },
	  translude:true
	 
		
	}
	
});

//'<div class="modal fade">  {{$id}}' + 
//'<div class="modal-dialog">' + 
//'<div class="modal-content">' + 
//  '<div class="modal-header">' + 
//    '<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>' + 
//    '<h4 class="modal-title">{{ title }}</h4>' + 
//  '</div>' + 
//  '<div class="modal-body" ></div>' + 
//'</div>' + 
//'<div class="modal-footer">'+
//'<button class="btn btn-primary" type="button" ng-click="ok()">OK</button>'+
//'<button class="btn btn-warning" type="button" ng-click="cancel()">Cancel</button>'+
//'</div>'+
//
//'</div>' + 
//'</div>'

//'<div class="ui-alert">{{$id}}<div class="ui-alert-title">{{title}}</div>'+
//'<div class="ui-alert-message" ng-transclude>{{message}}</div></div>'
