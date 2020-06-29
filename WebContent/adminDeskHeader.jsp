<%@page import="com.hms.beans.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="CSS and JS/css/bootstrap.min.css">
<link rel="stylesheet" href="CSS and JS/css/font-awesome.min.css">
<script src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<script src="CSS and JS/js/popper.min.js"></script>
<script src="CSS and JS/js/bootstrap.min.js"></script>
<style type="text/css">
.btn-group {
	padding: 4px;
}
</style>
</head>
<body>
	<%
		//SESSION CHECK (LOGGED IN OR NOT)  	
	User user = (User) session.getAttribute("currentUser");
	String __jspName = this.getClass().getSimpleName().replaceAll("_", ".");
	if ( user == null) {
		response.sendRedirect("./index.jsp");
	} else if ( user.getWorkGroup().contentEquals("cashier") && !(__jspName.contentEquals("Dashboard.jsp"))) {
		response.sendRedirect("./Dashboard.jsp");
	}
	

	//Back Button Cache Security
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");//HTTP 1.1
	response.setHeader("Pragma", "no-cache");//HTTP 1.0
	response.setHeader("Expires", "0");//Proxies
	%>
	<div class="bs-example">
		<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
			<a href="#" class="navbar-brand" style="font-weight: bold;">HMS-TCS</a>
			<button type="button" class="navbar-toggler" data-toggle="collapse"
				data-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav btn-group">
					<a href="AdminDeskController?action=Dashboard"
						class="nav-item nav-link active">Home</a>

				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Manage Patient Details</button>
					<div class="dropdown-menu" style="background-color: #dddddd;">
						<a href="AdminDeskController?action=createPatient"
							class="dropdown-item btn btn-outline-light">Create Patient</a>
						<div class="dropdown-divider"></div>
						<a href="AdminDeskController?action=updatePatient"
							class="dropdown-item btn btn-outline-light">Update Patient</a>
						<div class="dropdown-divider"></div>
						<a href="AdminDeskController?action=deletePatient"
							class="dropdown-item btn btn-outline-light">Delete Patient</a>
						<div class="dropdown-divider"></div>
						<a href="AdminDeskController?action=viewAllPatients&currentPage=1"
							class="dropdown-item btn btn-outline-light">View All Patients</a>
					</div>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Online Search</button>
					<div class="dropdown-menu" style="background-color: #dddddd">
						<a href="AdminDeskController?action=searchPatient"
							class="dropdown-item btn btn-outline-light">Search for Patient</a>
					</div>
				</div>

				<div class="btn-group">
					<button type="button" class="btn btn-primary dropdown-toggle"
						data-toggle="dropdown"
						style="background-color: #222831; border: 2px solid #222831;">Patient Billing</button>
					<div class="dropdown-menu" style="background-color: #dddddd">
						<a href="AdminDeskController?action=findBilling"
							class="dropdown-item  btn btn-outline-light">Find Billing</a>
					</div>
				</div>
				<div class="navbar-nav btn-group">
					<a href="AdminDeskController?action=about"
						class="nav-item nav-link active">About</a>

				</div>

				<form class="form-inline ml-auto" action="UserController"
					method="get">
					<span class="label-input100"
						style="font-weight: bold; font-size: 20px; color: white; text-transform: capitalize;">${currentUser.getUserName()}</span>
					&ensp;&ensp; <input type="hidden" name="action" value="logout">
					<button type="submit" class="btn btn-outline-light">Logout</button>
				</form>
			</div>
		</nav>
	</div>
</body>
</html>