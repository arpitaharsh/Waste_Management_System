<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%
    String errorMsg = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<title>Waste Management - Login</title>
<style>
/* Background with green + image */
body {
  margin: 0;
  font-family: 'Trebuchet MS', sans-serif;
  background: linear-gradient(135deg, #2ecc71, #27ae60), 
              url('<%= request.getContextPath() %>/images/ew.jpg') no-repeat center center/cover;
  background-blend-mode: overlay;  /* blends green with image */
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  position: relative;
  overflow: hidden;
}

/* Extra overlay with green tint */
.overlay {
  background: rgba(0, 80, 0, 0.5);
  position: absolute;
  top: 0; left: 0;
  height: 100%;
  width: 100%;
  z-index: -1;
}

/* Login box */
.login-box {
  background: rgba(255, 255, 255, 0.95);
  padding: 35px;
  border-radius: 15px;
  width: 340px;
  text-align: center;
  box-shadow: 0 8px 18px rgba(0,0,0,0.3);
  animation: pop 0.8s ease;
  border-top: 6px solid #27ae60;
}

/* Animation */
@keyframes pop {
  from { transform: scale(0.8); opacity: 0; }
  to   { transform: scale(1); opacity: 1; }
}

/* Heading */
.login-box h2 {
  margin-bottom: 10px;
  color: #1e8449; /* dark eco green */
  font-size: 26px;
}
.login-box p {
  font-size: 14px;
  color: #333;
  margin-bottom: 15px;
}

/* Inputs */
.login-box input[type=text],
.login-box input[type=password] {
  width: 90%;
  padding: 12px;
  margin: 8px 0;
  border: 1px solid #bbb;
  border-radius: 8px;
  font-size: 14px;
}

/* Submit button */
.login-box input[type=submit] {
  width: 100%;
  padding: 12px;
  margin-top: 12px;
  background: linear-gradient(90deg, #2ecc71, #27ae60);
  color: white;
  border: none;
  border-radius: 8px;
  cursor: pointer;
  font-weight: bold;
  transition: 0.3s;
}
.login-box input[type=submit]:hover {
  background: linear-gradient(90deg, #27ae60, #1e8449);
  transform: scale(1.05);
}

/* Error message */
.error {
  background: #eafaf1;
  color: #1e8449;
  padding: 8px;
  border-radius: 5px;
  margin-bottom: 10px;
  font-size: 13px;
  font-weight: bold;
  border: 1px solid #27ae60;
}

/* Links */
.login-box a {
  display: block;
  margin-top: 10px;
  font-size: 13px;
  color: #1e8449;
  text-decoration: none;
  font-weight: bold;
}
.login-box a:hover {
  text-decoration: underline;
}
</style>
</head>
<body>
  <div class="overlay"></div>
  <div class="login-box">
    <h2>Waste Management</h2>
    <p>Welcome back! Please login to manage, buy and sell your waste products responsibly.</p>

    <% if(errorMsg != null){ %>
      <div class="error"><%= errorMsg %></div>
    <% } %>

    <form method="post" action="loginvalidate">
      <input type="text" name="email" placeholder="Email" required><br>
      <input type="password" name="pass" placeholder="Password" required><br>
      <input type="submit" value="Login">
    </form>

    <a href="forgot.jsp">Forgot Password?</a>
    <a href="signup.jsp">New user? Sign Up</a>
  </div>
</body>
</html>
