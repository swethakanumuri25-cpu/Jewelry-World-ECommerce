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

<title>Manage Products</title>

<link rel="stylesheet" href="css/style.css">

<style>

.table-container{

    width:90%;

    margin:40px auto;

}

.table-container h1{

    text-align:center;

    color:#6B3F00;

    margin-bottom:30px;

}

.add-btn{

    display:inline-block;

    margin-bottom:20px;

    background:#6B3F00;

    color:white;

    padding:12px 25px;

    text-decoration:none;

    border-radius:30px;

}

.add-btn:hover{

    background:#B8860B;

}

table{

    width:100%;

    border-collapse:collapse;

    background:white;

    box-shadow:0 10px 25px rgba(0,0,0,.15);

}

th{

    background:#6B3F00;

    color:white;

    padding:15px;

}

td{

    padding:15px;

    text-align:center;

    border-bottom:1px solid #ddd;

}

img{

    width:80px;

    height:80px;

    object-fit:cover;

    border-radius:10px;

}

.edit-btn{

    background:#3498db;

    color:white;

    padding:8px 15px;

    text-decoration:none;

    border-radius:5px;

    margin-right:5px;

}

.delete-btn{

    background:#c0392b;

    color:white;

    padding:8px 15px;

    text-decoration:none;

    border-radius:5px;

}

</style>

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

<div class="table-container">

<h1>Manage Products</h1>

<a href="addProduct.jsp" class="add-btn">
+ Add Product
</a>

<table>

<tr>

<th>ID</th>

<th>Image</th>

<th>Name</th>

<th>Category</th>

<th>Price</th>

<th>Actions</th>

</tr>

<%

Connection con = DBConnection.getConnection();

Statement st = con.createStatement();

ResultSet rs = st.executeQuery("SELECT * FROM products");

while(rs.next()){

%>

<tr>

<td><%=rs.getInt("id")%></td>

<td>

<img src="images/<%=rs.getString("image")%>">

</td>

<td><%=rs.getString("name")%></td>

<td><%=rs.getString("category")%></td>

<td>$<%=rs.getDouble("price")%></td>

<td>

<a class="edit-btn"
href="editProduct.jsp?id=<%=rs.getInt("id")%>">

Edit

</a>

<a class="delete-btn"
href="DeleteProductServlet?id=<%=rs.getInt("id")%>">

Delete

</a>

</td>

</tr>

<%

}

rs.close();
st.close();
con.close();

%>

</table>

</div>

</body>

</html>