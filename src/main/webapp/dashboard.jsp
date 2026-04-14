<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Student Dashboard</title>

<style>
body {
    margin: 0;
    font-family: Arial;
    background: #ffffff; /* White background */
}

/* Navbar */
.navbar {
    background: #007bff;
    color: white;
    padding: 15px;
    text-align: center;
    font-size: 20px;
}

/* Container */
.container {
    display: flex;
    justify-content: center;
    margin-top: 80px;
}

/* Card */
.card {
    width: 400px;
    background: #f9f9f9;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
    text-align: center;
}

/* Buttons */
.btn {
    display: block;
    width: 100%;
    padding: 12px;
    margin: 15px 0;
    background: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-size: 16px;
    transition: 0.3s;
}

.btn:hover {
    background: #0056b3;
}
</style>

</head>
<body>

<!-- Navbar -->
<div class="navbar">
    🎓 Student Management Dashboard
</div>

<!-- Content -->
<div class="container">
    <div class="card">

        <h2>Welcome 👋</h2>
        <p>Manage student records easily</p>

        <a class="btn" href="addStudents.jsp">➕ Add Student</a>
        <a class="btn" href="StudentServlet">📋 View Students</a>

    </div>
</div>

</body>
</html>