<%@page import="java.sql.*"%>

<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String userPassword = request.getParameter("password");
    String bloodGroup = request.getParameter("blood_group"); // Get the blood_group parameter
    
    if(name != null && email != null && userPassword != null && bloodGroup != null){
        Connection conn = null;
        PreparedStatement pstmt = null;
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");
            
            // Include the blood_group field in your SQL statement
            String sql = "INSERT INTO donors (name, email, password, blood_group) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, userPassword); // Consider using password hashing for security
            pstmt.setString(4, bloodGroup); // Add the blood_group to the prepared statement
            
            int result = pstmt.executeUpdate();
            if(result > 0){
                session.setAttribute("user", email);
                // Registration success
                response.sendRedirect("Donor/dashboard.jsp");
            } else {
                // Registration failed
                response.sendRedirect("register.jsp?status=failed");
            }
        } catch(Exception e){
            e.printStackTrace();
            // Handle exceptions
        } finally {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        }
    }
%>
