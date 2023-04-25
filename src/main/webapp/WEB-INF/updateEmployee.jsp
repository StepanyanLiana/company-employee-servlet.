<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23.04.2023
  Time: 23:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<a href="/employees">Back</a>
<body>
<%Employee employee = (Employee) request.getAttribute("employee");%>
<%List<Integer> companyId = (List<Integer>) request.getAttribute("companiesList");%>
<a href="/employees">Back</a>
<h2>Update Employee</h2>
<form action="/updateEmployee" method="post">
    <input name="id" type="hidden" value="<%=employee.getId()%>">
    name: <input type="text" name="name" value="<%=employee.getName()%>"><br>
    surname: <input type="text" name="surname" value="<%=employee.getSurname()%>"><br>
    email: <input type="email" name="email" value="<%employee.getEmail();%>"><br>
    company_id: <select name="company_id" >
                        <%for (Integer company : companyId) {%>
                        <option value="<%=employee.getCompany().getId()%>"><%=company%>
    <% }%>
</select><br>
    <input type="submit" value="update">
</form>

</body>
</html>
