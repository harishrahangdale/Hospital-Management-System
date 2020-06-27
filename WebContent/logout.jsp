<%
    session.invalidate(); //session destroy
    response.sendRedirect("index.jsp"); //after destroy redirect to index.jsp page
%>