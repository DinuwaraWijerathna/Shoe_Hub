<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Confirmation</title>
</head>
<body>

<%
    // Get form data
    String shoeId = request.getParameter("shoe_id");
    String price = request.getParameter("price");
    String customerName = request.getParameter("customer_name");
    String customerAddress = request.getParameter("customer_address");
    String quantity = request.getParameter("quantity");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/ShoePalaceDB";
    String user = "root";
    String password = "";

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        con = DriverManager.getConnection(url, user, password);

        // SQL query to insert order
        String query = "INSERT INTO orders (shoe_id, customer_name, customer_address, quantity, price, total_price, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(query);
        pstmt.setString(1, shoeId);
        pstmt.setString(2, customerName);
        pstmt.setString(3, customerAddress);
        pstmt.setInt(4, Integer.parseInt(quantity));
        pstmt.setString(5, price);
        
        // Calculate the total price
        double totalPrice = Integer.parseInt(quantity) * Double.parseDouble(price);
        pstmt.setDouble(6, totalPrice);
        
        pstmt.setString(7, "Pending"); // Default order status

        int rows = pstmt.executeUpdate();
        
        if (rows > 0) {
            out.println("<h2>Your order has been placed successfully!</h2>");
            out.println("<p>Order Details:</p>");
            out.println("<p>Shoe ID: " + shoeId + "</p>");
            out.println("<p>Name: " + customerName + "</p>");
            out.println("<p>Address: " + customerAddress + "</p>");
            out.println("<p>Quantity: " + quantity + "</p>");
            out.println("<p>Total Price: $" + totalPrice + "</p>");
        } else {
            out.println("<h2>Error placing the order. Please try again.</h2>");
        }
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
        e.printStackTrace();
    } finally {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
%>

</body>
</html>
