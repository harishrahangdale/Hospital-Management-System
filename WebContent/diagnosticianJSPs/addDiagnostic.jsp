<%@page import="com.hms.beans.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Diagnostic</title>
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
<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
<script>
	$(document).ready(function() {
		$("#cancel").click(()=>{
			window.location.replace("./DiagnosticianController?action=addDiagnostic");
		});
		var msg = "" + '${msg}';
		if (msg != "") {
			if (msg == "success") {
				swal({
					title : "Success",
					text : "Diagnostic Added Successfully",
					icon : "success",
					button : "Okay",
				})
			} else if (msg == "failed") {
				swal({
					title : "Failed",
					text : "Diagnostic Not Added, Please Try Again!",
					icon : "error",
					button : "Okay",
				});
			} else {
				swal({
					title : "Failed",
					text : "Patient already taken the Test",
					icon : "warning",
					button : "Okay",
				});
			}
		}
		
		$("#issue").click(()=>{
			$(".after").css("display", "none");
        	$(".before").css("display", "block");
		});
		
		$("#reset1").click(()=>{
			$(".after").css("display", "block");
        	$(".before").css("display", "none");
		});
		
		var actionType = "" + '${actionType}';
		if (actionType == "error") {
			swal({
				title : "Failed",
				text : "Patient ID Not found",
				icon : "error",
				button : "Okay",
			});
		}
		$("#reset").click(function() {
			$("#id").val("");
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
		var input = $('.validate-input .input100');
		$('#Form').on('submit', function(e) {
			var check = true;
			for (var i = 0; i < input.length; i++) {
				if (validate(input[i]) == false) {
					showValidate(input[i]);
					check = false;
				}
			}
			return check;
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
	<%@ include file="../diagnosticianHeader.jsp"%>
	<div class="container-login100">
		<c:choose>
			<c:when test="${actionType !='show'}">
				<div class="container-login100">
					<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
						<form autocomplete="off" class="login100-form validate-form "
							id="Form" action="DiagnosticianController" method="post">
							<div class=" p-l-55 p-r-55 p-t-5 p-b-5 ">
								<span class="login100-form-title"
									style="font-size: 30px; color: crimson;">Add Diagnostics</span><br />
							</div>
							<div class="wrap-input100 validate-input m-b-23"
								data-validate="Enter a Valid Patient Id">
								<span class="label-input100">Patient ID</span> <input
									autocomplete="off" class="input100 form-control" type="text"
									id="id" maxLength="9" name="patient_id"
									placeholder="Enter the ID..." /> <span class="focus-input100"></span>
							</div>
							<input type="hidden" name="action" value="addDiagnostic">
							<input type="hidden" name="actionType" value="find">
						</form>
						<div class="col-md-12 text-center after-id">
							<button class="btn btn-primary active" id="reset">Reset</button>
							&ensp;
							<button type="submit" form="Form" class="btn btn-primary active">Find
								Patient</button>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="container my-4  p-t-30 p-b-30 "
					style="background-color: white;">
					<div class=" p-l-55 p-r-55 p-t-5 p-b-5 ">
						<span class="login100-form-title"
							style="font-size: 30px; color: crimson;">Patient Details</span><br />
					</div>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Patient ID</th>
									<th>Name</th>
									<th>Age</th>
									<th>Address</th>
									<th>Date of Admission</th>
									<th>Type of Room</th>
									<th>Status</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${patient.getPatient_id()}</td>
									<td>${patient.getPatient_name()}</td>
									<td>${patient.getPatient_age()}</td>
									<td>${patient.getAddress()},${patient.getCity()},
										${patient.getState()}</td>
									<td>${patient.getPatient_date_of_admission()}</td>
									<td>${patient.getType_of_room()}</td>
									<td>${patient.getStatus() }</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class=" p-l-55 p-r-55 p-t-5 p-b-5 ">
						<span class="login100-form-title"
							style="font-size: 30px; color: crimson;">Diagnostics
							Conducted</span><br />
					</div>
					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Test ID</th>
									<th>Test Name</th>
									<th>Amount</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${tests}" var="test">
									<tr>
										<td>${test.getTest_id()}</td>
										<td>${test.getTest_name()}</td>
										<td>Rs.${test.getTest_charges()}</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
					<c:if test="${patient.getStatus() == 'ACTIVE'}">
						<div class="d-flex justify-content-center after">
							<button class="btn btn-primary active" id="cancel">Back</button>
							&ensp;
							<button class="btn btn-primary active after" id="issue">Add
								Diagnostic</button>
						</div>
					</c:if>

					<c:if test="${patient.getStatus() != 'ACTIVE'}">
						<div class="d-flex justify-content-center after"
							style="font-size: 25px;">
							<strong>***Patient Discharged***</strong>
						</div>
						<div class="d-flex justify-content-center after p-t-20">
							<button class="btn btn-primary active" id="cancel">Back</button>
						</div>
					</c:if>

					<br>
					<form style="display: none;" autocomplete="off"
						class="login100-form validate-form before" id="patientForm"
						action="DiagnosticianController" method="post">
						<div class="form-group row d-flex justify-content-center">
							<div class=" validate-input m-b-23 col-sm-3"
								data-validate="Select a valid room Type" id="div2">
								<span class="label-input100 ">Diagnostic Name</span> <select
									id="test_id" name="test_id" class="input100 form-control">
									<c:forEach items="${availableTests}" var="test">
										<option value="${test.getTest_id()}">${test.getTest_name()}</option>
									</c:forEach>
								</select>

							</div>
						</div>

						<input type="hidden" name="action" value="addDiagnostic" /> <input
							type="hidden" name="actionType" value="check" /> <input
							type="hidden" name="patient_id"
							value="${patient.getPatient_id() }" />
					</form>
					<div class="col-md-12 d-flex justify-content-center before">
						<button style="display: none;"
							class="btn btn-primary active before" id="reset1">Cancel</button>
						&ensp; <input style="display: none;" type="submit"
							form="patientForm" class="btn btn-primary active before"
							id="submitForm" value="Update" />
					</div>


				</div>
			</c:otherwise>
		</c:choose>
	</div>

	<%@ include file="../footer.jsp"%>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/validation.js"></script>
	<script type="text/javascript" src="CSS and JS/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="CSS and JS/js/tether.min.js"></script>
</body>
</html>