<%@page import="com.hms.beans.Patient"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Patient Status</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<link rel="icon" type="image/png"
	href="CSS and JS/images/icons/home.ico" />
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
		$("#reset").on("click", function() {
			window.location = "./AdminDeskController?action=Dashboard";
		});
	});
</script>
</head>
<body
	style="background-image: url('CSS and JS/images/other.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
	<%@ include file="../adminDeskHeader.jsp"%>
	<div class="container-login100">
		<c:choose>
			<c:when test="${actionType =='show'}">

				<div class="container my-4  p-t-10 p-b-20 "
					style="background-color: white;">
					<div class=" p-l-55 p-r-55 p-t-30 p-b-0 ">
						<span class="login100-form-title"
							style="font-size: 28px; color: crimson;">Patients Details</span>
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
									<th>View details</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${patients}" var="patient">
									<tr>
										<td>${patient.getPatient_id()}</td>
										<td>${patient.getPatient_name()}</td>
										<td>${patient.getPatient_age()}</td>
										<td>${patient.getAddress()},${patient.getCity()},
											${patient.getState()}</td>
										<td>${patient.getPatient_date_of_admission()}</td>
										<td>${patient.getType_of_room()}</td>
										<td>
											<form action="AdminDeskController" method="post">
												<input type="hidden" name="action" value="viewAllPatients">
												<input type="hidden" name="currentPage"
													value="${currentPage}"> <input type="hidden"
													name="id" value="${patient.getPatient_id()}">
												<div class="btn-group">
													<input type="submit" class="btn btn-primary active"
														value="View Details" />
												</div>
											</form>
										</td>
									</tr>
								</c:forEach>
							</tbody>

						</table>
					</div>
					<nav aria-label="Navigation for Patients"
						class="d-flex justify-content-center">
						<ul class="pagination">
							<c:if test="${currentPage != 1}">
								<li class="page-item"><a class="page-link"
									href="AdminDeskController?action=viewAllPatients&currentPage=${currentPage-1}">Previous</a>
								</li>
							</c:if>

							<c:forEach begin="1" end="${pages}" var="i">
								<c:choose>
									<c:when test="${currentPage eq i}">
										<li class="page-item active"><a class="page-link">
												${i} <span class="sr-only">(current)</span>
										</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="AdminDeskController?action=viewAllPatients&currentPage=${i}">${i}</a>
										</li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${currentPage lt pages}">
								<li class="page-item"><a class="page-link"
									href="AdminDeskController?action=viewAllPatients&currentPage=${currentPage+1}">Next</a>
								</li>
							</c:if>
						</ul>
					</nav>
					<div class="col-md-12 text-center">
						<button class="btn btn-primary active" id="reset">Back</button>
					</div>
				</div>

			</c:when>
			<c:otherwise>
				<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
					<span class="login100-form-title"
						style="font-size: 20px; color: crimson;">Viewing Patient
						ID: ${patient.getPatient_id()}</span><br />
					<form autocomplete="off" id="patientForm">
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Patient ID</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the id..."
									value="${patient.getPatient_id()}" readonly />
							</div>
							<div class="col-sm-6">
								<span class="label-input100">Name</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the name..."
									value="${patient.getPatient_name()}" readonly />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<span class="label-input100">Date of Admission</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the Date of Admission"
									value="${patient.getPatient_date_of_admission()}" readonly />
							</div>
							<div class="col-sm-3">
								<span class="label-input100">Age</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the age..."
									value="${patient.getPatient_age()}" readonly />
							</div>
							<div class="col-sm-3">
								<span class="label-input100">Status</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the status..."
									value="${patient.getStatus()}" readonly />
							</div>
						</div>
						<div class="form-group row">

							<div class="col-sm-12">
								<span class="label-input100">Type of Room</span> <input
									class="input100 form-control" type="text"
									placeholder="Enter the type of room..."
									value="${patient.getType_of_room()}" readonly />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-12" data-validate="Enter a Valid Address">
								<span class="label-input100">Address</span>
								<textarea class="input100 form-control" form="patientForm"
									placeholder="Enter the address..." readonly>${patient.getAddress()}, ${patient.getCity()}, ${patient.getState()}</textarea>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<a class="btn btn-primary active"
								href="AdminDeskController?action=viewAllPatients&currentPage=${currentPage}">Back</a>
						</div>
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