<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" href="CSS/register.css">
    <script defer src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Body and General Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f4f4;
            color: #333;
        }

        /* Header Section */
        .login_main_wrapper {
            width: 100%;
            background-color: #007bff;
            padding: 20px 0;
        }

        .abc_header_section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .abc_header_section_left a,
        .abc_header_section_right a {
            color: #fff;
            text-decoration: none;
            padding: 8px 16px;
            border-radius: 5px;
            font-size: 14px;
        }

        .abc_header_section_left a:hover,
        .abc_header_section_right a:hover {
            background-color: #0056b3;
        }

        .abc_header_section_middle p {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
            margin: 0;
        }

        /* Main Content */
        .page_body_main_wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 100px);
            padding: 20px;
        }

        .body_content {
            display: flex;
            width: 100%;
            max-width: 1200px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Left Form Wrapper */
        .left_warpper {
            width: 50%;
            padding: 40px;
        }

        .left_warpper h2 {
            font-size: 28px;
            color: #333;
            margin-bottom: 20px;
        }

        .left_warpper p {
            font-size: 16px;
            color: #777;
            margin-bottom: 20px;
        }

        .left_warpper_user_input {
            display: flex;
            flex-direction: column;
        }

        .user_input_tems {
            margin-bottom: 20px;
        }

        .user_input_tems label {
            font-size: 14px;
            color: #333;
            margin-bottom: 8px;
            font-weight: bold;
        }

        .user_input_tems input {
            width: 100%;
            padding: 12px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        .user_input_tems input:focus {
            outline: none;
            border-color: #007bff;
        }

        .user_check_box {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .user_check_box input {
            margin-right: 10px;
        }

        .user_check_box p {
            font-size: 14px;
            color: #333;
        }

        /* Redirect to Login Page */
        .redirect_loging_page p {
            font-size: 14px;
            color: #007bff;
        }

        .redirect_loging_page a {
            text-decoration: none;
            color: #007bff;
        }

        .redirect_loging_page a:hover {
            text-decoration: underline;
        }

.footer_btn {
    text-align: center;
    margin-top: 40px; /* Adjust this value to move the button further down */
}


        .footer_btn button {
            background-color: #007bff;
            color: #fff;
            font-size: 16px;
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            width: 100%;
        }

        .footer_btn button:hover {
            background-color: #0056b3;
        }

        /* Right Wrapper (Empty but can be used for future elements) */
        .right_warpper {
            width: 50%;
            background-image: url('https://via.placeholder.com/600');
            background-size: cover;
            background-position: center;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            .page_body_main_wrapper {
                flex-direction: column;
                height: auto;
            }

            .left_warpper {
                width: 100%;
                padding: 20px;
            }

            .right_warpper {
                display: none;
            }

            .footer_btn button {
                width: auto;
            }
        }
    </style>
</head>
<body>
    <div class="login_main_wrapper">
        <div class="header_section">
            <div class="abc_header_section">
                <div class="abc_header_section_left">
       
                </div>
                <div class="abc_header_section_middle">
                    <p>MEGA CITY CAB SERVICE</p>
                </div>
                <div class="abc_header_section_right">
                    <a href="login.html"><button>Your Ride, Your Way</button></a>
                </div>
            </div>
        </div>
        <div>
            <div class="page_body_main_wrapper">
                <div class="body_content">
                    <div class="left_warpper">
                        <form action="Register" method="post">
                            <h2>Create Your Account</h2>
                            <p>Fill in your details below</p>
                            <div class="left_warpper_user_input">
                                <div class="user_input_tems">
                                    <label for="">Customer Name</label>
                                    <input name="Name" type="text" placeholder="Customer Name" required>
                                </div>
                                <div class="user_input_tems">
                                    <label for="">NIC</label>
                                    <input name="NIC" type="text" placeholder="Your NIC" required>
                                </div>
                                <div class="user_input_tems">
                                    <label for="">Address</label>
                                    <input name="Address" type="text" placeholder="Address" required>
                                </div>
                                <div class="user_input_tems">
                                    <label for="">Password</label>
                                    <input name="pass" type="password" placeholder="Your Password" required>
                                </div>
                                <div class="user_check_box">
                                    <input name="agree" type="checkbox">
                                    <p>I agree to receive marketing, advertising, and promotional information via email.</p>
                                </div>
                                <div class="user_input_tems redirect_loging_page">
                                    <p>If you have an account <a href="login.jsp">Login?</a></p>
                                </div>
                            </div>
                            <div class="footer_btn">
                                <button type="submit">Register</button>
                            </div>
                        </form>
                    </div>
                    <div class="right_warpper"></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
