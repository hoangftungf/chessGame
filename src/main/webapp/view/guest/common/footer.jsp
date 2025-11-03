<%-- 
    Document   : footer
    Created on : Sep 24, 2025, 4:04:42 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <footer>
            <div class="container">
                <div class="footer-top">
                    <div class="row g-4 justify-content-start">
                        <div class="col-lg-4 order-lg-0 order-2">
                            <div class="footer-items footer-about">
                                <h4>Chess Online</h4>
                                <p>Join our global chess community and experience the thrill of online chess. 
                                   Whether you're a beginner or a grandmaster, our platform offers exciting matches, 
                                   AI opponents, and a comprehensive rating system to track your progress.</p>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="footer-items social-area">
                                <span class="dot1"></span>
                                <span class="dot2"></span>
                                <div class="footer-logo text-center">
                                    <img src="${pageContext.request.contextPath}/guest/assets/images/chess-logo.png" alt="Chess Logo">
                                    <p>Chess Online</p>
                                    <span>Play Anywhere, Anytime</span>
                                </div>
                                <div class="footer-social">
                                    <ul class="social-link d-flex align-items-center justify-content-center">
                                        <li><a href="https://www.facebook.com/"><i class='bx bxl-facebook'></i></a></li>
                                        <li><a href="https://twitter.com/"><i class='bx bxl-twitter'></i></a></li>
                                        <li><a href="https://www.youtube.com/"><i class='bx bxl-youtube'></i></a></li>
                                        <li><a href="https://www.discord.com/"><i class='bx bxl-discord'></i></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 d-flex justify-content-sm-end justify-content-center">
                            <div class="footer-items contact">
                                <h4>Contact Us</h4>
                                <div class="hotline mb-30">
                                    <div class="hotline-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-phone.svg" alt="">
                                    </div>
                                    <div class="hotline-info">
                                        <h6 class="mb-10"><a href="#">Support Hotline</a></h6>
                                        <h6><a href="tel:+1234567890">+1 (234) 567-890</a></h6>
                                    </div>
                                </div>
                                <div class="email mb-30">
                                    <div class="email-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-envlop.svg" alt="">
                                    </div>
                                    <div class="email-info">
                                        <h6 class="mb-10"><a>Support Email</a></h6>
                                        <h6><a href="mailto:support@chessonline.com">support@chessonline.com</a></h6>
                                    </div>
                                </div>
                                <div class="email">
                                    <div class="email-icon">
                                        <img src="${pageContext.request.contextPath}/guest/assets/images/icons/f-location.svg" alt="">
                                    </div>
                                    <div class="email-info">
                                        <h6 class="mb-10"><a>Headquarters</a></h6>
                                        <h6><a>Chess Online, Innovation Building</a></h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>
