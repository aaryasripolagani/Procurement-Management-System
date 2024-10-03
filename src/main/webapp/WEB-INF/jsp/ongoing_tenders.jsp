<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ongoing Tenders</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
   
</head>
<body>

<header>
    <h1><i class="bi bi-file-earmark-text"></i>Ongoing Tenders</h1>
    <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
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

<div class="container">
    <div class="tender-table">
        <h2>Current Ongoing Tenders</h2>
        <table>
            <tr>
                <th>Tender ID</th>
                <th>Item</th>
                <th>Description</th>
                <th>Deadline</th>
            </tr>
            <tr>
                <td>T1001</td>
                <td>Office Supplies</td>
                <td>Bid for office supplies including paper, pens, and other stationary items.</td>
                <td>2024-10-15</td>
            </tr>
            <tr>
                <td>T1002</td>
                <td>IT Equipment</td>
                <td>Bid for IT equipment such as laptops, printers, and accessories.</td>
                <td>2024-10-20</td>
            </tr>
        </table>
    </div>
</div>
</div>
<footer>
    &copy; 2024 - ProMS All rights reserved
</footer>
<script>
    document.getElementById('toggleSidebarBtn').addEventListener('click', function() {
        var sidebar = document.getElementById('sidebar');
        sidebar.classList.toggle('collapsed');
    });
    </script>


</body>
</html>
