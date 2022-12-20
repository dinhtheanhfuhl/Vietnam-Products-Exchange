<!DOCTYPE html>
<%
    if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 1) {
        request.getRequestDispatcher("../common/error.jsp").forward(request, response);
        return;
    }
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Danh sách người dùng</title>
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
                                <a href="AdminController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-user-1"></i>
                                        <span>Danh sách <br> người dùng</span>
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
                    <div class="row ">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

                            <div class="statbox widget box box-shadow">

                                <div style="margin-top: 116px;" class="widget-header">
                                    <div class="page-header ">
                                        <div class="page-title col-xl-12 col-md-12 col-sm-12 col-12 mb-3">
                                            <h3>Quản lý người dùng hệ thống</h3>
                                        </div>
                                    </div>
                                    <div class="widget-header mb-3">
                                        <div class="row">
                                            <div class="col-lg-12">
                                                <form class="top-action" method="post" action="AdminController">
                                                    <div id="filter">
                                                        <input type="hidden" value="search" name="action" />
                                                        <input type="text" name="name-search" placeholder="Tên người dùng" value="${name}" class="form-control">
                                                        <input type="text" name="shop-name-search" placeholder="Tên nhà cung cấp" value="${shopName}"
                                                               class="form-control">
                                                        <select name="address-search" class="form-control" >
                                                            <option <c:if test="${address==0}">selected</c:if> value="0">Tất cả thành phố</option>
                                                            <c:forEach items="${allCities}" var="city">
                                                                <option <c:if test="${address==city.cityId}">selected</c:if> value="${city.cityId}">${city.cityName}</option>
                                                            </c:forEach>
                                                        </select>
                                                                <input type="number" name="phone-search" placeholder="Số điện thoại" value="${phone}"
                                                               class="form-control">
                                                        <input type="email" name="email-search" placeholder="Email" value="${email}"
                                                               class="form-control">

                                                        <button class="btn btn-info" type="submit"
                                                                style="padding: 0 10px; background: none; border: none;"
                                                                title="Tìm kiếm">
                                                            <i class="flaticon-search" aria-hidden="true"
                                                               style="color:#469408;font-size: 25px;line-height: 42px;"></i>
                                                        </button>

                                                    </div>
                                                </form>
                                            </div>

                                        </div>
                                    </div>  
                                </div>

                                <div class="widget-content widget-content-area">
                                    <form action="AdminController" method="post">
                                        <c:if test='${ACTION != null && ACTION=="search"}'>
                                            <input type="hidden" name="action" value="search"/>
                                            <input type="hidden" name="name-search" value="${name}"/>
                                            <input type="hidden" name="shop-name-search" value="${shopName}"/>
                                            <input type="hidden" name="address-search" value="${address}"/>
                                            <input type="hidden" name="phone-search" value="${phone}"/>
                                            <input type="hidden" name="email-search" value="${email}"/>
                                        </c:if>
                                            <select style="min-width: 186px;" name="filter" onchange="this.form.submit()" id="selectstatus" class="form-control">
                                            <option <c:if test="${statusFilter==0}">selected</c:if> value="0">Tất cả trạng thái</option>
                                            <option <c:if test="${statusFilter==1}">selected</c:if> value="1">Chờ phê duyệt</option>
                                            <option <c:if test="${statusFilter==2}">selected</c:if> value="2">Đã phê duyệt</option>
                                            <option <c:if test="${statusFilter==3}">selected</c:if> value="3">Từ chối phê duyệt</option>
                                            </select>
                                        </form>
                                        <h6 id="sorttext">Sắp xếp theo</h6>
                                        <h3>Nhà cung cấp</h3>
                                    <c:if test="${mapSuppliers.keySet().size()!=0}">
                                        <div class="table-responsive mb-4" style="overflow: scroll;height: 20em;">

                                            <table id="ecommerce-product-list" class="table table-bordered table-striped">

                                                <tbody class="text-center">
                                                    <tr style="background-color: #F5AB1E !important; color: #F5F5F5 !important;">
                                                        <th>ID</th>
                                                        <th>Tên người dùng</th>
                                                        <th>Tên nhà cung cấp</th>
                                                        <th>Thành phố</th>
                                                        <th>SĐT</th>
                                                        <th>Email</th>
                                                        <th>Trạng thái</th>
                                                        <th>Chi tiết</th>
                                                    </tr>
                                                    <c:forEach items="${mapSuppliers.keySet()}" var="key" >
                                                        <tr>
                                                            <td>#${key.supplierId}</td>
                                                            <td>${key.supplierName}</td>
                                                            <td>${key.shopName}</td>
                                                            <td>${mapSupplierCity.get(key).cityName}</td>
                                                            <td>${key.phone}</td>
                                                            <td>${key.email}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${mapSupplierStatus.get(key)==1}">Chờ phê duyệt</c:when>
                                                                    <c:when test="${mapSupplierStatus.get(key)==2}">Đã chấp thuận</c:when>
                                                                    <c:when test="${mapSupplierStatus.get(key)==3}">Tài khoản bị từ chối</c:when>
                                                                </c:choose>
                                                            </td>
                                                            <td><a style="color: #F5AB1E !important" href="DetailSuppilerController?id=${key.supplierId}">Xem chi tiết</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                    <c:if test="${mapSuppliers.keySet().size()==0}">
                                        <div class="mb-5">
                                            <h5 style="color: #F5AB1E;" class="col-12">Không có dữ liệu!</h5>
                                        </div>
                                    </c:if>
                                    <h3>Khách hàng</h3>
                                    <c:if test="${mapCustomers.keySet().size()!=0}">
                                        <div class="table-responsive mb-4" style="overflow: scroll;height: 20em;"> 
                                            <table id="ecommerce-product-list" class="table table-bordered table-striped" >
                                                <tbody class="text-center">
                                                    <tr style="background-color: #F5AB1E !important; color: #F5F5F5 !important;">
                                                        <th>ID</th>
                                                        <th>Tên người dùng</th>
                                                        <th>Tên khách hàng</th>
                                                        <th>Thành phố</th>
                                                        <th>SĐT</th>
                                                        <th>Email</th>
                                                        <th>Trạng thái</th>
                                                        <th>Chi tiết</th>
                                                    </tr>
                                                    <c:forEach items="${mapCustomers.keySet()}" var="key" >
                                                        <tr>
                                                            <td>#${key.customerId}</td>
                                                            <td>${key.customerName}</td>
                                                            <td>${key.shopName}</td>
                                                            <td>${mapCustomerCity.get(key).cityName}</td>
                                                            <td>${key.phone}</td>
                                                            <td>${key.email}</td>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${mapCustomerStatus.get(key)==1}">Chờ phê duyệt</c:when>
                                                                    <c:when test="${mapCustomerStatus.get(key)==2}">Đã chấp thuận</c:when>
                                                                    <c:when test="${mapCustomerStatus.get(key)==3}">Tài khoản bị từ chối</c:when>
                                                                </c:choose>
                                                            </td>
                                                            <td><a style="color: #F5AB1E !important" href="DetailCustomerController?id=${key.customerId}">Xem chi tiết</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </c:if>
                                    <c:if test="${mapCustomers.keySet().size()==0}">
                                        <div class="mb-5">
                                            <h5 style="color: #F5AB1E;" class="col-12">Không có dữ liệu!</h5>
                                        </div>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--  END CONTENT PART  -->
        </div>

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
</html>
<script>
                                            $('#ecommerce-product-list').DataTable({
                                                "lengthMenu": [5, 10, 20, 50, 100],
                                                "language": {
                                                    "paginate": {"previous": "<i class='flaticon-arrow-left-1'></i>", "next": "<i class='flaticon-arrow-right'></i>"},
                                                    "info": "Showing page _PAGE_ of _PAGES_"
                                                },
                                                drawCallback: function (settings) {
                                                    $('[data-toggle="tooltip"]').tooltip();
                                                }
                                            });
</script>
<!--  END CUSTOM SCRIPT FILES  -->

</html>