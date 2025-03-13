<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="CSS/main.css">
    <link rel="stylesheet" href="CSS/cDescription.css">
    <title>Cab Description</title>
    <style>
 /* General Styles */
/* Body Styles */
/* Body Styles */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #87CEEB; /* Sky Blue Background */
    margin: 0;
    padding: 0;
    color: #333;
    height: 100%;
}

/* Main Wrapper */
.page_main_wrapper {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    box-sizing: border-box;
}

/* Header Styles */
.page_header {
    background: linear-gradient(135deg, #0066cc, #003366); /* Blue Gradient */
    color: #fff;
    padding: 30px 0;
    text-align: center;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.page_header_sub_wrapper {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0 30px;
    flex-wrap: wrap; /* Allow items to wrap on smaller screens */
}

.company_logo h1 {
    font-size: 32px;
    font-weight: 600;
    margin: 0;
    color: #ffbb33;
}

.page_search_bar {
    display: flex;
    align-items: center;
    position: relative;
}

.pgs_main_wrapper input {
    padding: 14px 22px;
    font-size: 18px;
    width: 250px;
    border: 1px solid #ddd;
    border-radius: 25px;
    outline: none;
    transition: all 0.3s ease;
}

.pgs_main_wrapper input:focus {
    border-color: #ffbb33;
}

.search_icon img {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
}

.user_indicator {
    display: flex;
    align-items: center;
}

.user_indicator img {
    margin: 0 12px;
    width: 25px;
    height: 25px;
}

#u_name {
    margin-right: 20px;
    font-size: 20px;
}

a {
    color: #ffbb33;
    text-decoration: none;
    font-size: 18px;
}

/* Body Styles */
.page_body {
    padding: 40px 0;
    display: flex;
    justify-content: center;
}

.p_des_main_wrapper {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    width: 100%;
    max-width: 1000px;
    margin: 0 auto;
    box-sizing: border-box;
    flex-wrap: wrap; /* Allow items to wrap on smaller screens */
}

/* Vehicle Description */
.left_p_dec {
    width: 50%;
    padding: 20px;
}

.item_image img {
    width: 100%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

.right_p_dec {
    width: 45%;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    margin-left: 30px;
}

.r_item_name {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    margin-bottom: 15px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.r_item_name span {
    font-size: 18px;
    font-weight: normal;
    color: #777;
}

/* Vehicle Type (optional, can be styled differently) */
.r_item_name:nth-of-type(3) {
    font-size: 18px;
    font-weight: normal;
    color: #777;
}

/* Price Wrapper */
.r_price_wrapper {
    margin-top: 30px;
    font-size: 26px;
    font-weight: bold;
    color: #ff5722;
}

/* Rent Now Button */
.r_price_wrapper a {
    display: inline-block;
    margin-top: 20px;
    padding: 18px 35px;
    background-color: #007bff;
    color: #fff;
    text-align: center;
    text-decoration: none;
    font-size: 20px;
    border-radius: 8px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.r_price_wrapper a:hover {
    background-color: #0056b3;
    transform: translateY(-3px);
}

.r_price_wrapper a:active {
    transform: translateY(1px);
}

/* Responsive Design */
@media (max-width: 768px) {
    .page_header_sub_wrapper {
        flex-direction: column;
        text-align: center;
    }

    .page_search_bar {
        margin-top: 20px;
    }

    .p_des_main_wrapper {
        flex-direction: column;
        padding: 10px;
    }

    .left_p_dec, .right_p_dec {
        width: 100%;
        padding: 15px;
    }

    .r_price_wrapper {
        font-size: 22px;
    }

    .r_item_name {
        font-size: 20px;
    }

    .item_image img {
        height: auto;
    }
}

/* Vehicle Model, Name, and Type */
.right_p_dec {
    width: 100%;
    max-width: 500px;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    margin-left: 30px;
}

.r_item_name {
    font-size: 24px;
    font-weight: 600;
    color: #333;
    margin-bottom: 10px;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Rent Now Button */
.r_price_wrapper a {
    display: inline-block;
    margin-top: 20px;
    padding: 15px 30px;
    background-color: #007bff;
    color: #fff;
    text-align: center;
    text-decoration: none;
    font-size: 18px;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.r_price_wrapper a:hover {
    background-color: #0056b3;
    transform: translateY(-2px);
}

.r_price_wrapper a:active {
    transform: translateY(1px);
}




/* Flex container for content */
.p_des_main_wrapper {
    display: flex;
    justify-content: center; /* Center all items horizontally */
    align-items: center; /* Align items vertically */
    gap: 30px; /* Adds space between the image and content */
    flex-wrap: wrap; /* Allow wrapping on smaller screens */
    margin: 0 auto;
}

/* Left Section (Image) */
.left_p_dec {
    width: 100%;
    max-width: 500px;
    padding: 20px;
    text-align: center;
}

.item_image img {
    width: 100%;
    height: auto;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
}

/* Right Section (Text and Button) */
.right_p_dec {
    width: 100%;
    max-width: 500px;
    padding: 30px;
    background-color: #ffffff;
    border-radius: 10px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
}

.r_item_name {
    font-size: 24px;
    font-weight: bold;
    color: #333;
    margin-bottom: 15px;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.r_item_name span {
    font-size: 18px;
    font-weight: normal;
    color: #777;
}

.r_price_wrapper {
    margin-top: 20px;
    font-size: 28px;
    font-weight: bold;
    color: #ff5722;
}

.r_price_wrapper p {
    margin: 0;
}

/* Rent Now Button */
.rent_now_button {
    margin-top: 20px;
    padding: 15px 30px;
    background-color: #007bff;
    color: #fff;
    font-size: 18px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
}

.rent_now_button:hover {
    background-color: #0056b3;
    transform: translateY(-3px);
}

.rent_now_button:active {
    transform: translateY(1px);
}

/* Responsive Design */
@media (max-width: 768px) {
    .p_des_main_wrapper {
        flex-direction: column; /* Stack the items vertically on smaller screens */
        padding: 10px;
    }

    .left_p_dec, .right_p_dec {
        width: 100%;
        padding: 15px;
    }

    .r_item_name {
        font-size: 20px;
    }

    .r_price_wrapper {
        font-size: 22px;
    }

    .rent_now_button {
        font-size: 16px;
        padding: 12px 25px;
    }
}


    </style>
</head>
<body>
<div class="page_main_wrapper">
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

    <div class="page_body">
        <div class="p_des_main_wrapper">
            <%
                String url = "jdbc:mysql://localhost:3306/megacab";
                String user = "root";
                String password = "root";
                Connection con = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                int vehicleId = Integer.parseInt(request.getParameter("id"));
                
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, user, password);
                    String query = "SELECT * FROM vehicles WHERE vehicle_id = ?";
                    pstmt = con.prepareStatement(query);
                    pstmt.setInt(1, vehicleId);
                    rs = pstmt.executeQuery();
                    
                    if (rs.next()) {
                        String model = rs.getString("vehicle_model");
                        String price = rs.getString("vehicle_rent");
                        String name = rs.getString("vehicle_name");
                        String number = rs.getString("vehicle_number");
                        String type = rs.getString("vehicle_type");
                        
                        // Convert image BLOB to base64 for display
                        byte[] imgData = rs.getBytes("vehicle_image");
                        String base64Image = "";
                        if (imgData != null) {
                            base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imgData);
                        }
            %>
            <div class="left_p_dec">
                <div class="item_image">
                    <img src="<%= base64Image %>" width="100%" height="100%" alt="Vehicle Image">
                </div>
            </div>
            <div class="right_p_dec">
                <p class="r_item_name"><%= model %></p>
                
                    <p class="r_item_name"><%= name %></p>
                
                    <p class="r_item_name"><%= type %></p>
                
                <div class="r_price_wrapper">
                    <p>LKR <%= price %></p>
                   
                </div>
                <div class="r_price_wrapper">
                <a href="chekout.jsp?id=<%= request.getParameter("id") %>">
    					<button class="">Rent Now</button>
				</a>
				</div>
            </div>
            <%
                    } else {
                        out.println("<p>Vehicle not found.</p>");
                    }
                } catch (Exception e) {
                    out.println("<p>Error: " + e.getMessage() + "</p>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (pstmt != null) pstmt.close();
                        if (con != null) con.close();
                    } catch (SQLException se) {
                        se.printStackTrace();
                    }
                }
            %>
        </div>
    </div>
</div>
</body>
</html>