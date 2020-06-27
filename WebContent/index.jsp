<%
    if(session.getAttribute("login")!=null)
    {
        response.sendRedirect("welcome.jsp"); //session login user not back to index.jsp page or not type direct in url
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HMS Login</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css">
        <script language="javascript">	
	function validate()
	{
            var username = document.LoginForm.txt_username; //get form name "LoginForm" and textbox name "txt_username" store in variable username
            var password = document.LoginForm.txt_password; //get form name "LoginForm" and textbox name "txt_password" store in variable password
				
            if (username.value == null || username.value == "") //check username textbox not blank
            {
		window.alert("please enter username ?"); //alert message
		username.style.background = '#f08080'; //set textbox color
		username.focus();
		return false;
            }
            if (password.value == null || password.value == "") //check password textbox not blank
            {
		window.alert("Please Enter Password!"); //alert message
		password.style.background = '#f08080'; //set textbox color
		password.focus();
		return false;
            }
	}		
	</script>
    </head>
    <body>  
        <div class="login">
            <h1>Login</h1>
            <form method="post" action="LoginController" name="LoginForm" onsubmit="return validate();">
                <label for="username">
                    <i class="fas fa-user"></i>
                </label>
                <input type="text" name="txt_username" placeholder="Username" id="username" required>
                <label for="password">
                    <i class="fas fa-lock"></i>
                </label>
                <input type="password" name="txt_password" placeholder="Password" id="password" required>
                <div class="msg">
                    <%
                    if(request.getAttribute("WrongLoginMsg")!=null)
                    {
                        out.println(request.getAttribute("WrongLoginMsg")); //get login error message from LoginController
                    }
                    %>
                </div>
                <input type="submit" name="btn_login" value="Login">
            </form>
        </div>
    
    </body>
</html>

