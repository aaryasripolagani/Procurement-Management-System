<%@ page import="java.net.URLDecoder" %>
<%
    String buyerId = URLDecoder.decode(request.getParameter("buyerId"), "UTF-8");
    String quotationId = URLDecoder.decode(request.getParameter("quotationId"), "UTF-8");
	String vendorId = URLDecoder.decode(request.getParameter("vendorId"), "UTF-8");
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
    <title>Bid application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    <style>
       
       .content {
            flex: 1;
            padding: 20px;
            background-color: #e6e6fa;
            overflow-y: auto;
            display: flex;
            justify-content: center; /* Center the content horizontally */
            align-items: center; /* Center the content vertically */
            flex-direction: column; /* Stack children vertically */
        }
        .button {
    padding: 10px 15px;
    background-color: #800080;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 16px;
    transition: background-color 0.3s ease;
}

.button:hover {
    background-color: #b300b3;
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
        function setStatus(value) {
            document.getElementById('status').value = value;
        }
    </script>
</head>
<body>
 <header>
     <h1>
    <i class="bi bi-file-earmark-text" style="font-size: 1.5rem; color: white;"></i> 
            Apply Bids
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
        <h1>Bid Application</h1>
        <form action="/Apply-bid" method="POST">
            <div class="form-group">
                <label for="buyerId">Buyer Id:</label>
                <input type="text" id="buyerId" name="buyerId" value="<%= buyerId %>" readonly>
            </div>
			<div class="form-group">
			    <label for="vendorId">Vendor Id:</label>
			    <input type="text" id="vendorId" name="id.vendorId" value="<%= vendorId %>" readonly>
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
                                <button type="button" class="button" onclick="setStatus('Applied')" style="background-color: green;">Apply</button>
                                <button type="button" class="button button-secondary" onclick="setStatus('Canceled')">Cancel</button>
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
       <footer>
    &copy; 2024 Quotation & Bidding System
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
