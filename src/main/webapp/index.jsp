<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23.04.2023
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main page</title>
</head>
<body>
<%
    if (session.getAttribute("user") != null) {
        response.sendRedirect("/home");
    }
    String msg = (String) session.getAttribute("msg");
%>
<% if (msg != null) {%>
<span style="color: red"><%=msg%></span><br>
<%session.removeAttribute("msg");
}%>
login:
<form action="/login" method="post">
   email: <input name="email" type="text"><br>
  password:  <input name="password" type="password"><br>
    <input type="submit" value="login">
</form>
<a href="/register.jsp">Register</a>
</body>
</html>
