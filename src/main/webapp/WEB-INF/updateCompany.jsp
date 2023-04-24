<%@ page import="com.example.companyemployeeservlet.model.Company" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23.04.2023
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Company</title>
</head>
<body>
<%Company company = (Company) request.getAttribute("company");%>
<a href="/companies">Back</a>
<h2>Update Company</h2>
<form action="/updateCompany" method="post">
  <input name="id" type="hidden" value="<%=company.getId()%>">
  name: <input type="text" name="name" value="<%=company.getName()%>"><br>
    country: <input type="text" name="country" value="<%=company.getCountry()%>">
  <input type="submit" value="update">
</form>
</body>
</html>
