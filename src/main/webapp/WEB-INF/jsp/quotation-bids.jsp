<%@ page import="java.util.List" %>
<%@ page import="com.example.Procurement.model.BuyerQuotation" %>
<%@ page import="com.example.Procurement.model.QuotationHelper" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Select Quotation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
</head>
<body>
<header>
        <h1><i class="bi bi-pencil"></i>Edit Quotation bid</h1>
        <nav>
            <a href="${pageContext.request.contextPath}/main"><i class="bi bi-house"></i> Home</a>
            <a href="${pageContext.request.contextPath}/vendor_dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a href="${pageContext.request.contextPath}/main"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </nav>
        <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
    </header>
    <div class="main-container">
    <div class="sidebar" id="sidebar">
		
        <a href="/Apply-bid" class="nav-link active">
            <i class="bi bi-file-earmark-text"></i> Apply Bid
        </a>
        <a href="/Applied-bids" class="nav-link">
            <i class="bi bi-coin"></i> Applied Bids
        </a>
        <a href="#" class="nav-link">
           <i class="bi bi-file-earmark-arrow-up"></i> Submit Invoice
        </a>
        <a href="#" class="nav-link">
            <i class="bi bi-truck"></i> Track Vendors
        </a>
        
        
    </div>
    <div class="invbutton-container">
    <div class="content">
<h2>Select Quotation</h2>

<form action="edit-quotation-bids" method="get"> <!-- Update action URL if necessary -->
    <label for="quotationId">Select Quotation:</label>
    <select id="quotationId" name="quotationId" required>
        <%
            // Fetch the buyerQuotationList from the request scope
            List<BuyerQuotation> buyerQuotationList = (List<BuyerQuotation>) request.getAttribute("quotations");
            if (buyerQuotationList != null) {
                for (BuyerQuotation quotation : buyerQuotationList) {
        %>
            <!-- Populate the dropdown with quotations using quotationId and itemName -->
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
</body>
</html>