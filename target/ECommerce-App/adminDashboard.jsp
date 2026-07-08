<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

Connection con = DBConnection.getConnection();
Statement st = con.createStatement();

int totalProducts = 0;
int totalUsers = 0;
int totalOrders = 0;
int pendingOrders = 0;
int deliveredOrders = 0;
double revenue = 0;

ResultSet rs;

// Total Products
rs = st.executeQuery("SELECT COUNT(*) FROM products");
if(rs.next())
    totalProducts = rs.getInt(1);
rs.close();

// Total Users
rs = st.executeQuery("SELECT COUNT(*) FROM users");
if(rs.next())
    totalUsers = rs.getInt(1);
rs.close();

// Total Orders
rs = st.executeQuery("SELECT COUNT(*) FROM orders");
if(rs.next())
    totalOrders = rs.getInt(1);
rs.close();

// Pending Orders
rs = st.executeQuery("SELECT COUNT(*) FROM orders WHERE status='Pending'");
if(rs.next())
    pendingOrders = rs.getInt(1);
rs.close();

// Delivered Orders
rs = st.executeQuery("SELECT COUNT(*) FROM orders WHERE status='Delivered'");
if(rs.next())
    deliveredOrders = rs.getInt(1);
rs.close();

// Revenue (Delivered Orders Only)
rs = st.executeQuery("SELECT IFNULL(SUM(total),0) FROM orders WHERE status='Delivered'");
if(rs.next())
    revenue = rs.getDouble(1);
rs.close();

st.close();
con.close();
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

<link rel="stylesheet" href="css/style.css">

<style>

.dashboard{
    width:90%;
    margin:40px auto;
}

.dashboard h1{
    text-align:center;
    color:#6B3F00;
    margin-bottom:40px;
}

.stats{
    display:flex;
    justify-content:center;
    flex-wrap:wrap;
    gap:25px;
    margin-bottom:50px;
}

.stat-card{
    width:220px;
    background:white;
    padding:30px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 10px 25px rgba(0,0,0,.15);
    transition:.3s;
}

.stat-card:hover{
    transform:translateY(-5px);
}

.stat-card h2{
    color:#B8860B;
    font-size:42px;
    margin-bottom:10px;
}

.stat-card p{
    font-size:18px;
    color:#555;
    font-weight:bold;
}

.cards{
    display:flex;
    justify-content:center;
    flex-wrap:wrap;
    gap:30px;
}

.card{
    width:260px;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,.15);
    text-align:center;
}

.card h2{
    color:#6B3F00;
    margin-bottom:20px;
}

.card a{
    display:inline-block;
    background:#6B3F00;
    color:white;
    text-decoration:none;
    padding:12px 28px;
    border-radius:30px;
    transition:.3s;
}

.card a:hover{
    background:#B8860B;
}

</style>

</head>

<body>

<header>

<a href="index.jsp" class="logo">
Jewelry World Admin
</a>

<nav>

<a href="adminDashboard.jsp">Dashboard</a>

<a href="LogoutServlet">Logout</a>

</nav>

</header>

<div class="dashboard">

<h1>Admin Dashboard</h1>

<div class="stats">

<div class="stat-card">
<h2><%=totalProducts%></h2>
<p>Total Products</p>
</div>

<div class="stat-card">
<h2><%=totalUsers%></h2>
<p>Total Users</p>
</div>

<div class="stat-card">
<h2><%=totalOrders%></h2>
<p>Total Orders</p>
</div>

<div class="stat-card">
<h2><%=pendingOrders%></h2>
<p>Pending Orders</p>
</div>

<div class="stat-card">
<h2><%=deliveredOrders%></h2>
<p>Delivered Orders</p>
</div>

<div class="stat-card">
<h2>$<%=String.format("%.2f",revenue)%></h2>
<p>Total Revenue</p>
</div>

</div>

<div class="cards">

<div class="card">

<h2>Manage Products</h2>

<a href="manageProducts.jsp">
Open
</a>

</div>

<div class="card">

<h2>Manage Orders</h2>

<a href="adminOrders.jsp">
Open
</a>

</div>

<div class="card">

<h2>View Users</h2>

<a href="users.jsp">
Open
</a>

</div>

</div>

</div>

</body>
</html>