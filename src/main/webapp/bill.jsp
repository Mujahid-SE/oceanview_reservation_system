<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Calculate Bill - Ocean View Resort</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f8ff; padding: 30px; }
        .container { max-width: 500px; background: white; margin: 50px auto; padding: 30px; border-radius: 12px; box-shadow: 0 8px 16px rgba(0,0,0,0.2); }
        h2 { text-align: center; color: #333; }
        label { display: block; margin-top: 15px; font-weight: bold; color: #555; }
        input[type="number"] { padding: 10px; margin-top: 5px; border-radius: 6px; border: 1px solid #ccc; width: 100%; }
        input[type="submit"] { margin-top: 20px; padding: 12px; border: none; border-radius: 8px; background-color: #36d1dc; color: white; font-size: 1.1em; font-weight: bold; cursor: pointer; width: 100%; }
        input[type="submit"]:hover { background-color: #5b86e5; }
        .result { margin-top: 20px; padding: 15px; border-radius: 8px; background-color: #f1f1f1; font-size: 1em; color: #333; text-align: center; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Calculate Bill</h2>

        <form method="get" action="BillServlet">
            <label>Reservation ID:</label>
            <input type="number" name="reservationId" required>
            <input type="submit" value="Calculate">
        </form>

        <div class="result">
            <%
                String billMessage = (String) request.getAttribute("billMessage");
                if (billMessage != null) {
                    out.println(billMessage);
                }
            %>
        </div>
    </div>
</body>
</html>
