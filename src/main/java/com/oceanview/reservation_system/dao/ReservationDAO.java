package com.oceanview.reservation_system.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.oceanview.reservation_system.model.Reservation;
import com.oceanview.reservation_system.util.DBConnection;

public class ReservationDAO {

    // Add a new reservation
	public boolean addReservation(String guestName, String address, String contactNumber,
            String roomType, String checkinDate, String checkoutDate,
            double pricePerNight) {
boolean status = false;
String sql = "INSERT INTO reservations (guest_name, address, contact_number, room_type, checkin_date, checkout_date, price_per_night, created_at) "
+ "VALUES (?, ?, ?, ?, ?, ?, ?, NOW())";

try (Connection conn = DBConnection.getConnection();
PreparedStatement ps = conn.prepareStatement(sql)) {

ps.setString(1, guestName);
ps.setString(2, address);
ps.setString(3, contactNumber);
ps.setString(4, roomType);
ps.setString(5, checkinDate);
ps.setString(6, checkoutDate);
ps.setDouble(7, pricePerNight);

status = ps.executeUpdate() > 0;

} catch (SQLException e) {
e.printStackTrace();
}

return status;
}


    // Get reservation details by ID
    public Reservation getReservationById(int reservationId) {
        Reservation res = null;
        String sql = "SELECT * FROM reservations WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reservationId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                res = new Reservation();
                res.setId(rs.getInt("id"));
                res.setGuestName(rs.getString("guest_name"));
                res.setAddress(rs.getString("address"));
                res.setContactNumber(rs.getString("contact_number"));
                res.setRoomType(rs.getString("room_type"));
                res.setCheckinDate(rs.getDate("checkin_date").toLocalDate());
                res.setCheckoutDate(rs.getDate("checkout_date").toLocalDate());
                res.setPricePerNight(rs.getDouble("price_per_night"));
            }

            rs.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return res;
    }
}
