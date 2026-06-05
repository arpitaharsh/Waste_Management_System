<%@ page import="java.sql.*, java.util.UUID, java.text.SimpleDateFormat, java.util.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String productId = request.getParameter("id");
    String productName = "";
    String unitPrice = "";
    String orderId = UUID.randomUUID().toString();
    String orderDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    if (productId != null && !productId.trim().isEmpty()) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");
            String sql = "SELECT p_name, p_price FROM recycled_products WHERE p_id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, productId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                productName = rs.getString("p_name");
                unitPrice = rs.getString("p_price");
 } else {
                productName = "Unknown Product";
                unitPrice = "0.00";
            }

        } catch (Exception e) {
            e.printStackTrace();
            productName = "Error fetching product";
            unitPrice = "0.00";
        } finally {
            if (rs != null) try { rs.close(); } catch (Exception e) {}
            if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
            if (conn != null) try { conn.close(); } catch (Exception e) {}
        }
    } else {
        productName = "Invalid Product ID";
        unitPrice = "0.00";
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Buy Product</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #d4edda;
            margin: 0;
            padding: 20px;
color: #333;
        }
        .form-container {
            max-width: 500px;
            margin: 30px auto;
            background-color: #fff;
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
        input, textarea, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            margin-top: 20px;
            padding: 12px;
width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
    <script>
        function updatePrice() {
            const quantity = document.getElementById("quantity").value;
            const unitPrice = parseFloat(document.getElementById("unitPrice").value);
            const totalPrice = (quantity * unitPrice).toFixed(2);
            document.getElementById("price").value = totalPrice;
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h1>Buy Product</h1>
        <form action="confirm_purchase.jsp" method="post">
            <!-- Hidden fields for order tracking -->
            <input type="hidden" name="orderId" value="<%= orderId %>">
            <input type="hidden" name="orderDate" value="<%= orderDate %>">
            <input type="hidden" name="productId" value="<%= productId %>">
            <input type="hidden" id="unitPrice" value="<%= unitPrice %>">

            <label>Product Name:</label>
            <input type="text" name="productName" value="<%= productName %>" readonly>
<label>Order Date:</label>
            <input type="text" name="orderDateDisplay" value="<%= orderDate %>" readonly>

            <label>Order ID:</label>
            <input type="text" name="orderIdDisplay" value="<%= orderId %>" readonly>

            <label>Full Name:</label>
            <input type="text" name="name" required>

            <label>Email:</label>
            <input type="email" name="email" required>

            <label>Contact Number:</label>
            <input type="tel" name="phone" required>

            <label>Delivery Address:</label>
            <textarea name="address" rows="3" required></textarea>

            <label>Pincode:</label>
            <input type="text" name="pincode" required>

            <label>Quantity:</label>
            <input type="number" id="quantity" name="quantity" min="1" value="1" required onchange="updatePrice()">

            <label>Total Price:</label>
            <input type="text" id="price" name="price" value="<%= unitPrice %>" readonly>

 <label>Payment Option:</label>
            <select name="paymentOption" required>
                <option value="">Select Payment Option</option>
                <option value="Credit Card">Credit Card</option>
                <option value="UPI">UPI</option>
                <option value="Cash on Delivery">Cash on Delivery</option>
            </select>

            <input type="submit" value="Proceed to Confirmation">
        </form>
    </div>
</body>
</html>