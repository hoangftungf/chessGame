<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chess Game</title>
    <style>
        .header-area {
            padding: 24px 0;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
        }
        .header-title {
            font-size: 32px;
            font-weight: bold;
            color: #F77204;
            margin: 0;
        }
        .header-area .container {
            max-width: 720px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 16px;
        }
        .auth-buttons {
            display: flex;
            flex-direction: column;
            gap: 12px;
            width: 100%;
            max-width: 320px;
        }
        .auth-buttons .btn-auth {
            background-color: #F77204; /* orange */
            color: #fff;               /* white text */
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
            text-align: center;
        }
        .auth-buttons .btn-auth:hover {
            background-color: #e36300; /* slightly darker on hover */
            color: #fff;
        }
    </style>
</head>
<body>
    <header class="header-area style-1">
        <div class="container">
            <h1 class="header-title">Chess Game</h1>
        </div>
    </header>
</body>
</html>
