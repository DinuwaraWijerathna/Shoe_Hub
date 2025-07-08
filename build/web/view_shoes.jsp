<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Products | Shoe Palace</title>
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
            background: var(--primary);
            color: white;
        }

        .btn-primary:hover {
            background: #ff5252;
            transform: translateY(-2px);
        }

        .btn-secondary {
            background: var(--secondary);
            color: white;
        }

        .btn-secondary:hover {
            background: #6a3df5;
            transform: translateY(-2px);
        }

        .btn-danger {
            background: #ff4757;
            color: white;
        }

        .btn-danger:hover {
            background: #ff2d3f;
            transform: translateY(-2px);
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

        .product-img {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 5px;
        }

        .status {
            padding: 0.4rem 0.8rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .status.in-stock {
            background: #d4edda;
            color: #155724;
        }

        .status.low-stock {
            background: #fff3cd;
            color: #856404;
        }

        .status.out-of-stock {
            background: #f8d7da;
            color: #721c24;
        }

        .actions {
            display: flex;
            gap: 0.5rem;
        }

        .search-bar {
            display: flex;
            margin-bottom: 1.5rem;
        }

        .search-bar input {
            flex: 1;
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: 5px 0 0 5px;
            font-size: 1rem;
        }

        .search-bar button {
            padding: 0 1.5rem;
            background: var(--secondary);
            color: white;
            border: none;
            border-radius: 0 5px 5px 0;
            cursor: pointer;
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
            
            .actions {
                flex-direction: column;
            }
            
            .actions .btn {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="header">
            <h1>Product Management</h1>
            <ul class="breadcrumb">
                <li><a href="admin_dashboard.jsp">Dashboard</a></li>
                <li>Products</li>
            </ul>
        </div>
        
        <div class="card">
            <div class="card-header">
                <h2 class="card-title">All Products</h2>
                <a href="add_product.jsp" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add Product
                </a>
            </div>
            
            <div class="search-bar">
                <input type="text" placeholder="Search products...">
                <button type="submit"><i class="fas fa-search"></i></button>
            </div>
            
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Category</th>
                            <th>Price</th>
                            <th>Stock</th>
                            <th>Status</th>
                            <th>Actions</th>
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
                                rs = stmt.executeQuery("SELECT * FROM shoes");

                                while (rs.next()) {
                                    int id = rs.getInt("shoe_id");
                                    String name = rs.getString("name");
                                    String category = rs.getString("category");
                                    double price = rs.getDouble("price");
                                    int stock = rs.getInt("stock");
                                    String image = rs.getString("image");
                                    
                                    String statusClass = "in-stock";
                                    String statusText = "In Stock";
                                    
                                    if (stock < 5 && stock > 0) {
                                        statusClass = "low-stock";
                                        statusText = "Low Stock";
                                    } else if (stock == 0) {
                                        statusClass = "out-of-stock";
                                        statusText = "Out of Stock";
                                    }
                        %>
                        <tr>
                            <td><%= id %></td>
                            <td><img src="<%= image %>" class="product-img" alt="<%= name %>"></td>
                            <td><%= name %></td>
                            <td><%= category %></td>
                            <td>$<%= String.format("%.2f", price) %></td>
                            <td><%= stock %></td>
                            <td><span class="status <%= statusClass %>"><%= statusText %></span></td>
                            <td class="actions">
                                <a href="edit_product.jsp?id=<%= id %>" class="btn btn-secondary">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="delete_product.jsp?id=<%= id %>" class="btn btn-danger">
                                    <i class="fas fa-trash"></i> Delete
                                </a>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (Exception e) {
                                out.println("<tr><td colspan='8'>Error: " + e.getMessage() + "</td></tr>");
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