<%@ page import="com.example.companyemployeeservlet.model.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 27.04.2023
  Time: 19:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home Page</title>
</head>
<body>
<%User user = (User) session.getAttribute("user");%>
Welcome<%=user.getName()%><%=user.getSurname()%><a href="/logout">logout</a><br>
<a href="/employees">Employees</a>
<a href="/companies">Companies</a>
</body>
</html>
