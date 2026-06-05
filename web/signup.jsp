<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String errorMsg = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<title>Signup</title>
<style>
/* Background */
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background: url('<%= request.getContextPath() %>/images/ew.jpg') no-repeat center center fixed;
  background-size: cover; /* make the image cover full screen */
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh; /* full screen */
}

/* Signup box (same style as login box) */
.signup-box {
  background: rgba(255, 255, 255, 0.9); /* semi-transparent for readability */
  padding: 30px;
  border-radius: 10px;
  width: 320px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0,0,0,0.3);
}

/* Heading */
.signup-box h2 {
  margin-bottom: 10px;
  color: #004d00;
}

/* Inputs */
.signup-box input[type=text],
.signup-box input[type=password],
.signup-box input[type=email] {
  width: 90%;
  padding: 10px;
  margin: 8px 0;
  border: 1px solid #ccc;
  border-radius: 5px;
}

/* Submit button */
.signup-box input[type=submit] {
  width: 100%;
  padding: 10px;
  margin-top: 10px;
  background: #004d00;
  color: white;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-weight: bold;
}
.signup-box input[type=submit]:hover {
  background: #006600;
}

/* Error message */
.error {
  background: pink;
  color: red;
  padding: 6px;
  border-radius: 5px;
  margin-bottom: 10px;
}

/* Links */
.signup-box a {
  display: block;
  margin-top: 8px;
  font-size: 13px;
  color: #004d00;
  text-decoration: none;
}
.signup-box a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
  <div class="signup-box">
    <h2>Signup</h2>
    <p>Create your account</p>

    <% if(errorMsg != null){ %>
      <div class="error"><%= errorMsg %></div>
    <% } %>

    <form method="post" action="signup1">
      <input type="text" name="name" placeholder="Full Name" required><br>
      <input type="email" name="email" placeholder="Email" required><br>
      <input type="text" name="contact" placeholder="Contact Number" required><br>
      <input type="password" name="pass" placeholder="Password" required><br>
      <input type="text" name="address" placeholder="Address"><br>
      <input type="text" name="gender" placeholder="Gender"><br>
      <input type="submit" value="Signup">
    </form>

    <a href="login.jsp">Already registered? Login</a>
  </div>
</body>
</html>
