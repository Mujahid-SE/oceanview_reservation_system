package com.oceanview.reservation_system.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;

import com.oceanview.reservation_system.util.DBConnection;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String guestName = request.getParameter("guestName");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");
        String roomType = request.getParameter("roomType");
        String checkinDateStr = request.getParameter("checkinDate");
        String checkoutDateStr = request.getParameter("checkoutDate");

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO reservations " +
                         "(guest_name, address, contact_number, room_type, checkin_date, checkout_date) " +
                         "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, guestName);
            ps.setString(2, address);
            ps.setString(3, contactNumber);
            ps.setString(4, roomType);
            ps.setDate(5, Date.valueOf(checkinDateStr));
            ps.setDate(6, Date.valueOf(checkoutDateStr));

            int rows = ps.executeUpdate();

            ps.close();
            conn.close();

            if (rows > 0) {
                // Redirect with success parameter
                response.sendRedirect("addReservation.jsp?success=true");
            } else {
                response.sendRedirect("addReservation.jsp?error=true");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addReservation.jsp?error=true");
        }
    }
}
