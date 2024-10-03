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
    <style>
        /* Your existing styles */
        .header, .footer {
            background-color: #2d3e50;
            color: white;
            text-align: center;
            padding: 20px;
        }

        nav {
            background-color: #34495e;
            padding: 10px;
        }

        nav a {
            color: white;
            margin: 0 15px;
            text-decoration: none;
            font-weight: bold;
        }

        nav a:hover {
            color: #1abc9c;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        table, th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #2d3e50;
            color: white;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
        }
        .button {
            padding: 10px 15px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .button:hover {
            background-color: #0056b3;
        }
        .button-secondary {
            background-color: #dc3545;
        }
        .button-secondary:hover {
            background-color: #c82333;
        }
        .status-buttons {
            display: flex;
            gap: 10px;
        }
    </style>
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
    <h1><i class="bi bi-coins"></i> Bids for Quotations</h1>
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
        <form action="/quotation-bids" method="post">
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
                                    <button type="button" class="button" onclick="setStatus('Admin Verified', '<%= quotation.getId().getQuotationId() %>', '<%= quotation.getId().getVendorId() %>')">Approve</button>
                                    <button type="button" class="button button-secondary" onclick="setStatus('Admin Rejected', '<%= quotation.getId().getQuotationId() %>', '<%= quotation.getId().getVendorId() %>')">Reject</button>
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
                            <td colspan="14" class="no-items">No bids available for this quotation</td>
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
