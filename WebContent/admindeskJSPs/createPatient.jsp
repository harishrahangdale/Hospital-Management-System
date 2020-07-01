<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Patient</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" type="image/png"
	href="CSS and JS/images/icons/favicon.ico" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/vendor/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/font-awesome-4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="CSS and JS/fonts/iconic/css/material-design-iconic-font.min.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/util1.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/main1.css" />
<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/sweetalert.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
<script>
$(document).ready(function() {
	
		"use strict";
		//   [ Focus input ]
		$('.input100').each(function() {
			$(this).on('blur', function() {
				if ($(this).val().trim() != "") {
					$(this).addClass('has-val');
				} else {
					$(this).removeClass('has-val');
				}
			})
		})
		//   [ Validate ]
		var input = $('.validate-input .input100');

		$('.validate-form').on('submit', function(e) {
			var check = true;

			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}
			
			if(check){
			var patient_name = "";
			var patient_SSN= "";
			var patient_age = "";
			var address = "";
			var city = "";
			var state = "";
			var type_of_room="";
			var action="";
			e.preventDefault();
			patient_name = $("#patient_name").val();
			patient_SSN = $("#patient_SSN").val();
			patient_age = $("#patient_age").val();
			address = $("#address").val();
			city = $("#city").val();
			state = $("#state").val();			
			type_of_room = $("#type_of_room").val();			
			action = $("#action").val();			
			var obj={patient_name,patient_SSN,patient_age,address,city,state,type_of_room,action};
			//alert(JSON.stringify(obj));			
			$.ajax({
	            url:'AdminDeskController',
	            data:obj,
	            type:'post',
	            cache:false,
	            async: false,
	            success:function(data){
	            	if(data!=="failed"){
	            	swal({
	            		  title: "Success",
	            		  text: "Patient Created Successfully with the ID:"+data,
	            		  icon: "success",
	            		  button: "Okay",
	            		}).then((value) => {
	            			$('#reset').click();
	            		});
	            	}else{
	            		swal({
		            		  title: "Patient Not Created, Duplication of Social Security Number!",
		            		  text: "Try Again",
		            		  icon: "error",
		            		  button: "Okay",
		            		});
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
	         }
	    );
			}
			return false;
		});

		$('.validate-form .input100').each(function() {
			$(this).focus(function() {
				hideValidate(this);
			});
		});

		function validate(input) {
			if ($(input).val().trim() == '')
				return false;
			switch ($(input).attr("name")) {
		    case "name":
		      return validate_name($(input).val().trim());
		    case "ssn":
		      return validate_ssno($(input).val().trim());
		    case "dob":
		      return validate_dob($(input).val().trim());
		    case "address":
		      return validate_address($(input).val().trim());
		    default:
			  return;
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

		function Validate() {
			var thisAlert = this.parent();

			$(thisAlert).addClass('alert-validate');
		}
	});
</script>
</head>
<body
	<%@ include file="../adminDeskHeader.jsp"%>
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">Create Patient</span><br />
			<form autocomplete="off" class="login100-form validate-form "
				id="patientForm">
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid Name">
					<span class="label-input100">Name</span> <input
						class="input100 form-control" type="text" id="patient_name"
						name="patient_name" placeholder="Enter the name..." /> <span
						class="focus-input100"></span>
				</div>

				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid SSN">
					<span class="label-input100" id="ssn">Social Security Number</span>
					<input class="input100 form-inline form-control" type="text"
						id="patient_SSN" name="patient_SSN" maxLength="9"
						placeholder="Enter the ssn..." /> <span class="focus-input100"></span>
				</div>
				<div class="form-group row">
					<div class=" validate-input m-b-23 col-sm-6"
						data-validate="Enter a Valid Age">
						<span class="label-input100 ">Age</span> <input
							class="input100 form-control" type="text" maxLength="3"
							id="patient_age" name="patient_age"
							placeholder="Enter the age..." />
					</div>

					<div class=" validate-input m-b-23 col-sm-6"
						data-validate="Select a valid room Type" id="div2">
						<span class="label-input100 ">Type Of Room</span> <select
							id="type_of_room" name="type_of_room"
							class="input100 form-control">
							<option value="Single Room" selected>Single Room</option>
							<option value="Semi-Sharing">Semi-Sharing</option>
							<option value="General Ward">General Ward</option>
						</select>
					</div>
				</div>
				<div class="wrap-input100 validate-input m-b-23 "
					data-validate="Enter a Valid Address">
					<span class="label-input100">Address</span>
					<textarea name="address" id="address" class="input100 form-control"
						form="patientForm" placeholder="Enter the address..."></textarea>
					<span class="focus-input100"></span>
				</div>
				<div class="form-group row">
					<div class=" validate-input m-b-23 col-sm-6"
						data-validate="Enter a Valid City">
						<span class="label-input100">City</span> <input
							class="input100 form-control" type="text" id="city" name="city"
							placeholder="Enter the City..." />
					</div>

					<div class=" validate-input m-b-23 col-sm-6"
						data-validate="Enter a Valid State">
						<span class="label-input100">State</span> <input
							class="input100 form-control" type="text" id="state" name="state"
							placeholder="Enter the State..." />
					</div>
				</div>

				<input type="hidden" id="action" name="action" value="createPatient" />
				<div class="col-md-12 text-center">
					<button type="reset" class="btn btn-primary active" id="reset">Reset</button>
					&ensp; <input type="submit" class="btn btn-primary active"
						id="submitForm" value="Create" />
				</div>
			</form>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
</body>
</html>