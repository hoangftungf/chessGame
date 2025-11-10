<%-- Document : list-account Created on : Sep 22, 2025, 9:48:17 AM Author : Dell --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!doctype html>
            <html class="no-js" lang="">


            <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-student.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:13 GMT -->

            <head>
                <meta charset="utf-8">
                <meta http-equiv="x-ua-compatible" content="ie=edge">
                <title>All Players</title>
                <meta name="description" content="">
                <meta name="viewport" content="width=device-width, initial-scale=1">
                <!-- Favicon -->
                <link rel="shortcut icon" type="image/x-icon"
                    href="${pageContext.request.contextPath}/admin/img/favicon.png">
                <!-- Normalize CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin//css/normalize.css">
                <!-- Main CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/main.css">
                <!-- Bootstrap CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css">
                <!-- Fontawesome CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/all.min.css">
                <!-- Flaticon CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/fonts/flaticon.css">
                <!-- Animate CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/animate.min.css">
                <!-- Data Table CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/jquery.dataTables.min.css">
                <!-- Custom CSS -->
                <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">

                <!--IzizToast-->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/css/iziToast.min.css">
                <script src="https://cdnjs.cloudflare.com/ajax/libs/izitoast/1.4.0/js/iziToast.min.js"></script>
                <!-- Modernize js -->
                <script src="${pageContext.request.contextPath}/admin/js/modernizr-3.6.0.min.js"></script>
            </head>

            <body>
                <!-- Preloader Start Here -->
                <div id="preloader"></div>
                <!-- Preloader End Here -->
                <div id="wrapper" class="wrapper bg-ash">
                    <!-- Header Menu Area Start Here -->
                    <jsp:include page="../common/header.jsp"></jsp:include>
                    <!-- Header Menu Area End Here -->
                    <!-- Page Area Start Here -->
                    <div class="dashboard-page-one">
                        <!-- Sidebar Area Start Here -->
                        <jsp:include page="../common/sider.jsp"></jsp:include>
                        <!-- Sidebar Area End Here -->
                        <div class="dashboard-content-one">
                            <br></br>
                            <!-- PLayers Table Area Start Here -->
                            <div class="card height-auto">
                                <div class="card-body">
                                    <div class="heading-layout1">
                                        <div class="item-title">
                                            <h3>All Players</h3>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table display data-table text-nowrap">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>Display Name</th>
                                                    <th>Rating</th>
                                                    <th>Created At</th>
                                                    <th>Updated At</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="account" items="${listAccount}">
                                                    <tr>
                                                        <td>${account.player_id}</td>
                                                        <td>${account.player_name}</td>
                                                        <td>${account.email}</td>
                                                        <td>${account.display_name}</td>
                                                        <td>${account.rating}</td>
                                                        <td>${account.created_at}</td>
                                                        <td>${account.updated_at}</td>

                                                        <td>
                                                            <div class="dropdown">
                                                                <a href="#" class="dropdown-toggle"
                                                                    data-toggle="dropdown" aria-expanded="false">
                                                                    <span
                                                                        class="flaticon-more-button-of-three-dots"></span>
                                                                </a>
                                                                <div class="dropdown-menu dropdown-menu-right">
                                                                    <a class="dropdown-item"
                                                                        href="${pageContext.request.contextPath}/manager-player?action=account-detail&id=${account.player_id}"><i
                                                                            class="fas fa-eye text-orange-peel"></i>View
                                                                        Detail</a>
                                                                    <a class="dropdown-item" href="javascript:void(0);"
                                                                        onclick="confirmDelete(${account.player_id});"><i
                                                                            class="fas fa-times text-orange-red"></i>Delete</a>
                                                                </div>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Modal Xác Nhận Xóa -->
                                    <div class="modal fade" id="deleteConfirmModal" tabindex="-1" role="dialog"
                                        aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="deleteConfirmModalLabel">Xác nhận xóa
                                                        tài khoản</h5>
                                                    <button type="button" class="close" data-dismiss="modal"
                                                        aria-label="Close">
                                                        <span aria-hidden="true">&times;</span>
                                                    </button>
                                                </div>
                                                <div class="modal-body">
                                                    <p>Bạn có chắc chắn muốn xóa tài khoản này?</p>
                                                    <form id="deleteAccountForm"
                                                        action="${pageContext.request.contextPath}/manager-player?action=account-delete"
                                                        method="post">
                                                        <input type="hidden" id="deleteAccountId" name="id" value="">
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-dismiss="modal">Hủy</button>
                                                    <button type="button" class="btn btn-danger"
                                                        onclick="document.getElementById('deleteAccountForm').submit();">Xóa</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!--Footer-->
                            <jsp:include page="../common/footer.jsp"></jsp:include>
                        </div>
                    </div>
                    <!-- Page Area End Here -->
                </div>
                <!-- jquery-->
                <script src="${pageContext.request.contextPath}/admin/js/jquery-3.3.1.min.js"></script>
                <!-- Plugins js -->
                <script src="${pageContext.request.contextPath}/admin/js/plugins.js"></script>
                <!-- Popper js -->
                <script src="${pageContext.request.contextPath}/admin/js/popper.min.js"></script>
                <!-- Bootstrap js -->
                <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
                <!-- Scroll Up Js -->
                <script src="${pageContext.request.contextPath}/admin/js/jquery.scrollUp.min.js"></script>
                <!-- Data Table Js -->
                <script src="${pageContext.request.contextPath}/admin/js/jquery.dataTables.min.js"></script>
                <!-- Custom Js -->
                <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>

            </body>

            <!--Hiển thị modal delete-->
            <script>
                function confirmDelete(accountId) {
                    document.getElementById('deleteAccountId').value = accountId;
                    $('#deleteConfirmModal').modal('show');
                }
            </script>

            <!--Thông báo delete success-->
            <c:if test="${deleteSuccess == true}">
                <script>
                    document.addEventListener("DOMContentLoaded", () => {
                        iziToast.success({
                            title: "Thông báo",
                            message: "${message}",
                            position: 'topRight',
                            timeout: 5000,
                            backgroundColor: "#d4edda"
                        });
                    });
                </script>
                <% session.removeAttribute("deleteSuccess"); session.removeAttribute("message"); %>
            </c:if>
            <!--Thông báo add success-->
            <!-- <c:if test="${addSuccess == true}">
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                iziToast.success({
                    title: "Thông báo",
                    message: "${message}",
                    position: 'topRight',
                    timeout: 5000,
                });
            });
        </script>
        <%
            session.removeAttribute("addSuccess");
            session.removeAttribute("message");
        %>
    </c:if> -->
            <!--Thông báo add failed-->
            <!-- <c:if test="${addSuccess == false}">
        <script>
            document.addEventListener("DOMContentLoaded", () => {
                iziToast.error({
                    title: "Thông báo",
                    message: "${message}",
                    position: 'topRight',
                    timeout: 5000,
                });
            });
        </script>
        <%
            session.removeAttribute("addSuccess");
            session.removeAttribute("message");
        %>
    </c:if> -->

            <script>
                function handleSortChange() {
                    // Lấy phần tử select
                    const select = document.getElementById("sortSelect");
                    const value = select.value;

                    // Xác định URL servlet tương ứng
                    let url = "";
                    if (value === "asc") {
                        url = "manager-player?action=sortByAsc";
                    } else if (value === "desc") {
                        url = "manager-player?action=sortByDesc";
                    } else {
                        return; // Không chọn gì thì thoát
                    }

                    // Gửi request tới servlet (chuyển trang)
                    window.location.href = url;
                }
            </script>

            <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/all-student.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:13 GMT -->

            </html>