<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="initial-scale=1, width=device-width" />
    <title>Payment Success</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
    <!-- Font Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            text-align: center;
            margin-top: 100px;
        }
        .success-icon {
            color: #28a745;
            font-size: 5rem;
        }
        h1 {
            margin-bottom: 20px;
        }
        p {
            font-size: 1.2rem;
            color: #6c757d;
        }
        a {
            font-family: 'Montserrat', sans-serif;
            font-size: 14px;
            text-decoration: none;
            text-transform: uppercase;
            background: #28a745;
            display: inline-block;
            padding: 15px 30px;
            border-radius: 40px;
            color: #fff;
            font-weight: 700;
            -webkit-box-shadow: 0px 4px 15px -5px #0046d5;
            box-shadow: 0px 4px 15px -5px #0046d5;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Payment Successful!</h1>
    <div class="success-icon">
        <i class="fas fa-check-circle"></i>
    </div>
    <p>Your payment was successful. Thank you for your purchase!</p>
    <a href="/bookshop">Go To Homepage</a>

</div>

<!-- Script để nhận và gửi dữ liệu -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</body>
</html>
