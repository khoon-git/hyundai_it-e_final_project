<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="app" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
         <style>
            .page{
                position:absolute;
                top:40%;
                left:50%;
                transform:translate(-50%, -50%);
            }
            
            .row {
   				 	display: inline-grid;
    				width: 100%;
    				align-items: center;
    				justify-items: center;
				}
			.a_label {
    
    			margin-bottom: 20px !important;
    
					}	

			input[type=checkbox], input[type=radio] {
    		  margin: 3px 7px 0px 0 !important;
 
				}
            
        </style>
</head>
<body>
<div class="page">
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
						<div class="card-body">
							<h5 class="card-title text-center">Log In</h5>
							<form class="loginForm" method="post" action="${app}/login">
								<div class="form-label-group">
									<input class="form-control" placeholder="ID" name="username"
										type="text" autofocus>
								</div>
								<br>
								<div class="form-label-group">
									<input class="form-control" placeholder="Password"
										name="password" type="password" value="">
								</div>

								<hr class="my-4">
								<label class="a_label"> <input name="remember-me"
									type="checkbox">자동 로그인
								</label>
								<button
									class="btn btn-lg btn-secondary btn-block text-uppercase btn-success loginBtn"
									onclick="location='login'">LOGIN</button>
								<input type="hidden" name="${_csrf.parameterName }"
									value="${_csrf.token }" />
							</form>
						</div>
					</div>
      </div>
    </div>
  </div>
 </div>
 <script type="text/javascript"
	src="<c:url value="/webjars/jquery/3.6.0/dist/jquery.js" />"></script>
 <script>
$(document).ready(function() {
	var loginForm = $("#loginForm");
	$("#loginBtn").on("click", function(e) {
		e.preventDefault();
		loginForm.submit();
	});
});
</script>
</body>
</html>