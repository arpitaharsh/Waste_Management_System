<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Waste</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #c8e6c9, #e0f2f1);
            display: flex;
            justify-content: center;
            align-items: flex-start;
            min-height: 100vh;
            padding: 30px;
            margin: 0;
        }
        .container {
            background: #ffffff;
            padding: 35px 40px;
            border-radius: 20px;
            box-shadow: 0px 8px 22px rgba(0, 0, 0, 0.25);
            max-width: 700px;
            width: 100%;
        }
        .container h1 { text-align:center; color:#2e7d32; }
        label { display:block; margin-top:15px; font-weight:bold; }
        input, select { width:100%; padding:10px; margin-top:5px; border-radius:8px; }
        button { margin-top:20px; width:100%; padding:12px; background:#2e7d32; color:#fff; border:none; border-radius:8px; cursor:pointer; }
        button:hover { background:#1b5e20; }
        table { width:100%; border-collapse:collapse; margin-top:30px; }
        th,td { border:1px solid #bbb; padding:10px; text-align:center; }
        th { background:#2e7d32; color:#fff; }
    </style>
    <script>
        const priceMap = {
            "Household": 15, "Industry": 25, "Hospital": 20,
            "Market": 10, "School": 10, "Office": 5, "Other": 12
        };
        function calculatePrice() {
            const source = document.querySelector("select[name='source']").value;
            const quantity = parseFloat(document.querySelector("input[name='wasteQuantity']").value) || 0;
            const priceField = document.querySelector("input[name='totalPrice']");
            if (source && priceMap[source]) {
                const total = priceMap[source] * quantity;
                priceField.value = total.toFixed(2);
            } else {
                priceField.value = "";
            }
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Sell Your Waste</h1>
    <form action="AddWasteServlet" method="post">
        <label>Waste Type:</label>
        <input type="text" name="wasteType" required>

        <label>Source:</label>
        <select name="source" required onchange="calculatePrice()">
            <option value="">-- Select Waste Source --</option>
            <option value="Household">Household</option>
            <option value="Industry">Industry</option>
            <option value="Hospital">Hospital</option>
            <option value="Market">Market</option>
            <option value="School">School</option>
            <option value="Office">Office</option>
            <option value="Other">Other</option>
        </select>

        <label>Quantity (Kg):</label>
        <input type="number" name="wasteQuantity" required oninput="calculatePrice()">

        <label>Total Price (₹):</label>
        <input type="text" name="totalPrice" readonly>

        <label>Date:</label>
        <input type="date" name="wasteDate" required>

        <button type="submit">Sell Waste</button>
    </form>

    <!-- Price Reference Table -->
    <h2 style="text-align:center; color:#2e7d32;">Waste Price List</h2>
    <table>
        <tr><th>Source</th><th>Price (₹ per Kg)</th></tr>
        <tr><td>Household</td><td>₹15</td></tr>
        <tr><td>Industry</td><td>₹25</td></tr>
        <tr><td>Hospital</td><td>₹20</td></tr>
        <tr><td>Market</td><td>₹10</td></tr>
        <tr><td>School</td><td>₹10</td></tr>
        <tr><td>Office</td><td>₹5</td></tr>
        <tr><td>Other</td><td>₹12</td></tr>
    </table>
    <p><a href="home.jsp">Back to Home Page</a></p>
</div>
</body>
</html>
