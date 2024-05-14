package com.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpSession;

@WebServlet("/scheduleDonationServlet")
public class ScheduleDonationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId"); // Make sure donorId is set in the session
        String appointmentDate = request.getParameter("appointmentDate");

        if (donorId != null && appointmentDate != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                // Load the driver class
                Class.forName("oracle.jdbc.driver.OracleDriver");
                // Establish the connection
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");

                // Prepare SQL statement to insert a new appointment
                String sql = "INSERT INTO donation_appointments (donor_id, appointment_date, status) VALUES (?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, donorId);
                pstmt.setDate(2, java.sql.Date.valueOf(appointmentDate)); // Convert String to sql.Date
                pstmt.setString(3, "Scheduled");

                // Execute the update
                int result = pstmt.executeUpdate();
                if (result > 0) {
                    response.sendRedirect("dashboard.jsp?appointmentStatus=success");
                } else {
                    response.sendRedirect("dashboard.jsp?appointmentStatus=failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("dashboard.jsp?appointmentStatus=error");
            } finally {
                // Close resources
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        } else {
            response.sendRedirect("dashboard.jsp?appointmentStatus=invalid");
        }
    }
}
