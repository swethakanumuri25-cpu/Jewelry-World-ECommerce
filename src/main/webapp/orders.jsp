<%@ page import="java.sql.*" %>
<%@ page import="com.swetha.ecommerce.util.DBConnection" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Orders</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.orders-page{
    width:90%;
    max-width:1100px;
    margin:40px auto;
}

.orders-page h1{
    text-align:center;
    color:#6B3F00;
    margin-bottom:35px;
    font-size:48px;
}

.order-card{
    background:white;
    border-radius:15px;
    padding:25px;
    margin-bottom:25px;
    box-shadow:0 10px 25px rgba(0,0,0,.12);
}

.order-card h2{
    color:#6B3F00;
    margin-bottom:15px;
}

.order-card p{
    font-size:18px;
    margin:10px 0;
}

.order-actions{
    display:flex;
    align-items:center;
    gap:15px;
    margin-top:20px;
}

.status{
    display:inline-block;
    padding:8px 18px;
    color:white;
    border-radius:20px;
    font-weight:bold;
}

.pending{
    background:#dc3545;
}

.packed{
    background:#fd7e14;
}

.shipped{
    background:#0d6efd;
}

.delivered{
    background:#198754;
}

.cancelled{
    background:#6c757d;
}

.cancel-order-btn{

    background:#dc3545;
    color:white;
    padding:10px 18px;
    border-radius:25px;
    text-decoration:none;
    font-weight:bold;
    transition:.3s;

}

.cancel-order-btn:hover{

    background:#b02a37;

}

</style>

</head>

<body>

<header>

<a href="index.jsp" class="logo">
Jewelry World
</a>

<nav>

<a href="index.jsp">Home</a>

<a href="products.jsp">Products</a>

<a href="profile.jsp">Profile</a>

</nav>

</header>

<section class="orders-page">

<h1>

<i class="fa-solid fa-box"></i>

My Orders

</h1>

<%

String email = (String)session.getAttribute("user");

Connection con = DBConnection.getConnection();

PreparedStatement ps = con.prepareStatement(
"SELECT * FROM orders WHERE email=? ORDER BY id DESC");

ps.setString(1,email);

ResultSet rs = ps.executeQuery();

while(rs.next()){

    String status = rs.getString("status");

    if(status == null){
        status = "Pending";
    }

    String cssClass="";

    if(status.equalsIgnoreCase("Pending")){
        cssClass="pending";
    }
    else if(status.equalsIgnoreCase("Packed")){
        cssClass="packed";
    }
    else if(status.equalsIgnoreCase("Shipped")){
        cssClass="shipped";
    }
    else if(status.equalsIgnoreCase("Delivered")){
        cssClass="delivered";
    }
    else if(status.equalsIgnoreCase("Cancelled")){
        cssClass="cancelled";
    }

%>

<div class="order-card">

<h2>

Order #<%=rs.getInt("id")%>

</h2>

<p>

<b>Name :</b>

<%=rs.getString("fullname")%>

</p>

<p>

<b>Email :</b>

<%=rs.getString("email")%>

</p>

<p>

<b>Address :</b>

<%=rs.getString("address")%>

</p>

<p>

<b>Total :</b>

$<%=rs.getDouble("total")%>

</p>

<p>

<b>Ordered On :</b>

<%=rs.getTimestamp("order_date")%>

</p>

<div class="order-actions">

<div class="order-status">

        <span class="status <%=cssClass%>">
            <%=status%>
        </span>
        
        <div class="progress">
        
        <div class="step <%=status.equals("Pending") || status.equals("Packed") || status.equals("Shipped") || status.equals("Delivered") ? "active":""%>">
        Pending
        </div>
        
        <div class="step <%=status.equals("Packed") || status.equals("Shipped") || status.equals("Delivered") ? "active":""%>">
        Packed
        </div>
        
        <div class="step <%=status.equals("Shipped") || status.equals("Delivered") ? "active":""%>">
        Shipped
        </div>
        
        <div class="step <%=status.equals("Delivered") ? "active":""%>">
        Delivered
        </div>
        
        </div>
        
</div>

<%
if(status.equalsIgnoreCase("Delivered")){
%>

<a href="review.jsp?id=<%=rs.getInt("id")%>"
class="cancel-order-btn"
style="background:#198754;">

Rate Product

</a>

<%
}
%>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<a href="CancelOrderServlet?id=<%=rs.getInt("id")%>"
class="cancel-order-btn"
onclick="return confirm('Are you sure you want to cancel this order?');">

Cancel Order

</a>

<%

}

%>

</div>

</div>

<%

}

rs.close();
ps.close();
con.close();

%>

</section>

</body>

</html>