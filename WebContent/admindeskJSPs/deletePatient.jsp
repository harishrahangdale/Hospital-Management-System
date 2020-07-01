<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Delete Patient</title>
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
	
	
	$('#Form').keydown(function (e) {
	    if (e.keyCode == 13) {
	        e.preventDefault();
	        $("#patient_id").click();
	    }
	});
	
		$("#reset1").click(function(){
			$("#id").val("");
		});
			
		
		$("#reset").click(function(){
			location.reload(true);
		});
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
		
		$("#patient_id").click(function(){
			if (validate($("#id")) == false) {
				showValidate($("#id"));				
			}else{
				var patient_id="";
				patient_id=$("#id").val();
				var action= 'deletePatient';
				var actionType= 'fetch';
				var obj={patient_id,
		            	action,
		            	actionType
		            	};
				$.ajax({
		            url:'AdminDeskController',
		            data:obj,
		            type:'post',
		            cache:false,
		            async: false,
		            success:function(data){	
		            	if(data.hasOwnProperty("patient_id"))
		            		{
		            	$('#id').attr('readonly', true); 
		            	$('#patient_name').val(data.patient_name);
		            	$('#patient_date_of_admission').val(data.patient_date_of_admission);
		            	$('#type_of_room').val(data.type_of_room);
		            	$('#address').val(data.address);
		            	$('#city').val(data.city);
		            	$('#state').val(data.state);
		            	$('#patient_age').val(data.patient_age);
		            	$(".after-id").css("display", "none");
		            	$(".before-id").css("display", "block");
		            	$('#patient_date_of_admission').attr('readonly', true); 
		            	$('#patient_name').attr('readonly', true);
		            	$('#type_of_room').attr('readonly', true);
		            	$('#address').attr('readonly', true);
		            	$('#city').attr('readonly', true)
		            	$('#state').attr('readonly', true);
		            	$('#patient_age').attr('readonly', true);
		            	
		            		}else{
		            			swal({
				            		  title: "Failed",
				            		  text: "Patient ID Not found",
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
		   
		  });
		
		var input = $('.validate-input .input100');

		$('#submitForm').click( function(e) {
			var check = true;

			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}
			
			if(check){
			var patient_id="";
			var action = "deletePatient";
			var actionType="delete";
			e.preventDefault();
			patient_id=$("#id").val();
			var obj={actionType,action,patient_id };		
			//alert(JSON.stringify(obj));
			swal({
				  title: "Confirm Delete",
				  text: "Once deleted, you will not be able to recover!",
				  icon: "warning",
				  buttons: true,
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
			$.ajax({
	            url:'AdminDeskController',
	            data:obj,
	            type:'post',
	            cache:false,
	            async: false,
	            success:function(data){
	            	if(data==="success"){
	            	swal({
	            		  title: "Success",
	            		  text: "Patient Delete Successfully!",
	            		  icon: "success",
	            		  button: "Okay",
	            		}).then((value) => {
	            			window.location.reload();
	            		});	
	            	}else{
	            		swal({
		            		  title: "Failed",
		            		  text: "Patient Not Deleted! Try Again",
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
				  } else {
					    swal("Customer Not Deleted");
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
			if ($(input).val().trim() == '')
				return false;			
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
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
	<%@ include file="../adminDeskHeader.jsp"%>
	<div class="container-login100">
		<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
			<span class="login100-form-title"
				style="font-size: 30px; color: crimson;">Delete Patient</span><br />
			<form autocomplete="off" class="login100-form validate-form "
				id="Form">
				<div class="wrap-input100 validate-input m-b-23"
					data-validate="Enter a Valid Patient Id">
					<span class="label-input100">Patient ID</span> <input
						autocomplete="off" class="input100 form-control" type="text"
						id="id" maxLength="9" name="patient_id"
						placeholder="Enter the ID..." /> <span class="focus-input100"></span>
				</div>
			</form>
			<div class="col-md-12 text-center after-id">
				<button type="reset" class="btn btn-primary active" id="reset1">Reset</button>
				&ensp;
				<button class="btn btn-primary active" id="patient_id">Find
					Patient</button>
			</div>


			<form autocomplete="off" class="login100-form validate-form "
				id="patientForm">

				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Date of Admission">
					<span class="label-input100">Date of Admission</span> <input
						class="input100 form-control" type="text"
						id="patient_date_of_admission" name="patient_date_of_admission"
						placeholder="Enter the Date of Admission..." /> <span
						class="focus-input100"></span>
				</div>

				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid Name">
					<span class="label-input100">Name</span> <input
						class="input100 form-control" type="text" id="patient_name"
						name="patient_name" placeholder="Enter the name..." /> <span
						class="focus-input100"></span>
				</div>

				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid Age">
					<span class="label-input100 ">Age</span> <input
						class="input100 form-control" type="text" id="patient_age"
						name="patient_age" maxLength="3" /> <span class="focus-input100"></span>
				</div>


				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Select a valid room Type">
					<span class="label-input100 ">Type Of Room</span> <input
						class="input100 form-control" type="text" id="type_of_room"
						name="type_of_room" /> <span class="focus-input100"></span>
				</div>


				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid Address">
					<span class="label-input100">Address</span>
					<textarea name="address" id="address" class="input100 form-control"
						form="patientForm" placeholder="Enter the address..."></textarea>
					<span class="focus-input100"></span>
				</div>

				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid City">
					<span class="label-input100">City</span> <input
						class="input100 form-control" type="text" id="city" name="city"
						placeholder="Enter the name..." /> <span class="focus-input100"></span>
				</div>

				<div style="display: none;"
					class="wrap-input100 validate-input m-b-23 before-id"
					data-validate="Enter a Valid State">
					<span class="label-input100">State</span> <input
						class="input100 form-control" type="text" id="state" name="state"
						placeholder="Enter the name..." /> <span class="focus-input100"></span>
				</div>

				<div style="display: none;" class="col-md-12 text-center before-id">
					<input type="reset" class="btn btn-primary active" id="reset"
						value="Cancel"> &ensp;
					<button class="btn btn-primary active" id="submitForm">Delete</button>
				</div>

			</form>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript"
		src="../CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../CSS and JS/js/validation.js"></script>
</body>
</html>