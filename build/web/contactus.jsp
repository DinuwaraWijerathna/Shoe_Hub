<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us | Shoe Palace</title>
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

        .contact-hero {
            background: linear-gradient(rgba(0, 0, 0, 0.7), rgba(0, 0, 0, 0.7)), url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            height: 40vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 0 1rem;
        }

        .contact-hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        .contact-hero p {
            font-size: 1.2rem;
            max-width: 700px;
        }

        .contact-container {
            max-width: 1200px;
            margin: 5rem auto;
            padding: 0 5%;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
        }

        .contact-info {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .contact-info h2 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark);
        }

        .info-item {
            display: flex;
            margin-bottom: 1.5rem;
        }

        .info-icon {
            width: 50px;
            height: 50px;
            background: rgba(121, 74, 250, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--secondary);
            font-size: 1.2rem;
            margin-right: 1rem;
            flex-shrink: 0;
        }

        .info-content h3 {
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            color: var(--dark);
        }

        .info-content p {
            color: var(--gray);
            line-height: 1.6;
        }

        .contact-form {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .contact-form h2 {
            font-size: 1.8rem;
            margin-bottom: 1.5rem;
            color: var(--dark);
        }

        .form-group {
            margin-bottom: 1.5rem;
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
            border-radius: 5px;
            font-size: 1rem;
            transition: border 0.3s;
        }

        .form-group textarea {
            min-height: 150px;
            resize: vertical;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary);
        }

        .btn {
            padding: 1rem 2rem;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn:hover {
            background: #ff5252;
            transform: translateY(-2px);
        }

        .map {
            grid-column: span 2;
            height: 400px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
        }

        .map iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        footer {
            background: var(--dark);
            color: white;
            text-align: center;
            padding: 3rem;
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

        @media (max-width: 992px) {
            .contact-container {
                grid-template-columns: 1fr;
            }
            
            .map {
                grid-column: span 1;
            }
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
            
            .contact-hero h1 {
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

    <section class="contact-hero">
        <h1>Get In Touch</h1>
        <p>We'd love to hear from you! Reach out with any questions or feedback.</p>
    </section>

    <div class="contact-container">
        <div class="contact-info">
            <h2>Contact Information</h2>
            
            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-map-marker-alt"></i>
                </div>
                <div class="info-content">
                    <h3>Our Location</h3>
                    <p>123 Shoe Street, Chicago, IL 60601</p>
                </div>
            </div>
            
            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-phone-alt"></i>
                </div>
                <div class="info-content">
                    <h3>Phone Number</h3>
                    <p>+1 (123) 456-7890</p>
                    <p>+1 (987) 654-3210</p>
                </div>
            </div>
            
            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-envelope"></i>
                </div>
                <div class="info-content">
                    <h3>Email Address</h3>
                    <p>info@shoepalace.com</p>
                    <p>support@shoepalace.com</p>
                </div>
            </div>
            
            <div class="info-item">
                <div class="info-icon">
                    <i class="fas fa-clock"></i>
                </div>
                <div class="info-content">
                    <h3>Working Hours</h3>
                    <p>Monday - Friday: 9:00 AM - 6:00 PM</p>
                    <p>Saturday: 10:00 AM - 4:00 PM</p>
                    <p>Sunday: Closed</p>
                </div>
            </div>
        </div>
        
        <div class="contact-form">
            <h2>Send Us a Message</h2>
            
            <form action="send_message.jsp" method="post">
                <div class="form-group">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Your Email</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="subject">Subject</label>
                    <input type="text" id="subject" name="subject" required>
                </div>
                
                <div class="form-group">
                    <label for="message">Your Message</label>
                    <textarea id="message" name="message" required></textarea>
                </div>
                
                <button type="submit" class="btn">Send Message</button>
            </form>
        </div>
        
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2970.1230738089863!2d-87.6373456845582!3d41.87811397922142!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x880e2c3cd0f4cbed%3A0xafe0a6ad09c0c000!2sChicago%2C%20IL!5e0!3m2!1sen!2sus!4v1625090000000!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </div>

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