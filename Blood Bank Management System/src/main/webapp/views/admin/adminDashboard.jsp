<%@ page import="com.model.Donor, com.model.EmergencyRequest" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.3/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

    <div class="container mx-auto p-5">
        <h1 class="text-xl font-bold text-gray-800 mb-4">Admin Dashboard</h1>

        <div class="mb-8">
            <h2 class="text-lg font-semibold text-gray-700 mb-2">Donors List</h2>
            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                <table class="min-w-full leading-normal">
                    <thead>
                        <tr>
                            <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                ID
                            </th>
                            <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                Name
                            </th>
                            <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                Email
                            </th>
                            <th class="px-5 py-3 border-b-2 border-gray-200 bg-gray-100 text-left text-xs font-semibold text-gray-600 uppercase tracking-wider">
                                Blood Group
                            </th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-700">
                        <%-- Loop through donors list and populate table --%>
                        <% List<Donor> donors = (List<Donor>) request.getAttribute("donors");
                           if (donors != null) {
                               for (Donor donor : donors) {
                        %>
                        <tr>
                            <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                <%= donor.getId() %>
                            </td>
                            <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                <%= donor.getName() %>
                            </td>
                            <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                <%= donor.getEmail() %>
                            </td>
                            <td class="px-5 py-5 border-b border-gray-200 bg-white text-sm">
                                <%= donor.getBloodGroup() %>
                            </td>
                        </tr>
                        <% 
                               }
                           }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

        <div>
            <h2 class="text-lg font-semibold text-gray-700 mb-2">Emergency Blood Requests</h2>
            <div class="bg-white shadow-md rounded-lg overflow-hidden">
                <table class="min-w-full leading-normal">
                    <thead>
                        <tr>
                            <th class="...">Blood Type</th>
                            <th class="...">Quantity</th>
                            <th class="...">Location</th>
                            <th class="...">Urgency</th>
                        </tr>
                    </thead>
                    <tbody class="text-gray-700">
                        <%-- Loop through emergency requests list and populate table --%>
                        <% List<EmergencyRequest> emergencyRequests = (List<EmergencyRequest>) request.getAttribute("emergencyRequests");
                           if (emergencyRequests != null) {
                               for (EmergencyRequest erequest : emergencyRequests) {
                        %>
                        <tr>
                            <td class="..."><%= erequest.getBloodType() %></td>
                            <td class="..."><%= erequest.getQuantity() %> units</td>
                            <td class="..."><%= erequest.getLocation() %></td>
                            <td class="..."><%= erequest.getUrgency() %></td>
                        </tr>
                        <% 
                               }
                           }
                        %>
                    </tbody>
                </table>
            </div>
        </div>

    </div>

</body>
</html>
