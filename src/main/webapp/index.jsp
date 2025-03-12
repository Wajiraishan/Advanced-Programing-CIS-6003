<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/style.css">
    <title>MegaCityCab</title>
</head>
<body>

    <!-- Header Section -->
    <div class="page_main_wrapper">
        <header class="page_header">
            <div class="company_logo">
                <h1>MegaCityCab</h1>
            </div>
            <div class="page_search_bar">
                <input type="search" placeholder="Search for anything....">
                <div class="search_icon">
                    <img src="assert/search.png" alt="" width="20" height="20">
                </div>
            </div>
            <div class="user_indicator">
                <img src="assert/user.png" width="25" height="25" alt="">
                <p id="u_name">abc</p>
                <a href="logout.jsp" class="logout_btn">Logout</a>
            </div>
        </header>

        <!-- Hero Section -->
        <div class="hero">
            <h2>Find the Best Vehicles for Rent</h2>
        </div>

        <!-- Vehicle Section -->
        <section class="page_body">
            <div class="head_compo1">
                <h2>Top Vehicles Available</h2>
            </div>

            <div class="supplier_item">
                <%
                    String url = "jdbc:mysql://localhost:3306/megacab";
                    String user = "root";
                    String password = "root";
                    Connection con = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection(url, user, password);
                        stmt = con.createStatement();
                        String query = "SELECT * FROM vehicles";
                        rs = stmt.executeQuery(query);

                        while (rs.next()) {
                            String model = rs.getString("vehicle_model");
                            String price = rs.getString("vehicle_rent");

                            byte[] imgData = rs.getBytes("vehicle_image");
                            String base64Image = "";
                            if (imgData != null) {
                                base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                            }
                %>

                <div class="vehicle-card">
                    <div class="vehicle-image">
                        <img src="<%= base64Image %>" alt="Vehicle Image">
                    </div>
                    <div class="vehicle-details">
                        <h3><%= model %></h3>
                        <p class="price">LKR <%= price %></p>
                        <button class="rent-now" onclick="window.location.href='productDescription.jsp?id=<%= rs.getInt("vehicle_id") %>'">
                            Rent Now
                        </button>
                    </div>
                </div>

                <%
                        }
                    } catch (Exception e) {
                        out.println("Error: " + e.getMessage());
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (con != null) con.close();
                        } catch (SQLException se) {
                            se.printStackTrace();
                        }
                    }
                %>
            </div>
        </section>

        <!-- Footer Section -->
        <footer class="page_footer">
            <div class="footer_main_wrapper">
                <div class="footer_column">
                    <h3>About</h3>
                    <p>Get 10% off your first order</p>
                </div>
                <div class="footer_column">
                    <h3>Support</h3>
                    <p>Contact</p>
                    <p>FAQ</p>
                    <p>Terms of Use</p>
                </div>
                <div class="footer_column">
                    <h3>Account</h3>
                    <p>My Account</p>
                    <p>Login / Register</p>
                </div>
                <div class="footer_column">
                    <h3>Download App</h3>
                    <img src="assert/GooglePlay.png" alt="">
                    <img src="assert/download-appstore.png" alt="">
                </div>
            </div>
            <p id="footer_copyright">© 2025 MegaCityCab. All rights reserved.</p>
        </footer>
    </div>

</body>
</html>
