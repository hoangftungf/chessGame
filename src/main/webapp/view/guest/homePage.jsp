
<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
<%--
Created by IntelliJ IDEA.
User: vankh
Date: 9/21/2025
Time: 3:49 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ChessGame</title>
        <!-- css file link -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/all.css">

        <!-- bootstrap 5 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap.min.css">

        <!-- box-icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/boxicons.min.css">

        <!-- bootstrap icon -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/bootstrap-icons.css">

        <!-- jquery ui -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/jquery-ui.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/jquery.fancybox.min.css">

        <!-- swiper-slide -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/swiper-bundle.min.css">

        <!-- slick-slide -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/slick-theme.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/slick.css">

        <!-- select 2 -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/nice-select.css">

        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/magnific-popup.css">

        <!-- odometer css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/odometer.css">

        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/guest/assets/css/style.css">
    </head>

    <body>
        <!-- start preloader area -->
        <div class="egns-preloader">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-6">
                        <div class="circle-border">
                            <div class="moving-circle"></div>
                            <div class="moving-circle"></div>
                            <div class="moving-circle"></div>
                            <svg width="180px" height="150px" viewBox="0 0 187.3 93.7" preserveAspectRatio="xMidYMid meet"
                                 style="left: 50%; top: 50%; position: absolute; transform: translate(-50%, -50%) matrix(1, 0, 0, 1, 0, 0);">
                            <path stroke="#D90A2C" id="outline" fill="none" stroke-width="4" stroke-linecap="round"
                                  stroke-linejoin="round" stroke-miterlimit="10"
                                  d="M93.9,46.4c9.3,9.5,13.8,17.9,23.5,17.9s17.5-7.8,17.5-17.5s-7.8-17.6-17.5-17.5c-9.7,0.1-13.3,7.2-22.1,17.1 c-8.9,8.8-15.7,17.9-25.4,17.9s-17.5-7.8-17.5-17.5s7.8-17.5,17.5-17.5S86.2,38.6,93.9,46.4z" />
                            <path id="outline-bg" opacity="0.05" fill="none" stroke="#959595" stroke-width="4"
                                  stroke-linecap="round" stroke-linejoin="round" stroke-miterlimit="10"
                                  d="M93.9,46.4c9.3,9.5,13.8,17.9,23.5,17.9s17.5-7.8,17.5-17.5s-7.8-17.6-17.5-17.5c-9.7,0.1-13.3,7.2-22.1,17.1 c-8.9,8.8-15.7,17.9-25.4,17.9s-17.5-7.8-17.5-17.5s7.8-17.5,17.5-17.5S86.2,38.6,93.9,46.4z" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End preloader area  -->

        <!-- ========== header start============= -->
        <jsp:include page="./common/header.jsp"></jsp:include>
            <!-- ========== header end============= -->
            <!-- ========== Hero start============= -->
            <div class="hero-style1">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-12 px-0">
                            <div class="hero-img">
                                <img class="device-width" src="${pageContext.request.contextPath}/guest/assets/images/banner.jpg" alt="" 
                                     style="width: 100%; height: 100vh; object-fit: cover; object-position: center;">
                            </div>
                            <div class="hero-content">
                                <h1 style="color: white; font-weight: 800; text-shadow: 2px 2px 4px rgba(0,0,0,0.5)">Chess Online</h1>
                                <p style="color: white; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.5)">Play chess with players worldwide</p>
                            </div>
                            <div class="scroll-dowm">
                                <a href="#about-area"><img src="${pageContext.request.contextPath}/guest/assets/images/icons/scroll-down.svg" alt=""></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ========== Hero end============= -->
        <!-- ========== Home1 About start============= -->
        <div class="home-one-about pt-120 pb-120" id="about-area">
            <img class="about-vector" src="${pageContext.request.contextPath}/guest/assets/images/bg/h1-about-bg.png" alt="">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="about-content">
                            <div class="section-title1">
                                <h2>Welcome to Chess Online</h2>
                                <h3>Experience Chess Like Never Before</h3>
                            </div>
                            <div class="features-list">
                                <ul>
                                    <li><i class='bx bx-check-circle'></i> Play against players worldwide</li>
                                    <li><i class='bx bx-check-circle'></i> Multiple difficulty levels against AI</li>
                                    <li><i class='bx bx-check-circle'></i> Track your progress with ELO rating</li>
                                    <li><i class='bx bx-check-circle'></i> Learn from your game history</li>
                                    <li><i class='bx bx-check-circle'></i> Join tournaments and competitions</li>
                                </ul>
                            </div>
                            <div class="about-btn">
                                <a href="login" class="primary-btn1">Start Playing Now</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-img">
                            <img class="img-fluid" src="${pageContext.request.contextPath}/guest/assets/images/chess-pieces.png" alt="Chess Pieces">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Footer-->
    <jsp:include page="./common/footer.jsp"></jsp:include>

        <!-- js file link -->
        <script data-cfasync="false" src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
        <script src="${pageContext.request.contextPath}/guest/assets/js/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery-ui.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/swiper-bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/slick.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery.nice-select.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/odometer.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery.fancybox.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/isotope.pkgd.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/viewport.jquery.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/jquery.magnific-popup.min.js"></script>
    <script src="${pageContext.request.contextPath}/guest/assets/js/main.js"></script>


</body>


<!-- Mirrored from demo.egenslab.com/html/hotelina/preview/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Sun, 21 Sep 2025 06:39:58 GMT -->

</html>