<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // ✅ Check Admin Session
    if(session.getAttribute("admin") == null){
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Waste Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f7fb;
            margin: 0;
            padding: 0;
        }

        header {
            background: #2c3e50;
            color: white;
            padding: 15px;
            text-align: center;
        }

        .logout {
            text-align: right;
            padding: 10px 20px;
            background: #ecf0f1;
        }

        .logout a {
            color: red;
            text-decoration: none;
            font-weight: bold;
        }

        .container {
            width: 90%;
            margin: 20px auto;
        }

        /* ✅ Summary Card Layout */
        .summary-row {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
        }

        .card {
            background: #1abc9c;
            color: white;
            padding: 20px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0px 4px 8px rgba(0,0,0,0.2);
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card p {
            font-size: 22px;
            font-weight: bold;
        }

        /* ✅ Table Styles */
        .section {
            background: white;
            margin: 20px 0;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 6px 12px rgba(0,0,0,0.1);
        }

        h2, h3 {
            text-align: center;
            color: #2c3e50;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        table th, table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background: #1abc9c;
            color: white;
        }

        table tr:hover {
            background: #f9f9f9;
        }
    </style>
</head>
<body>
<header>
    <h2>Welcome Admin</h2>
</header>

<div class="logout">
    <a href="adminLogout.jsp">Logout</a>
</div>

<div class="container">

    <!-- ✅ FIRST ROW (3 BOXES) -->
    <div class="summary-row">
        <!-- Total Users -->
        <div class="card">
            <h3>Total Users</h3>
            <p>
            <%
                int totalUsers = 0;
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM US");
                    if(rs.next()){ totalUsers = rs.getInt(1); }
                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: "+e.getMessage()); }
                out.print(totalUsers);
            %>
            </p>
        </div>

        <!-- Total Orders -->
        <div class="card">
            <h3>Total Orders</h3>
            <p>
            <%
                int totalOrders = 0;
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM order_summary");
                    if(rs.next()){ totalOrders = rs.getInt(1); }
                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: "+e.getMessage()); }
                out.print(totalOrders);
            %>
            </p>
        </div>

        <!-- Total Waste Records -->
        <div class="card">
            <h3>Total Waste Records</h3>
            <p>
            <%
                int totalWaste = 0;
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT COUNT(*) FROM WASTESALES");
                    if(rs.next()){ totalWaste = rs.getInt(1); }
                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: "+e.getMessage()); }
                out.print(totalWaste);
            %>
            </p>
        </div>
    </div>

    <!-- ✅ SECOND ROW (3 BOXES) -->
    <div class="summary-row">
        <!-- Commission from Waste Bought -->
        <div class="card" style="background:#ff9800;"> <!-- Orange -->
            <h3>Commission from Waste Bought (2%)</h3>
            <p>
            <%
                double wasteCommission = 0.0;
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();

                    ResultSet rs = st.executeQuery("SELECT NVL(SUM(TOTALPRICE),0) FROM WASTESALES");
                    double totalWasteSales = 0.0;
                    if(rs.next()) totalWasteSales = rs.getDouble(1);
                    wasteCommission = 0.02 * totalWasteSales;

                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: "+e.getMessage()); }

                out.print("₹ " + String.format("%.2f", wasteCommission));
            %>
            </p>
        </div>

        <!-- Commission from Product Sales -->
        <div class="card" style="background:#ff9800;"> <!-- Orange -->
            <h3>Commission from Product Sales (5%)</h3>
            <p>
            <%
                double productCommission = 0.0;
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();

                    ResultSet rs = st.executeQuery("SELECT NVL(SUM(TOTAL_PRICE),0) FROM order_summary");
                    double totalProductSales = 0.0;
                    if(rs.next()) totalProductSales = rs.getDouble(1);
                    productCommission = 0.05 * totalProductSales;

                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: "+e.getMessage()); }

                out.print("₹ " + String.format("%.2f", productCommission));
            %>
            </p>
        </div>

        <!-- Total Admin Commission -->
        <div class="card" style="background:#e74c3c;"> <!-- Red -->
            <h3>Total Admin Commission</h3>
            <p>
            <%
                double totalCommission = wasteCommission + productCommission;
                out.print("₹ " + String.format("%.2f", totalCommission));
            %>
            </p>
        </div>
    </div>

    <!-- ✅ Registered Users Table -->
    <div class="section">
        <h3>Registered Users</h3>
        <table>
            <tr>
                <th>Name</th><th>Email</th><th>Contact</th><th>Gender</th><th>Address</th>
            </tr>
            <%
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM US");
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getString("NAME") %></td>
                <td><%= rs.getString("EMAIL") %></td>
                <td><%= rs.getString("CONTACT") %></td>
                <td><%= rs.getString("GENDER") %></td>
                <td><%= rs.getString("ADDRESS") %></td>
            </tr>
            <%
                    }
                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: " + e.getMessage()); }
            %>
        </table>
    </div>

    <!-- ✅ Orders Table -->
    <div class="section">
        <h3>Orders History</h3>
        <table>
            <tr>
                <th>Customer</th><th>Email</th><th>Product Id</th><th>Product</th><th>Quantity</th>
                <th>Total Price</th><th>Order Date</th><th>Phone</th><th>Delivery Address</th>
                <th>Pincode</th><th>Feedback</th><th>Rating</th>
            </tr>
            <%
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM order_summary ORDER BY ORDER_DATE DESC");
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getString("CUSTOMER_NAME") %></td>
                <td><%= rs.getString("CUSTOMER_EMAIL") %></td>
                <td><%= rs.getString("PRODUCT_ID") %></td>
                <td><%= rs.getString("PRODUCT_NAME") %></td>
                <td><%= rs.getInt("QUANTITY") %></td>
                <td><%= rs.getDouble("TOTAL_PRICE") %></td>
                <td><%= rs.getDate("ORDER_DATE") %></td>
                <td><%= rs.getString("CUSTOMER_PHONE") %></td>
                <td><%= rs.getString("DELIVERY_ADDRESS") %></td>
                <td><%= rs.getInt("PINCODE") %></td>
                <td><%= rs.getString("CUSTOMER_FEEDBACK") %></td>
                <td><%= rs.getString("CUSTOMER_RATING") %></td>
            </tr>
            <%
                    }
                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: " + e.getMessage()); }
            %>
        </table>
    </div>

    <!-- ✅ Waste Records -->
    <div class="section">
        <h3>Waste Records</h3>
        <table>
            <tr>
                <th>Waste Type</th><th>Source</th><th>Quantity</th><th>Total Price</th><th>Date</th>
            </tr>
            <%
                try{
                    Class.forName("oracle.jdbc.driver.OracleDriver");
                    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","arpita123");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM WASTESALES ORDER BY WASTEDATE DESC");
                    while(rs.next()){
            %>
            <tr>
                <td><%= rs.getString("WASTETYPE") %></td>
                <td><%= rs.getString("SOURCE") %></td>
                <td><%= rs.getInt("WASTEQUANTITY") %></td>
                <td><%= rs.getDouble("TOTALPRICE") %></td>
                <td><%= rs.getDate("WASTEDATE") %></td>
            </tr>
            <%
                    }
                    rs.close(); st.close(); con.close();
                }catch(Exception e){ out.println("Error: " + e.getMessage()); }
            %>
        </table>
    </div>

</div>
</body>
</html>

