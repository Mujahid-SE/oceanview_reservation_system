package com.oceanview.reservation_system;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.oceanview.reservation_system.util.DBConnection;

public class UserDAO {

    public boolean validate(String username, String password) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM staff WHERE username=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
}
