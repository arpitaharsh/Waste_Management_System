<%@ page import="java.sql.*,javax.servlet.http.*" %>
<%
    if (session.getAttribute("name") == null) { response.sendRedirect("login.jsp"); return; }
    int id = Integer.parseInt(request.getParameter("id"));
    Connection con = null; PreparedStatement ps = null;
    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");
        String q = "DELETE FROM WASTE_RECORDS WHERE ID=?";
        ps = con.prepareStatement(q);
        ps.setInt(1, id);
        int r = ps.executeUpdate();
        response.sendRedirect("viewWaste.jsp");
    } catch(Exception e) {
        out.println("<div class='form-box'><div class='error'>Error: "+e.getMessage()+"</div><a href='viewWaste.jsp'>Back</a></div>");
    } finally {
        try{ if(ps!=null) ps.close(); } catch(Exception ignored){}
        try{ if(con!=null) con.close(); } catch(Exception ignored){}
    }
%>
