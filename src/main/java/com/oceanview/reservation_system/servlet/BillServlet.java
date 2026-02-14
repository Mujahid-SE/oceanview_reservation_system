package com.oceanview.reservation_system.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.temporal.ChronoUnit;

import com.oceanview.reservation_system.dao.ReservationDAO;
import com.oceanview.reservation_system.model.Reservation;

@WebServlet("/BillServlet")
public class BillServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String reservationIdStr = request.getParameter("reservationId");
        String message = "";

        if (reservationIdStr != null && !reservationIdStr.isEmpty()) {
            try {
                int reservationId = Integer.parseInt(reservationIdStr);
                ReservationDAO dao = new ReservationDAO();
                Reservation res = dao.getReservationById(reservationId);

                if (res != null) {
                    long nights = ChronoUnit.DAYS.between(res.getCheckinDate(), res.getCheckoutDate());
                    if (nights <= 0) nights = 1; // Minimum 1 night
                    double totalBill = nights * res.getPricePerNight();
                    message = "<strong>Guest Name:</strong> " + res.getGuestName() +
                            "<br><strong>Room Type:</strong> " + res.getRoomType() +
                            "<br><strong>Nights Stayed:</strong> " + nights +
                            "<br><strong>Price Per Night:</strong> $" + res.getPricePerNight() +
                            "<br><hr><strong>Total Bill:</strong> $" + totalBill;

                } else {
                    message = "Reservation not found!";
                }

            } catch (NumberFormatException e) {
                message = "Invalid Reservation ID!";
            } catch (Exception e) {
                message = "Error calculating bill: " + e.getMessage();
                e.printStackTrace();
            }
        } else {
            message = "Please enter a Reservation ID.";
        }

        request.setAttribute("billMessage", message);
        request.getRequestDispatcher("bill.jsp").forward(request, response);
    }
}
