<%-- Document : sider Created on : Sep 22, 2025, 10:05:16 AM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">
        <title>JSP Page</title>
    </head>

    <body>
        <div class="sidebar-main sidebar-menu-one sidebar-expand-md sidebar-color">
            <div class="mobile-sidebar-header d-md-none">
                <div class="header-logo">
                    <a href="${pageContext.request.contextPath}/home">
                        <img src="${pageContext.request.contextPath}/admin/img/logo1.png" alt="logo">
                    </a>
                </div>
            </div>
            <div class="sidebar-menu-content">
                <ul class="nav nav-sidebar-menu sidebar-toggle-view">
                    <li class="nav-item sidebar-nav-item">
                        <a href="${pageContext.request.contextPath}/manager-player?action=list-account" class="nav-link"><i
                                class="flaticon-multiple-users-silhouette"></i><span>List Players</span></a>
                    </li>
                    <li class="nav-item sidebar-nav-item">
                        <a href="${pageContext.request.contextPath}/GamesServlet" class="nav-link"><i
                                class="flaticon-technological"></i><span>History</span></a>
                    </li>
                </ul>
            </div>
        </div>
    </body>

</html>