<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bid Rejected</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ffebee;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        h1 {
            color: #d32f2f;
            font-size: 36px;
            margin-bottom: 10px;
        }
        p {
            color: #666;
            font-size: 18px;
            margin-bottom: 30px;
        }
        .button {
            background-color: #d32f2f;
            color: white;
            padding: 12px 25px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            text-decoration: none;
        }
        .button:hover {
            background-color: #b71c1c;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>Bid Rejected</h1>
    <p>Unfortunately, your bid was rejected.</p>
    <a href="/try-again" class="button">Try Again</a>
</div>

</body>
</html>
