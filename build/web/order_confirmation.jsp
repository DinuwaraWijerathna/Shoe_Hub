<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation | Shoe Palace</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #ff6b6b;
            --secondary: #794afa;
            --dark: #1e1e1e;
            --light: #f8f9fa;
            --gray: #6c757d;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: var(--light);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .confirmation-container {
            background: white;
            width: 100%;
            max-width: 800px;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .confirmation-icon {
            width: 100px;
            height: 100px;
            background: rgba(46, 213, 115, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 2rem;
            color: #2ed573;
            font-size: 3rem;
        }

        h1 {
            color: var(--dark);
            font-size: 2.2rem;
            margin-bottom: 1rem;
        }

        p {
            color: var(--gray);
            font-size: 1.1rem;
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .order-details {
            background: #f8f9fa;
            border-radius: 10px;
            padding: 2rem;
            margin: 2rem 0;
            text-align: left;
        }

        .order-details h2 {
            font-size: 1.5rem;
            color: var(--dark);
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1rem;
        }

        .detail-label {
            color: var(--gray);
            font-weight: 500;
        }

        .detail-value {
            color: var(--dark);
            font-weight: 500;
        }

        .btn {
            display: inline-block;
            padding: 1rem 2rem;
            background: var(--primary);
            color: white;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            margin-top: 1.5rem;
            transition: all 0.3s;
        }

        .btn:hover {
            background: #ff5252;
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        @media (max-width: 768px) {
            .confirmation-container {
                padding: 2rem;
                margin: 1rem;
            }
            
            .detail-row {
                flex-direction: column;
            }
            
            .detail-label {
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="confirmation-container">
        <div class="confirmation-icon">
            <i class="fas fa-check"></i>
        </div>
        
        <h1>Thank You For Your Order!</h1>
        <p>Your order has been placed successfully. We've sent a confirmation email with all the details.</p>
        
        <div class="order-details">
            <h2>Order Details</h2>
            
            <%
                String shoeId = request.getParameter("shoe_id");
                String price = request.getParameter("price");
                String customerName = request.getParameter("customer_name");
                String customerAddress = request.getParameter("customer_address");
                String quantity = request.getParameter("quantity");
                
                double totalPrice = Integer.parseInt(quantity) * Double.parseDouble(price);
            %>
            
            <div class="detail-row">
                <span class="detail-label">Order Number:</span>
                <span class="detail-value">#<%= (int)(Math.random() * 9000) + 1000 %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Product ID:</span>
                <span class="detail-value"><%= shoeId %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Customer Name:</span>
                <span class="detail-value"><%= customerName %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Shipping Address:</span>
                <span class="detail-value"><%= customerAddress %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Quantity:</span>
                <span class="detail-value"><%= quantity %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Unit Price:</span>
                <span class="detail-value">$<%= String.format("%.2f", Double.parseDouble(price)) %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Total Amount:</span>
                <span class="detail-value">$<%= String.format("%.2f", totalPrice) %></span>
            </div>
            
            <div class="detail-row">
                <span class="detail-label">Estimated Delivery:</span>
                <span class="detail-value">3-5 Business Days</span>
            </div>
        </div>
        
        <a href="index.jsp" class="btn">Continue Shopping</a>
    </div>

    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>