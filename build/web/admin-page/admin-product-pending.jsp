<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Danh sách sản phẩm chờ duyệt </title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!--====== Favicon Icon ======-->
        <link rel="shortcut icon" .href="./image/578b1438ff0a7fc4704aa5ade7625e89.jpeg" type="image/png">

        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="../assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="../plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="../plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />\
        <link rel="stylesheet" href="../assets/css/style.css">
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
                                <a href="./admin-product-pending.jsp" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>D/s sản phẩm</span>
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
                                                        <input type="text" name="id" placeholder="Mã yêu cầu phê duyệt" value=""
                                                               class="form-control">
                                                        <input type="text" name="name" placeholder="Tên sản phẩm" value=""
                                                               class="form-control">
                                                        <input type="text" name="danh mục" placeholder="Mã Barcode/SKU" value=""
                                                               class="form-control"> 
                                                        <input type="text" name="danh mục" placeholder="Nhà cung cấp" value=""
                                                               class="form-control"> 
                                                        <button class="btn btn-info"
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
                                    <div class="table-responsive new-products">
                                        <table class="table">
                                            <thead>
                                                <tr class="text-center">
                                                    <th> </th>
                                                    <th>STT</th>
                                                    <th>Mã yêu 
                                                        cầu duyệt</th>
                                                    <th>Thời gian 
                                                        gửi yêu cầu</th>
                                                    <th>Tên sản phẩm</th>
                                                    <th>Mã Barcode/
                                                        SKU</th>
                                                    <th>Nhà cung cấp </th>
                                                    <th>Khu vực 
                                                        giao hàng</th>
                                                    <th>Trạng thái</th>
                                                    <th>Chi tiết</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                <tr>
                                                    <td>&nbsp;<input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" ></td>
                                                    <td>#0001</td>
                                                    <td>Cam sành</td>
                                                    <td><span class="badge badge-info badge-pill">Hoa quả</span></td>
                                                    <td>100</td>
                                                    <td>50</td>
                                                    <td>50</td>
                                                    <td>
                                                        50.000
                                                    </td>
                                                    <td>20.000</td>
                                                    <td><a href="#">Xem chi tiết</a></td>
                                                </tr>
                                            </tbody>
                                        </table>
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
        <%@include file="aside.jsp" %>
        <!--  BEGIN PROFILE SIDEBAR  -->
    </body>
    <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
    <script src="../assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="../assets/js/loader.js"></script>
    <script src="../assets/js/popper.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <script src="../plugins/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="../plugins/blockui/jquery.blockUI.min.js"></script>
    <script src="../assets/js/app.js"></script>
    <script>
        $(document).ready(function () {
            App.init();
        });
    </script>
    <script src="../assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="../plugins/charts/chartist/chartist.js"></script>
    <script src="../plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.min.js"></script>
    <script src="../plugins/maps/vector/jvector/worldmap_script/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../plugins/calendar/pignose/moment.latest.min.js"></script>
    <script src="../plugins/calendar/pignose/pignose.calendar.js"></script>
    <script src="../plugins/progressbar/progressbar.min.js"></script>
    <script src="../assets/js/default-dashboard/default-custom.js"></script>
    <script src="../assets/js/ui-kit/timeline/horizontal-main.js"></script>
    <script src="../plugins/charts/amcharts/amcharts.js"></script>
    <script src="../plugins/maps/vector/ammaps/ammap_amcharts_extension.js"></script>
    <script src="../plugins/maps/vector/ammaps/worldLow.js"></script>
    <script src="../plugins/charts/amcharts/radar.js"></script>
    <script src="../plugins/charts/amcharts/pie.js"></script>
    <script src="../plugins/charts/sparklines/jquery.sparkline.min.js"></script>
    <script src="../plugins/charts/amcharts/serial.js"></script>
    <script src="../plugins/charts/amcharts/light.js"></script>
    <script src="../assets/js/ecommerce-dashboard/ecommerce-custom.js"></script>


</html>