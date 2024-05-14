package com.servlet;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session if exists
        HttpSession session = request.getSession(false);
        if(session != null) {
            session.invalidate();
        }
        
        // Redirect to login page or home page
        response.sendRedirect("registration.html"); // Assuming you have a login.jsp page. Adjust as necessary.
    }
}
