<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<%
String admin = (String) session.getAttribute("admin");

if(admin == null){
    response.sendRedirect("adminLogin.jsp");
    return;
}

int id = Integer.parseInt(request.getParameter("id"));

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM products WHERE id=?");

ps.setInt(1, id);

ResultSet rs = ps.executeQuery();

rs.next();
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Product</title>

<link rel="stylesheet" href="css/style.css">

</head>

<body>

<header>

<a href="adminDashboard.jsp" class="logo">

Jewelry World Admin

</a>

<nav>

<a href="manageProducts.jsp">Products</a>

<a href="LogoutServlet">Logout</a>

</nav>

</header>

<section class="login-container">

<div class="login-box">

<h2>Edit Product</h2>

<form action="UpdateProductServlet" method="post">

<input
type="hidden"
name="id"
value="<%=rs.getInt("id")%>">

<input
type="text"
name="name"
value="<%=rs.getString("name")%>"
required>

<input
type="number"
step="0.01"
name="price"
value="<%=rs.getDouble("price")%>"
required>

<input
type="text"
name="image"
value="<%=rs.getString("image")%>"
required>

<input
type="text"
name="category"
value="<%=rs.getString("category")%>"
required>

<textarea
name="description"
required><%=rs.getString("description")%></textarea>

<button type="submit">

Update Product

</button>

</form>

</div>

</section>

</body>

</html>

<%
rs.close();
ps.close();
con.close();
%>