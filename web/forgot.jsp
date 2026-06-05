<!DOCTYPE html>
<html>
<head>
<title>Forgot Password</title>
<style>
body {
  margin: 0;
  font-family: Arial, sans-serif;
  background-color: lightgreen;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
}
.forgot-box {
  background: white;
  padding: 30px;
  border-radius: 10px;
  width: 320px;
  text-align: center;
  box-shadow: 0 4px 12px rgba(0,0,0,0.2);
}
.forgot-box h2 { margin-bottom: 10px; color: #004d00; }
.forgot-box input {
  width: 90%; padding: 10px; margin: 8px 0;
  border: 1px solid #ccc; border-radius: 5px;
}
.forgot-box input[type=submit] {
  width: 100%; padding: 10px;
  background: #004d00; color: white; border: none;
  border-radius: 5px; cursor: pointer; font-weight: bold;
}
.forgot-box input[type=submit]:hover { background: #006600; }
.success { background: #ccffcc; color: green; padding: 6px; border-radius: 5px; margin-bottom: 10px; }
.error { background: pink; color: red; padding: 6px; border-radius: 5px; margin-bottom: 10px; }
</style>
</head>
<body>
  <div class="forgot-box">
    <h2>Reset Password</h2>
    <form method="post" action="forgot1">
      <input type="email" name="email" placeholder="Enter Email" required><br>
      <input type="password" name="newpass" placeholder="Enter New Password" required><br>
      <input type="submit" value="Update Password">
    </form>
    <a href="login.jsp">Back to Login</a>
  </div>
</body>
</html>
