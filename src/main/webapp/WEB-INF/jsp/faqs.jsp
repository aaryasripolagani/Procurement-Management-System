<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Frequently Asked Questions</title>
    <link rel="stylesheet" href="design.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>

<header>
    <h1><i class="bi bi-question-circle"></i>Frequently Asked Questions</h1>
</header>

<div class="main-container">
    <div id="sidebar" class="sidebar">
        <a href="/main" class="nav-link">
            <i class="bi bi-house"></i> Home
        </a>
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
    <div class="tender-table">
        <h2 style="color:#800080">FAQs</h2>
        <ul>
            <li><strong>How do I register as a vendor?</strong> - You can register by filling out the vendor registration form.</li>
            <li><strong>What is the deadline for ongoing tenders?</strong> - Each tender has its own deadline mentioned in the tender details.</li>
            <li><strong>How can I track my bids?</strong> - Track your bids through the 'Track Orders' section on your dashboard.</li>
            <li><strong>How can an employee create a quotation?</strong> - Employees can create a quotation by accessing the 'Create Quotation' section on their dashboard and filling out the necessary details.</li>
            <li><strong>How can a vendor bid on a quotation?</strong> - Vendors can bid on a quotation by navigating to the 'View Quotations' section and selecting the desired quotation to place a bid.</li>
            <li><strong>Can we place multiple items in the same quotation?</strong> - To include multiple items, you must create a new quotation for each item.</li>
            <li><strong>What are the responsibilities of an admin?</strong> - Admins manage users, approve quotations, and oversee the bidding process.</li>
        </ul>
    </div>
</div>
</div>
<footer>
    &copy; 2024-ProMS All rights reserved
</footer>
<script>
    document.getElementById('toggleSidebarBtn').addEventListener('click', function() {
        var sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('collapsed');
    });
    </script>


</body>
</html>
