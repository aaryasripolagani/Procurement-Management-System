<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Quotation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
    <style>
	
    </style>
	<script>
	   function setStatus(value) {
	       document.getElementById('status').value = value;
	   }
	   function generateQuotationId() {
	       var randomId = Math.floor(100000 + Math.random() * 900000); // Generates a random 6-digit number
	       document.getElementById('quotationId').value = randomId;
	   }
	   window.onload = function() {
	       generateQuotationId(); // Generate the ID when the page loads
	   };
	   
	</script>
</head>
<body>

      <header class="header">
        <h1>
            <i class="bi bi-file-earmark-text" style="font-size: 1.5rem;"></i> 
            Create Quotation
        </h1>
        <button class="btn" id="toggleSidebarBtn">
            <i class="bi bi-list"></i>
        </button>
        <nav>
            <a href="/main">
                <i class="bi bi-house">Home</i>
            </a>
            <a href="/buyer_dashboard"><i class="bi bi-speedometer2"></i> Dashboard</a>
            <a href="/login">
                <i class="bi bi-box-arrow-right" >Logout</i>
            </a>
            
        </nav>
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
    <div class="content expanded" id="content">
        <h1>Create Quotation</h1>
        <form action="/generate_quotation" method="POST">
            <div class="form-group">
                <label for="buyerId">Buyer Id:</label>
                <!-- Set Buyer ID from session attribute and make it readonly -->
                <input type="text" id="buyerId" name="buyerId" value="${sessionScope.empid}" readonly>
            </div>
            <div class="form-grid">
                <div class="form-group">
                    <label for="quotationId">Quotation No:</label>
                    <!-- Set random 6-digit quotationId and make it readonly -->
                    <input type="text" id="quotationId" name="id.quotationId" readonly>
                </div>
                <div class="form-group">
                    <label for="adminId">Admin Id:</label>
                    <!-- Dropdown for adminId with values 1 and 2 -->
                    <select id="adminId" name="adminId">
                        <option value="1">Admin 1</option>
                        <option value="2">Admin 2</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="currency">Currency:</label>
                    <select id="currency" name="currency">
                        <option value="">Select currency</option>
                        <option value="INR">INR</option>
                        <option value="USD">USD</option>
                        <option value="EUR">EUR</option>
                        <option value="GBP">GBP</option>
                    </select>
                </div>
                <div class="form-group">
                    <label for="quotationStartDate">Quotation Start Date:</label>
                    <input type="date" id="quotationStartDate" name="quotationStartDate">
                </div>
                <div class="form-group">
                    <label for="quotationEndDate">Quotation End Date:</label>
                    <input type="date" id="quotationEndDate" name="quotationEndDate">
                </div>
            </div>

            <div class="form-grid">
                <div class="form-group">
                    <label for="igst">IGST (%):</label>
                    <input type="number" id="igst" name="igst" value="0">
                </div>
                <div class="form-group">
                    <label for="cgst">CGST (%):</label>
                    <input type="number" id="cgst" name="cgst" value="0">
                </div>
                <div class="form-group">
                    <label for="sgst">SGST (%):</label>
                    <input type="number" id="sgst" name="sgst" value="0">
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
                        <td><input type="text" name="itemName"></td>
                        <td><input type="number" name="quantity"></td>
                        <td><input type="number" name="unitPrice"></td>
						<td>
						    <div class="status-buttons">
						        <button type="button" class="button" onclick="setStatus('Pending at admin')" style="background-color:green;">Pending at admin</button>
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