package com.servlet;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

public class RespondToRequestServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int requestId = Integer.parseInt(request.getParameter("requestId"));
        HttpSession session = request.getSession();
        Integer donorId = (Integer) session.getAttribute("donorId");

        if (donorId == null) {
            // Redirect or handle the case where the donor is not logged in
            response.sendRedirect("login.jsp"); // Assuming you have a login page
            return;
        }

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Assuming you have a DataSource setup or similar way to get connection
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");
            String sql = "INSERT INTO emergency_responses (request_id, donor_id) VALUES (?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, requestId);
            pstmt.setInt(2, donorId);
            pstmt.executeUpdate();
            
            // Optionally, update the request status if necessary
            // Redirect or forward to a confirmation page or back to the dashboard
            response.sendRedirect("dashboard.jsp"); // Assuming you have a dashboard page
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exception (e.g., log and redirect to an error page)
        } finally {
            // Close resources
            if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
}
