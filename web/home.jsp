<%@ page import="javax.servlet.http.*" %>
<%
    if(session.getAttribute("name") == null){
        response.sendRedirect("login.jsp");
        return;
    }
    String username = (String) session.getAttribute("name");
%>
<!DOCTYPE html>
<html>
<head>
<title>Home - Waste Management</title>
<style>
/* Global */
body {
  margin: 0;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background: #f0f0f0; /* very light gray for overall page */
  color: #222;
}


/* Navbar */
.navbar {
  display:flex; justify-content:space-between; align-items:center;
  background:#006600; padding:15px 40px; color:white;
  box-shadow: 0 4px 8px rgba(0,0,0,0.50);
}
.navbar .brand { font-weight:bold; font-size:24px; }
.navbar .links a {
  margin-left:30px; color:white; text-decoration:none; font-weight:600;
}
.navbar .links a:hover { text-decoration: underline; color:#cce5cc; }

/* Section Box */
.section {
  background: #d9d9d9;   /* gray */
  border-radius: 20px;
  max-width:1200px;
  margin:60px auto;
  padding:50px;
  box-shadow:0 12px 28px rgba(0,0,0,0.35); /* darker shadow */
}


/* Hero (Welcome) */
.hero {
  display:flex; justify-content:space-between; align-items:center;
  gap:50px;
}
.hero-left h1 { font-size:40px; color:#004d00; margin-bottom:15px; }
.hero-left p { font-size:17px; line-height:1.6; color:#333; }
.hero-right img {
  max-width:350px; border-radius:20px;
  box-shadow:0 8px 22px rgba(0,0,0,0.25);
}

/* Section Headings */
.section h2 {
  font-size:40px; color:#006600; text-align:center;
  margin-bottom:25px; font-weight:bold;
}


/* Rules */
.rules {
  margin:25px 0; text-align:center; font-size:16px;
}
.rules ul {
  list-style-type: disc; display:inline-block;
  text-align:left; line-height:1.8;
}

/* Image Grid */
.img-row {
  margin-top:35px; display:flex; justify-content:space-between; gap:30px;
}
.img-row img {
  width:100%; height:240px; object-fit:cover; border-radius:14px;
  box-shadow:0 8px 22px rgba(0,0,0,0.25);
}

/* Section 3 Layout */
.participate {
  display:flex; justify-content:space-between; gap:30px; margin-top:40px;
}
.participate .box {
  flex:1; text-align:center;
}
.participate img {
  width:100%; height:300px; object-fit:cover; border-radius:14px;
  box-shadow:0 8px 22px rgba(0,0,0,0.25);
}
.participate p {
  margin-top:15px; font-size:16px; color:#333; line-height:1.6;
}

/* Footer */
footer {
  background:#006600; color:white; text-align:center;
  padding:20px; margin-top:40px; font-size:15px;
}
</style>
</head>
<body>

<!-- Navbar -->
<div class="navbar">
  <div class="brand">Waste Management System</div>
  <div class="links">
    <a href="home.jsp" class="active">Home</a>
    <a href="about.jsp">About Us</a>
    <a href="addwaste.jsp">Add Waste</a>
    <a href="category.jsp">Recycled Products</a>
    <a href="profile.jsp">Profile</a>
    <a href="adminLogin.jsp">Admin</a>
    <a href="logout.jsp">Logout</a>
  </div>
</div>

<!-- Section 1: Welcome -->
<div class="section hero">
  <div class="hero-left">
    <h1>Welcome, <%= username %>!</h1>
    <p>Together we make waste management easy, smart, and sustainable.  
       Sell your waste, explore recycled products, and join the movement  
       towards a cleaner, greener planet.</p>
  </div>
  <div class="hero-right">
    <img src="<%= request.getContextPath() %>/images/ew.jpg" alt="Website Benefits">
  </div>
</div>

<!-- Section 2: Waste Management System -->
<div class="section">
  <h2>Waste Management System</h2>
  <p style="text-align:center; max-width:850px; margin:0 auto 25px auto; 
            font-size:17px; line-height:1.8; color:#333;">
    Waste management means collecting, treating, and disposing of waste in a safe way.  
    By reducing, reusing, and recycling, we save energy, protect nature,  
    and build a sustainable future.
  </p>

  <div class="rules">
    <ul>
      <li>Reduce unnecessary plastics and packaging.</li>
      <li>Reuse household items whenever possible.</li>
      <li>Recycle paper, glass, and metals responsibly.</li>
    </ul>
  </div>

  <div class="img-row">
    <img src="<%= request.getContextPath() %>/images/reduce.jpg" alt="Reduce">
    <img src="<%= request.getContextPath() %>/images/reuse.jpg" alt="Reuse">
    <img src="<%= request.getContextPath() %>/images/recycle.jpg" alt="Recycle">
  </div>
</div>

<!-- Section 3: How You Can Be Part -->
<div class="section">
  <h2>How You Can Be Part of Waste Management</h2>
  <div class="participate">
    <div class="box">
      <img src="<%= request.getContextPath() %>/images/reduce1.jpg" alt="Reduce Waste">
      <p>Start reducing waste by avoiding single-use plastics,  
         carrying your own bag, and buying only what you need.</p>
    </div>
    <div class="box">
      <img src="<%= request.getContextPath() %>/images/reuse1.jpg" alt="Reuse Waste">
      <p>Reuse jars, bottles, and clothes. Give old items a second life  
         instead of throwing them away.</p>
    </div>
    <div class="box">
      <img src="<%= request.getContextPath() %>/images/recycle1.jpg" alt="Recycle Waste">
      <p>Recycle paper, glass, and metals by putting them in proper bins  
         and supporting recycling programs.</p>
    </div>
  </div>
</div>

<!-- Footer -->
<footer>
  <p>&copy; 2025 Waste Management System | All Rights Reserved</p>
</footer>

</body>
</html>