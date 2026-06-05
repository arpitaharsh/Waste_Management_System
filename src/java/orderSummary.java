import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/orderSummary")
public class orderSummary extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection settings
    private final String jdbcURL = "jdbc:oracle:thin:@localhost:1521:XE";
    private final String jdbcUsername = "system";
    private final String jdbcPassword = "arpita123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String orderId = request.getParameter("orderId");
        String productId = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String pincodeStr = request.getParameter("pincode");
        String quantityStr = request.getParameter("quantity");
        String priceStr = request.getParameter("price");
        String orderDate = request.getParameter("orderDate");
        String feedback = request.getParameter("feedback");
        String rating = request.getParameter("rating");

        
        int quantity = 0;
        double totalPrice = 0.0;
        int pincode = 0;

        try { quantity = Integer.parseInt(quantityStr); } catch(Exception e) { quantity = 1; }
        try { totalPrice = Double.parseDouble(priceStr); } catch(Exception e) { totalPrice = 0.0; }
        try { pincode = Integer.parseInt(pincodeStr); } catch(Exception e) { pincode = 0; }

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

            String sql = "INSERT INTO order_summary "
                       + "(order_id, product_id, customer_name, customer_email, customer_phone, customer_feedback, customer_rating, quantity, total_price, order_date, product_name, delivery_address, pincode) "
                       + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, orderId);
            pstmt.setString(2, productId);
            pstmt.setString(3, name);
            pstmt.setString(4, email);
            pstmt.setString(5, phone);
            pstmt.setString(6, feedback);
            pstmt.setString(7, rating);
            pstmt.setInt(8, quantity);
            pstmt.setDouble(9, totalPrice);
            pstmt.setString(10, orderDate); 
            pstmt.setString(11, productName);
            pstmt.setString(12, address);
            pstmt.setInt(13, pincode);
int row = pstmt.executeUpdate();
            if(row > 0) {
                response.sendRedirect("thankyou.jsp");
            } else {
                response.getWriter().println("Error inserting order details.");
            }

        } catch(Exception e) {
            e.printStackTrace();
            response.getWriter().println("Exception: " + e.getMessage());
        } finally {
            try { if(pstmt != null) pstmt.close(); } catch(Exception e) {}
            try { if(conn != null) conn.close(); } catch(Exception e) {}
        }
    }
}