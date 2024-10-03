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
    <title>Approved Quotations</title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    
    
    
</head>
<body>
    <header class="header">
        <h1><i class="bi bi-check-circle"></i> Approved Quotations</h1>
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
        <!-- Display the approved quotations in a table -->
        <div class="content">
        <table>
            <thead>
                <tr>
                    <th>Quotation ID</th>
                    <th>Buyer ID</th>
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
                            if ("approved by admin".equalsIgnoreCase(quotation.getStatus())) { // Only show approved quotations
                %>
                    <tr>
                        <td><%= quotation.getId().getQuotationId() %></td>
                        <td><%=quotation.getBuyerId()%></td>
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
									<a class="btn" href="${pageContext.request.contextPath}/send-quotation-to-vendors?quotationId=<%= quotation.getId().getQuotationId() %>&buyerId=<%= quotation.getBuyerId() %>&adminId=<%= quotation.getAdminId() %>&currency=<%= quotation.getCurrency() %>&quotationStartDate=<%= dateFormat.format(quotation.getQuotationStartDate()) %>&quotationEndDate=<%= dateFormat.format(quotation.getQuotationEndDate()) %>&igst=<%= quotation.getIgst() %>&cgst=<%= quotation.getCgst() %>&sgst=<%= quotation.getSgst() %>&itemName=<%= quotation.getItemName() %>&quantity=<%= quotation.getQuantity() %>&unitPrice=<%= quotation.getUnitPrice() %>">SEND</a>

						</td>
                    </tr>
                <%
                            }
                        }
                    } else {
                %>
                    <tr>
                        <td colspan="13" class="no-items"><img src="inventory.webp" alt="No Quotations available" height="300" width="400" />
                                <p>No Approved Quotations available</p></td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
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
