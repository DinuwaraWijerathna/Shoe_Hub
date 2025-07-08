<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // Retrieve form data
    String name = request.getParameter("name");
    String price = request.getParameter("price");
    String category = request.getParameter("category");
    String image = request.getParameter("image");
    String stock = request.getParameter("stock");

    // Database connection details
    String url = "jdbc:mysql://localhost:3306/shoepalacedb";  // Ensure DB name is correct
    String user = "root";  // Your MySQL username
    String password = "";  // Your MySQL password

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Establish connection
        con = DriverManager.getConnection(url, user, password);

        // SQL Query to insert data
        String sql = "INSERT INTO shoes (name, price, category, image, stock) VALUES (?, ?, ?, ?, ?)";
        ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setDouble(2, Double.parseDouble(price));
        ps.setString(3, category);
        ps.setString(4, image);
        ps.setInt(5, Integer.parseInt(stock));

        // Execute insert
        int rowsInserted = ps.executeUpdate();
        if (rowsInserted > 0) {
            out.println("<script>alert('Shoe added successfully!'); window.location='admin_dashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Error adding shoe.'); window.location='add_shoe.jsp';</script>");
        }
    } catch (Exception e) {
        out.println("<script>alert('Database Error: " + e.getMessage() + "'); window.location='add_shoe.jsp';</script>");
        e.printStackTrace();
    } finally {
        // Close resources
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
