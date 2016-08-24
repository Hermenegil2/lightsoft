<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
  <h1>Modal example</h1>
  <button ng-click="toggleModal()" class="btn btn-default">Open modal</button>
    
  <modal title="Login form" visible="showModal">
    <form role="form" ng-submit="registrar(entidad)">
      <div class="form-group">
        <label for="email">Email address</label>
        <input ng-model="entidad.email" type="email" class="form-control" id="email" placeholder="Enter email" />
      </div>
      <div class="form-group">
        <label for="password">Password</label>
        <input ng-model="entidad.password" type="password" class="form-control" id="password" placeholder="Password" />
      </div>
      <button type="submit" class="btn btn-default">Submit</button>
    </form>
  </modal>

</div>
</div>
</body>
</html>