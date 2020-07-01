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
		var msg = "" + '${msg}';
		if (msg != "") {
			if (msg == "success") {
				swal({
					title : "Success",
					text : "Patient Billing Confirmed!",
					icon : "success",
					button : "Okay",
				})
			} else if (msg == "failed") {
				swal({
					title : "Failed",
					text : "Patient Billing Not Confirmed, Please Try Again!",
					icon : "error",
					button : "Okay",
				});
			} 
		}
		
		
		$("#cancel").click(()=>{
			window.location.replace("./AdminDeskController?action=finalBilling");
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
	<%@ include file="../adminDeskHeader.jsp"%>
	<div class="container-login100">
		<c:choose>
			<c:when test="${actionType !='show'}">
				<div class="container-login100">
					<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
						<span class="login100-form-title"
							style="font-size: 30px; color: crimson;">Final Billing</span><br />
						<form autocomplete="off" class="login100-form validate-form "
							id="Form" action="AdminDeskController" method="post">
							<div class="wrap-input100 validate-input m-b-23"
								data-validate="Enter a Valid Patient Id">
								<span class="label-input100">Patient ID</span> <input
									autocomplete="off" class="input100 form-control" type="text"
									id="id" maxLength="9" name="patient_id"
									placeholder="Enter the ID..." /> <span class="focus-input100"></span>
							</div>
							<input type="hidden" name="action" value="finalBilling">
							<input type="hidden" name="actionType" value="find">
						</form>
						<div class="col-md-12 text-center after-id">
							<button class="btn btn-primary active" id="reset">Reset</button>

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
									<th>Date of Discharge</th>
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
									<td>${todayDate}</td>
									<td>${patient.getType_of_room()}</td>
									<td>${patient.getStatus()}</td>
								</tr>
							</tbody>
						</table>
						<div class="text-right p-r-50">
							<strong>Number of Days:
								${numberOfDays}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Bill
								for Room: Rs.${roomAmout}</strong>
						</div>
					</div>
					<div class=" p-l-55 p-r-55 p-t-5 p-b-5 ">
						<span class="login100-form-title"
							style="font-size: 30px; color: crimson;">Pharmacy Charges</span><br />
					</div>

					<div class="table-responsive">
						<table class="table table-striped">
							<thead>
								<tr>
									<th>Medicine ID</th>
									<th>Medicine Name</th>
									<th>Quantity</th>
									<th>Rate</th>
									<th>Amount</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${medicines}" var="medicine">
									<tr>
										<td>${medicine.getMedicineId()}</td>
										<td>${medicine.getMedicineName()}</td>
										<td>${medicine.getQuantityIssued()}</td>
										<td>Rs.${medicine.getMedicinePrice()}</td>
										<td>Rs.${medicine.getQuantityIssued() * medicine.getMedicinePrice()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<div class="text-right p-r-110">
							<strong>Bill for Pharmacy: Rs.${medicineAmount}</strong>
						</div>
					</div>

					<div class=" p-l-55 p-r-55 p-t-5 p-b-5 ">
						<span class="login100-form-title"
							style="font-size: 30px; color: crimson;">Diagnostics
							Charges</span><br />
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
						<div class="text-right p-r-250">
							<strong>Bill for Diagnostics:
								Rs.${testAmount}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
						</div>
					</div>
					<div class="d-flex justify-content-center  p-t-40"
						style="font-size: 20px;">
						<strong>Grand Total: Rs.${grandTotal}</strong>
					</div>
					<div class="col-md-12  text-center p-t-20 p-b-20">
						<c:if test="${patient.getStatus() != 'ACTIVE'}">
							<div class="d-flex justify-content-center after"
								style="font-size: 25px;">
								<strong>***Patient Discharged***</strong>
							</div>
							<div class="p-t-10 p-b-0">
								<button class="btn btn-primary active" id="cancel">Back</button>
							</div>
						</c:if>

						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<c:if test="${patient.getStatus() == 'ACTIVE'}">
							<div class="col-md-12 text-center ">
								<button class="btn btn-primary active" id="cancel">Back</button>
								<button type="submit" form="patientForm"
									class="btn btn-primary active" id="confirm">Confirm</button>
							</div>
						</c:if>

					</div>
					<form autocomplete="off" class="login100-form validate-form before"
						id="patientForm" action="AdminDeskController" method="post">
						<input type="hidden" name="action" value="finalBilling" /> <input
							type="hidden" name="actionType" value="confirm" /> <input
							type="hidden" name="patient_id"
							value="${patient.getPatient_id() }" />
					</form>

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