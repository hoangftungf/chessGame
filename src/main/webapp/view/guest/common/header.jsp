<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Chess Game</title>
    <style>
        .header-area {
            padding: 20px 0;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            text-align: center;
        }
        .header-title {
            font-size: 32px;
            font-weight: bold;
            color: #F77204;
            margin: 0; /* keep title vertically centered in flex row */
        }
        /* NEW: align title and buttons on the same row */
        .header-area .container {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .auth-buttons {
            display: flex;
            gap: 12px;
        }
        .auth-buttons .btn-auth {
            background-color: #F77204; /* orange */
            color: #fff;               /* white text */
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            font-weight: 600;
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
            <div class="auth-buttons">
              <a href="${pageContext.request.contextPath}/login" class="btn-auth">Đăng nhập</a>
              <a href="${pageContext.request.contextPath}/register" class="btn-auth">Đăng ký</a>
            </div>
        </div>
    </header>
</body>
</html>