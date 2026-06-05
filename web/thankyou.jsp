<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name = request.getParameter("name");
    if (name == null || name.trim().isEmpty()) name = "Customer";
    String orderId = request.getParameter("orderId");
    if (orderId == null || orderId.trim().isEmpty()) orderId = "N/A";
%>
<!DOCTYPE html>
<html>
<head>
    <title>Thank You</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');
 body {
            font-family: 'Nunito', sans-serif;
            background-color: lightgreen;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
 .container {
            background-color: #ffffff; 
            border-left: 8px solid #66bb6a; 
            border-radius: 12px;
            padding: 40px 30px;
            text-align: center;
            max-width: 420px;
            width: 90%;
            box-shadow: 0 6px 15px rgba(0,0,0,0.05);
            transition: transform 0.3s ease;
        }
.container:hover {
            transform: translateY(-5px);
        }  h1 {
            font-size: 28px;
            color: #388e3c; 
            margin-bottom: 20px;
        }  p {
            font-size: 16px;
            color: #555555;
            margin: 10px 0;
        } a {
            display: inline-block;
            margin-top: 25px;
            padding: 12px 28px;
            background-color: #66bb6a; 
            color: #fff;
            text-decoration: none;
            font-weight: 700;
            border-radius: 50px;
            transition: background-color 0.3s, transform 0.3s;
        }
a:hover {
            background-color: #4caf50;
            transform: scale(1.05);
        }
    </style></head>
<body>
    <div class="container">
        <h1>Thank You, <%= name %>!</h1>
        <p>Your order (ID: <%= orderId %>) has been placed successfully.</p>
        <p>We appreciate your feedback and hope to serve you again!</p>
        <a href="home.jsp">Go to Home</a>
    </div>
</body>
</html>