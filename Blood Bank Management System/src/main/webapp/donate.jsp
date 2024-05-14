<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Donate Blood</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        .background-image {
            background-image: url('your-image-path.jpg');
            background-size: cover;
            background-position: center;
        }
    </style>
</head>
<body class="bg-gray-100 back">
    <nav class="bg-red-600 text-white py-4">
        <div class="container mx-auto flex justify-between items-center">
            <a href="index.jsp" class="text-lg font-semibold">Blood Bank Management System</a>
            <div class="flex space-x-4">
                <a href="index.jsp" class="hover:bg-red-700 px-3 py-2 rounded">Home</a>
                <a href="donate.jsp" class="hover:bg-red-700 px-3 py-2 rounded">Donate Blood</a>
                <a href="contact.jsp" class="hover:bg-red-700 px-3 py-2 rounded">Contact</a>
                <!-- Logout Button -->
                <form action="logout.jsp" method="post">
                    <button type="submit" class="hover:bg-red-700 px-3 py-2 rounded">Logout</button>
                </form>
            </div>
        </div>
    </nav>
    
    <div class="background-image min-h-screen flex items-center justify-center" style="background-image: url(/img/donor-backgroud.jpg);">
        <div class="container mx-auto px-4">
            <div class="max-w-md mx-auto bg-white bg-opacity-90 rounded-lg overflow-hidden md:max-w-lg">
                <div class="md:flex">
                    <div class="w-full p-4">
                        <h2 class="text-2xl text-gray-800 font-semibold text-center">Donate Blood</h2>
                       <form action="SubmitDonation.jsp" method="post" class="mt-5 space-y-4">
    <div>
        <label for="donorName" class="block text-sm font-medium text-gray-700">Donor Name</label>
        <input type="text" name="donorName" id="donorName" required class="mt-1 focus:ring-red-500 focus:border-red-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    </div>
    <div>
        <label for="bloodType" class="block text-sm font-medium text-gray-700">Blood Type</label>
        <select id="bloodType" name="bloodType" required class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-red-500 focus:border-red-500 sm:text-sm">
            <option>A+</option>
            <option>A-</option>
            <option>B+</option>
            <option>B-</option>
            <option>AB+</option>
            <option>AB-</option>
            <option>O+</option>
            <option>O-</option>
        </select>
    </div>
    <div>
        <label for="donationDate" class="block text-sm font-medium text-gray-700">Donation Date</label>
        <input type="date" name="donationDate" id="donationDate" required class="mt-1 focus:ring-red-500 focus:border-red-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    </div>
    <div>
        <label for="donationCenter" class="block text-sm font-medium text-gray-700">Donation Center</label>
        <input type="text" name="donationCenter" id="donationCenter" required class="mt-1 focus:ring-red-500 focus:border-red-500 block w-full shadow-sm sm:text-sm border-gray-300 rounded-md">
    </div>
    <div class="flex items-center justify-between">
        <button type="submit" class="flex justify-center py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
            Submit Donation
        </button>
    </div>
</form>

                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
