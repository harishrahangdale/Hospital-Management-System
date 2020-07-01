<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.abc.beans.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>HMS-TCS</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="CSS and JS/image/png"
	href="CSS and JS/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/animate/animate.css">
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/css-hamburgers/hamburgers.min.css">
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="CSS and JS/css/util.css">
<link rel="stylesheet" type="text/css" href="CSS and JS/css/main.css">
<script src="CSS and JS/vendor/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/sweetalert.min.js"></script>
<script>
	$(document).ready(function() {
		"use strict";

		/*==================================================================
		[ Validate ]*/
		var input = $('.validate-input .input100');

		$('#login').click(function(){
	        var check = true;
	        for(var i=0; i<input.length; i++) {
	            if(validate(input[i]) == false){
	                showValidate(input[i]);
	                check=false;
	            }            
	        }
	        if(check){
				var userName = "";
				var password = "";
				userName = $("#userName").val();
				password = $("#password").val();
				
				var obj={userName,password};	
				//alert(JSON.stringify(obj));
				$.ajax({
		            url:'UserController',
		            data:obj,
		            type:'post',
		            cache:false,
		            async: false,
		            success:function(data){
		            	if("failed"===data){	            		
		            	swal({
		            		  title: "Incorrect Credentials",
		            		  text: "Login failed please try again!",
		            		  icon: "error",
		            		  button: "Okay",
		            		}).then((value) => {
		            			if(value){
		            				location.reload(true);
		            				}
		            		});
		            	}else{
		            	window.location.href = "./Dashboard.jsp";
		            	}
		            },
		            error:function(){
		            	swal({
		            		  title: "Failed",
		            		  text: "No Response from the server! Try Again",
		            		  icon: "error",
		            		  button: "Okay",
		            		});
		            }
		         });
				}
	        return false;
	    });

		$('.validate-form .input100').each(function() {
			$(this).focus(function() {
				hideValidate(this);
			});
		});

		function validate(input) {
			if ($(input).val().trim() == '') {
				return false;
			}
		}

		function showValidate(input) {
			var thisAlert = $(input).parent();

			$(thisAlert).addClass('alert-validate');
		}

		function hideValidate(input) {
			var thisAlert = $(input).parent();

			$(thisAlert).removeClass('alert-validate');
		}

	});

	$(document).keypress(function(event) {
		var keycode = (event.keyCode ? event.keyCode : event.which);
		if (keycode == '13') {
			$('#login').click();
		}
	});
	
	$(document).keypress(function(event){
	    var keycode = (event.keyCode ? event.keyCode : event.which);
	    if(keycode == '13'){
	        $('#login').click();    
	    }
	});
</script>
</head>
<body>
	<%
		//SESSION CHECK (LOGGED IN OR NOT)  	
	User user = (User) session.getAttribute("currentUser");

	if (user != null) {
		response.sendRedirect("Dashboard.jsp");
	}

	//Back Button Cache Security
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0");//Proxies
	%>
	<div class="limiter">
		<div class="container-login100 "
			style="background-image: url('CSS and JS/images/2.jpg'); background-repeat: no-repeat; background-size: cover;">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-10 p-b-54"
				style="opacity: 0.99;">
				<span class="login100-form-title"
					style="font-size: 40px; color: #111d5e;">ABC Hospital
					Management System</span>
				<div class="login100-pic js-tilt " data-tilt>
					<img src="CSS and JS/images/img-01.png" width="300" height="275"
						alt="HMS-TCS">
				</div>
				<br> <br>
				<form autocomplete="off" class="login100-form validate-form">
					<span class="login100-form-title"
						style="font-size: 28px; color: green;">Login</span>

					<div class="wrap-input100 validate-input"
						data-validate="Enter a Valid Username">
						<input class="input100" type="text" id="userName" name="userName"
							placeholder="Username"> <span class="focus-input100"></span>
						<span class="symbol-input100"> <i class="fa fa-user"
							aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input"
						data-validate="Enter a Valid Password">
						<input class="input100" type="password" id="password"
							name="password" placeholder="Password"> <span
							class="focus-input100"></span> <span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" id="login" style="color: white;">Login</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="CSS and JS/vendor/jquery/jquery-3.2.1.min.js"></script>
	<script src="CSS and JS/vendor/bootstrap/js/popper.js"></script>
	<script src="CSS and JS/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="CSS and JS/vendor/select2/select2.min.js"></script>
	<script src="CSS and JS/vendor/tilt/tilt.jquery.min.js"></script>
	<script>
		$('.js-tilt').tilt({
			scale : 1.1
		})
	</script>
</body>
</html>