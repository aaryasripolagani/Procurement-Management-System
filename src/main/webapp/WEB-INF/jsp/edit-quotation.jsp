<%@ page import="java.net.URLDecoder" %>
<%
    String buyerId = URLDecoder.decode(request.getParameter("buyerId"), "UTF-8");
    String quotationId = URLDecoder.decode(request.getParameter("quotationId"), "UTF-8");
    String adminId = URLDecoder.decode(request.getParameter("adminId"), "UTF-8");
    String currency = URLDecoder.decode(request.getParameter("currency"), "UTF-8");
    String quotationStartDate = URLDecoder.decode(request.getParameter("quotationStartDate"), "UTF-8");
    String quotationEndDate = URLDecoder.decode(request.getParameter("quotationEndDate"), "UTF-8");
    String igst = URLDecoder.decode(request.getParameter("igst"), "UTF-8");
    String cgst = URLDecoder.decode(request.getParameter("cgst"), "UTF-8");
    String sgst = URLDecoder.decode(request.getParameter("sgst"), "UTF-8");
    String itemName = URLDecoder.decode(request.getParameter("itemName"), "UTF-8");
    String quantity = URLDecoder.decode(request.getParameter("quantity"), "UTF-8");
    String unitPrice = URLDecoder.decode(request.getParameter("unitPrice"), "UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>Buyer Quotation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    
    
    <script>
        function setStatus(value) {
            document.getElementById('status').value = value;
        }
    </script>
</head>
<body>
<header>
    <h1><i class="bi bi-pencil"></i> Edit Quotations</h1>
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
        <h2>Buyer Quotation</h2>
        <form action="/view-quotations" method="POST">
            <div class="form-group">
                <label for="buyerId">Buyer Id:</label>
                <input type="text" id="buyerId" name="buyerId" value="<%= buyerId %>" readonly>
            </div>
            <div class="form-grid">
                <div class="form-group">
                    <label for="quotationId">Quotation No:</label>
                    <input type="text" id="quotationId" name="id.quotationId" value="<%= quotationId %>" readonly>
                </div>
                <div class="form-group">
                    <label for="adminId">Admin Id:</label>
                    <input type="text" id="adminId" name="adminId" value="<%= adminId %>" readonly>
                </div>
                <div class="form-group">
                    <label for="currency">Currency:</label>
                    <select id="currency" name="currency">
                        <option value="<%= currency %>" selected><%= currency %></option>
                        <option value="INR">INR</option>
                        <option value="USD">USD</option>
                        <option value="EUR">EUR</option>
                        <option value="GBP">GBP</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="quotationStartDate">Quotation Start Date:</label>
                    <input type="date" id="quotationStartDate" name="quotationStartDate" value="<%= quotationStartDate %>">
                </div>
                <div class="form-group">
                    <label for="quotationEndDate">Quotation End Date:</label>
                    <input type="date" id="quotationEndDate" name="quotationEndDate" value="<%= quotationEndDate %>">
                </div>
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="igst">IGST (%):</label>
                    <input type="number" id="igst" name="igst" value="<%= igst %>">
                </div>
                <div class="form-group">
                    <label for="cgst">CGST (%):</label>
                    <input type="number" id="cgst" name="cgst" value="<%= cgst %>">
                </div>
                <div class="form-group">
                    <label for="sgst">SGST (%):</label>
                    <input type="number" id="sgst" name="sgst" value="<%= sgst %>">
                </div>
            </div>

            <table>
                <thead>
                    <tr>
                        <th>Sl. No.</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Unit Price</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td><input type="text" name="itemName" value="<%= itemName %>"></td>
                        <td><input type="number" name="quantity" value="<%= quantity %>"></td>
                        <td><input type="number" name="unitPrice" value="<%= unitPrice %>"></td>
                        <td>
                            <div class="status-buttons">
                                <button type="button" class="button" onclick="setStatus('Approved by admin')">Approve</button>
                                <button type="button" class="button button-secondary" onclick="setStatus('Rejected by admin')">Reject</button>
                            </div>
                            <input type="hidden" id="status" name="status">
                        </td>
                    </tr>
                </tbody>
            </table>

            <div class="button-container">
                <button type="submit" class="button">Save</button>
            </div>
        </form>
        
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
