import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class forgot1 extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String email = req.getParameter("email");
        String newpass = req.getParameter("newpass");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

            String q = "UPDATE US SET PASS=? WHERE EMAIL=?";
            ps = con.prepareStatement(q);
            ps.setString(1, newpass);
            ps.setString(2, email);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                // Password updated successfully
                req.setAttribute("success", "Password updated! Please login with new password.");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.forward(req, res);
            } else {
                // Email not found
                req.setAttribute("error", "Email not found!");
                RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("forgot.jsp");
            rd.forward(req, res);
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception ignored){}
            try { if (con != null) con.close(); } catch(Exception ignored){}
        }
    }
}
