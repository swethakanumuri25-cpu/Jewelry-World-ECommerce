<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<%
String admin=(String)session.getAttribute("admin");

if(admin==null){
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Orders</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<header>

<a href="adminDashboard.jsp" class="logo">
Jewelry World Admin
</a>

<nav>

<a href="adminDashboard.jsp">Dashboard</a>

<a href="LogoutServlet">Logout</a>

</nav>

</header>

<section class="admin-products">

<h1>Manage Orders</h1>

<table>

<tr>

<th>ID</th>

<th>Name</th>

<th>Email</th>

<th>Total</th>

<th>Date</th>

<th>Status</th>

<th>Action</th>

</tr>

<%

Connection con=DBConnection.getConnection();

PreparedStatement ps=
con.prepareStatement(
"SELECT * FROM orders ORDER BY id DESC");

ResultSet rs=ps.executeQuery();

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("id")%></td>

<td><%=rs.getString("fullname")%></td>

<td><%=rs.getString("email")%></td>

<td>$<%=rs.getDouble("total")%></td>

<td><%=rs.getTimestamp("order_date")%></td>

<td>

    <form action="UpdateOrderStatusServlet" method="post">
    
    <input type="hidden"
        name="id"
        value="<%=rs.getInt("id")%>">
    
    <select name="status">
    
    <option value="Pending"
    <%= rs.getString("status").equals("Pending") ? "selected" : "" %>>
    Pending
    </option>
    
    <option value="Packed"
    <%= rs.getString("status").equals("Packed") ? "selected" : "" %>>
    Packed
    </option>
    
    <option value="Shipped"
    <%= rs.getString("status").equals("Shipped") ? "selected" : "" %>>
    Shipped
    </option>
    
    <option value="Delivered"
    <%= rs.getString("status").equals("Delivered") ? "selected" : "" %>>
    Delivered
    </option>
    
    <option value="Cancelled"
    <%= rs.getString("status").equals("Cancelled") ? "selected" : "" %>>
    Cancelled
    </option>
    
    </select>
    
    <input type="submit"
           value="Save"
           class="edit-btn">
    
    </form>
    
</td>

</tr>

<%

}

%>

</table>

</section>

</body>

</html>