<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Sign Up - Ocean View Resort</title>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Montserrat', sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .card {
            background: #2c2c2c;
            padding: 40px 35px;
            border-radius: 15px;
            width: 360px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.6);
            text-align: center;
            color: #f0f0f0;
        }

        .card h2 {
            margin-bottom: 25px;
            color: #36d1dc;
        }

        input[type="text"], input[type="password"], select {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border-radius: 8px;
            border: none;
            outline: none;
            background: #3c3c3c;
            color: #f0f0f0;
            font-size: 1em;
        }

        input[type="text"]::placeholder, input[type="password"]::placeholder {
            color: #bbb;
        }

        select {
            color: #f0f0f0;
        }

        input[type="submit"] {
            width: 100%;
            padding: 12px;
            margin-top: 15px;
            border: none;
            border-radius: 10px;
            background: #36d1dc;
            color: #1c1c1c;
            font-weight: 600;
            font-size: 1.1em;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        input[type="submit"]:hover {
            background: #5b86e5;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.4);
        }

        .message {
            padding: 10px;
            border-radius: 8px;
            margin-top: 15px;
            font-weight: 600;
        }

        .success { background: #4CAF50; color: white; }
        .error { background: #f44336; color: white; }

        .login-link {
            margin-top: 20px;
        }

        .login-link a {
            color: #36d1dc;
            text-decoration: none;
            font-weight: 600;
        }

        .login-link a:hover {
            color: #5b86e5;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Create Account</h2>
        <form method="post" action="signup">
            <input type="text" name="username" placeholder="Enter username" required>
            <input type="password" name="password" placeholder="Enter password" required>

            <select name="role" required>
                <option value="">-- Select Role --</option>
                <option value="staff">Staff</option>
                <option value="admin">Admin</option>
            </select>

            <input type="submit" value="Sign Up">
        </form>

        <div class="message success">
            <% if("true".equals(request.getParameter("success"))) { %>
                Account created successfully!
            <% } %>
        </div>

        <div class="message error">
            <% if("true".equals(request.getParameter("error"))) { %>
                Failed to create account! Username may already exist.
            <% } %>
        </div>

        <div class="login-link">
            <a href="login.jsp">Already have an account? Login here</a>
        </div>
    </div>
</body>
</html>
