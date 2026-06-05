<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Confirmation</title>
</head>
<body style="font-family:Arial; background:#f1f8f6; padding:30px;">
    <h2 style="color:green;"><%= request.getAttribute("message") %></h2>
    <a href="addwaste.jsp">⬅ Back to Add Waste</a>
</body>
</html>
