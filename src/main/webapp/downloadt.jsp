<%@ page import="java.sql.*, java.util.Base64" %>

<%
    String bookingId = request.getParameter("id");
    String fullName = "", address = "", phone = "", email = "", fromLocation = "", toLocation = "", vehicleModel = "", rentPrice = "";

    if (bookingId != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM checkout WHERE id = ?");
            stmt.setString(1, bookingId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                fullName = rs.getString("full_name");
                address = rs.getString("address");
                phone = rs.getString("phone");
                email = rs.getString("email");
                fromLocation = rs.getString("from_location");
                toLocation = rs.getString("to_location");
                vehicleModel = rs.getString("vehicle_model");
                rentPrice = rs.getString("rent_price");
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
    <title>Booking Ticket</title>

    <!-- Include Bootstrap for better styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .ticket-info {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        .ticket-info p {
            font-size: 16px;
            margin: 5px 0;
        }

        .ticket-info p strong {
            width: 150px;
            display: inline-block;
        }

        .btn-download {
            display: block;
            width: 200px;
            margin: 30px auto;
            background-color: #007bff;
            color: white;
            padding: 10px;
            text-align: center;
            border-radius: 5px;
            text-decoration: none;
            font-size: 18px;
        }

        .btn-download:hover {
            background-color: #0056b3;
        }

        /* Print-specific styles */
        @media print {
            body {
                background-color: white;
                margin: 0;
                padding: 20px;
            }

            h2 {
                text-align: center;
            }

            .ticket-info {
                box-shadow: none;
                padding: 10px;
                border-radius: 0;
            }

            .btn-download {
                display: none; /* Hide the download button when printing */
            }

            p {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <h2>Booking Ticket</h2>

    <div class="ticket-info">
        <p><strong>Name:</strong> <%= fullName != null ? fullName : "N/A" %></p>
        <p><strong>Address:</strong> <%= address != null ? address : "N/A" %></p>
        <p><strong>Phone:</strong> <%= phone != null ? phone : "N/A" %></p>
        <p><strong>Email:</strong> <%= email != null ? email : "N/A" %></p>
        <p><strong>From Location:</strong> <%= fromLocation != null ? fromLocation : "N/A" %></p>
        <p><strong>To Location:</strong> <%= toLocation != null ? toLocation : "N/A" %></p>
        <p><strong>Vehicle Model:</strong> <%= vehicleModel != null ? vehicleModel : "N/A" %></p>
        <p><strong>Rent Price:</strong> LKR <%= rentPrice != null ? rentPrice : "0" %> .00</p>
    </div>

    <a href="javascript:window.print()" class="btn-download">Download Ticket (Print)</a>

    <!-- Add this to help with the print version -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
