<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
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
<link rel="stylesheet" type="text/css" href="CSS and JS/css/util.css" />
<link rel="stylesheet" type="text/css" href="CSS and JS/css/main.css" />
<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  margin: 0;
}

html {
  box-sizing: border-box;
}

*, *:before, *:after {
  box-sizing: inherit;
}

p {
  font-weight: bold;
}

.column {
  float: left;
  width: 33.3%;
  margin-bottom: 16px;
  padding: 0 8px;
}

.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
  margin: 8px;
}

.about-section {
  padding: 50px;
  padding-top:65px;
  text-align: center;
  background-color: #002266;
  color: white;
  height:100%;
}

.container {
  padding: 0 16px;
}

.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}

@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}
</style>

</head>
<body style="background-image: url('CSS and JS/images/home.jpg'); background-repeat: no-repeat; background-attachment: fixed; background-size: cover;">
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
					<c:when test="${currentUser.getWorkGroup() =='diagnostician'}">
						<%@ include file="diagnosticianHeader.jsp"%>
					</c:when>
				</c:otherwise>
			</c:choose>
		</c:otherwise>
	</c:choose>
	<br>
<div class="about-section">
  <h1 style="text-align:center;">Our Team</h1>
  
</div>
<div class="container">
<div class="row">
  <div class="column col align-self-center">
    <div class="card">
      <img src="CSS and JS/images/male.png" alt="Harish Rahangdale" style="width:100%">
      <div class="container">
        <h2>Bhavya Sinha</h2>
        <p class="title">Developer</p>
        <p>DT20195556833</p>
        <p>bhavyapreeti99@gmail.com</p>
        <p><button class="button" onclick="window.open('https://www.linkedin.com/in/bhavya99/','_blank')">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column col align-self-center">
    <div class="card">
      <img src="CSS and JS/images/female.png" alt="Bhavya" style="width:100%">
      <div class="container">
        <h2>Ruchi Nagpal</h2>
        <p class="title">Developer</p>
        <p>DT20195590416</p>
        <p>ruchhinagpal@gmail.com</p>
        <p><button class="button" onclick="window.open('https://www.linkedin.com/in/ruchi-nagpal-1a58421aa/','_blank')">Contact</button></p>
      </div>
    </div>
  </div>
</div>

<div class="row">
  <div class="column col align-self-center">
    <div class="card">
      <img src="CSS and JS/images/female.png" alt="Ruchi Nagpal" style="width:100%">
      <div class="container">
        <h2>Harish Rahangdale</h2>
        <p class="title">Developer</p>
        <p>DT20195543443</p>
        <p>hsr.29978@gmail.com</p>
        <p><button class="button" onclick="window.open('https://www.linkedin.com/in/harishrahangdale/','_blank')">Contact</button></p>
      </div>
    </div>
  </div>

  <div class="column col align-self-center">
    <div class="card">
      <img src="CSS and JS/images/male.png" alt="Vandan Karwa" style="width:100%">
      <div class="container">
        <h2>Vandan Karwa</h2>
        <p class="title">Developer</p>
        <p>CT20172285431</p>
        <p>vandankarwa@gmail.com</p>
        <p><button class="button" onclick="window.open('https://www.linkedin.com/in/vandan-karwa-b8739a169/','_blank')">Contact</button></p>
      </div>
    </div>
  </div>
</div>
  </div>
  </div>
 

	<script type="text/javascript" src="CSS and JS/js/jquery-3.5.1.min.js"></script>
	<%@ include file="footer.jsp"%>
</body>
</html>