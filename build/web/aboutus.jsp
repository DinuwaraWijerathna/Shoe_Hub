<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us | Shoe Palace</title>
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

        .about-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1525966222134-fcfa99b8ae77?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 50vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 0 1rem;
        }

        .about-hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .about-hero p {
            font-size: 1.2rem;
            max-width: 700px;
        }

        .about-content {
            max-width: 1200px;
            margin: 5rem auto;
            padding: 0 5%;
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

        .about-text {
            font-size: 1.1rem;
            line-height: 1.8;
            margin-bottom: 3rem;
            color: var(--gray);
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .feature-card {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: transform 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px);
        }

        .feature-icon {
            width: 80px;
            height: 80px;
            background: rgba(121, 74, 250, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            color: var(--secondary);
            font-size: 2rem;
        }

        .feature-card h3 {
            font-size: 1.3rem;
            margin-bottom: 1rem;
            color: var(--dark);
        }

        .feature-card p {
            color: var(--gray);
            line-height: 1.6;
        }

        .team {
            margin-top: 5rem;
        }

        .team-members {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 3rem;
        }

        .member-card {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            text-align: center;
            transition: transform 0.3s;
        }

        .member-card:hover {
            transform: translateY(-10px);
        }

        .member-img {
            height: 250px;
            overflow: hidden;
        }

        .member-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s;
        }

        .member-card:hover .member-img img {
            transform: scale(1.1);
        }

        .member-info {
            padding: 1.5rem;
        }

        .member-info h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
        }

        .member-info p {
            color: var(--primary);
            font-weight: 500;
            margin-bottom: 1rem;
        }

        .member-info .social-links {
            display: flex;
            justify-content: center;
            gap: 1rem;
        }

        .social-links a {
            width: 35px;
            height: 35px;
            background: #f8f9fa;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--dark);
            transition: all 0.3s;
        }

        .social-links a:hover {
            background: var(--primary);
            color: white;
        }

        footer {
            background: var(--dark);
            color: white;
            text-align: center;
            padding: 3rem;
            margin-top: 3rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            text-align: left;
        }

        .footer-column h3 {
            font-size: 1.3rem;
            margin-bottom: 1.5rem;
            color: white;
        }

        .footer-column p, 
        .footer-column a {
            color: #b8c7ce;
            margin-bottom: 1rem;
            display: block;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-column a:hover {
            color: var(--primary);
        }

        .copyright {
            margin-top: 3rem;
            padding-top: 1.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
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
            
            .about-hero h1 {
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

    <section class="about-hero">
        <h1>Our Story</h1>
        <p>Discover the passion and dedication behind Shoe Palace</p>
    </section>

    <section class="about-content">
        <div class="section-title">
            <h2>About Shoe Palace</h2>
            <p>Premium footwear crafted with passion and precision</p>
        </div>
        
        <div class="about-text">
            <p>Founded in 2010, Shoe Palace began as a small boutique in downtown Chicago with a simple mission: to provide high-quality, comfortable, and stylish footwear at affordable prices. What started as a single store has now grown into a nationally recognized brand with locations across the country and a thriving online presence.</p>
            
            <p>At Shoe Palace, we believe that shoes are more than just a necessity—they're an expression of personality and style. That's why we carefully curate our collection to include only the finest materials and designs, ensuring that every pair we sell meets our high standards of quality and comfort.</p>
            
            <p>Our team of experienced designers and craftsmen work tirelessly to create footwear that not only looks great but feels great too. We source our materials from ethical suppliers and prioritize sustainable practices in our manufacturing process.</p>
        </div>
        
        <div class="features">
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-tshirt"></i>
                </div>
                <h3>Premium Materials</h3>
                <p>We use only the finest leathers, fabrics, and components to ensure durability and comfort in every pair of shoes we make.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-hand-holding-heart"></i>
                </div>
                <h3>Ethical Sourcing</h3>
                <p>All our materials are sourced from suppliers who adhere to fair labor practices and environmental standards.</p>
            </div>
            
            <div class="feature-card">
                <div class="feature-icon">
                    <i class="fas fa-award"></i>
                </div>
                <h3>Quality Craftsmanship</h3>
                <p>Each pair of shoes is handcrafted by skilled artisans with attention to detail and passion for perfection.</p>
            </div>
        </div>
        
        <div class="team">
            <div class="section-title">
                <h2>Meet Our Team</h2>
                <p>The passionate individuals behind Shoe Palace</p>
            </div>
            
            <div class="team-members">
                <div class="member-card">
                    <div class="member-img">
                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="John Smith">
                    </div>
                    <div class="member-info">
                        <h3>John Smith</h3>
                        <p>Founder & CEO</p>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="member-card">
                    <div class="member-img">
                        <img src="https://randomuser.me/api/portraits/women/44.jpg" alt="Sarah Johnson">
                    </div>
                    <div class="member-info">
                        <h3>Sarah Johnson</h3>
                        <p>Head Designer</p>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="member-card">
                    <div class="member-img">
                        <img src="https://randomuser.me/api/portraits/men/67.jpg" alt="Michael Brown">
                    </div>
                    <div class="member-info">
                        <h3>Michael Brown</h3>
                        <p>Production Manager</p>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
                
                <div class="member-card">
                    <div class="member-img">
                        <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Emily Davis">
                    </div>
                    <div class="member-info">
                        <h3>Emily Davis</h3>
                        <p>Customer Service</p>
                        <div class="social-links">
                            <a href="#"><i class="fab fa-facebook-f"></i></a>
                            <a href="#"><i class="fab fa-twitter"></i></a>
                            <a href="#"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <div class="footer-content">
            <div class="footer-column">
                <h3>Shoe Palace</h3>
                <p>Premium footwear for every occasion. Quality, comfort, and style in every step.</p>
            </div>
            
            <div class="footer-column">
                <h3>Quick Links</h3>
                <a href="index.jsp">Home</a>
                <a href="about.jsp">About Us</a>
                <a href="contact.jsp">Contact</a>
                <a href="login.jsp">Login</a>
            </div>
            
            <div class="footer-column">
                <h3>Customer Service</h3>
                <a href="#">Shipping Policy</a>
                <a href="#">Return Policy</a>
                <a href="#">Size Guide</a>
                <a href="#">FAQs</a>
            </div>
            
            <div class="footer-column">
                <h3>Contact Us</h3>
                <p>123 Shoe Street, Chicago, IL 60601</p>
                <p>Phone: (123) 456-7890</p>
                <p>Email: info@shoepalace.com</p>
            </div>
        </div>
        
        <div class="copyright">
            <p>&copy; 2025 Shoe Palace. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>