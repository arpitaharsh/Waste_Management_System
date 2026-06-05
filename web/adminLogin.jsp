<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url('images/ew.jpg') no-repeat center center;
            background-size: cover;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.9); /* Slightly transparent so background shows */
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            width: 350px;
            text-align: center;
            animation: fadeIn 1s ease;
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            font-weight: bold;
            margin: 10px 0 5px;
            color: #555;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 14px;
            transition: 0.3s;
        }

        input[type="text"]:focus, input[type="password"]:focus {
            border-color: #74ebd5;
            outline: none;
            box-shadow: 0 0 8px rgba(116,235,213,0.4);
        }

        input[type="submit"] {
            background: linear-gradient(45deg, #74ebd5, #4facfe);
            border: none;
            color: white;
            padding: 12px;
            width: 100%;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: transform 0.2s, background 0.3s;
        }

        input[type="submit"]:hover {
            transform: scale(1.05);
            background: linear-gradient(45deg, #4facfe, #00f2fe);
        }

        p {
            margin-top: 15px;
            font-size: 14px;
        }

        p a {
            color: #333;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }

        .error-message {
            color: red;
            margin-top: 10px;
            font-size: 14px;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Admin Login</h2>
        <form action="AdminServlet" method="post">
            <label>Username:</label>
            <input type="text" name="username" required>

            <label>Password:</label>
            <input type="password" name="password" required>

            <input type="submit" value="Login">
            <p><a href="home.jsp">Back to Home Page</a></p>
        </form>
        <p class="error-message">
            <%= request.getAttribute("error") == null ? "" : request.getAttribute("error") %>
        </p>
    </div>
</body>
</html>
