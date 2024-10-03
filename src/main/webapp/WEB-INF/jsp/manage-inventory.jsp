<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Procurement.model.Inventory" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    <style>
        body {
        
        
        
        
        
    </style>
</head>
<body>
<header>
    <h1><i class="bi bi-box"></i> Manage Inventory</h1>
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
        <a href="${pageContext.request.contextPath}/view-quotations"><i class="bi bi-file-earmark-text"></i> Quotations</a>
        <a href="${pageContext.request.contextPath}/approved-quotations"><i class="bi bi-check-circle"></i> Approved Quotations</a>
        <a href="${pageContext.request.contextPath}/rejected-quotations"><i class="bi bi-x-circle"></i> Rejected Quotations</a>
        <a href="${pageContext.request.contextPath}/manage-inventory"><i class="bi bi-box"></i> Manage Inventory</a>
        
    </div>
    <div class="content">     
      <h2>Manage Inventory</h2>
       <div class="invbutton-container">
            <a href="${pageContext.request.contextPath}/manage-inventory/add-item" class="invbutton"><i class="bi bi-plus-circle"></i>Add New Item</a>
            <a href="${pageContext.request.contextPath}/manage-inventory/delete-item" class="invbutton"><i class="bi bi-trash"></i>Delete Item</a>
            <a href="${pageContext.request.contextPath}/manage-inventory/edit-item" class="invbutton"><i class="bi bi-pencil"></i>Update Item Data</a>
        </div>
    

    <div class="table-wrapper">
        <table>
            <thead>
                <tr>
                    <th>Item ID</th>
                    <th>Item Name</th>
                    <th>Description</th>
                    <th>Unit Price</th>
                    <th>Quantity</th>
                    <th>Added Date</th>
                    <th>Comments</th>
                    <th>Category</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Inventory> inventoryList = (List<Inventory>) request.getAttribute("inventoryList");
                    if (inventoryList != null && !inventoryList.isEmpty()) {
                        for (Inventory item : inventoryList) {
                %>
                    <tr>
                        <td><%= item.getItemId() %></td>
                        <td><%= item.getItemName() %></td>
                        <td><%= item.getDescription() %></td>
                        <td><%= item.getUnitPrice() %></td>
                        <td><%= item.getQuantity() %></td>
                        <td><%= item.getItemAddedDate() != null ? dateFormat.format(item.getItemAddedDate()) : "N/A" %></td>
                        <td><%= item.getComments() != null ? item.getComments() : "N/A" %></td>
                        <td><%= item.getCategory() != null ? item.getCategory() : "N/A" %></td>
                    </tr>
                <%
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="8" class="no-items"><img src="inventory.webp" alt="No items available" height="300" width="400"/>
                                <p>No items available</p>
                        </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
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
