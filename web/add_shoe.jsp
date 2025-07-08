<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Product | Shoe Palace</title>
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

        .card-title {
            font-size: 1.3rem;
            color: var(--dark);
            margin-bottom: 1.5rem;
            padding-bottom: 1rem;
            border-bottom: 1px solid #eee;
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
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.8rem 1rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            transition: border 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: var(--primary);
        }

        .form-group textarea {
            min-height: 120px;
            resize: vertical;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 1.5rem;
        }

        .btn {
            padding: 0.8rem 1.5rem;
            border-radius: 5px;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s;
            border: none;
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

        .btn-group {
            display: flex;
            gap: 1rem;
            margin-top: 1.5rem;
        }

        .file-upload {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }

        .file-upload-btn {
            width: 100%;
            padding: 0.8rem 1rem;
            background: #f8f9fa;
            border: 1px dashed #ddd;
            border-radius: 5px;
            text-align: center;
            cursor: pointer;
        }

        .file-upload input[type="file"] {
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .preview-image {
            max-width: 200px;
            max-height: 200px;
            margin-top: 1rem;
            display: none;
            border-radius: 5px;
        }

        @media (max-width: 768px) {
            .form-row {
                grid-template-columns: 1fr;
            }
            
            .admin-container {
                padding: 1rem;
            }
        }
    </style>
</head>
<body>
    <div class="admin-container">
        <div class="header">
            <h1>Add New Product</h1>
            <ul class="breadcrumb">
                <li><a href="admin_dashboard.jsp">Dashboard</a></li>
                <li><a href="view_products.jsp">Products</a></li>
                <li>Add Product</li>
            </ul>
        </div>
        
        <div class="card">
            <h2 class="card-title">Product Information</h2>
            
            <form action="add_product_process.jsp" method="post" enctype="multipart/form-data">
                <div class="form-row">
                    <div class="form-group">
                        <label for="name">Product Name</label>
                        <input type="text" id="name" name="name" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="category">Category</label>
                        <select id="category" name="category" required>
                            <option value="">Select Category</option>
                            <option value="Running">Running</option>
                            <option value="Casual">Casual</option>
                            <option value="Sports">Sports</option>
                            <option value="Formal">Formal</option>
                            <option value="Sneakers">Sneakers</option>
                        </select>
                    </div>
                </div>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="price">Price ($)</label>
                        <input type="number" id="price" name="price" step="0.01" min="0" required>
                    </div>
                    
                    <div class="form-group">
                        <label for="stock">Stock Quantity</label>
                        <input type="number" id="stock" name="stock" min="0" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="description">Description</label>
                    <textarea id="description" name="description"></textarea>
                </div>
                
                <div class="form-group">
                    <label>Product Image</label>
                    <div class="file-upload">
                        <label class="file-upload-btn">
                            Choose File
                            <input type="file" id="image" name="image" accept="image/*" required>
                        </label>
                    </div>
                    <img id="preview" class="preview-image" src="#" alt="Preview">
                </div>
                
                <div class="btn-group">
                    <button type="submit" class="btn btn-primary">Add Product</button>
                    <button type="reset" class="btn btn-secondary">Reset</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        // Image preview functionality
        document.getElementById('image').addEventListener('change', function(e) {
            const preview = document.getElementById('preview');
            const file = e.target.files[0];
            const reader = new FileReader();
            
            reader.onloadend = function() {
                preview.src = reader.result;
                preview.style.display = 'block';
            }
            
            if (file) {
                reader.readAsDataURL(file);
            } else {
                preview.src = "";
                preview.style.display = 'none';
            }
        });
    </script>
</body>
</html>