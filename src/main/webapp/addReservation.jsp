<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation - Ocean View Resort</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            padding: 30px;
        }
        h2 {
            color: #004080;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            max-width: 400px;
        }
        input[type=text], input[type=date], input[type=number] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
            box-sizing: border-box;
        }
        input[type=submit] {
            background-color: #004080;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #0066cc;
        }
    </style>
</head>
<body>
    <h2>Add New Reservation</h2>
    <%
    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>

<script>
    <% if ("true".equals(success)) { %>
        alert("Reservation Successfully Added!");
    <% } %>

    <% if ("true".equals(error)) { %>
        alert("Failed to Add Reservation!");
    <% } %>
</script>
    
    <form method="post" action="reservation">
        Guest Name: <input type="text" name="guestName" required><br>
        Address: <input type="text" name="address" required><br>
        Contact Number: <input type="text" name="contactNumber" required><br>
        Room Type: <input type="text" name="roomType" required><br>
        Check-in Date: <input type="date" name="checkinDate" required><br>
        Check-out Date: <input type="date" name="checkoutDate" required><br>
        <input type="submit" value="Add Reservation">
    </form>

    <p style="color:green;">
        ${successMessage}
    </p>
    <p style="color:red;">
        ${errorMessage}
    </p>
</body>
</html>
