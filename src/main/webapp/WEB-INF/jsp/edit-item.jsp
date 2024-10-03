<%@ page import="java.util.List" %>
<%@ page import="com.example.Procurement.model.Inventory" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Item</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
</head>
<body>

<header>
        <h1><i class="bi bi-pencil"></i>Update An Item</h1>
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
			
<h2>Edit Item</h2>

<form action="/manage-inventory/edit-item-form" method="get"> <!-- Correct action URL if necessary -->
    <label for="itemId">Select Item:</label>
    <select id="itemId" name="itemId" required>
        <%
            // Fetch the inventoryList from the request scope
            List<Inventory> inventoryList = (List<Inventory>) request.getAttribute("inventoryList");
            if (inventoryList != null) {
                for (Inventory item : inventoryList) {
        %>
            <!-- Populate the dropdown with items from the list -->
            <option value="<%= item.getItemId() %>"><%= item.getItemName() %></option>
        <%
                }
            } else {
        %>
            <!-- If the list is empty, show a message -->
            <option value="">No items available</option>
        <%
            }
        %>
    </select><br>
    <button type="submit">Edit Item</button>
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
