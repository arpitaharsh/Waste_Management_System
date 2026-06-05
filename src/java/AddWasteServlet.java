import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class AddWasteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
        throws ServletException, IOException {

        String wasteType = request.getParameter("wasteType");
        String source = request.getParameter("source");
        double wasteQuantity = Double.parseDouble(request.getParameter("wasteQuantity"));
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String wasteDate = request.getParameter("wasteDate");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            // Adjust DB settings for MySQL / Oracle
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

            String sql = "INSERT INTO WasteSales (wasteType, source, wasteQuantity, totalPrice, wasteDate) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, wasteType);
            ps.setString(2, source);
            ps.setDouble(3, wasteQuantity);
            ps.setDouble(4, totalPrice);
            ps.setDate(5, java.sql.Date.valueOf(wasteDate));

            int rows = ps.executeUpdate();

            if (rows > 0) {
                request.setAttribute("message", "✅ Waste added successfully. You will get ₹" + totalPrice + " at your doorstep at the time of the Waste Collection.");

            } else {
                request.setAttribute("message", "❌ Failed to add waste. Try again.");
            }

            request.getRequestDispatcher("confirmation.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("confirmation.jsp").forward(request, response);
        } finally {
            try { if (ps != null) ps.close(); if (conn != null) conn.close(); } catch (Exception ex) {}
        }
    }
}
