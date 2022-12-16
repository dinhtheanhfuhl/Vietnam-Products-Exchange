<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Chi tiết sản phẩm</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!--====== Favicon Icon ======-->
        <link rel="shortcut icon" .href="./image/578b1438ff0a7fc4704aa5ade7625e89.jpeg" type="image/png">

        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="${pageContext.request.contextPath}/assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ecommerce/addedit_product.css">
        <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
    </head>

    <body>
        <div id="eq-loader">
            <div class="eq-loader-div">
                <div class="eq-loading dual-loader mx-auto mb-5"></div>
            </div>
        </div>

        <!--  BEGIN NAVBAR  -->
        <header class="desktop-nav header navbar fixed-top">
            <div class="nav-logo mr-sm-5 ml-sm-4">
                <a href="javascript:void(0);" class="nav-link sidebarCollapse d-inline-block mr-sm-5"
                   data-placement="bottom">
                    <i class="flaticon-menu-line-3"></i>
                </a>
                <a class="navbar-brand waves-effect" href="Home">
                    <h2 id="logoheader" style="color: #F5AB1E;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
                </a>
            </div>

            <ul class="navbar-nav flex-row ml-lg-auto">
                <li class="nav-item dropdown user-profile-dropdown pl-4 pr-lg-0 pr-2 ml-lg-2 mr-lg-4  align-self-center">
                    <a href="javascript:void(0);" class="nav-link dropdown-toggle user">
                        <div class="user-profile d-lg-block d-none">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ6p1uHt5NGPGppq1t48xlKt18PfNiIX5zCYQ&usqp=CAU"
                                 alt="admin-profile" class="img-fluid">
                        </div>
                        <i class="flaticon-user-7 d-lg-none d-block"></i>
                    </a>
                </li>
            </ul>
        </header>
        <!--  END NAVBAR  -->

        <!--  BEGIN MAIN CONTAINER  -->

        <div class="main-container" id="container">
            <div class="overlay"></div>
            <div class="ps-overlay"></div>
            <div class="search-overlay"></div>


            <!--  BEGIN MODERN  -->

            <div class="modernSidebar-nav header header navbar">
                <div class="">
                    <nav id="modernSidebar">
                        <ul class="menu-categories pl-0 m-0" id="topAccordion">

                            <li class="menu">
                                <a href="ModeratorController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>Danh sách<br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="ModeratorOrderController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>Danh sách<br> đơn hàng</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="ModeratorCategoryController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-saas"></i>
                                        <span>Danh mục</span>
                                    </div>
                                </a>
                            </li>

                        </ul>
                    </nav>

                </div>
            </div>
            <!--  END MODERN  -->

            <!--  BEGIN CONTENT PART  -->
            <div id="content" class="main-content container">
                <p>&nbsp;</p>
                <h4 class="h3-order">Chi tiết sản phẩm</h4>
                <p>&nbsp;</p>
                <div style="margin-left: 60px;" class="h3-order">
                    <c:if test="${product.statusId == 1}">
                        <div class="button-status ">
                            <a href="ModeratorDetailProductController?action=accept&id=${product.productId}" class="btn btn-success mb-1" class="btn btn-primary">Phê duyệt đơn</a>
                            <button class="btn btn-danger mb-1" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" type="submit">Từ chối đơn</button>
                        </div>
                    </c:if>
                </div>

                <div class="view-order">
                    <div class="summary-order">
                        <table class="table table-borderless">
                            <tr>
                                <th style="min-width: 300px">Ảnh</th>
                                <td>
                                    <c:forEach var="img" items="${proImgs}">
                                        <img style="width: 100px; height: 100px; object-fit: cover;" class="product-list-img" src="uploads/${img.imgPath}"> 
                                    </c:forEach>
                                </td>
                            </tr> 
                            <tr>
                                <th>Tên</th>
                                <td>${product.productName}</td>
                            </tr> 
                            <tr>
                                <th>Khoảng giá</th>
                                <td>
                                    <c:forEach var="lp" items="${proHies}">
                                        > ${lp.quantity} kg: ${lp.price} vnd<br>
                                    </c:forEach>
                                </td>
                            </tr> 
                            <tr>
                                <th>Khu vực giao hàng</th>
                                <td>
                                    <c:forEach var="c" begin="0" end="${cities.size()-2}">
                                        ${cities.get(c).cityName} , 
                                    </c:forEach>
                                    ${cities.get(cities.size()-1).cityName}
                                </td>
                            </tr> 
                            <tr>
                                <th>Danh mục hàng</th>
                                <td>${cate.cateName} - ${subCate.subCateName}</td>
                            </tr>
                            <tr>
                                <th>Mã Barcode / SKU</th>
                                <td>${product.barCode}</td>
                            </tr>
                            <tr>
                                <th>Tên loại sản phẩm</th>
                                <td>${product.productName}</td>
                            </tr>
                            <tr>
                                <th>Thương hiệu</th>
                                <td>${product.trademark}</td>
                            </tr>
                            <tr>
                                <th>Hương vị</th>
                                <td>${product.smell}</td>
                            </tr>
                            <tr>
                                <th>Màu sắc</th>
                                <td>${product.color}</td>
                            </tr>
                            <tr>
                                <th>Trọng lượng</th>
                                <td>${product.weight}</td>
                            </tr>
                            <tr>
                                <th>Kiểu đóng gói</th>
                                <td>${product.packing}</td>
                            </tr>
                            <tr>
                                <th>Thành phần</th>
                                <td>${product.element}</td>
                            </tr>
                            <tr>
                                <th>Mô tả sản phẩm</th>
                                <td>${product.description}</td>
                            </tr>
                            <tr>
                                <th>Giấy tờ chứng nhận</th>
                                <td>${product.productCertificate}</td>
                            </tr>
                            <c:if test="${mess != null}">
                                <tr>
                                    <th>Lý do từ chối: </th>
                                    <td>${mess.messageDescribe}</td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>Trạng thái</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${product.statusId == 1}"><span class="badge rounded-pill bg-info">Chờ phê duyệt</span></c:when>
                                        <c:when test="${product.statusId == 2}"><span class="badge rounded-pill bg-success">Đã phê duyệt</span></c:when>
                                        <c:when test="${product.statusId == 3}"><span class="badge rounded-pill bg-danger">Bị từ chối</span></c:when>
                                        <c:when test="${product.statusId == 4}"><span class="badge rounded-pill bg-secondary">Đã ẩn</span></c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>
            </div>

            <!--  END CONTENT PART  -->
            <!--  END MODERN  -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Từ chối đơn</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="ModeratorDetailProductController?action=reject&id=${product.productId}" method="POST" id="reject-form">
                                <div class="form-group">
                                    <label for="message-text" class="col-form-label">Lý do từ chối: </label>
                                    <textarea name="reason" class="form-control" id="message-text"></textarea>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                            <input form="reject-form" type="submit" value="Gửi" class="btn btn-success"/>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="footer-section theme-footer">

                <div class="footer-section-1  sidebar-theme">

                </div>

                <div class="footer-section-2 container-fluid">
                    <div class="row">
                        <div id="toggle-grid" class="col-xl-7 col-md-6 col-sm-6 col-12 text-sm-left text-center">
                            <ul class="list-inline links ml-sm-5">
                                <li class="list-inline-item">
                                    <a target="_blank" href="#">Vietnam Products Exchange</a>
                                </li>
                            </ul>
                        </div>
                        <div class="col-xl-5 col-md-6 col-sm-6 col-12">
                            <ul
                                class="list-inline mb-0 d-flex justify-content-sm-end justify-content-center mr-sm-3 ml-sm-0 mx-3">
                                <li class="list-inline-item  mr-3">
                                    <p class="bottom-footer">&#xA9; 2022 <a target="_blank" href="#">VnProX</a></p>
                                </li>
                                <li class="list-inline-item align-self-center">
                                    <div class="scrollTop"><i class="flaticon-up-arrow-fill-1"></i></div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </footer>

            <!--  END FOOTER  -->

            <!--  BEGIN PROFILE SIDEBAR  -->
            <%@include file="aside.jsp" %>

            <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
            <script src="${pageContext.request.contextPath}/assets/js/libs/jquery-3.1.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/loader.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/blockui/jquery.blockUI.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
            <script>
                $(document).ready(function () {
                    App.init();
                });
            </script>
            <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
            <!-- END GLOBAL MANDATORY SCRIPTS -->

            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
            <script src="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.min.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/maps/vector/jvector/worldmap_script/jquery-jvectormap-world-mill-en.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/calendar/pignose/moment.latest.min.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/calendar/pignose/pignose.calendar.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/progressbar/progressbar.min.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/default-dashboard/default-custom.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/ui-kit/timeline/horizontal-main.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/amcharts.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/maps/vector/ammaps/ammap_amcharts_extension.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/maps/vector/ammaps/worldLow.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/radar.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/pie.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/charts/sparklines/jquery.sparkline.min.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/serial.js"></script>
            <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/light.js"></script>
            <script src="${pageContext.request.contextPath}/assets/js/ecommerce-dashboard/ecommerce-custom.js"></script>

            <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    </body>
    <script>
                $('#exampleModal').on('show.bs.modal', function (event) {
                    var button = $(event.relatedTarget) // Button that triggered the modal
                    var recipient = button.data('whatever') // Extract info from data-* attributes
                    // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                    // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                    var modal = $(this)
                    modal.find('.modal-body input').val(recipient)
                })
    </script>
    <script>

        document.getElementById("processing").onclick = function () {
            document.querySelector("#processing").style.backgroundColor = 'green';
            document.querySelector("#canceled").style.backgroundColor = 'grey';
            document.querySelector("#approved").style.backgroundColor = 'grey';
            document.querySelector("#delivered").style.backgroundColor = 'grey';
        }
        document.getElementById("canceled").onclick = function () {
            document.querySelector("#canceled").style.backgroundColor = 'green';
            document.querySelector("#processing").style.backgroundColor = 'grey';
            document.querySelector("#approved").style.backgroundColor = 'grey';
            document.querySelector("#delivered").style.backgroundColor = 'grey';
        }
        document.getElementById("approved").onclick = function () {
            document.querySelector("#approved").style.backgroundColor = 'green';
            document.querySelector("#canceled").style.backgroundColor = 'grey';
            document.querySelector("#processing").style.backgroundColor = 'grey';
            document.querySelector("#delivered").style.backgroundColor = 'grey';
        }
        document.getElementById("delivered").onclick = function () {
            document.querySelector("#delivered").style.backgroundColor = 'green';
            document.querySelector("#canceled").style.backgroundColor = 'grey';
            document.querySelector("#approved").style.backgroundColor = 'grey';
            document.querySelector("#processing").style.backgroundColor = 'grey';
        }

    </script>
</html>