package com.oceanview.reservation_system.servlet ;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/deleteReservation")
public class DeleteReservationServlet extends HttpServlet {

    private static final String URL =
            "jdbc:mysql://localhost:3306/oceanview_resort";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");

        if (idParam != null) {

            try {
                int id = Integer.parseInt(idParam);

                Class.forName("com.mysql.cj.jdbc.Driver");

                Connection conn =
                        DriverManager.getConnection(URL, USER, PASSWORD);

                String sql = "DELETE FROM reservations WHERE id=?";

                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, id);

                ps.executeUpdate();

                ps.close();
                conn.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // redirect back to viewpage
        response.sendRedirect("viewReservation.jsp?msg=deleted");
    }
}