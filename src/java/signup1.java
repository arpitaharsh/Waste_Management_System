import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class signup1 extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws IOException, ServletException {

        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String pass = req.getParameter("pass");
        String address = req.getParameter("address");
        String gender = req.getParameter("gender");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            con = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:XE", "system", "arpita123");

            String q = "INSERT INTO US (NAME, EMAIL, CONTACT, PASS, ADDRESS, GENDER) VALUES (?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(q);
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, contact);
            ps.setString(4, pass);
            ps.setString(5, address);
            ps.setString(6, gender);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                HttpSession session = req.getSession();
                session.setAttribute("name", name);

                res.sendRedirect("home.jsp");
            } else {
                req.setAttribute("error", "Signup failed. Try again!");
                RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
                rd.forward(req, res);
            }

        } catch (Exception e) {
            req.setAttribute("error", "Error: " + e.getMessage());
            RequestDispatcher rd = req.getRequestDispatcher("signup.jsp");
            rd.forward(req, res);
        } finally {
            try { if (ps != null) ps.close(); } catch(Exception ignored){}
            try { if (con != null) con.close(); } catch(Exception ignored){}
        }
    }
}
