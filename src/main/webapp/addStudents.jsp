<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>

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
    text-align: center;
    font-size: 20px;
}

/* Container */
.container {
    display: flex;
    justify-content: center;
    margin-top: 60px;
}

/* Card */
.card {
    width: 400px;
    background: #f9f9f9;
    padding: 30px;
    border-radius: 12px;
    box-shadow: 0px 0px 10px rgba(0,0,0,0.1);
}

/* Inputs */
input {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 6px;
    border: 1px solid #ccc;
}

/* Button */
button {
    width: 100%;
    padding: 12px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
}

button:hover {
    background: #0056b3;
}

/* Back Link */
.back {
    display: block;
    text-align: center;
    margin-top: 15px;
    text-decoration: none;
    color: #007bff;
}
</style>

</head>
<body>

<!-- Navbar -->
<div class="navbar">
    ➕ Add Student
</div>

<!-- Form -->
<div class="container">
    <div class="card">

        <h2 style="text-align:center;">Enter Student Details</h2>

        <form action="StudentServlet" method="post">
            <input type="hidden" name="action" value="add">

            <input type="text" name="name" placeholder="Enter Name" required>
            <input type="email" name="email" placeholder="Enter Email" required>
            <input type="text" name="course" placeholder="Enter Course" required>
            <input type="number" name="marks" placeholder="Enter Marks" required>

            <button type="submit">Add Student</button>
        </form>

        <a class="back" href="dashboard.jsp">⬅ Back to Dashboard</a>

    </div>
</div>

</body>
</html>