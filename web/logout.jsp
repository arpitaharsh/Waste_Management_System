<%@ page import="javax.servlet.http.*" %>
<%
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("login.jsp");
%>
