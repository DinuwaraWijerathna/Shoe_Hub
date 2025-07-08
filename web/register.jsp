<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | Shoe Palace</title>
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

        .register-container {
            background: white;
            width: 100%;
            max-width: 600px;
            padding: 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .logo {
            font-size: 2rem;
            font-weight: 700;
            color: var(--primary);
            margin-bottom: 1rem;
            text-align: center;
        }

        .logo span {
            color: var(--secondary);
        }

        h2 {
            color: var(--dark);
            margin-bottom: 2rem;
            text-align: center;
            font-size: 1.8rem;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group.full-width {
            grid-column: span 2;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: var(--dark);
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
            transition: border 0.3s;
        }

        .form-group textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-group input:focus,
        .form-group textarea:focus {
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

        .login-link {
            text-align: center;
            margin-top: 1.5rem;
        }

        .login-link a {
            color: var(--secondary);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .login-link a:hover {
            color: var(--primary);
        }

        .success-message {
            color: #2ed573;
            margin-top: 1rem;
            text-align: center;
            font-size: 0.9rem;
        }

        .error-message {
            color: #ff4757;
            margin-top: 1rem;
            text-align: center;
            font-size: 0.9rem;
        }

        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }
            
            .form-group.full-width {
                grid-column: span 1;
            }
            
            .register-container {
                padding: 2rem;
                margin: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="logo">Shoe<span>Palace</span></div>
        <h2>Create Your Account</h2>
        
        <form action="register.jsp" method="post">
            <div class="form-grid">
                <div class="form-group">
                    <label for="name">Full Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required>
                </div>
                
                <div class="form-group">
                    <label for="confirm-password">Confirm Password</label>
                    <input type="password" id="confirm-password" name="confirm-password" required>
                </div>
                
                <div class="form-group full-width">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" required></textarea>
                </div>
            </div>
            
            <button type="submit" class="btn">Register</button>
            
            <div class="login-link">
                Already have an account? <a href="login.jsp">Login here</a>
            </div>
        </form>
        
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String address = request.getParameter("address");

                String url = "jdbc:mysql://localhost:3306/ShoePalaceDB";
                String user = "root";
                String pass = "";

                Connection con = null;
                PreparedStatement stmt = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection(url, user, pass);

                    String query = "INSERT INTO customers (name, email, password, address) VALUES (?, ?, ?, ?)";
                    stmt = con.prepareStatement(query);
                    stmt.setString(1, name);
                    stmt.setString(2, email);
                    stmt.setString(3, password);
                    stmt.setString(4, address);

                    int result = stmt.executeUpdate();

                    if (result > 0) {
                        out.println("<div class='success-message'>Registration successful! You can now <a href='login.jsp'>login</a>.</div>");
                    } else {
                        out.println("<div class='error-message'>Registration failed! Please try again.</div>");
                    }
                } catch (Exception e) {
                    out.println("<div class='error-message'>Error: " + e.getMessage() + "</div>");
                } finally {
                    try {
                        if (stmt != null) stmt.close();
                        if (con != null) con.close();
                    } catch (Exception e) { }
                }
            }
        %>
    </div>
</body>
</html>