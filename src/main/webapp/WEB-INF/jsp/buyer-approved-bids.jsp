<!DOCTYPE html>
<html lang="en">
<%@ page isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.Procurement.controller.BuyerQuotationController" %> 
<%@ page import="com.example.Procurement.model.BuyerQuotation" %>
<%@ page import="com.example.Procurement.model.QuotationHelper" %>
<%
    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd"); // Adjust the format as needed
%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bids for Quotation</title>
   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    
    <script>
        function setStatus(value, quotationId, vendorId) {
            document.getElementById('status').value = value;
            document.getElementById('quotationId').value = quotationId;
            document.getElementById('vendorId').value = vendorId;
        }
    </script>
</head>
<body>
    <header>
     <h1>
    <i class="bi bi-check-circle" style="font-size: 1.5rem; color: white;"></i> 
            Approved Bids
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
    <div class="sidebar" id="sidebar">
		
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
    <div class="content">
     <form action="/buyer-approved-bids" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Quotation ID</th>
                        <th>Buyer ID</th>
                        <th>Vendor ID</th>
                        <th>Item</th>
                        <th>Status</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>IGST</th>
                        <th>CGST</th>
                        <th>SGST</th>
                        <th>Start Date</th>
                        <th>Close Date</th>
                        <th>Estimated Bid Price</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<BuyerQuotation> quotations = (List<BuyerQuotation>) request.getAttribute("quotations");
                        if (quotations != null && !quotations.isEmpty()) {
                            for (BuyerQuotation quotation : quotations) {
                    %>
                        <tr>
                            <td><%= quotation.getId().getQuotationId() %></td>
                            <td><%=quotation.getBuyerId()%></td>
                            <td><%= quotation.getId().getVendorId() %></td>
                            <td><%= quotation.getItemName() %></td>
                            <td><%= quotation.getStatus() %></td>
                            <td><%= quotation.getQuantity() %></td>
                            <td><%= quotation.getUnitPrice() %></td>
                            <td><%= quotation.getIgst() %></td>
                            <td><%= quotation.getCgst() %></td>
                            <td><%= quotation.getSgst() %></td>
                            <td><%= quotation.getQuotationStartDate() != null ? dateFormat.format(quotation.getQuotationStartDate()) : "N/A" %></td>
                            <td><%= quotation.getQuotationEndDate() != null ? dateFormat.format(quotation.getQuotationEndDate()) : "N/A" %></td>
                            <td><%= quotation.getTotalPrice() %></td>
                            <td>
                                <div class="status-buttons">
                                    <button type="button" class="button" onclick="setStatus('Final Acknowledgement', '<%= quotation.getId().getQuotationId() %>', '<%= quotation.getId().getVendorId() %>')">Finak Acknowledgement</button>
                                    <button type="button" class="button button-secondary" onclick="setStatus('MIR', '<%= quotation.getId().getQuotationId() %>', '<%= quotation.getId().getVendorId() %>')">Generate MIR</button>
                                </div>
                                <input type="hidden" id="status" name="status">
                                <input type="hidden" id="quotationId" name="quotationId">
                                <input type="hidden" id="vendorId" name="vendorId">
                            </td>
                        </tr>
                    <%
                            }
                        } else {
                    %>
                        <tr>
                            <td colspan="14" class="no-items">You haven't approved any bids</td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="button-container">
                <button type="submit" class="button">Save</button>
            </div>
        </form>
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
