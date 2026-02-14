<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Reservation - Ocean View Resort</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', Arial, sans-serif;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .container {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
            max-width: 450px;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: #004080;
            margin-bottom: 25px;
        }

        form label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            color: #333;
        }

        form input[type=text],
        form input[type=date],
        form select {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            font-size: 1em;
        }

        form input[type=submit] {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background: #004080;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        form input[type=submit]:hover {
            background: #0066cc;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .alert {
            text-align: center;
            padding: 12px;
            margin-top: 20px;
            border-radius: 8px;
            font-weight: 600;
        }

        .success {
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }

        .error {
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Reservation</h2>

        <%
            String success = request.getParameter("success");
            String error = request.getParameter("error");
        %>

        <% if ("true".equals(success)) { %>
            <div class="alert success">Reservation Successfully Added!</div>
        <% } else if ("true".equals(error)) { %>
            <div class="alert error">Failed to Add Reservation! Please check the details.</div>
        <% } %>

        <form method="post" action="reservation">
            <label>Guest Name:</label>
            <input type="text" name="guestName" placeholder="Enter guest full name" required>

            <label>Address:</label>
            <input type="text" name="address" placeholder="Enter address" required>

            <label>Contact Number:</label>
            <input type="text" name="contactNumber" placeholder="Enter phone number" required>

            <label>Room Type:</label>
            <select name="roomType" required>
                <option value="">-- Select Room Type --</option>
                <option value="Standard">Standard - $100</option>
                <option value="Deluxe">Deluxe - $150</option>
                <option value="Suite">Suite - $250</option>
                <option value="Ocean view">Ocean View - $350</option>
            </select>

            <label>Check-in Date:</label>
            <input type="date" name="checkinDate" required>

            <label>Check-out Date:</label>
            <input type="date" name="checkoutDate" required>

            <input type="submit" value="Add Reservation">
        </form>
    </div>
</body>
</html>
