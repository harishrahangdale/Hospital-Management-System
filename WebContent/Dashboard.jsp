<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
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
</head>
</head>
<body>
	<!-- Adding Header Based on the user  -->
	<c:choose>
		<c:when test="${currentUser.getWorkGroup() =='adminDesk'}">
			<%@ include file="adminDeskHeader.jsp"%>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${currentUser.getWorkGroup() =='pharmacist'}">
					<%@ include file="pharmacistHeader.jsp"%>
				</c:when>
				<c:otherwise>
					<%@ include file="diagnosticianHeader.jsp"%>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<div class="limiter">
		<div class="container-login100"
			style="background-image: url('CSS and JS/images/home.jpg');">
			<span class="login100-form-title"
				style="font-family: 'Cambria'; font-weight: bold; font-size: 70px; color: #e71414; text-transform: capitalize;">Welcome
				${ currentUser.getUserName() }!</span><br />
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54"
				style="opacity: 0;"></div>
		</div>
	</div>
	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>