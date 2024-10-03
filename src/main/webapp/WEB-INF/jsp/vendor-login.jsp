<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="design.css">
    <title>Login - ProMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/design.css">
</head>
<body>
<header>
    <h1><i class="bi bi-truck"></i>Vendor Login</h1>
    <nav>
        <a href="/main"><i class="bi bi-house"></i> Home</a>
    </nav>
</header>

<div class="logincontainer">
    <div class="login-container">
        <h2>Login to Your Account</h2>
        <img src="login.png" alt="Login" class="login-image">
		<form action="/vendor-login" method="post">
		    <label for="username">Username:</label>
		    <input type="text" id="username" name="username" required>
		    <label for="password">Password:</label>
		    <input type="password" id="password" name="password" required>
		    <button type="submit">Login</button>
		</form>
        
        <p style="color:red">${error}</p> <!-- Display error message -->
    </div>
</div>

<footer>
    &copy; 2024 ProMS- All Rights Reserved
</footer>

</body>
</html>
