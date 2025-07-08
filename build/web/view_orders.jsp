<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Orders | Shoe Palace</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
        }

        .admin-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 2rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .header h1 {
            color: var(--dark);
            font-size: 1.8rem;
        }

        .breadcrumb {
            display: flex;
            list-style: none;
        }

        .breadcrumb li {
            margin-right: 0.5rem;
        }

        .breadcrumb li:after {
            content: '/';
            margin-left: 0.5rem;
            color: var(--gray);
        }

        .breadcrumb li:last-child:after {
            content: '';
        }

        .breadcrumb a {
            color: var(--secondary);
            text-decoration: none;
        }

        .breadcrumb a:hover {
            text-decoration: underline;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
        }

        .card-title {
            font-size: 1.3rem;
            color: var(--dark);
        }

        .filter-group {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
        }

        .filter-group select,
        .filter-group input {
            padding: 0.5rem 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 0.9rem;
        }

        .filter-group button {
            padding: 0.5rem 1.5rem;
            background: var(--secondary);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .table-responsive {
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #eee;
        }

        th {
            background: #f8f9fa;
            color: var(--gray);
            font-weight: 500;
        }

        tr:hover {
            background: #f8f9fa;
        }

        .status {
            padding: 0.4rem 0.8rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status.pending {
            background: #fff3cd;
            color: #856404;
        }

        .status.processing {
            background: #cce5ff;
            color: #004085;
        }

        .status.shipped {
            background: #d1ecf1;
            color: #0c5460;
        }

        .status.delivered {
            background: #d4edda;
            color: #155724;
        }

        .status.cancelled {
            background: #f8d7da;
            color: #721c24;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
        }

        .btn i {
            margin-right: 0.5rem;
        }

        .btn-primary {
            background: var(--secondary);
            color: white;
        }

        .btn-primary:hover {
            background: #6a3df5;
            transform: translateY(-2px);
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 2rem;
        }

        .pagination a {
            padding: 0.5rem 1rem;
            margin: 0 0.25rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            color: var(--secondary);
            text-decoration: none;
        }

        .pagination a.active {
            background: var(--secondary);
            color: white;
            border-color: var(--secondary);
        }

        @media (max-width: 768px) {
            .admin-container {
                padding: 1rem;
            }
            
            .header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .breadcrumb {
                margin-top: 1rem;
            }
            
            .filter-group {
                flex-direction: column;
            }
            
            .filter-group select,
            .filter-group input,
            .filter-group button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="header">
            <h1>Order Management</h1>
            <ul class="breadcrumb">
                <li><a href="admin_dashboard.jsp">Dashboard</a></li>
                <li>Orders</li>
            </ul>
        </div>
        
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">All Orders</h2>
            </div>
            
            <div class="filter-group">
                <select>
                    <option>All Status</option>
                    <option>Pending</option>
                    <option>Processing</option>
                    <option>Shipped</option>
                    <option>Delivered</option>
                    <option>Cancelled</option>
                </select>
                
                <input type="date">
                
                <input type="text" placeholder="Search orders...">
                
                <button type="submit"><i class="fas fa-filter"></i> Filter</button>
            </div>
            
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Date</th>
                            <th>Amount</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String url = "jdbc:mysql://localhost:3306/ShoePalaceDB";
                            String user = "root";
                            String pass = "";

                            Connection con = null;
                            Statement stmt = null;
                            ResultSet rs = null;

                            try {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                con = DriverManager.getConnection(url, user, pass);
                                stmt = con.createStatement();
                                rs = stmt.executeQuery("SELECT * FROM orders ORDER BY order_date DESC");

                                while (rs.next()) {
                                    int orderId = rs.getInt("order_id");
                                    String customerName = rs.getString("customer_name");
                                    Date orderDate = rs.getDate("order_date");
                                    double totalPrice = rs.getDouble("total_price");
                                    String status = rs.getString("status");
                                    
                                    String statusClass = status.toLowerCase();
                        %>
                        <tr>
                            <td>#<%= orderId %></td>
                            <td><%= customerName %></td>
                            <td><%= orderDate %></td>
                            <td>$<%= String.format("%.2f", totalPrice) %></td>
                            <td><span class="status <%= statusClass %>"><%= status %></span></td>
                            <td>
                                <a href="order_details.jsp?id=<%= orderId %>" class="btn btn-primary">
                                    <i class="fas fa-eye"></i> View
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='6'>Error: " + e.getMessage() + "</td></tr>");
                            } finally {
                                try {
                                    if (rs != null) rs.close();
                                    if (stmt != null) stmt.close();
                                    if (con != null) con.close();
                                } catch (Exception e) { }
                            }
                        %>
                    </tbody>
                </table>
            </div>
            
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">&raquo;</a>
            </div>
        </div>
    </div>
</body>
</html>