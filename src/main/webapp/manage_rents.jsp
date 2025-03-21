<%@ page session="true" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Rents</title>
    <link rel="stylesheet" href="styles.css">
    <style>
/* Global Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f9;
    margin: 0;
    padding: 0;
}

/* Page Heading */
h2 {
    text-align: center;
    color: #333;
    font-size: 28px;
    margin: 40px 0;
}

/* Back to Dashboard Link */
a {
    display: inline-block;
    margin: 20px 0;
    color: #007bff;
    text-decoration: none;
    font-size: 16px;
}

a:hover {
    text-decoration: underline;
}

/* Table Styling */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

/* Table Header Styling */
th, td {
    padding: 12px;
    text-align: left;
    font-size: 16px;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #007bff;
    color: white;
    font-weight: bold;
}

/* Alternate Row Background Color for Likeness */
tr:nth-child(odd) {
    background-color: #f9f9f9; /* Light background for odd rows */
}

tr:nth-child(even) {
    background-color: #ffffff; /* White background for even rows */
}

tr:hover {
    background-color: #f1f1f1; /* Light hover effect */
}

/* Actions Column Styling */
td a {
    color: #007bff;
    text-decoration: none;
    padding: 5px 10px;
    margin-right: 10px;
    border-radius: 5px;
    transition: background-color 0.3s ease;
}

td a:hover {
    background-color: #007bff;
    color: white;
}

/* Responsive Styling */
@media (max-width: 768px) {
    table {
        width: 100%;
        font-size: 14px;
    }

    th, td {
        padding: 8px;
    }

    h2 {
        font-size: 24px;
    }
}


</style>
</head>
<body>
    <h2>Manage Rents</h2>
    <a href="admin_dashboard.jsp">Back to Dashboard</a>
    
    <table border="1">
        <tr>
            <th>Rent ID</th>
            <th>Customer</th>
            <th>Vehicle</th>
            <th>Total Amount</th>
            <th>Actions</th>
        </tr>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                java.sql.Connection con = java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/megacab", "root", "root");
                java.sql.PreparedStatement pst = con.prepareStatement("SELECT * FROM rents");
                java.sql.ResultSet rs = pst.executeQuery();
                
                while (rs.next()) {
        %>
        <tr>
            <td><%= rs.getInt("rent_id") %></td>
            <td><%= rs.getString("customer_name") %></td>
            <td><%= rs.getString("vehicle_id") %></td>
            <td><%= rs.getDouble("total_amount") %></td>
            <td>
                <a href="edit_rent.jsp?id=<%= rs.getInt("rent_id") %>">Edit</a> |
                <a href="delete_rent.jsp?id=<%= rs.getInt("rent_id") %>">Delete</a>
            </td>
        </tr>
        <%
                }
                con.close();
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>
