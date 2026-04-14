<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,model.Student" %>
<%@ page session="true" %>

<%
List<Student> list = (List<Student>) request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<title>Student List</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background: #ffffff;
}

/* Navbar */
.navbar {
    background: #007bff;
    color: white;
    padding: 15px;
    display: flex;
    justify-content: space-between;
}

.navbar a {
    color: white;
    text-decoration: none;
    margin-left: 15px;
}

/* Container */
.container {
    padding: 30px;
}

/* Table */
table {
    width: 90%;
    margin: auto;
    border-collapse: collapse;
    background: #f9f9f9;
    border-radius: 10px;
    overflow: hidden;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}

th, td {
    padding: 12px;
    text-align: center;
}

th {
    background: #007bff;
    color: white;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

/* Buttons */
.btn {
    padding: 6px 12px;
    border-radius: 5px;
    text-decoration: none;
    color: white;
    font-size: 14px;
}

.edit {
    background: orange;
}

.delete {
    background: red;
}

/* Back Button */
.back {
    display: inline-block;
    margin: 20px;
    padding: 8px 15px;
    background: #28a745;
    color: white;
    border-radius: 5px;
    text-decoration: none;
}
</style>

</head>
<body>

<!-- Navbar -->
<div class="navbar">
    <div><b>Student Management</b></div>
    <div>
        <a href="dashboard.jsp">Dashboard</a>
    </div>
</div>

<div class="container">

<h2 style="text-align:center;">Student List</h2>

<% if(list != null && !list.isEmpty()) { %>

<table>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Course</th>
<th>Marks</th>
<th>Action</th>
</tr>

<% for(Student s : list) { %>
<tr>
<td><%=s.getId()%></td>
<td><%=s.getName()%></td>
<td><%=s.getEmail()%></td>
<td><%=s.getCourse()%></td>
<td><%=s.getMarks()%></td>

<td>
<a class="btn edit"
   href="StudentServlet?action=edit&id=<%=s.getId()%>">Edit</a>

<a class="btn delete"
   href="StudentServlet?action=delete&id=<%=s.getId()%>"
   onclick="return confirm('Are you sure?')">Delete</a>
</td>
</tr>
<% } %>

</table>

<% } else { %>

<p style="text-align:center; font-size:18px;">No students found 😔</p>

<% } %>

<br>

<div style="text-align:center;">
    <a class="back" href="dashboard.jsp">⬅ Back to Dashboard</a>
</div>

</div>

</body>
</html>