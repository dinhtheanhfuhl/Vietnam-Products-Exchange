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
                                <a href="SupplierController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>Danh sách<br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="SupplierOrderController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>Danh sách<br> đơn hàng</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!--  END MODERN  -->

            <!--  BEGIN CONTENT PART  -->


            <div style="margin-top: 80px" id="content" class="main-content container">
                <div style="margin-left: 30px;" class="view-order">
                    <c:if test="${status.orderStatusID!=4 && status.orderStatusID!=3 && status.orderStatusID!=5}">
                        <h5>Hành động</h5>
                        <c:if test="${status.orderStatusID==1}">
                            <form style="display: inline" action="SupplierDetailOrderController" method="POST">
                                <input type="hidden" name="action" value="accept"/>
                                <input type="hidden" name="id" value="${order.orderId}"/>
                                <input type="submit" class="btn btn-success status mb-2" value="Xác nhận đơn hàng"/>
                            </form>
                            <form style="display: inline" action="SupplierDetailOrderController" method="POST">
                                <input type="hidden" name="action" value="reject"/>
                                <input type="hidden" name="id" value="${order.orderId}"/>
                                <input type="submit" class="btn btn-danger status mb-2" value="Từ chối đơn hàng"/>
                            </form>
                        </c:if>
                        <c:if test="${status.orderStatusID==2}">
                            <form action="SupplierDetailOrderController" method="POST">
                                <input type="hidden" name="action" value="success"/>
                                <input type="hidden" name="id" value="${order.orderId}"/>
                                <input type="submit" class="btn btn-secondary status mb-2" value="Đang giao hàng"/>
                            </form>
                        </c:if>
                        </span>
                    </c:if>
                </div>
                <div style="margin-left: 30px; margin-top: 42px;" class="view-order">
                    <div class="summary-order">
                        <table class="table table-striped table-bordered" >
                            <tr>
                                <th>Mã đơn hàng:</th>
                                <td>#${order.orderId}</td>
                            </tr>
                            <tr>
                                <th>Ngày đặt hàng:</th>
                                <td>${details.get(0).orderDate}</td>
                            </tr>
                            <tr>
                                <th>Tên người nhận: </th>
                                <td>${order.recieverName}</td>
                            </tr>
                            <tr>
                                <th>Số Điện Thoại: </th>
                                <td>${order.recieverPhone}</td>
                            </tr>
                            <tr>
                                <th>Địa Chỉ nhận hàng: </th>
                                <td>${order.recieverAddress}</td>
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
                            <tr>
                                <th>Trạng thái:</th>
                                <td class="text-warning">
                                    <c:if test="${order.orderStatusId==1}">Chờ xác nhận</c:if>
                                    <c:if test="${order.orderStatusId==2}">Đã xác nhận</c:if>
                                    <c:if test="${order.orderStatusId==3}">Bị từ chối</c:if>
                                    <c:if test="${order.orderStatusId==4}">Đang giao</c:if>
                                    <c:if test="${order.orderStatusId==5}">Khách hàng đã huỷ</c:if>
                                    <c:if test="${order.orderStatusId==6}">Khách hàng đã nhận hàng</c:if>
                                    </td>
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

                <h3 style="margin-top: 20px;margin-left: 30px;"  class="h3-order">Danh sách sản phẩm đơn hàng</h3>
                <div style="margin-left: 30px;" class="widget-content widget-content-area view-order-detail">
                    <div class="table-responsive mb-4 ">
                        <table id="ecommerce-product-list" class="table table-bordered">
                            <thead>
                                <tr style="background-color: #F5AB1E;" class="text-center">
                                    <th style="color: white !important;">ID</th>
                                    <th style="color: white !important;">Ảnh</th>
                                    <th style="color: white !important;">Tên</th>
                                    <th style="color: white !important;">Danh mục</th>
                                    <th style="color: white !important;">Giá bán</th>
                                    <th style="color: white !important;">Số lượng</th>

                                </tr>
                            </thead>
                            <c:forEach var="d" items="${details}">
                                <tbody >
                                    <tr class="text-center">
                                        <td>#${d.orderDetailId}</td>
                                        <td class="text-center">
                                            <img style="object-fit: cover;" class="product-list-img" src="uploads/${mapOrderDetailAndImagePath.get(d)}"/>
                                        </td>
                                        <td>${mapOrderDetailAndProductName.get(d)}</td>
                                        <td>${mapOrderDetailAndCateName.get(d)} <b>/</b> ${mapOrderDetailAndSubCateName.get(d)}</td>
                                        <td><span><fmt:formatNumber type = "number" 
                                                          pattern = "" value = "${mapOrderDetailAndCost.get(d)}" /><sup>vnđ</sup>&nbsp;&nbsp;</span></td>
                                        <td>
                                            <span><fmt:formatNumber type = "number" 
                                                              pattern = "" value = "${d.amount}" />Kg</span>
                                        </td>
                                    </tr>
                                </tbody>
                            </c:forEach>
                        </table>
                    </div>
                </div>

            </div>
            <div class="pagination-section" >
                <ul class="pagination" >
                    <li class="paginate_button page-item previous disabled" id="ecommerce-product-list_previous">
                        <a href="#" aria-controls="ecommerce-product-list" data-dt-idx="0" tabindex="0" class="page-link">
                            <i class="flaticon-arrow-left-1"></i>
                        </a>
                    </li>
                    <li class="paginate_button page-item active">
                        <a href="#" aria-controls="ecommerce-product-list" data-dt-idx="1" tabindex="0" class="page-link">1
                        </a>
                    </li>
                    <li class="paginate_button page-item ">
                        <a href="#" aria-controls="ecommerce-product-list" data-dt-idx="2" tabindex="0" class="page-link">2
                        </a>
                    </li>
                    <li class="paginate_button page-item next" id="ecommerce-product-list_next">
                        <a href="#" aria-controls="ecommerce-product-list" data-dt-idx="3" tabindex="0" class="page-link">
                            <i class="flaticon-arrow-right"></i>
                        </a>
                    </li>
                </ul>
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