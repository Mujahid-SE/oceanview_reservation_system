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
import java.time.LocalDate;

import com.oceanview.reservation_system.util.DBConnection;

@WebServlet("/reservation")
public class ReservationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String guestName = request.getParameter("guestName");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");
        String roomType = request.getParameter("roomType");
        String checkinDateStr = request.getParameter("checkinDate");
        String checkoutDateStr = request.getParameter("checkoutDate");

        try {
            // Convert dates
            LocalDate checkinDate = LocalDate.parse(checkinDateStr);
            LocalDate checkoutDate = LocalDate.parse(checkoutDateStr);

            // Validate dates
            if (checkoutDate.isBefore(checkinDate)) {
                response.sendRedirect("addReservation.jsp?error=true");
                return;
            }

            // Assign price automatically based on room type
            double pricePerNight = 0;

            switch (roomType) {
                case "Standard":
                    pricePerNight = 100;
                    break;
                case "Deluxe":
                    pricePerNight = 150;
                    break;
                case "Suite":
                    pricePerNight = 250;
                    break;
                case "Ocean view":
                    pricePerNight = 350;
                    break;
                default:
                    pricePerNight = 100; // fallback
            }

            String sql = "INSERT INTO reservations " +
                    "(guest_name, address, contact_number, room_type, checkin_date, checkout_date, price_per_night) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?)";

            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)) {

                ps.setString(1, guestName);
                ps.setString(2, address);
                ps.setString(3, contactNumber);
                ps.setString(4, roomType);
                ps.setDate(5, Date.valueOf(checkinDate));
                ps.setDate(6, Date.valueOf(checkoutDate));
                ps.setDouble(7, pricePerNight);

                int rows = ps.executeUpdate();

                if (rows > 0) {
                    response.sendRedirect("addReservation.jsp?success=true");
                } else {
                    response.sendRedirect("addReservation.jsp?error=true");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("addReservation.jsp?error=true");
        }
    }
}
