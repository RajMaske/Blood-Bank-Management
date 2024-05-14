<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
<%@page import="com.model.EmergencyRequest"%> <!-- Import your EmergencyRequest model -->
<%@page import="javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donor Dashboard</title>
    <!-- Tailwind CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.3/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        .background {
            background-image: url('your-background-image-url');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="background">
   <nav class="bg-blue-900 text-white p-4 shadow">
    <div class="container mx-auto flex justify-between items-center">
        <h1 class="text-xl font-bold">Blood Donation Dashboard</h1>
        <div class="flex space-x-4">
            <ul class="flex space-x-4">
                <li><a href="#" class="hover:underline text-lg">Home</a></li>
                <!-- You can add more links here -->
            </ul>
            <!-- Logout Button -->
            <form action="/Blood_Bank_Management_System/LogoutServlet" method="post" class="flex items-center">
                <button type="submit" class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded cursor-pointer">Logout</button>
            </form>
        </div>
    </div>
</nav>

    <div class="container mx-auto mt-5 bg-white p-5 rounded shadow-lg">
        <h2 class="font-bold text-xl mb-4">Welcome to Your Dashboard</h2>
        <% 
            String userEmail = (String)session.getAttribute("user");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("oracle.jdbc.driver.OracleDriver");
                conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "raj", "tancent");

                String sqlDonor = "SELECT * FROM donors WHERE email = ?";
                pstmt = conn.prepareStatement(sqlDonor);
                pstmt.setString(1, userEmail);
                rs = pstmt.executeQuery();

                if(rs.next()) {
        %>
        <div>
            <p><strong>Name:</strong> <%= rs.getString("name") %></p>
            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
            <p><strong>Blood Group:</strong> <%= rs.getString("blood_group") != null ? rs.getString("blood_group") : "Not specified" %></p>
            <%session.setAttribute("donorId", rs.getInt("id")); // Setting the donorId in the session based on the logged-in user %>
        </div>
        <%      
                    // Additional sections for donation appointments and emergency requests can be added here
                }

            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                if(rs != null) try { rs.close(); } catch(SQLException e) { /* Ignored */ }
                if(pstmt != null) try { pstmt.close(); } catch(SQLException e) { /* Ignored */ }
                if(conn != null) try { conn.close(); } catch(SQLException e) { /* Ignored */ }
            }
        %>
    </div>
    <div class="container mx-auto mt-5 bg-white p-5 rounded shadow-lg">
    <!-- Schedule a Donation Appointment Form -->
    <h3 class="font-bold text-lg mt-8">Schedule a Donation Appointment</h3>
    <form action="scheduleDonation" method="post" class="mt-4">
        <label for="donationDate" class="block">Choose a date:</label>
        <input type="date" id="donationDate" name="donationDate" required class="p-2 rounded border border-gray-300">
        
        <input type="submit" value="Schedule" class="mt-4 bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded cursor-pointer">
    </form>	
    </div>
    <div class="container mx-auto mt-5 bg-white p-5 rounded shadow-lg">
    <!-- Emergency Blood Requests Section -->
    <h3 class="font-bold text-lg mt-8">Emergency Blood Requests</h3>
    <div class="mt-4">
        <%-- Assuming emergencyRequests is a List object fetched from the server --%>
        <% List<EmergencyRequest> emergencyRequests = (List<EmergencyRequest>) request.getAttribute("emergencyRequests");
           if (emergencyRequests != null) {
               for (EmergencyRequest erequest : emergencyRequests) {
        %>
        <div class="p-4 mb-4 border rounded">
            <p><strong>Type Needed:</strong> <%= erequest.getBloodType() %></p>
            <p><strong>Quantity Needed:</strong> <%= erequest.getQuantity() %> units</p>
            <p><strong>Location:</strong> <%= erequest.getLocation() %></p>
            <p><strong>Urgency:</strong> <%= erequest.getUrgency() %></p>
            <form action="respondToRequest" method="post">
                <input type="hidden" name="requestId" value="<%= erequest.getId() %>">
                <input type="submit" value="Respond" class="mt-2 bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded cursor-pointer">
            </form>
        </div>
        <% 
               }
           } else {
        %>
        <p>No emergency requests at the moment.</p>
        <% 
           }
        %>
    </div>
    </div>
</body>
</html>
