<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculate Bill - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #36d1dc, #5b86e5);
            margin: 0;
            padding: 0;
        }

        header {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            text-align: center;
            padding: 25px 0;
            font-size: 2em;
            font-weight: bold;
        }

        .container {
            max-width: 500px;
            background-color: white;
            margin: 50px auto;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            margin-top: 15px;
            font-weight: bold;
            color: #555;
        }

        input[type="number"] {
            padding: 10px;
            margin-top: 5px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 1em;
        }

        input[type="submit"] {
            margin-top: 25px;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background-color: #36d1dc;
            color: white;
            font-size: 1.2em;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #5b86e5;
        }

        .result {
            margin-top: 30px;
            padding: 15px;
            border-radius: 8px;
            background-color: #f1f1f1;
            font-size: 1em;
            color: #333;
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

    </style>
</head>
<body>
    <header>Ocean View Resort</header>

    <div class="container">
        <h2>Calculate Bill</h2>
        <form method="get" action="BillServlet">
            <label>Reservation ID:</label>
            <input type="number" name="reservationId" required>
            <input type="submit" value="Calculate">
        </form>

        <div class="result">
            <%-- Placeholder for calculated bill from BillServlet --%>
            <!--
                <% 
                    // Example:
                    // int reservationId = Integer.parseInt(request.getParameter("reservationId"));
                    // Bill bill = BillDAO.getBill(reservationId);
                    // out.println("Total Amount: $" + bill.getTotal());
                %>
            -->
        </div>
    </div>

    <footer>
        &copy; 2026 Ocean View Resort. All rights reserved.
    </footer>
</body>
</html>
