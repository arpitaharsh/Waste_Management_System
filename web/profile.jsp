<%@ page import="java.sql.*, javax.servlet.http.*" %>
<%
//    HttpSession session = request.getSession(false);
    if (session == null || session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    // Get details from session (set at login/signup)
    String email   = (String) session.getAttribute("email");
    String name    = (String) session.getAttribute("name");
    String contact = (String) session.getAttribute("contact");
    String address = (String) session.getAttribute("address");
    String gender  = (String) session.getAttribute("gender");
    String pass    = (String) session.getAttribute("pass");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile - Waste Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0fff0;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            margin: 40px auto;
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0,0,0,0.2);
        }
        h2 {
            color: #004d00;
            text-align: center;
            margin-bottom: 20px;
        }
        .success {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .profile-view {
            background: #f9f9f9;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 25px;
        }
        .profile-view p {
            margin: 8px 0;
            font-size: 16px;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #222;
        }
        input, textarea {
            width: 96%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .btn {
            margin-top: 18px;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: bold;
        }
        .btn-update {
            background: #004d00;
            color: white;
        }
        .btn-update:hover {
            background: #006600;
        }
        .btn-back {
            background: gray;
            color: white;
            margin-left: 10px;
        }
        .btn-back:hover {
            background: #555;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Your Profile</h2>

    <% if ("1".equals(request.getParameter("success"))) { %>
        <div class="success">? Profile updated successfully!</div>
    <% } %>

    <!-- Profile Details -->
    <div class="profile-view">
        <p><b>Email:</b> <%= email %></p>
        <p><b>Name:</b> <%= name %></p>
        <p><b>Contact:</b> <%= contact %></p>
        <p><b>Address:</b> <%= address %></p>
        <p><b>Gender:</b> <%= gender %></p>
    </div>

    <!-- Edit Profile Form -->
    <form action="UpdateProfileServlet" method="post">
        <label>Name:</label>
        <input type="text" name="name" value="<%= name %>" required>

        <label>Contact:</label>
        <input type="text" name="contact" value="<%= contact %>" required>

        <label>Address:</label>
        <textarea name="address" required><%= address %></textarea>

        <label>Gender:</label>
        <input type="radio" name="gender" value="Male" <%= "Male".equals(gender)?"checked":"" %>> Male
        <input type="radio" name="gender" value="Female" <%= "Female".equals(gender)?"checked":"" %>> Female

        <label>Password:</label>
        <input type="password" name="pass" value="<%= pass %>" required>

        <br>
        <button type="submit" class="btn btn-update">Update</button>
        <a href="home.jsp" class="btn btn-back">Back</a>
    </form>
</div>
</body>
</html>
