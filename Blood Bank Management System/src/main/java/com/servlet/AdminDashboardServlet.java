package com.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.model.Donor;
import com.model.EmergencyRequest;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Donor> donors = fetchDonorsFromDatabase();
            request.setAttribute("donors", donors);

            List<EmergencyRequest> emergencyRequests = fetchEmergencyRequestsFromDatabase();
            request.setAttribute("emergencyRequests", emergencyRequests);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exception or set an error message attribute to show in the JSP
        }

        // Forward the request to the JSP page for rendering
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/adminDashboard.jsp");
        dispatcher.forward(request, response);
    }

    private List<Donor> fetchDonorsFromDatabase() throws SQLException, ClassNotFoundException {
        List<Donor> donors = new ArrayList<>();
        Class.forName("oracle.jdbc.driver.OracleDriver");
        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM donors");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Donor donor = new Donor(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("blood_group")
                    // Assuming the constructor of Donor class is designed to accept these parameters
                );
                donors.add(donor);
            }
        }
        return donors;
    }
    
    private List<EmergencyRequest> fetchEmergencyRequestsFromDatabase() throws SQLException, ClassNotFoundException {
        List<EmergencyRequest> emergencyRequests = new ArrayList<>();
        Class.forName("oracle.jdbc.driver.OracleDriver");
        try (Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM emergency_requests");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                EmergencyRequest request = new EmergencyRequest(
                    rs.getInt("id"),
                    rs.getString("blood_type"),
                    rs.getInt("quantity"),
                    rs.getString("location"),
                    rs.getString("urgency"),
                    rs.getString("request_status")
                    // Assuming the constructor of EmergencyRequest class is designed to accept these parameters
                );
                emergencyRequests.add(request);
            }
        }
        return emergencyRequests;
    }
}
