<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendor Registration</title>
    
    <link rel="stylesheet" href="design.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    
</head>
<body>


<!-- Static Header -->
<header>
    <h1>
    <i class="bi bi-person-plus"></i> Vendor Registration
    </h1>
        <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
</header>

<div class="main-container">
        <div class="sidebar" id="sidebar">
            <a href="main" class="nav-link">
                <i class="bi bi-home"></i> Home
            </a>
            <a href="ongoing_tenders" class="nav-link">
                <i class="bi bi-file-earmark-text"></i> Ongoing Tenders
            </a>
            <a href="upcoming_tenders" class="nav-link">
                <i class="bi bi-calendar-event"></i> Upcoming Tenders
            </a>
            <a href="faqs" class="nav-link">
                <i class="bi bi-question-circle"></i> FAQs
            </a>
            
            <a href="vendor_guidelines" class="nav-link">
                <i class="bi bi-file-earmark-text"></i> Vendor Guidelines
            </a>
        </div>

<!-- Scrollable content -->
<div class="content">
<div class="register-container">
    
                <h2 style="color:#800080">Register as a Vendor</h2>
		          <c:if test="${not empty error}">
		            <div class="error-message" style="color: red;">
		                ${error}
		            </div>
		        </c:if>
        
        <form action="/register_vendor" method="post">
            <label for="name">Vendor Name:</label>
            <input type="text" id="name" name="name" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="contact_no">Contact Number:</label>
            <input type="tel" id="contact_no" name="contact_no" required>

            <label for="company_name">Company Name:</label>
            <input type="text" id="company_name" name="company_name" required>

            <label for="address">Address:</label>
            <input type="text" id="address" name="address" required>

            <label for="company_started_year">Company Started Year:</label>
            <input type="number" id="company_started_year" name="company_started_year" min="1900" max="2099" required>
			
			<label for="username">Username:</label>
			<input type="text" id="username" name="username" required>
			
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="confirm_password">Confirm Password:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <button type="submit">Register</button>
        </form>
    </div>
</div>
</div>
<!-- Static Footer -->
<footer>
        &copy; 2024 ProMS - All rights reserved
    </footer>
    <script>
    document.getElementById('toggleSidebarBtn').addEventListener('click', function() {
        var sidebar = document.getElementById('sidebar'); // Accessing the sidebar by ID
        sidebar.classList.toggle('collapsed'); // Toggle class
    });
    </script>

</body>
</html>
