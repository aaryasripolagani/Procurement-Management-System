<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
</head>
<body>
<header>
        <h1><i class="bi bi-plus-circle"></i>Add New Item</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/main"><i class="bi bi-house"></i> Home</a>
            <a href="${pageContext.request.contextPath}/admin_dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/main"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </nav>
        <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
    </header>
    <div class="main-container">
    <div id="sidebar" class="sidebar">
            <a href="/view-quotations" class="nav-link"><i class="bi bi-file-earmark-text"></i>Quotations</a>
            <a href="/approved-quotations" class="nav-link"><i class="bi bi-check-circle"></i>Approved Quotations</a>
            <a href="/rejected-quotations" class="nav-link"><i class="bi bi-x-circle"></i>Rejected Quotations</a>
            <a href="/manage-inventory" class="nav-link"><i class="bi bi-box-seam"></i>Manage Inventory</a>
                    </div>
      <div class="invbutton-container">
      <a href="${pageContext.request.contextPath}/manage-inventory" class="invbutton"><i class="bi bi-arrow-left-square"></i>  Go Back and Check Inventory</a>
        <div class="content">
			<h2>Add New Item</h2>

<form action="/manage-inventory/add-item" method="post">
    <label for="itemName">Item Name:</label>
    <input type="text" id="itemName" name="itemName" required><br>

    <label for="description">Description:</label>
    <input type="text" id="description" name="description" required><br>

    <label for="quantity">Quantity:</label>
    <input type="number" id="quantity" name="quantity" required><br>

    <label for="unitPrice">Unit Price:</label>
    <input type="number" step="0.01" id="unitPrice" name="unitPrice" required><br>

    <!-- New fields for added date, comment, and category -->

    <label for="itemAddedDate">Item Added Date:</label>
    <input type="date" id="itemAddedDate" name="itemAddedDate" required><br>

    <label for="comments">Comments:</label>
    <input id="comments" name="comments" required><br>

    <label for="category">Category:</label>
    <input type="text" id="category" name="category" required><br>

    <button type="submit">Add Item</button>
</form>
</div>
</div>
</div>
<footer class="footer">
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
