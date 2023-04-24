<%@ page import="java.util.List" %>
<%@ page import="com.example.companyemployeeservlet.model.Company" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 23.04.2023
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Companies</title>
</head>
<%List<Company> companies = (List<Company>) request.getAttribute("companies");%>
<body>
<h2>Companies</h2><a href="/createCompany">Create Company</a>
<table border="1">
  <tr>
    <th>id</th>
    <th>name</th>
    <th>country</th>
    <th>action</th>
  </tr>
  <% if(companies!= null && !companies.isEmpty()) { %>
  <% for (Company company : companies) { %>
  <tr>
    <td><%=company.getId() %></td>
    <td><%=company.getName()%></td>
    <td><%=company.getCountry()%></td>
    <td><a href="/removeCompany?id=<%=company.getId()%>">Delete</a>
    / <a href="updateCompany?id=<%=company.getId()%>">Update</a>
    </td>
  </tr>
  <% } %>
  <% } %>
</table>
</body>
</html>
