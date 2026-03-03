package com.oceanview.reservation_system.servlet;

import java.io.IOException;
import com.oceanview.reservation_system.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // validation
        if(username == null || password == null ||
           username.isEmpty() || password.isEmpty()) {

            request.setAttribute("errorMessage","All fields required");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }

        UserDAO dao = new UserDAO();

        if(dao.validate(username,password)){

            // CREATE SESSION (IMPORTANT)
            HttpSession session = request.getSession();
            session.setAttribute("user", username);
            session.setMaxInactiveInterval(30*60); // 30 mins

            response.sendRedirect("home.jsp");

        }else{
            request.setAttribute("errorMessage",
                    "Invalid username or password");
            request.getRequestDispatcher("login.jsp")
                    .forward(request,response);
        }
    }
}