<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Rate Product</title>

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

<h2>Rate Product</h2>

<form action="SubmitReviewServlet" method="post">

<input type="hidden"
name="productId"
value="<%=request.getParameter("id")%>">

<label>Rating</label>

<select name="rating" required>

<option value="5">★★★★★ (5)</option>

<option value="4">★★★★☆ (4)</option>

<option value="3">★★★☆☆ (3)</option>

<option value="2">★★☆☆☆ (2)</option>

<option value="1">★☆☆☆☆ (1)</option>

</select>

<br><br>

<textarea
name="review"
rows="5"
placeholder="Write your review..."
required></textarea>

<br><br>

<button type="submit">

Submit Review

</button>

</form>

</div>

</div>

</body>

</html>