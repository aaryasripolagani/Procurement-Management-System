<%@ page import="java.util.List" %>
<%@ page import="com.example.Procurement.model.BuyerQuotation" %>
<%@ page import="com.example.Procurement.model.QuotationHelper" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Quotation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    <style>
    
         
        
        </style>
</head>
<body>
<header>
     <h1>
    <i class="bi bi-coins" style="font-size: 1.5rem; color: white;"></i> 
            View Bids
        </h1>
    <nav>
    <a href="/main"><i class="bi bi-house"></i> Home</a>
    <a href="/buyer_dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
    <a href="/main"><i class="bi bi-box-arrow-right"></i> Logout</a>
</nav>
    <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
</header>
<div class="main-container">
<div class="sidebar" id="sidebar" >
		
        <a href="/generate_quotation" class="nav-link active">
            <i class="bi bi-file-earmark-text"></i> Create Quotation
        </a>
        <a href="/buyer-quotation-bids" class="nav-link">
            <i class="bi bi-coin"></i> View Bids
        </a>
        <a href="/buyer-approved-quotation-bids" class="nav-link">
            <i class="bi bi-check-circle"></i> Approved Bids
        </a>
        <a href="#" class="nav-link">
            <i class="bi bi-truck"></i> Track Orders
        </a>
        <a href="#" class="nav-link">
            <i class="bi bi-people"></i> Evaluate Vendors
        </a>
        
</div>
<div class="invbutton-container">
    <div class="content">
<h2>Select Quotation to View Bids</h2>
<form action="edit-buyer-quotation-bids" method="get"> <!-- Update action URL if necessary -->
    <label for="quotationId">Select Quotation:</label>
    <select id="quotationId" name="quotationId" required>
        <%
            // Fetch the buyerQuotationList from the request scope
            List<BuyerQuotation> buyerQuotationList = (List<BuyerQuotation>) request.getAttribute("quotations");
            if (buyerQuotationList != null) {
                for (BuyerQuotation quotation : buyerQuotationList) {
        %>
            
            <option value="<%= quotation.getId().getQuotationId() %>"><%= quotation.getItemName() %> - <%= quotation.getId().getQuotationId() %></option>
        <%
                }
            } else {
        %>
            <!-- If the list is empty, show a message -->
            <option value="">No quotations available</option>
        <%
            }
        %>
    </select><br>
    <button type="submit">Show Bids</button>
</form>
</div>
</div>
</div>

<footer>
    &copy; 2024 ProMS- All Rights Reserved
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
