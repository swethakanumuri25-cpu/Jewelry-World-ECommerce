<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Rate Product</title>

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.review-container{

    width:500px;
    margin:60px auto;
    background:white;
    padding:35px;
    border-radius:15px;
    box-shadow:0 10px 25px rgba(0,0,0,.15);

}

.review-container h2{

    text-align:center;
    color:#6B3F00;
    margin-bottom:25px;

}

.review-container select,
.review-container textarea{

    width:100%;
    padding:14px;
    margin:15px 0;
    border:1px solid #ddd;
    border-radius:8px;
    font-size:16px;

}

.review-container textarea{

    height:140px;
    resize:none;

}

.review-container button{

    width:100%;
    padding:15px;
    background:#6B3F00;
    color:white;
    border:none;
    border-radius:30px;
    font-size:18px;
    cursor:pointer;
    transition:.3s;

}

.review-container button:hover{

    background:#B8860B;

}

</style>

</head>

<body>

<header>

<a href="index.jsp" class="logo">
Jewelry World
</a>

</header>

<div class="review-container">

<h2>

<i class="fa-solid fa-star"></i>

Rate Product

</h2>

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

<label>Write Review</label>

<textarea
name="review"
placeholder="Share your experience..."
required></textarea>

<button type="submit">

Submit Review

</button>

</form>

</div>

</body>

</html>