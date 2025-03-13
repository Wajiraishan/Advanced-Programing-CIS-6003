package com.megacab.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.megacab.model.RegisterModel;

public class RegisterRepo {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/megacab";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    public String saveUser(RegisterModel user) {
        String query = "INSERT INTO users (name, nic, address, password, agree) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(query)) {
             
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getNic());
            stmt.setString(3, user.getAddress());
            stmt.setString(4, user.getPassword());
            stmt.setBoolean(5, user.isAgree());

            int rowsInserted = stmt.executeUpdate();
            return (rowsInserted > 0) ? "Registration Successful" : "Registration Failed";

        } catch (SQLException e) {
            e.printStackTrace();
            return "Database Error";
        }
    }
}
