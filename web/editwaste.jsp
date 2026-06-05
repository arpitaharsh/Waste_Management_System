<%@ page import="java.sql.*,javax.servlet.http.*" %>
<%
    // ? Check login session
    if (session.getAttribute("name") == null) { 
        response.sendRedirect("login.jsp"); 
        return; 
    }

    // ? Get record ID from request
    String idStr = request.getParameter("id");
    if (idStr == null) { 
        response.sendRedirect("viewWaste.jsp"); 
        return; 
    }
    int id = Integer.parseInt(idStr);

    // ? Initialize variables
    String type="", source="", date=""; 
    double quantity=0;

    Connection con = null; 
    PreparedStatement ps = null; 
    ResultSet rs = null;

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

        String q = "SELECT * FROM waste_records WHERE id=?";
        ps = con.prepareStatement(q);
        ps.setInt(1, id);
        rs = ps.executeQuery();

        if (rs.next()) {
            type = rs.getString("type");
            source = rs.getString("source");
            quantity = rs.getDouble("quantity");
            date = rs.getDate("record_date").toString();
        } else {
            out.println("<div class='error-box'>? Record not found. <a href='viewWaste.jsp'>Back</a></div>");
            return;
        }
    } catch(Exception e) {
        out.println("<div class='error-box'>? Error: " + e.getMessage() + "</div>");
        return;
    } finally {
        try{ if(rs!=null) rs.close(); } catch(Exception ignored){}
        try{ if(ps!=null) ps.close(); } catch(Exception ignored){}
        try{ if(con!=null) con.close(); } catch(Exception ignored){}
    }
%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Waste Record</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background: linear-gradient(135deg, #e0f7fa, #e8f5e9);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .form-box {
      background: #fff;
      padding: 35px;
      border-radius: 15px;
      box-shadow: 0px 6px 18px rgba(0,0,0,0.2);
      width: 420px;
      text-align: center;
    }
    h2 {
      margin-bottom: 25px;
      color: #2e7d32;
      font-size: 26px;
      text-transform: uppercase;
      letter-spacing: 1px;
    }
    input, select {
      width: 100%;
      padding: 12px;
      margin: 12px 0;
      border: 1px solid #ccc;
      border-radius: 8px;
      font-size: 15px;
      transition: 0.3s;
    }
    input:focus, select:focus {
      border-color: #28a745;
      box-shadow: 0 0 6px rgba(40,167,69,0.5);
      outline: none;
    }
    input[type="submit"] {
      background: #28a745;
      color: white;
      border: none;
      cursor: pointer;
      font-size: 16px;
      font-weight: bold;
      transition: 0.3s;
    }
    input[type="submit"]:hover {
      background: #218838;
      transform: translateY(-2px);
    }
    a {
      display: block;
      margin-top: 15px;
      text-decoration: none;
      color: #007bff;
      font-weight: bold;
    }
    a:hover {
      color: #0056b3;
    }
    .error-box {
      background: #ffe6e6;
      color: red;
      padding: 20px;
      border-radius: 10px;
      text-align: center;
      margin: 40px auto;
      width: 400px;
      box-shadow: 0 4px 12px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>
  <div class="form-box">
    <h2>Edit Waste Record</h2>
    <form method="post" action="updateWaste.jsp">
      <input type="hidden" name="id" value="<%=id%>">

      <!-- Waste Type Dropdown -->
      <select name="type" required>
        <option value="Biomedical" <%= "Biomedical".equals(type) ? "selected" : "" %>>Biomedical</option>
        <option value="Plastic" <%= "Plastic".equals(type) ? "selected" : "" %>>Plastic</option>
        <option value="Organic" <%= "Organic".equals(type) ? "selected" : "" %>>Organic</option>
        <option value="E-waste" <%= "E-waste".equals(type) ? "selected" : "" %>>E-waste</option>
      </select>

      <!-- Other Fields -->
      <input type="text" name="source" value="<%=source%>" placeholder="Source" required>
      <input type="number" step="0.01" name="quantity" value="<%=quantity%>" placeholder="Quantity" required>
      <input type="date" name="date" value="<%=date%>" required>

      <input type="submit" value="Update Record">
    </form>
    <a href="viewWaste.jsp">? Back to Records</a>
  </div>
</body>
</html>