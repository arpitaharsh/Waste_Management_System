<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    
    String orderId = request.getParameter("orderId");
    String orderDate = request.getParameter("orderDate");
    String productId = request.getParameter("productId");
    String productName = request.getParameter("productName");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String pincode = request.getParameter("pincode");
    String quantity = request.getParameter("quantity");
    String price = request.getParameter("price");
    String paymentOption = request.getParameter("paymentOption");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #d4edda;
            margin: 0;
            padding: 20px;
            color: #333;
        }
.container {
            max-width: 500px;
            margin: 40px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        h1 {
            text-align: center;
            color: #4CAF50;
        }
        label {
            display: block;
            margin-top: 15px;
            font-weight: bold;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background: #4CAF50;
            color: #fff;
            border: none;
            padding: 12px;
            width: 100%;
            border-radius: 5px;
cursor: pointer;
            margin-top: 20px;
        }
        input[type="submit"]:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Payment Details</h1>
        <form action="ordersummary.jsp" method="post">
            <input type="hidden" name="orderId" value="<%= orderId %>">
            <input type="hidden" name="orderDate" value="<%= orderDate %>">
            <input type="hidden" name="productId" value="<%= productId %>">
            <input type="hidden" name="productName" value="<%= productName %>">
            <input type="hidden" name="name" value="<%= name %>">
            <input type="hidden" name="email" value="<%= email %>">
            <input type="hidden" name="phone" value="<%= phone %>">
            <input type="hidden" name="address" value="<%= address %>">
            <input type="hidden" name="pincode" value="<%= pincode %>">
            <input type="hidden" name="quantity" value="<%= quantity %>">
            <input type="hidden" name="price" value="<%= price %>">
            <input type="hidden" name="paymentOption" value="<%= paymentOption %>">

            <% if ("Credit Card".equals(paymentOption) || "UPI".equals(paymentOption)) { %>
                <label>Account Number:</label>
                <input type="text" name="accountNumber" required>

                <label>Transaction ID:</label>
                <input type="text" name="transactionId" required>
<input type="submit" value="Submit Payment">
            <% } else { %>
                <p style="text-align:center;">You have selected Cash on Delivery.</p>
                <input type="submit" value="Confirm Order">
            <% } %>
        </form>
    </div>
</body>
</html>
