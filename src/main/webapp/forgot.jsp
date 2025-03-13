<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="CSS/forgot.css">
    <style>
        body {
            background: linear-gradient(to right, #1e3c72, #2a5298);
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }
        .main_wrapper {
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.3);
            max-width: 400px;
            text-align: center;
            color: white;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
        }
        button {
            background-color: #f39c12;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            width: 100%;
            cursor: pointer;
            margin-top: 20px;
        }
        .social-buttons img {
            width: 30px;
            margin: 10px;
            cursor: pointer;
        }
        a {
            color: #f1c40f;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="main_wrapper">
        <h2>Forgot Password?</h2>
        <p>Enter your email to reset your password</p>
        <input type="email" placeholder="Enter Email" required>
        <button>Send</button>
        <p>Back to <a href="register.jsp">Sign in</a></p>
        <div class="social-buttons">
<!--             <img src="../assert/Google Login.png" alt="Google Login">
            <img src="../assert/apple-logo.png" alt="Apple Login"> -->
        </div>
    </div>
</body>
</html>
