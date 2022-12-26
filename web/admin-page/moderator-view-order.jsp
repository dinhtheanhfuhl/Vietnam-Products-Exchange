<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Đơn hàng</title>
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
        <%@include file="header.jsp" %>
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
                <h3 style="margin-top: 80px" class="h3-order">Danh sách sản phẩm đơn hàng</h3>
                <p>&nbsp;</p>
                <div class="h3-order">
                    <p><b style="font-size: 15px;">Trạng thái đơn hàng</b><span><c:forEach var="os" items="${allOrderStatuses}">
                                <c:if test="${order.orderStatusId==os.orderStatusID}">
                                    <a style="color: white" class="badge bg-danger mb-2 mt-2">${os.statusName}</a>
                                </c:if>
                            </c:forEach></span></p>
                </div>
                <div class="view-order">
                    <div class="summary-order">
                        <table class="table table-bordered table-striped ">
                            <tr>
                                <th>Mã đơn hàng:</th>
                                <td>#${order.orderId}</td>
                            </tr>
                            <tr>
                                <th>Ngày đặt hàng:</th>
                                <td>${orderDetails.get(0).orderDate}</td>
                            </tr>
                            <tr>
                                <th>Tên Khách Hàng: </th>
                                <td>${order.recieverName}</td>
                            </tr>
                            <tr>
                                <th>Địa chỉ giao hàng: </th>
                                <td>${order.recieverAddress}</td>
                            </tr>
                            <tr>
                                <th>Số Điện Thoại: </th>
                                <td>${order.recieverPhone}</td>
                            </tr>
                            <tr>
                                <th>Tổng Tiền Hóa Đơn: </th>
                                <td><span><fmt:formatNumber type = "number" 
                                                  pattern = "" value = "${order.totalPrice}" /><sup>vnđ</sup>&nbsp;&nbsp;</span></td>

                            </tr>
                            <tr>
                                <th>Ghi Chú:</th>
                                <td>${order.note}</td>
                            </tr>
                            <c:if test="${order.orderStatusId==5 && messReject!=null}">
                                <tr>
                                    <th>Lý do huỷ:</th>
                                    <td class="text-warning">${messReject.messageDescribe}</td>
                                </tr>
                            </c:if>
                        </table>
                    </div>

                </div>

                <div style="margin-left: 80px" class="widget-content widget-content-area view-order-detail">
                    <div class="table-responsive mb-4">
                        <table id="ecommerce-product-list" class="table table-bordered">
                            <thead>
                                <tr class="text-center">
                                    <th>ID</th>
                                    <th>Ảnh</th>
                                    <th>Tên</th>
                                    <th>Danh mục</th>
                                    <th>Giá bán</th>
                                    <th>Số lượng</th>

                                </tr>
                            </thead>
                            <c:forEach var="od" items="${orderDetails}">
                                <tbody >
                                    <tr class="text-center">
                                        <td>#${od.orderDetailId}</td>
                                        <td class="text-center"><img style="object-fit: cover" class="product-list-img" src="uploads/${mapOrderDetailAndImg.get(od)}"></td>
                                        <td >${mapOrderDetailAndProduct.get(od)}</td>
                                        <td>${mapOrderDetailAndCate.get(od)}</td>
                                        <td><span><fmt:formatNumber type = "number" 
                                                          pattern = "" value = "${mapOrderDetailAndPrice.get(od)}" /><sup>vnđ</sup>&nbsp;&nbsp;</span></td>
                                        <td>
                                            <span><fmt:formatNumber type = "number" 
                                                              pattern = "" value = "${od.amount}" />Kg</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>
            </div>

            <!--  END CONTENT PART  -->
            <!--  END MODERN  -->
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