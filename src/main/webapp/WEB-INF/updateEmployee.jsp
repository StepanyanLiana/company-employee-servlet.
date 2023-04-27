<%@ page import="com.example.companyemployeeservlet.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservlet.model.Company" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Employee</title>
</head>
<a href="/employees">Back</a>
<body>
<%Employee employee = (Employee) request.getAttribute("employee");%>
<%List<Company> companyId = (List<Company>) request.getAttribute("companiesList");%>
<a href="/employees">Back</a>
<h2>Update Employee</h2>
<form action="/updateEmployee" method="post">
    <input name="id" type="hidden" value="<%=employee.getId()%>">
    name: <input type="text" name="name" value="<%=employee.getName()%>"><br>
    surname: <input type="text" name="surname" value="<%=employee.getSurname()%>"><br>
    email: <input type="email" name="email" value="<%employee.getEmail();%>"><br>
    company: <select name="company_id" >
                        <%for (Company company : companyId) {%>
                        <option value="<%=employee.getCompany().getId()%>"><%=company.getName()%><%=company.getCountry()%>
    <% }%>
</select><br>
    <input type="submit" value="update">
</form>

</body>
</html>
