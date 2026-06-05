import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class loginvalidate extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        String email = req.getParameter("email");
        String pass = req.getParameter("pass");

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

            ps = conn.prepareStatement("SELECT * FROM US WHERE EMAIL=? AND PASS=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            rs = ps.executeQuery();

            if (rs.next()) {
                // ✅ Save user details in session
                HttpSession session = req.getSession();
                session.setAttribute("email", rs.getString("EMAIL"));
                session.setAttribute("name", rs.getString("NAME"));
                session.setAttribute("contact", rs.getString("CONTACT"));
                session.setAttribute("address", rs.getString("ADDRESS"));
                session.setAttribute("gender", rs.getString("GENDER"));

                // Redirect to home page
                res.sendRedirect("home.jsp");
            } else {
                out.println("<h3 style='color:red;text-align:center;'>Invalid Email or Password!</h3>");
                RequestDispatcher rd = req.getRequestDispatcher("login.jsp");
                rd.include(req, res);
            }
        } catch (Exception e) {
            e.printStackTrace(out);
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
