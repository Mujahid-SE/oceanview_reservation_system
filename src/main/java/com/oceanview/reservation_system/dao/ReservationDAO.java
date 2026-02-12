package com.oceanview.reservation_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.oceanview.reservation_system.util.DBConnection;

public class ReservationDAO {

    // Add a new reservation
    public boolean addReservation(String guestName, String address, String contactNumber,
                                  String roomType, String checkinDate, String checkoutDate,
                                  double totalAmount) {
        boolean status = false;
        String sql = "INSERT INTO reservations (guest_name, address, contact_number, room_type, checkin_date, checkout_date, total_amount, created_at) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, guestName);
            ps.setString(2, address);
            ps.setString(3, contactNumber);
            ps.setString(4, roomType);
            ps.setString(5, checkinDate);
            ps.setString(6, checkoutDate);
            ps.setDouble(7, totalAmount);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                status = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Get reservation details by ID
    public ResultSet getReservationById(int reservationId) {
        ResultSet rs = null;
        String sql = "SELECT * FROM reservations WHERE id = ?";
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, reservationId);
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }

    // Calculate bill (here, we just fetch total_amount from table)
    public double calculateBill(int reservationId) {
        double total = 0;
        String sql = "SELECT total_amount FROM reservations WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reservationId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                total = rs.getDouble("total_amount");
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return total;
    }
}
