<%@ page import="com.example.companyemployeeservlet.model.Company" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservlet.model.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23.04.2023
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <% List<Company> companyList = (List<Company>) request.getAttribute("companiesList");%>
</head>
<body>
<a href="/employees"> Back</a>
<h2>Create Employee</h2>
<form action="/createEmployee" method="post">
    name: <input type="text" name="name"><br>
    surname: <input type="text" name="surname"><br>
    email: <input type="email" name="email"><br>
    company: <select name="company_id">
    <% for (Company company : companyList) {%>
    <option value="<%=company.getId()%>"><%=company.getName()%><%=company.getCountry()%></option>
        <%}%>
</select><br>
    <input type="submit" value="create">
</form>
</body>
</html>
