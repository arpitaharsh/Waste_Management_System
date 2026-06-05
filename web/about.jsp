<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - EcoWaste Solutions</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
/* Global */
body {
  margin: 0;
  font-family: 'Poppins', sans-serif;
  background: #f3fbf3;
  color: #222;
  line-height: 1.8;
}

/* ===== HEADER ===== */
header {
  background: linear-gradient(120deg, #1b5e20, #2e7d32);
  color: #fff;
  text-align: center;
  padding: 90px 20px 70px;
  border-bottom-left-radius: 60% 10%;
  border-bottom-right-radius: 60% 10%;
}
header h1 {
  font-size: 52px;
  margin: 0;
  font-weight: 800;
  text-transform: uppercase;
  letter-spacing: 2px;
}
header p {
  font-size: 20px;
  margin-top: 12px;
  font-weight: 300;
  color: #c8e6c9;
}

/* ===== ABOUT SECTION ===== */
.about-section {
  max-width: 1100px;
  margin: 60px auto;
  padding: 0 20px;
  display: grid;
  gap: 35px;
}

/* Card Style */
.card {
  background: #fff;
  border-radius: 16px;
  padding: 30px;
  box-shadow: 0 8px 20px rgba(0,0,0,0.08);
  transition: transform 0.3s, box-shadow 0.3s;
}
.card:hover {
  transform: translateY(-6px);
  box-shadow: 0 14px 28px rgba(0,0,0,0.15);
}
.card h2, .card h3 {
  margin-bottom: 15px;
  font-size: 24px;
  color: #2e7d32;
  position: relative;
  padding-bottom: 6px;
}
.card h2::after, .card h3::after {
  content: "";
  position: absolute;
  left: 0;
  bottom: 0;
  width: 60px;
  height: 3px;
  background: #66bb6a;
  border-radius: 2px;
}

/* Paragraphs */
.card p {
  font-size: 16px;
  margin: 0;
  color: #444;
}
.card ul {
  padding-left: 20px;
  margin: 10px 0 0;
}
.card li {
  margin: 10px 0;
  color: #444;
}

/* Footer */
footer {
  margin-top: 60px;
  background: #1b5e20;
  color: #fff;
  text-align: center;
  padding: 25px 15px;
  font-size: 15px;
}
footer a {
  color: #a5d6a7;
  text-decoration: none;
  transition: color 0.3s;
}
footer a:hover {
  color: #ffffff;
  text-decoration: underline;
}
</style>
</head>
<body>

<header>
  <h1>EcoWaste Solutions</h1>
  <p>Innovating Waste Management for Tomorrow</p>
</header>

<div class="about-section">

  <div class="card">
    <h2>About Us</h2>
    <p>
      At <strong>EcoWaste Solutions</strong>, we believe waste is not just something to throw away —
      it’s a resource waiting to be transformed. Our platform combines technology and
      sustainability to create smarter systems for waste collection, recycling, and
      responsible disposal.
    </p>
  </div>

  <div class="card">
    <h3>Our Purpose</h3>
    <p>
      We are dedicated to reducing environmental damage by streamlining how waste
      is handled. From households to municipalities, we provide services that make
      recycling effortless and eco-friendly living a reality.
    </p>
  </div>

  <div class="card">
    <h3>Our Aspiration</h3>
    <p>
      Our vision is a world where communities thrive in cleaner spaces, and waste
      is managed with innovation and care. By using smart technology, we aim to
      build sustainable cities for the next generation.
    </p>
  </div>

  <div class="card">
    <h3>What We Provide</h3>
    <ul>
      <li><strong>Pick-up Services:</strong> Hassle-free waste collection right from your doorstep.</li>
      <li><strong>Recycling Guidance:</strong> Easy access to recycling tips and local programs.</li>
      <li><strong>Smart Dashboard:</strong> Track waste, monitor progress, and view insights.</li>
      <li><strong>Optimized Routes:</strong> Efficient transport paths for faster, greener service.</li>
      <li><strong>Educational Resources:</strong> Learn effective waste separation and disposal methods.</li>
    </ul>
  </div>

  <div class="card">
    <h3>What We Stand For</h3>
    <ul>
      <li><strong>Eco Responsibility:</strong> Protecting nature with sustainable practices.</li>
      <li><strong>Innovation:</strong> Adopting smart tools to reshape waste management.</li>
      <li><strong>Honesty:</strong> Clear communication and trusted service delivery.</li>
      <li><strong>Community Power:</strong> Partnering with citizens to achieve cleaner neighborhoods.</li>
    </ul>
  </div>

  <div class="card">
    <h3>Reach Out</h3>
    <p>
      📍 Address: Asansol, Green Zone, Earth<br>
      📞 Phone: +1 234 567 890<br>
      📧 Email: contact@ecowaste.com
    </p>
  </div>

</div>

<footer>
  <p>&copy; 2025 EcoWaste Solutions. All Rights Reserved.</p>
  <p><a href="home.jsp">Back to Home Page</a></p>
</footer>

</body>
</html>