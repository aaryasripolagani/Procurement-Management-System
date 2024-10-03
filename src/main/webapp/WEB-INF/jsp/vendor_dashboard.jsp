<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    
    <style>

        </style>
</head>

<body>

<header>
     <h1>
    <i class="bi bi-person-truck" style="font-size: 1.5rem; color: white;"></i> 
            Vendor Dashboard
        </h1>
    <nav>
    <a href="/main"><i class="bi bi-house"></i> Home</a>
    <a href="/vendor_dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="/main"><i class="bi bi-box-arrow-right"></i> Logout</a>
</nav>
    <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
</header>

<div class="content d-flex">
    <div class="sidebar" id="sidebar">
		
        <a href="/Apply-bid" class="nav-link active">
            <i class="bi bi-file-earmark-text"></i> Apply Bid
        </a>
        <a href="/Applied-bids" class="nav-link">
            <i class="bi bi-coin"></i> Applied Bids
        </a>
        <a href="/vendor-bids" class="nav-link">
           <i class="bi bi-file-earmark-arrow-up"></i> Results
        </a>
        <a href="#" class="nav-link">
            <i class="bi bi-truck"></i> Track Vendors
        </a>
        
        
    </div>

    <div class="main-content">
     <div class="welcome-image" style="flex: 1; display: flex; align-items: center; justify-content: center;">
            <img src="vendor.webp" alt="Vendor Dashboard Image" style="max-width: 80%; height: auto;"/> <!-- Adjust image size -->
        </div>
        <div class="description" style="flex: 1; padding: 20px;">
            <h5 style="color: #800080;">As an Vendor, your responsibilities include:</h5>
            <ul>
                <li>Creating and submitting quotations for procurement: You can generate quotations based on the project requirements, specifying the items needed, their quantities, and other relevant details. These quotations will be sent to the admin for approval.</li>
                <li>Managing tenders: Initiate and oversee tenders by inviting vendors to submit bids for supplying items. Evaluate the bids to ensure they meet the project's criteria and quality standards.</li>
                <li>Confirming orders with vendors:Communicating with vendors: Liaise with vendors to gather pricing and availability information. Ensure that all queries are answered and that the vendors are aware of the project's needs and timelines.</li>
                <li>Coordinating with the project team: Stay in sync with the project team to ensure that the items being procured align with the current and future project needs.</li>
    <li>Maintaining records of procurement activities: Ensure that all procurement-related documents, such as quotations, tender bids, and vendor agreements, are well-organized and easily accessible for future reference.</li>
                
            </ul>
        </div>
    
        
    </div>
</div>

<footer>
    &copy; ProMs-All Rights Reserved
</footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-IF3gY5L8pE+DZ+8R41/m6kF8Pzm3EzH91A2u7Tz7RlIh3Hx3tb4BfG8S1lAyZFd4"
        crossorigin="anonymous"></script>
    <script>
        document.getElementById('toggleSidebarBtn').addEventListener('click', function() {
            var sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('collapsed');
        });
    </script>

</body>
</html>