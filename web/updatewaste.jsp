<%@ page import="java.sql.*,javax.servlet.http.*" %>
<%
    if (session.getAttribute("name") == null) { response.sendRedirect("login.jsp"); return; }
    int id = Integer.parseInt(request.getParameter("id"));
    String type = request.getParameter("type");
    String source = request.getParameter("source");
    double quantity = Double.parseDouble(request.getParameter("quantity"));
    String date = request.getParameter("date");

    Connection con = null; PreparedStatement ps = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");
        String q = "UPDATE WASTE_RECORDS SET TYPE=?, SOURCE=?, QUANTITY=?, RECORD_DATE=? WHERE ID=?";
        ps = con.prepareStatement(q);
        ps.setString(1, type);
        ps.setString(2, source);
        ps.setDouble(3, quantity);
        ps.setDate(4, java.sql.Date.valueOf(date));
        ps.setInt(5, id);
        int r = ps.executeUpdate();
        if (r > 0) response.sendRedirect("viewWaste.jsp");
        else out.println("<div class='form-box'><div class='error'>Update failed</div><a href='viewWaste.jsp'>Back</a></div>");
    } catch(Exception e) {
        out.println("<div class='form-box'><div class='error'>Error: "+e.getMessage()+"</div><a href='viewWaste.jsp'>Back</a></div>");
    } finally {
        try{ if(ps!=null) ps.close(); } catch(Exception ignored){}
        try{ if(con!=null) con.close(); } catch(Exception ignored){}
    }
%>
