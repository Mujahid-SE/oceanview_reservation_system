package com.oceanview.reservation_system.servlet;

import com.oceanview.reservation_system.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/signup")
public class SignupServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        UserDAO dao = new UserDAO();

        try {
            boolean created = dao.createUser(username, password, role);

            if (created) {
                response.sendRedirect("signup.jsp?success=true");
            } else {
                response.sendRedirect("signup.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("signup.jsp?error=true");
        }
    }
}
