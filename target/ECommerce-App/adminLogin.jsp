<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Login</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<header>

<a href="index.jsp" class="logo">

Jewelry World

</a>

</header>

<div class="login-container">

<div class="login-box">

<h2>

Admin Login

</h2>

<form action="AdminLoginServlet" method="post">

<input
type="email"
name="email"
placeholder="Admin Email"
required>

<input
type="password"
name="password"
placeholder="Password"
required>

<button type="submit">

Login

</button>

</form>

</div>

</div>

</body>

</html>