<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Danh sách sản phẩm</title>
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
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />\
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
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
                <a class="navbar-brand waves-effect" href="${pageContext.request.contextPath}/home.jsp">
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
                                <a href="supplier-product-pending.jsp" 
                                   class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>Danh sách <br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>

                            <li class="menu">
                                <a href="./supplier-view-order.jsp" 
                                   class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-cart-bag-1"></i>
                                        <span>Xem đơn hàng</span>
                                    </div>
                                </a>

                            </li>
                        </ul>
                    </nav>

                </div>
            </div>
            <!--  END MODERN  -->

            <!--  BEGIN CONTENT PART  -->
            <div id="content" class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing">
                            <div class="statbox widget box">
                                <div class="widget-content-area">
                                    <div class="widget-header mb-5 mt-5">
                                        <div class="row">

                                            <div class="col-lg-12">
                                                <form class="top-action" method="GET" action="">

                                                    <input name="sorts[]" value="" class="sort sort-name" type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-type" type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-address" type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-hotline" type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-transport_code"
                                                           type="hidden">
                                                    <input name="sorts[]" value="country_code|desc"
                                                           class="sort sort-country_code" type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-bill_in_warehouse"
                                                           type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-view_bill"
                                                           type="hidden">
                                                    <input name="sorts[]" value="" class="sort sort-order_in_warehouse"
                                                           type="hidden">

                                                    <div id="filter">
                                                        <form action="SupplierController" method="post">
                                                            <input type="hidden" name="action" value="search">
                                                            <input type="text" name="idSr" placeholder="Mã yêu cầu phê duyệt"
                                                                   <c:if test="${requestScope.idSr!=null}"> value="${requestScope.idSr}"</c:if>
                                                                       class="form-control">
                                                                   <input type="text" name="nameSr" placeholder="Tên sản phẩm"
                                                                   <c:if test="${requestScope.nameSr!=null}"> value="${requestScope.nameSr}"</c:if>
                                                                       class="form-control">
                                                                   <input type="text" name="barcodeSr" placeholder="Mã Barcode/SKU"
                                                                   <c:if test="${requestScope.barcodeSr!=null}"> value="${requestScope.barcodeSr}"</c:if>
                                                                       class="form-control"> 
                                                                   <button 
                                                                       type="submit"
                                                                       class="btn btn-info"
                                                                       style="padding: 0 10px; background: none; border: none;"
                                                                       title="Tìm kiếm">
                                                                       <i class="flaticon-search" aria-hidden="true"
                                                                          style="color:#469408;font-size: 25px;line-height: 42px;"></i>
                                                                   </button>
                                                            </form>
                                                        </div>
                                                    </form>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="table-responsive new-products" style="background-color: white;">
                                            <a href="SupplierAddController">
                                                <button type="button" class="btn btn-warning">Thêm sản phẩm</button></a>
                                            <select style="float: right;width: 160px;" onchange="location = this.value;" class="form-control">
                                                <option <c:if test="${status!=null&&status==0}">selected</c:if> value="SupplierController?filter=filter&status=0<c:if test="${action!=null}">&action=${action}&idSr=${idSr}&nameSr=${nameSr}&barcodeSr=${barcodeSr}</c:if>">Tất cả sản phẩm</option>
                                                <option <c:if test="${status!=null&&status==1}">selected</c:if> value="SupplierController?filter=filter&status=1<c:if test="${action!=null}">&action=${action}&idSr=${idSr}&nameSr=${nameSr}&barcodeSr=${barcodeSr}</c:if>">Chờ phê duyệt</option>
                                                <option <c:if test="${status!=null&&status==2}">selected</c:if> value="SupplierController?filter=filter&status=2<c:if test="${action!=null}">&action=${action}&idSr=${idSr}&nameSr=${nameSr}&barcodeSr=${barcodeSr}</c:if>">Đã phê duyệt</option>
                                                <option <c:if test="${status!=null&&status==3}">selected</c:if> value="SupplierController?filter=filter&status=3<c:if test="${action!=null}">&action=${action}&idSr=${idSr}&nameSr=${nameSr}&barcodeSr=${barcodeSr}</c:if>">Từ chối phê duyệt</option>
                                                <option <c:if test="${status!=null&&status==4}">selected</c:if> value="SupplierController?filter=filter&status=4<c:if test="${action!=null}">&action=${action}&idSr=${idSr}&nameSr=${nameSr}&barcodeSr=${barcodeSr}</c:if>">Đã ẩn</option>
                                            </select>
                                            <table class="table">
                                                <thead>
                                                    <tr class="text-center">
                                                        <th>Mã yêu 
                                                            cầu duyệt</th>
                                                        <th>Thời gian 
                                                            gửi yêu cầu</th>
                                                        <th>Tên sản phẩm</th>
                                                        <th>Mã Barcode/
                                                            SKU</th>
                                                        <th style="min-width: 150px" >Trạng thái</th>
                                                        <th style="min-width: 150px">Chi tiết</th>
                                                        <th>Chỉnh sửa</th>
                                                        <th>Ẩn/Bỏ Ẩn</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="text-center">
                                                <c:forEach var="p" items="${resultP}">
                                                    <tr>
                                                        <td>#${p.productId}</td>
                                                        <td>${p.createdDate}</td>
                                                        <td><span>${p.productName}</span></td>
                                                        <td>${p.barCode}</td>

                                                        <c:choose>
                                                            <c:when test="${p.statusId==1}"><td>Chờ phê duyệt</td></c:when>
                                                            <c:when test="${p.statusId==2}"><td>Đã phê duyệt</td></c:when>
                                                            <c:when test="${p.statusId==3}"><td>Từ chối phê duyệt</td></c:when>
                                                            <c:when test="${p.statusId==4}"><td>Đã ẩn</td></c:when>
                                                        </c:choose>
                                                        <td>
                                                            <div class="dropdown dropdown-user">
                                                                <a href="supplier-product-detail.jsp" target="_blank">
                                                                    Xem chi tiết
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <a href="#"><i class="flaticon-edit"></i></a>
                                                        </td>
                                                        <td>
                                                            <a href="#"><i class="flaticon-view"></i></a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>
                                    <div class="pagination-section">
                                        <ul
                                            class="pagination pagination-style-1 pagination-rounded justify-content-end mt-3 mb-3">
                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>



                </div>
            </div>
            <!--  END CONTENT PART  -->

        </div>
        <!-- END MAIN CONTAINER -->
        <!-- END MAIN CONTAINER -->

        <!--  BEGIN FOOTER  -->

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
        <aside class="profile-sidebar text-center">
            <div class="profile-content profile-content-scroll">
                <div class="usr-profile">
                    <img src="${pageContext.request.contextPath}/assets/img/90x90.jpg" alt="admin-profile" class="img-fluid" />
                </div>
                <p class="user-name mt-4 mb-4">Hoàng Thị Xoan</p>

                <div class="user-links text-left">
                    <ul class="list-unstyled">
                        <li>
                            <a href="./personal-infor-supplier.jsp"><i class="flaticon-user-11"></i> Thông tin cá nhân</a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/changepass.jsp"><i class="flaticon-lock-1"></i> Thay đổi mật khẩu</a>
                        </li>
                        <li>
                            <a href="supplier-product-pending.jsp"><i class="flaticon-globe"></i> Quản lý</a>
                        </li>
                        <li>
                            <a href="#"><i class="flaticon-power-off"></i> Đăng xuất</a>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
        <!--  BEGIN PROFILE SIDEBAR  -->
    </body>
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


</html>