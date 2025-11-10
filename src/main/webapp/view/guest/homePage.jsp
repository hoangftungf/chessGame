<%@ taglib prefix="c" uri="http://www.springframework.org/tags/form" %>
    <%-- Created by IntelliJ IDEA. User: vankh Date: 9/21/2025 Time: 3:49 PM To change this template use File | Settings
        | File Templates. --%>
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
                <link rel="stylesheet"
                    href="${pageContext.request.contextPath}/guest/assets/css/jquery.fancybox.min.css">

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
                <!-- Thêm CSS để thu nhỏ banner và căn giữa -->
                <style>
                    /* Đặt nền trang thành màu xanh pastel */
                    body {
                        background-color: #A8E6CF; /* pastel green */
                        margin: 0;
                        min-height: 100vh;
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        text-align: center;
                        font-family: "Helvetica Neue", Arial, sans-serif;
                    }

                    .home-wrapper {
                        width: min(960px, 100%);
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 32px;
                        padding: 32px 16px 48px;
                    }

                    .hero-style1 .hero-img {
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        padding: 40px 0;
                    }
                    .hero-style1 .hero-img img.device-width {
                        width: min(480px, 80vw);
                        height: auto;
                        object-fit: cover;
                        object-position: center;
                        display: block;
                    }
                    .hero-style1 .hero-content {
                        text-align: center;     /* căn giữa nội dung */
                        margin-top: 16px;
                    }

                    /* CTA buttons dưới banner */
                    .cta-buttons {
                        display: flex;
                        flex-direction: column;
                        align-items: center;
                        gap: 16px;
                        margin: 24px 0 48px;
                        width: 100%;
                    }
                    .btn-cta {
                        background-color: #F77204; /* orange */
                        color: #fff;               /* white text */
                        padding: 10px 18px;
                        border-radius: 8px;
                        text-decoration: none;
                        font-weight: 600;
                        width: min(320px, 80%);
                    }
                    .btn-cta:hover {
                        background-color: #e36300;
                        color: #fff;
                    }
                </style>
            </head>

            <body>
                <!-- ========== header start============= -->
                <jsp:include page="./common/header.jsp"></jsp:include>
                <!-- ========== header end============= -->
                <main class="home-wrapper">
                    <!-- ========== Hero start============= -->
                    <section class="hero-style1">
                        <div class="hero-img">
                            <img class="device-width"
                                 src="${pageContext.request.contextPath}/guest/assets/images/banner.jpg" alt="">
                        </div>
                    </section>
                    <!-- Thêm cụm nút dưới banner -->
                    <div class="cta-buttons">
                        <a href="${pageContext.request.contextPath}/manager-player?action=list-account" class="btn-cta">
                            Xem danh sách người chơi
                        </a>
                        <a href="${pageContext.request.contextPath}/GamesServlet" class="btn-cta">
                            Xem lịch sử đấu
                        </a>
                    </div>
                    <!-- ========== Hero end============= -->
                </main>

                <!-- js file link -->
                <script data-cfasync="false"
                    src="../../../cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
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
