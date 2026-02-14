package com.oceanview.reservation_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.oceanview.reservation_system.util.DBConnection;

public class UserDAO {

    // Validate login
    public boolean validate(String username, String password) {
        boolean status = false;
        String sql = "SELECT * FROM staff WHERE username=? AND password=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setString(2, password); // Later you can hash this
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    // Create new user with duplicate check
    public boolean createUser(String username, String password, String role) {
        boolean status = false;

        // Validate role
        if (!"admin".equals(role) && !"staff".equals(role)) {
            return false;
        }

        try (Connection conn = DBConnection.getConnection()) {

            // Check for existing username
            String checkSql = "SELECT id FROM staff WHERE username=?";
            try (PreparedStatement psCheck = conn.prepareStatement(checkSql)) {
                psCheck.setString(1, username);
                ResultSet rs = psCheck.executeQuery();
                if (rs.next()) {
                    System.out.println("Username already exists!");
                    return false;
                }
            }

            // Insert new user
            String insertSql = "INSERT INTO staff (username, password, role) VALUES (?, ?, ?)";
            try (PreparedStatement psInsert = conn.prepareStatement(insertSql)) {
                psInsert.setString(1, username);
                psInsert.setString(2, password); // TODO: Hash passwords in real-world apps
                psInsert.setString(3, role);
                status = psInsert.executeUpdate() > 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}
