import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class UpdateProfileServlet extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
        throws ServletException, IOException {

        res.setContentType("text/html");
        PrintWriter out = res.getWriter();

        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("email") == null) {
            res.sendRedirect("login.jsp");
            return;
        }

        String email = (String) session.getAttribute("email");
        String name = req.getParameter("name");
        String contact = req.getParameter("contact");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");
        String pass = req.getParameter("pass");

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

            ps = conn.prepareStatement(
                "UPDATE US SET NAME=?, CONTACT=?, ADDRESS=?, GENDER=?, PASS=? WHERE EMAIL=?");

            ps.setString(1, name);
            ps.setString(2, contact);
            ps.setString(3, address);
            ps.setString(4, gender);
            ps.setString(5, pass);
            ps.setString(6, email);

            int updated = ps.executeUpdate();

            if (updated > 0) {
                // ✅ Update session with new values
                session.setAttribute("name", name);
                session.setAttribute("contact", contact);
                session.setAttribute("address", address);
                session.setAttribute("gender", gender);
                session.setAttribute("pass", pass);

                res.sendRedirect("profile.jsp?success=1");
            } else {
                out.println("<h3 style='color:red;text-align:center;'>Update failed!</h3>");
            }

        } catch (Exception e) {
            e.printStackTrace(out);
        } finally {
            try { if (ps != null) ps.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}
