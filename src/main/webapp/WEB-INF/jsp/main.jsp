<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Procurement Management System</title>
    <link rel="stylesheet" href="design.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@700&display=swap" rel="stylesheet">
    
</head>
<body>

<header>
    <h1>
    <img src="logo.png" alt="ProMS Logo" class="logo">
    ProMS - Procurement Management System
    </h1>
        <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
</header>

    <div class="main-container">
        <div class="sidebar" id="sidebar">
            <a href="register_vendor" class="nav-link">
                <i class="bi bi-person-plus"></i> Register as Vendor
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

        <div class="content">
            <div class="header-image">
                <div class="nav-icons">
                    <a href="/buyer-login?redirect=buyer"><i class="bi bi-person"></i> Buyer Dashboard</a>
                    <a href="/vendor-login?redirect=vendor"><i class="bi bi-truck"></i> Vendor Dashboard</a>
                    <a href="/admin-login?redirect=admin"><i class="bi bi-shield-lock"></i> Admin Dashboard</a>
                </div>
            </div>
            <!-- Main content area -->
            <h2 style="color: #800080;">Welcome to ProMS</h2>
            <p style="color: #800080;">
                <ul>
                    <li>The Procurement Management System (ProMS) revolutionizes purchasing processes, enhancing efficiency and accountability.</li>
                    <li>Vendors can easily register and stay informed about ongoing and upcoming tenders, ensuring no missed opportunities.</li>
                    <li>Buyers gain access to essential statistics and insights for making data-driven decisions.</li>
                    <li>Comprehensive vendor guidelines and a dedicated FAQ section facilitate smooth operations.</li>
                    <li>Experience seamless procurement management with ProMS, prioritizing transparency and user-friendliness!</li>
                </ul>
            </p>
        </div>
    </div>

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