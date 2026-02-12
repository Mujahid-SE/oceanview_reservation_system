<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #4facfe, #00f2fe);
            margin: 0;
            padding: 0;
        }

        header {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            padding: 30px 0;
            font-size: 2em;
            font-weight: bold;
        }

        nav {
            display: flex;
            justify-content: center;
            margin: 40px 0;
            flex-wrap: wrap;
        }

        nav a {
            background-color: white;
            color: #4facfe;
            text-decoration: none;
            padding: 15px 25px;
            margin: 10px;
            border-radius: 8px;
            font-size: 1.2em;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0,0,0,0.2);
            transition: all 0.3s ease;
        }

        nav a:hover {
            background-color: #4facfe;
            color: white;
            transform: translateY(-3px);
            box-shadow: 0 8px 12px rgba(0,0,0,0.3);
        }

        footer {
            text-align: center;
            color: white;
            padding: 20px 0;
            background-color: rgba(0, 0, 0, 0.6);
            position: fixed;
            bottom: 0;
            width: 100%;
        }

        h2 {
            text-align: center;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <header>Ocean View Resort Dashboard</header>

    <h2>Welcome, Staff / Admin!</h2>

    <nav>
        <a href="addReservation.jsp">Add Reservation</a>
        <a href="viewReservation.jsp">View Reservations</a>
        <a href="bill.jsp">Calculate Bill</a>
        <a href="help.jsp">Help</a>
        <a href="login.jsp">Logout</a>
    </nav>

    <footer>
        &copy; 2026 Ocean View Resort. All rights reserved.
    </footer>
</body>
</html>
