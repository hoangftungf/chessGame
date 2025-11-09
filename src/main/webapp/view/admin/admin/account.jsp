<%@page contentType="text/html" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!doctype html>
    <html class="no-js" lang="">


    <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:18 GMT -->

    <head>
      <meta charset="utf-8">
      <meta http-equiv="x-ua-compatible" content="ie=edge">
      <title>Player Details</title>
      <meta name="description" content="">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- Favicon -->
      <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/admin/img/favicon.png">
      <!-- Normalize CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/normalize.css">
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
      <!-- Custom CSS -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/style.css">
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
            <!-- Student Table Area Start Here -->
            <div class="card height-auto">
              <div class="card-body">
                <div class="heading-layout1">
                  <div class="item-title">
                    <h3>About Me</h3>
                  </div>
                </div>
                <div class="single-info-details">
                  <div class="item-img">
                    <img src="${pageContext.request.contextPath}/admin/img/figure/teacher.jpg" alt="teacher">
                  </div>
                  <div class="item-content">
                    <!--Header Infomation-->
                    <div class="header-inline item-header">
                      <h3 class="text-dark-medium font-medium">${account.display_name}</h3>
                    </div>
                    <!--Header Information-->

                    <!--Information-->
                    <div class="info-table table-responsive">
                      <table class="table text-nowrap">
                        <tbody>
                          <tr>
                            <td>Display Name:</td>
                            <td class="font-medium text-dark-medium">${account.display_name}</td>
                          </tr>
                          <tr>
                            <td>Player Name:</td>
                            <td class="font-medium text-dark-medium">${account.player_name}</td>
                          </tr>
                          <tr>
                            <td>Email:</td>
                            <td class="font-medium text-dark-medium">${account.email}</td>
                          </tr>
                          <tr>
                            <td>Rating:</td>
                            <td class="font-medium text-dark-medium">${account.rating}</td>
                          </tr>
                          <tr>
                            <td>Status:</td>
                            <td class="font-medium text-dark-medium">
                              <c:choose>
                                <c:when test="${account.status == 'online'}">
                                  <span style="color: white; padding: 5px 10px; background-color: #9FD702; font-weight: 500; border-radius: 10px;">Online</span>
                                </c:when>
                                <c:when test="${account.status == 'offline'}">
                                  <span style="color: white; padding: 5px 10px; background-color: #DE3202; font-weight: 500; border-radius: 10px;">Offline</span>
                                </c:when>
                                <c:otherwise>
                                  <span style="color: white; padding: 5px 10px; background-color: #F2EC4E; font-weight: 500; border-radius: 10px;">In Game</span>
                                </c:otherwise>
                              </c:choose>
                            </td>
                          </tr>
                          <tr>
                            <td>Created At:</td>
                            <td class="font-medium text-dark-medium">${account.created_at}</td>
                          </tr>
                          <tr>
                            <td>Updated At:</td>
                            <td class="font-medium text-dark-medium">${account.updated_at}</td>
                          </tr>
                        </tbody>
                      </table>
                    </div>

                    <!-- Modal Update -->
                    <div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="updateModalLabel">Update Player Information</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/manager-account?action=account-update" method="post">
                              <input type="hidden" name="player_id" value="${account.player_id}">

                              <div class="row">
                                <div class="col-md-6 form-group">
                                  <label for="playerName">Player Name:</label>
                                  <input type="text" class="form-control" id="playerName" name="playerName" value="${account.player_name}">
                                </div>

                                <div class="col-md-6 form-group">
                                  <label for="displayName">Display Name:</label>
                                  <input type="text" class="form-control" id="displayName" name="displayName" value="${account.display_name}">
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-6 form-group">
                                  <label for="email">Email:</label>
                                  <input type="email" class="form-control" id="email" name="email" value="${account.email}">
                                </div>

                                <div class="col-md-6 form-group">
                                  <label for="rating">Rating:</label>
                                  <input type="number" class="form-control" id="rating" name="rating" value="${account.rating}">
                                </div>
                              </div>

                              <div class="row">
                                <div class="col-md-6 form-group">
                                  <label for="status">Status:</label>
                                  <select class="form-control" id="status" name="status">
                                    <option value="online" ${account.status == 'online' ? 'selected' : ''}>Online</option>
                                    <option value="offline" ${account.status == 'offline' ? 'selected' : ''}>Offline</option>
                                    <option value="ingame" ${account.status == 'ingame' ? 'selected' : ''}>In Game</option>
                                  </select>
                                </div>

                              </div>

                              <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                              </div>
                            </form>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- Student Table Area End Here -->
            <!--Footer-->
            <jsp:include page="../common/footer.jsp"></jsp:include>
            <!--Footer-->
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
      <!-- Custom Js -->
      <script src="${pageContext.request.contextPath}/admin/js/main.js"></script>



    </body>

    <!--Thông báo update success-->
    <c:if test="${updateSuccess == true}">
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
      <% session.removeAttribute("updateSuccess"); session.removeAttribute("message"); %>
    </c:if>


    <!-- Mirrored from www.radiustheme.com/demo/html/psdboss/akkhor/akkhor/teacher-details.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 20 Sep 2025 14:36:19 GMT -->

    </html>