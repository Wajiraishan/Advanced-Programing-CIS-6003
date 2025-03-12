<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login | Mega City Cab Service</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css">
<style>
    /* General Styles */
    body {
        background: linear-gradient(135deg, #1e3c72, #2a5298);
        color: white;
        font-family: Arial, sans-serif;
        height: 100vh;
        display: flex;
        flex-direction: column;
        justify-content: space-between;
    }
    
    /* Navbar */
    .navbar {
        background: rgba(0, 0, 0, 0.8);
        padding: 15px;
    }
    .navbar a {
        color: white !important;
        margin: 0 15px;
        font-weight: bold;
    }
    .navbar-brand {
        font-size: 1.5rem;
        color: #f39c12 !important;
    }
    
    /* Login Box */
    .login_main_wrapper {
        max-width: 400px;
        margin: auto;
        background: rgba(255, 255, 255, 0.1);
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        text-align: center;
    }
    .login_main_wrapper h2 {
        color: #f39c12;
    }
    .form-control {
        background: rgba(255, 255, 255, 0.2);
        border: none;
        color: white;
    }
    .form-control::placeholder {
        color: rgba(255, 255, 255, 0.7);
    }
    .btn-primary {
        background: #f39c12;
        border: none;
    }
    .btn-primary:hover {
        background: #e67e22;
    }
    
    /* Footer */
    .footer_wrapper {
        background: rgba(0, 0, 0, 0.9);
        padding: 20px;
        text-align: center;
        font-size: 0.9rem;
    }
    .footer_wrapper p {
        margin: 0;
        color: #f39c12;
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container">
        <a class="navbar-brand" href="#">Mega City Cab Service</a>
        <div class="collapse navbar-collapse justify-content-end">
            <a href="#">Home</a>
            <a href="#">Types</a>
            <a href="#">Offers</a>
            <a href="#">Contact</a>
        </div>
    </div>
</nav>

<!-- Login Form -->
<div class="login_main_wrapper mt-5">
    <h2>Login to Your Account</h2>
    <p>Fill in your details below</p>
    <form action="Login" method="get">
        <div class="mb-3">
            <input name="name" type="text" class="form-control" placeholder="User Name" required>
        </div>
        <div class="mb-3">
            <input name="pass" type="password" class="form-control" placeholder="Your Password" required>
        </div>
        <div class="mb-3 text-end">
            <a href="forgot.jsp" style="color: #f39c12;">Forgot Password?</a>
        </div>
        <button type="submit" id="loginBtn" class="btn btn-primary w-100">Login</button>
    </form>
</div>

<!-- Footer -->
<footer class="footer_wrapper">
    <p>&copy; 2024 Mega City Cab Service</p>
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    var message = document.getElementById("Response")?.value;
    document.getElementById("loginBtn").addEventListener("click", function(event) {
        if (message === "success") {
            event.preventDefault();
            Swal.fire("Success!", "You have successfully logged in.", "success");
        }
    });
</script>
</body>
</html>