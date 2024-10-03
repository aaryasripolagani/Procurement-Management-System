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
    <title>Bids Eligible to Vendor</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    <style>
        
        
    </style>
</head>
<body>
    <header>
     <h1>
    <i class="bi bi-file-earmark-check" style="font-size: 1.5rem; color: white;"></i> 
            Applied Bids
        </h1>
    <nav>
    <a href="/main"><i class="bi bi-house"></i> Home</a>
    <a href="/vendor_dashboard"><i class="bi bi-truck"></i> Dashboard</a>
    <a href="/main"><i class="bi bi-box-arrow-right"></i> Logout</a>
</nav>
    <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
</header>

    <div class="main-container">
        <div class="sidebar" id="sidebar">
    <a href="/Apply-bid" class="nav-link active" >
    <i class="bi bi-file-earmark-text"></i> Apply Bids</a>
    <a href="/Applied-bids" class="nav-link"><i class="bi bi-file-earmark-check"></i> Applied Bids</a>
    <a href="#" class="nav-link"><i class="bi bi-truck"></i> Track Orders</a>
    <a href="#" class="nav-link"><i class="bi bi-file-earmark-arrow-up"></i> Submit Invoice</a>
</div>
<div class="content">
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
                            if ("applied".equalsIgnoreCase(quotation.getStatus())) { // Only show approved quotations
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
									<a class="btn" href="${pageContext.request.contextPath}/bid-application?quotationId=<%= quotation.getId().getQuotationId() %>&buyerId=<%= quotation.getBuyerId() %>&vendorId=<%= quotation.getId().getVendorId()%>&adminId=<%= quotation.getAdminId() %>&currency=<%= quotation.getCurrency() %>&quotationStartDate=<%= dateFormat.format(quotation.getQuotationStartDate()) %>&quotationEndDate=<%= dateFormat.format(quotation.getQuotationEndDate()) %>&igst=<%= quotation.getIgst() %>&cgst=<%= quotation.getCgst() %>&sgst=<%= quotation.getSgst() %>&itemName=<%= quotation.getItemName() %>&quantity=<%= quotation.getQuantity() %>&unitPrice=<%= quotation.getUnitPrice() %>">EDIT</a>

						</td>
                    </tr>
                <%
                            }
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="13" class="no-items">No bids available</td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
</div>
       
    </div>

       <footer>
    &copy; 2024-ProMS All rights reserved
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
