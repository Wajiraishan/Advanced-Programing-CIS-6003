<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*, java.util.Base64" %>
<%
    String vehicleId = request.getParameter("id");  
    String model = "", rentPrice = "", imageBase64 = "";

    if (vehicleId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("SELECT vehicle_model, vehicle_rent, vehicle_image FROM vehicles WHERE vehicle_id = ?");
            stmt.setInt(1, Integer.parseInt(vehicleId)); // Ensure vehicleId is an integer
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                model = rs.getString("vehicle_model");
                rentPrice = rs.getString("vehicle_rent");

                byte[] imgData = rs.getBytes("vehicle_image");
                if (imgData != null) {
                    imageBase64 = Base64.getEncoder().encodeToString(imgData);
                }
            }

            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Your Cab</title>
    
    <link rel="stylesheet" href="CSS/main.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <style>
/* Body Styles */
body {
    background-color: #87CEEB; /* Sky Blue Background */
    font-family: 'Roboto', sans-serif;
    margin: 0;
    padding: 0;
    color: #333;
}

/* Header Styles */
.page_header {
    background-color: #1a73e8;
    padding: 15px 0;
}

.page_header_sub_wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.company_logo h1 {
    color: white;
    font-size: 24px;
    font-weight: 700;
}

.page_search_bar input {
    width: 100%;
    padding: 10px 15px;
    border-radius: 25px;
    border: none;
    margin-right: 10px;
}

.search_icon img {
    width: 20px;
    height: 20px;
    cursor: pointer;
}

.user_indicator {
    display: flex;
    align-items: center;
    color: white;
}

.user_indicator img {
    margin-right: 10px;
}

.user_indicator a {
    color: white;
    font-size: 14px;
    margin-left: 10px;
    text-decoration: none;
}

/* Container for Content */
.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 0 20px;
}

/* Card Design */
.card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

.card h3 {
    font-size: 24px;
    color: #007bff;
    font-weight: 600;
    margin-bottom: 20px;
}

.card img {
    max-height: 250px;
    border-radius: 10px;
    object-fit: cover;
}

.card p {
    font-size: 16px;
    margin-bottom: 10px;
}

.btn-primary {
    background-color: #007bff;
    border: none;
    border-radius: 25px;
    padding: 12px 20px;
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
}

/* Input Styles */
.form-control {
    border-radius: 8px;
    padding: 12px;
    margin-bottom: 10px;
    font-size: 15px;
    border: 1px solid #ced4da;
}

.form-label {
    font-size: 14px;
    font-weight: 600;
    color: #495057;
}

/* Responsive Design */
@media screen and (max-width: 767px) {
    .page_header_sub_wrapper {
        flex-direction: column;
        align-items: flex-start;
    }

    .company_logo h1 {
        font-size: 20px;
    }

    .container {
        padding: 10px;
    }

    .card {
        padding: 15px;
    }

    .row.g-3 {
        flex-direction: column;
    }

    .text-center {
        text-align: left;
    }
}



/* Container Styles */
.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 0 20px;
}

/* Card Styles */
.card {
    background-color: white;
    border-radius: 10px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

/* Heading Style */
.card h3 {
    font-size: 24px;
    color: #007bff;
    font-weight: 600;
    margin-bottom: 20px;
}

/* Image Style */
.card img {
    max-height: 250px;
    border-radius: 10px;
    object-fit: cover;
}

/* Input Styles */
.form-control {
    border-radius: 8px;
    padding: 12px;
    margin-bottom: 10px;
    font-size: 15px;
    border: 1px solid #ced4da;
}

/* Label Styles */
.form-label {
    font-size: 14px;
    font-weight: 600;
    color: #495057;
}

/* Button Styles */
.btn-primary {
    background-color: #007bff;
    border: none;
    border-radius: 25px;
    padding: 12px 20px;
    font-size: 16px;
    font-weight: 600;
    width: 100%;
    transition: background-color 0.3s ease;
}

.btn-primary:hover {
    background-color: #0056b3;
}

/* Text Center Alignment */
.text-center {
    text-align: center;
}
    </style>
</head>
<body>
<div class="page_header">
        <div class="page_header">
		        <div class="page_header_sub_wrapper">
		            <div class="company_logo">
		                <h1>Mega-City-Cab</h1>
		            </div>
		            <div class="page_search_bar">
		                <div class="pgs_main_wrapper">
		                    <input type="search" placeholder="Search for anything...." name="" id="">
		                    <div class="search_icon">
		                        <img src="assert/search.png" alt="" width="20" height="20" srcset="">
		                    </div>
		                </div>
		            </div>
		            <div class="user_indicator">

		                <img src="assert/user.png" width="25" height="25" alt="" srcset="">
		                <p id="u_name">WAJIRA</p>
		                <a href="logout.jsp">Logout</a>
		            </div>
		        </div>
		    </div>
    </div>

<div class="container">
    <div class="card p-4">
        <h3 class="text-center text-primary">Book Your Ride</h3>

        <% if (!imageBase64.isEmpty()) { %>
            <div class="text-center">
                <img src="data:image/jpeg;base64,<%= imageBase64 %>" class="img-fluid rounded" style="max-height: 200px;">
            </div>
        <% } %>

        <p class="text-center mt-3"><strong>Vehicle Model:</strong> <%= model %></p>
        <p class="text-center"><strong>Rent Price:</strong> LKR <%= rentPrice %></p>

        <form action="storeBooking.jsp" method="post" class="mt-3">
            <input type="hidden" name="vehicle_id" value="<%= vehicleId != null ? vehicleId : "" %>">
            <input type="hidden" name="vehicle_model" value="<%= model != null ? model : "" %>">
            <input type="hidden" name="rent_price" value="<%= rentPrice != null ? rentPrice : "" %>">

            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-user"></i> Full Name</label>
                    <input type="text" name="full_name" class="form-control" placeholder="Enter your name" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-map-marker-alt"></i> Address</label>
                    <input type="text" name="address" class="form-control" placeholder="Enter your address" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-id-card"></i> NIC</label>
                    <input type="text" name="nic" class="form-control" placeholder="Enter NIC" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-phone"></i> Phone</label>
                    <input type="text" name="phone" class="form-control" placeholder="Enter phone number" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fab fa-whatsapp"></i> WhatsApp</label>
                    <input type="text" name="whatsapp" class="form-control" placeholder="Enter WhatsApp number" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-envelope"></i> Email</label>
                    <input type="email" name="email" class="form-control" placeholder="Enter email" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-map-marker-alt"></i> From Location</label>
                    <input type="text" name="from_location" class="form-control" placeholder="From location" required>
                </div>

                <div class="col-md-6">
                    <label class="form-label"><i class="fas fa-map-marker-alt"></i> To Location</label>
                    <input type="text" name="to_location" class="form-control" placeholder="To location" required>
                </div>
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-ticket-alt"></i> Download Ticket</button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
