<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int vehicleId = -1;
    if (request.getParameter("id") != null) {
        vehicleId = Integer.parseInt(request.getParameter("id"));
    } else {
        response.sendRedirect("manage_vehicles.jsp?error=NoID");
        return;
    }

    String name = "", model = "", licensePlate = "", type = "";
    double rent = 0.0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
        PreparedStatement pst = con.prepareStatement("SELECT * FROM vehicles WHERE vehicle_id = ?");
        pst.setInt(1, vehicleId);
        ResultSet rs = pst.executeQuery();

        if (rs.next()) {
            name = rs.getString("vehicle_name");
            model = rs.getString("vehicle_model");
            licensePlate = rs.getString("vehicle_number");
            type = rs.getString("vehicle_type");
            rent = rs.getDouble("vehicle_rent");
        } else {
            response.sendRedirect("admin_dashboard.jsp?error=NotFound");
            return;
        }
        rs.close();
        pst.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Vehicle</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    
    <style>
        body {
            background-color: #87CEEB; /* Sky blue background */
            font-family: 'Arial', sans-serif;
        }
        .container {
            max-width: 900px;
            margin-top: 50px;
        }
        .card {
            border-radius: 15px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
        }
        .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .form-control {
            border-radius: 8px;
            font-size: 16px;
            padding: 10px;
        }
        .form-label {
            font-weight: bold;
            font-size: 14px;
        }
        .card-header {
            background-color: #007bff;
            color: white;
            border-top-left-radius: 15px;
            border-top-right-radius: 15px;
        }
        .text-primary {
            color: #007bff;
        }
        .back-btn {
            background-color: transparent;
            border-color: #007bff;
            color: #007bff;
        }
        .back-btn:hover {
            background-color: #007bff;
            color: white;
        }
        .form-section {
            margin-top: 30px;
        }
        .form-section .form-group {
            margin-bottom: 1.5rem;
        }
        @media (max-width: 768px) {
            .container {
                padding-left: 15px;
                padding-right: 15px;
            }
            .card {
                padding: 20px;
            }
            .form-label {
                font-size: 16px;
            }
        }
    </style>
</head>

<body>

<div class="container">
    <div class="card p-4">
        <div class="card-header text-center">
            <h3><i class="fas fa-edit"></i> Edit Vehicle</h3>
        </div>

        <form action="EditVehicleServlet" method="post" class="form-section">
            <input type="hidden" name="vehicleId" value="<%= vehicleId %>">

            <div class="form-group">
                <label class="form-label"><i class="fas fa-car"></i> Vehicle Name</label>
                <input type="text" name="name" class="form-control" value="<%= name %>" required>
            </div>

            <div class="form-group">
                <label class="form-label"><i class="fas fa-car"></i> Model</label>
                <input type="text" name="model" class="form-control" value="<%= model %>" required>
            </div>

            <div class="form-group">
                <label class="form-label"><i class="fas fa-id-card"></i> License Plate</label>
                <input type="text" name="licensePlate" class="form-control" value="<%= licensePlate %>" required>
            </div>

            <div class="form-group">
                <label class="form-label"><i class="fas fa-tags"></i> Type</label>
                <input type="text" name="type" class="form-control" value="<%= type %>" required>
            </div>

            <div class="form-group">
                <label class="form-label"><i class="fas fa-money-bill-wave"></i> Rent (LKR)</label>
                <input type="number" step="0.01" name="rent" class="form-control" value="<%= rent %>" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary w-100"><i class="fas fa-save"></i> Update Vehicle</button>
            </div>
        </form>

        <div class="text-center mt-3">
            <a href="admin_dashboard.jsp" class="btn back-btn w-100"><i class="fas fa-arrow-left"></i> Back to Manage Vehicles</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
