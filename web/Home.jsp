<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shoe Palace - Premium Footwear</title>
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
            color: var(--dark);
            line-height: 1.6;
        }

        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
            padding: 1rem 5%;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: var(--primary);
            text-decoration: none;
        }

        .logo span {
            color: var(--secondary);
        }

        .nav-links {
            display: flex;
            list-style: none;
        }

        .nav-links li {
            margin-left: 2rem;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        .hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1460353581641-37baddab0fa2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 60vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 0 1rem;
        }

        .hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .hero p {
            font-size: 1.2rem;
            max-width: 700px;
            margin-bottom: 2rem;
        }

        .btn {
            display: inline-block;
            background: var(--primary);
            color: white;
            padding: 0.8rem 1.8rem;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s;
        }

        .btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
        }

        .products {
            padding: 5rem 5%;
        }

        .section-title {
            text-align: center;
            margin-bottom: 3rem;
        }

        .section-title h2 {
            font-size: 2.5rem;
            color: var(--dark);
            margin-bottom: 1rem;
        }

        .section-title p {
            color: var(--gray);
            max-width: 700px;
            margin: 0 auto;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 2rem;
        }

        .product-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .product-img {
            height: 250px;
            overflow: hidden;
        }

        .product-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .product-card:hover .product-img img {
            transform: scale(1.1);
        }

        .product-info {
            padding: 1.5rem;
        }

        .product-info h3 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
        }

        .product-info p {
            color: var(--gray);
            margin-bottom: 1rem;
        }

        .product-price {
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .order-form {
            display: none;
            padding: 0 1.5rem 1.5rem;
        }

        .order-form input {
            width: 100%;
            padding: 0.8rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
        }

        .order-form button {
            width: 100%;
            padding: 0.8rem;
            background: var(--secondary);
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background 0.3s;
        }

        .order-form button:hover {
            background: #6a3df5;
        }

        footer {
            background: var(--dark);
            color: white;
            text-align: center;
            padding: 2rem;
            margin-top: 3rem;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
            }
            
            .nav-links {
                margin-top: 1rem;
            }
            
            .nav-links li {
                margin: 0 0.5rem;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
        }
    </style>
</head>
<body>
    <header>
        <nav class="navbar">
            <a href="index.jsp" class="logo">Shoe<span>Palace</span></a>
            <ul class="nav-links">
                <li><a href="index.jsp">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="contact.jsp">Contact</a></li>
                <li><a href="login.jsp">Login</a></li>
            </ul>
        </nav>
    </header>

    <section class="hero">
        <h1>Step Into Comfort & Style</h1>
        <p>Discover our premium collection of footwear designed for every occasion</p>
        <a href="#products" class="btn">Shop Now</a>
    </section>

    <section class="products" id="products">
        <div class="section-title">
            <h2>Featured Collection</h2>
            <p>Handcrafted shoes made with premium materials for ultimate comfort</p>
        </div>
        
        <div class="product-grid">
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
                    rs = stmt.executeQuery("SELECT * FROM shoes LIMIT 6");

                    while (rs.next()) {
                        String id = rs.getString("shoe_id");
                        String name = rs.getString("name");
                        String price = rs.getString("price");
                        String image = rs.getString("image");
                        String category = rs.getString("category");
            %>
            <div class="product-card">
                <div class="product-img">
                    <img src="<%= image %>" alt="<%= name %>">
                </div>
                <div class="product-info">
                    <h3><%= name %></h3>
                    <p><%= category %></p>
                    <div class="product-price">$<%= price %></div>
                    <button class="btn" onclick="showOrderForm('<%= id %>')">Order Now</button>
                </div>
                
                <form id="orderForm<%= id %>" action="order.jsp" method="post" class="order-form">
                    <input type="hidden" name="shoe_id" value="<%= id %>">
                    <input type="hidden" name="price" value="<%= price %>">
                    <input type="text" name="customer_name" placeholder="Your Name" required>
                    <input type="text" name="customer_address" placeholder="Shipping Address" required>
                    <input type="number" name="quantity" placeholder="Quantity" min="1" required>
                    <button type="submit">Complete Order</button>
                </form>
            </div>
            <%
                    }
                } catch (Exception e) {
                    out.println("<p>Error loading products: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (con != null) con.close();
                }
            %>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Shoe Palace. All rights reserved.</p>
    </footer>

    <script>
        function showOrderForm(id) {
            // Hide all forms first
            document.querySelectorAll('.order-form').forEach(form => {
                form.style.display = 'none';
            });
            
            // Show the selected form
            document.getElementById('orderForm' + id).style.display = 'block';
            
            // Scroll to the product
            document.getElementById('orderForm' + id).scrollIntoView({
                behavior: 'smooth'
            });
        }
    </script>
</body>
</html>