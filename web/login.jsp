<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login | Shoe Palace</title>
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

        .login-container {
            background: white;
            width: 100%;
            max-width: 500px;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .logo {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .logo span {
            color: var(--secondary);
        }

        h2 {
            color: var(--dark);
            margin-bottom: 2rem;
            font-size: 1.8rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
            text-align: left;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--dark);
            font-weight: 500;
        }

        .form-group input {
            width: 100%;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: border 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
        }

        .btn {
            width: 100%;
            padding: 1rem;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn:hover {
            background: #ff5252;
            transform: translateY(-2px);
        }

        .links {
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
        }

        .links a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .links a:hover {
            color: var(--primary);
        }

        .error-message {
            color: #ff4757;
            margin-top: 1rem;
            font-size: 0.9rem;
        }

        @media (max-width: 576px) {
            .login-container {
                padding: 2rem;
                margin: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="logo">Shoe<span>Palace</span></div>
        <h2>Customer Login</h2>
        
        <form action="login.jsp" method="post">
            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            
            <button type="submit" class="btn">Login</button>
            
            <div class="links">
                <a href="register.jsp">Create Account</a>
                <a href="admin_dashboard.jsp">Admin Login</a>
            </div>
        </form>
        
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                String url = "jdbc:mysql://localhost:3306/ShoePalaceDB";
                String user = "root";
                String pass = "";

                Connection con = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, user, pass);

                    String query = "SELECT * FROM customers WHERE email = ? AND password = ?";
                    stmt = con.prepareStatement(query);
                    stmt.setString(1, email);
                    stmt.setString(2, password);

                    rs = stmt.executeQuery();

                    if (rs.next()) {
                        session.setAttribute("customer_id", rs.getInt("customer_id"));
                        session.setAttribute("customer_name", rs.getString("name"));
                        session.setAttribute("customer_email", rs.getString("email"));
                        response.sendRedirect("index.jsp");
                    } else {
                        out.println("<div class='error-message'>Invalid email or password. Please try again.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='error-message'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    } catch (Exception e) { }
                }
            }
        %>
    </div>
</body>
</html>