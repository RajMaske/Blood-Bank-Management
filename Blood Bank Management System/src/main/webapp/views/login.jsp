<%@page import="java.sql.*"%>

<%
    String email = request.getParameter("email");
    String userPassword = request.getParameter("password");
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try{
        Class.forName("oracle.jdbc.driver.OracleDriver");
        conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");
        
        String sql = "SELECT * FROM donors WHERE email = ? AND password = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, email);
        pstmt.setString(2, userPassword);
        
        rs = pstmt.executeQuery();
        if(rs.next()){
            // Login success
            
            session.setAttribute("user", email); // Use session to track login status
            response.sendRedirect("Donor/dashboard.jsp");
        } else {
            // Login failed
            response.sendRedirect("login.jsp?status=failed");
        }	
    } catch(Exception e){
        e.printStackTrace();
        // Handle exceptions
    } finally {
        if(rs != null) rs.close();
        if(pstmt != null) pstmt.close();
        if(conn != null) conn.close();
    }
%>
