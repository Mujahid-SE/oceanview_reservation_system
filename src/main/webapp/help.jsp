<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Help - Ocean View Resort</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #5b86e5, #36d1dc);
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
            max-width: 700px;
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

        ul {
            line-height: 1.8em;
            color: #555;
            font-size: 1.1em;
        }

        li {
            margin-bottom: 10px;
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
    <h2>Help & User Guide</h2>

    <p>Welcome to the <strong>Ocean View Resort Reservation System</strong>. 
    This system helps staff manage guest reservations, view booking details, and calculate bills efficiently.</p>

    <h3>1. Login</h3>
    <ul>
        <li>Open the login page.</li>
        <li>Enter your <strong>username</strong> and <strong>password</strong>.</li>
        <li>Click the <strong>Login</strong> button to access the dashboard.</li>
        <li>If login fails, check your credentials or contact the administrator.</li>
    </ul>

    <h3>2. Dashboard</h3>
    <ul>
        <li>The dashboard is the main control panel.</li>
        <li>From here you can navigate to add reservations, view bookings, calculate bills, or access help.</li>
    </ul>

    <h3>3. Add Reservation</h3>
    <ul>
        <li>Click <strong>Add Reservation</strong> from the dashboard.</li>
        <li>Enter the guest name, room type, check-in date, check-out date, and price per night.</li>
        <li>Click <strong>Submit</strong> to save the reservation.</li>
        <li>The reservation will be stored in the system database.</li>
    </ul>

    <h3>4. View Reservations</h3>
    <ul>
        <li>Select <strong>View Reservations</strong> from the dashboard.</li>
        <li>All current reservations will be displayed in a table.</li>
        <li>You can view guest details, room type, and reservation dates.</li>
    </ul>

    <h3>5. Bill Calculation</h3>
    <ul>
        <li>Click the <strong>Bill</strong> button next to a reservation.</li>
        <li>The system calculates the total cost based on the number of nights stayed.</li>
        <li>Total bill = Number of nights × Price per night.</li>
    </ul>

    <h3>6. Delete Reservation (Admin Only)</h3>
    <ul>
        <li>Only users with the <strong>Admin role</strong> can delete reservations.</li>
        <li>Click the <strong>Delete</strong> button in the reservation table.</li>
        <li>A confirmation message will appear before deletion.</li>
    </ul>

    <h3>7. Logout</h3>
    <ul>
        <li>Click the <strong>Logout</strong> button from the dashboard.</li>
        <li>This will securely end your session.</li>
    </ul>

    <h3>Support</h3>
    <p>If you experience any issues using the system, please contact the system administrator or IT support team.</p>

</div>

    <footer>
        &copy; 2026 Ocean View Resort. All rights reserved.
    </footer>
</body>
</html>
