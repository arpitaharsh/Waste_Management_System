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
    String accountNumber = request.getParameter("accountNumber"); 
    String transactionId = request.getParameter("transactionId"); 
%>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap');

        body {
            font-family: 'Nunito', sans-serif;
            background-color: #e6f4ea; /* light green */
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #ffffff;
            border-radius: 20px;
            padding: 30px 40px;
            box-shadow: 0 8px 25px rgba(0,128,0,0.15);
            max-width: 700px;
            width: 90%;
        }

        h1 {
            text-align: center;
            color: #2e7d32; /* dark green */
            margin-bottom: 25px;
        }
 .section {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .info-box {
            background: #f0fff4;
            border-left: 5px solid #66bb6a;
            border-radius: 12px;
            padding: 15px 20px;
            flex: 1 1 48%;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        .info-box p {
            margin: 5px 0;
            font-size: 15px;
            color: #333;
        }

        .feedback {
            background: #f0fff4;
            border-left: 5px solid #66bb6a;
            border-radius: 12px;
            padding: 20px;
        }

textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            border-radius: 8px;
            border: 1px solid #66bb6a;
            box-sizing: border-box;
            font-size: 14px;
        }

        input[type="submit"] {
            margin-top: 15px;
            padding: 12px 25px;
            border-radius: 50px;
            border: none;
            background-color: #2e7d32;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #66bb6a;
            transform: scale(1.05);
        }

        h2 {
            color: #2e7d32;
            margin-bottom: 15px;
        }
    </style>
</head>

        
        
    
<body>
    <div class="container">
        <h1>Order Confirmation</h1>

        <div class="section">
            <div class="info-box">
                <h2>Order Details</h2>
                <p><strong>Order ID:</strong> <%= orderId %></p>
                <p><strong>Order Date:</strong> <%= orderDate %></p>
                <p><strong>Product:</strong> <%= productName %> (ID: <%= productId %>)</p>
                <p><strong>Quantity:</strong> <%= quantity %></p>
                <p><strong>Total Price:</strong> $<%= price %></p>
            </div>
            <div class="info-box">
                <h2>Customer Details</h2>
                <p><strong>Name:</strong> <%= name %></p>
                <p><strong>Email:</strong> <%= email %></p>
                <p><strong>Phone:</strong> <%= phone %></p>
                <p><strong>Address:</strong> <%= address %></p>
 <p><strong>Pincode:</strong> <%= pincode %></p>
                
                <% if(accountNumber != null && transactionId != null) { %>
                    <p><strong>Account:</strong> <%= accountNumber %></p>
                    <p><strong>Transaction ID:</strong> <%= transactionId %></p>
                <% } %>
            </div>
        </div>

        <div class="feedback">
            <form action="orderSummary" method="post">
                <input type="hidden" name="orderId" value="<%= orderId %>">
                <input type="hidden" name="productId" value="<%= productId %>">
                <input type="hidden" name="productName" value="<%= productName %>">
                <input type="hidden" name="name" value="<%= name %>">
                <input type="hidden" name="email" value="<%= email %>">
                <input type="hidden" name="phone" value="<%= phone %>">
                <input type="hidden" name="address" value="<%= address %>">
                <input type="hidden" name="pincode" value="<%= pincode %>">
                <input type="hidden" name="quantity" value="<%= quantity %>">
                <input type="hidden" name="price" value="<%= price %>">

                <input type="hidden" name="orderDate" value="<%= orderDate %>">
                <h2>Feedback</h2>
                <label for="feedback">Your Feedback:</label>
                <textarea id="feedback" name="feedback" rows="3" placeholder="Write your feedback..." required></textarea>

                <label for="rating">Rating:</label>
                <select id="rating" name="rating" required>
                    <option value="">Select rating</option>
                    <option value="5">5 - Excellent</option>
                    <option value="4">4 - Good</option>
                    <option value="3">3 - Average</option>
                    <option value="2">2 - Poor</option>
                    <option value="1">1 - Very Poor</option>
                </select>

                <input type="submit" value="Submit Feedback">
            </form>
        </div>
    </div>
</body>
</html>