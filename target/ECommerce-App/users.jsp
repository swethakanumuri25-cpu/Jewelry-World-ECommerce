<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>View Users</title>

<link rel="stylesheet" href="css/style.css">

<style>

.users-container{

    width:90%;

    margin:40px auto;

}

.users-container h1{

    text-align:center;

    color:#6B3F00;

    margin-bottom:30px;

}

table{

    width:100%;

    border-collapse:collapse;

    background:white;

    border-radius:15px;

    overflow:hidden;

    box-shadow:0 10px 25px rgba(0,0,0,.15);

}

th{

    background:#6B3F00;

    color:white;

    padding:15px;

    font-size:18px;

}

td{

    padding:18px;

    text-align:center;

    border-bottom:1px solid #eee;

    font-size:17px;

}

tr:hover{

    background:#faf5ef;

}

</style>

</head>

<body>

<header>

<a href="adminDashboard.jsp" class="logo">

Jewelry World Admin

</a>

<nav>

<a href="adminDashboard.jsp">

Dashboard

</a>

<a href="LogoutServlet">

Logout

</a>

</nav>

</header>

<section class="users-container">

<h1>

Registered Users

</h1>

<table>

<tr>

<th>ID</th>

<th>Full Name</th>

<th>Email</th>

</tr>

<%

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM users ORDER BY id DESC");

ResultSet rs = ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("id")%></td>

<td><%=rs.getString("fullname")%></td>

<td><%=rs.getString("email")%></td>

</tr>

<%

}

rs.close();
ps.close();
con.close();

%>

</table>

</section>

</body>

</html>