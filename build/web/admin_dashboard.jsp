<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Shoe Palace</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        :root {
            --primary: #ff6b6b;
            --secondary: #794afa;
            --dark: #1e1e1e;
            --light: #f8f9fa;
            --gray: #6c757d;
            --sidebar: #2c3e50;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            background-color: #f5f7fa;
            display: flex;
            min-height: 100vh;
        }

        .sidebar {
            width: 250px;
            background: var(--sidebar);
            color: white;
            min-height: 100vh;
            transition: all 0.3s;
        }

        .sidebar-header {
            padding: 1.5rem;
            background: rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .sidebar-header h3 {
            color: white;
            font-size: 1.3rem;
        }

        .sidebar-menu {
            padding: 1rem 0;
        }

        .sidebar-menu li {
            list-style: none;
            margin-bottom: 0.5rem;
        }

        .sidebar-menu a {
            display: flex;
            align-items: center;
            padding: 1rem 1.5rem;
            color: #b8c7ce;
            text-decoration: none;
            transition: all 0.3s;
        }

        .sidebar-menu a:hover,
        .sidebar-menu a.active {
            color: white;
            background: rgba(0, 0, 0, 0.2);
            border-left: 3px solid var(--primary);
        }

        .sidebar-menu i {
            margin-right: 0.8rem;
            font-size: 1.1rem;
        }

        .main-content {
            flex: 1;
            padding: 2rem;
        }

        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #e0e0e0;
        }

        .header h1 {
            color: var(--dark);
            font-size: 1.8rem;
        }

        .user-info {
            display: flex;
            align-items: center;
        }

        .user-info img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 0.8rem;
        }

        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .card {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .card-title {
            font-size: 1rem;
            color: var(--gray);
            font-weight: 500;
        }

        .card-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .card-icon.users {
            background: rgba(121, 74, 250, 0.1);
            color: var(--secondary);
        }

        .card-icon.products {
            background: rgba(255, 107, 107, 0.1);
            color: var(--primary);
        }

        .card-icon.orders {
            background: rgba(46, 213, 115, 0.1);
            color: #2ed573;
        }

        .card-icon.revenue {
            background: rgba(255, 165, 2, 0.1);
            color: #ffa502;
        }

        .card-value {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--dark);
            margin-bottom: 0.5rem;
        }

        .card-footer {
            font-size: 0.9rem;
            color: var(--gray);
        }

        .recent-orders {
            background: white;
            border-radius: 10px;
            padding: 1.5rem;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .section-title {
            font-size: 1.3rem;
            color: var(--dark);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
        }

        .section-title i {
            margin-right: 0.8rem;
            color: var(--primary);
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #f0f0f0;
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

        .status.completed {
            background: #d4edda;
            color: #155724;
        }

        .status.shipped {
            background: #cce5ff;
            color: #004085;
        }

        .btn {
            padding: 0.5rem 1rem;
            border-radius: 5px;
            font-size: 0.9rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
        }

        .btn-view {
            background: var(--secondary);
            color: white;
        }

        .btn-view:hover {
            background: #6a3df5;
        }

        @media (max-width: 992px) {
            .sidebar {
                width: 80px;
                overflow: hidden;
            }
            
            .sidebar-header h3,
            .sidebar-menu span {
                display: none;
            }
            
            .sidebar-menu a {
                justify-content: center;
            }
            
            .sidebar-menu i {
                margin-right: 0;
                font-size: 1.3rem;
            }
        }

        @media (max-width: 768px) {
            body {
                flex-direction: column;
            }
            
            .sidebar {
                width: 100%;
                min-height: auto;
            }
            
            .sidebar-menu {
                display: flex;
                overflow-x: auto;
            }
            
            .sidebar-menu li {
                flex: 0 0 auto;
                margin-bottom: 0;
            }
            
            .sidebar-menu a {
                padding: 1rem;
                border-left: none;
                border-bottom: 3px solid transparent;
            }
            
            .sidebar-menu a:hover,
            .sidebar-menu a.active {
                border-left: none;
                border-bottom: 3px solid var(--primary);
            }
        }
    </style>
</head>
<body>
    <!-- Sidebar -->
    <div class="sidebar">
        <div class="sidebar-header">
            <h3>Shoe Palace Admin</h3>
        </div>
        
        <ul class="sidebar-menu">
            <li>
                <a href="admin_dashboard.jsp" class="active">
                    <i class="fas fa-tachometer-alt"></i>
                    <span>Dashboard</span>
                </a>
            </li>
            <li>
                <a href="add_product.jsp">
                    <i class="fas fa-plus-circle"></i>
                    <span>Add Product</span>
                </a>
            </li>
            <li>
                <a href="view_products.jsp">
                    <i class="fas fa-shoe-prints"></i>
                    <span>View Products</span>
                </a>
            </li>
            <li>
                <a href="view_orders.jsp">
                    <i class="fas fa-shopping-cart"></i>
                    <span>View Orders</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-users"></i>
                    <span>Customers</span>
                </a>
            </li>
            <li>
                <a href="#">
                    <i class="fas fa-chart-line"></i>
                    <span>Reports</span>
                </a>
            </li>
            <li>
                <a href="index.jsp">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </li>
        </ul>
    </div>
    
    <!-- Main Content -->
    <div class="main-content">
        <div class="header">
            <h1>Dashboard Overview</h1>
            <div class="user-info">
                <img src="https://randomuser.me/api/portraits/men/41.jpg" alt="Admin">
                <span>Admin User</span>
            </div>
        </div>
        
        <div class="stats-cards">
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Total Users</div>
                    <div class="card-icon users">
                        <i class="fas fa-users"></i>
                    </div>
                </div>
                <div class="card-value">1,254</div>
                <div class="card-footer">+12% from last month</div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Total Products</div>
                    <div class="card-icon products">
                        <i class="fas fa-shoe-prints"></i>
                    </div>
                </div>
                <div class="card-value">86</div>
                <div class="card-footer">+5 new this week</div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Total Orders</div>
                    <div class="card-icon orders">
                        <i class="fas fa-shopping-cart"></i>
                    </div>
                </div>
                <div class="card-value">324</div>
                <div class="card-footer">+24% from last month</div>
            </div>
            
            <div class="card">
                <div class="card-header">
                    <div class="card-title">Total Revenue</div>
                    <div class="card-icon revenue">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                </div>
                <div class="card-value">$24,580</div>
                <div class="card-footer">+18% from last month</div>
            </div>
        </div>
        
        <div class="recent-orders">
            <h2 class="section-title">
                <i class="fas fa-shopping-cart"></i>
                Recent Orders
            </h2>
            
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Customer</th>
                        <th>Product</th>
                        <th>Amount</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>#SP-2548</td>
                        <td>John Smith</td>
                        <td>Nike Air Max</td>
                        <td>$120.00</td>
                        <td><span class="status completed">Completed</span></td>
                        <td><button class="btn btn-view">View</button></td>
                    </tr>
                    <tr>
                        <td>#SP-2547</td>
                        <td>Sarah Johnson</td>
                        <td>Adidas Ultraboost</td>
                        <td>$150.00</td>
                        <td><span class="status shipped">Shipped</span></td>
                        <td><button class="btn btn-view">View</button></td>
                    </tr>
                    <tr>
                        <td>#SP-2546</td>
                        <td>Michael Brown</td>
                        <td>Puma RS-X</td>
                        <td>$95.00</td>
                        <td><span class="status pending">Pending</span></td>
                        <td><button class="btn btn-view">View</button></td>
                    </tr>
                    <tr>
                        <td>#SP-2545</td>
                        <td>Emily Davis</td>
                        <td>New Balance 574</td>
                        <td>$80.00</td>
                        <td><span class="status completed">Completed</span></td>
                        <td><button class="btn btn-view">View</button></td>
                    </tr>
                    <tr>
                        <td>#SP-2544</td>
                        <td>Robert Wilson</td>
                        <td>Converse Chuck 70</td>
                        <td>$70.00</td>
                        <td><span class="status shipped">Shipped</span></td>
                        <td><button class="btn btn-view">View</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>