<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Danh sách danh mục </title>
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
        <header class="desktop-nav header navbar fixed-top">
            <div class="nav-logo mr-sm-5 ml-sm-4">
                <a href="javascript:void(0);" class="nav-link sidebarCollapse d-inline-block mr-sm-5"
                   data-placement="bottom">
                    <i class="flaticon-menu-line-3"></i>
                </a>
                <a class="navbar-brand waves-effect" href="../home.jsp">
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
                                <a href="./moderator-list-product.jsp" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>D/s sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="./moderator-list-order.jsp" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>D/s đơn hàng</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="./moderator-category.jsp" class="dropdown-toggle collapsed">
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
            <div id="content" class="main-content">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-12 layout-spacing">
                            <div class="statbox widget box">
                                <h3>Danh sách danh mục</h3>
                                <div class="widget-content-area">
                                    <div class="table-responsive new-products">
                                        <table class="table">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Tên danh mục</th>

                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                <tr>
                                                    <td>1</td>
                                                    <td>#0001</td>


                                                </tr>
                                            </tbody>
                                        </table>
                                        <a href="./moderator-add-cate.jsp"><button class=" btn btn-warning status mb-2" id="approved">  Thêm danh mục </button></a>
                                        <a href="./moderator-add-subcate.jsp"><button class=" btn btn-warning status mb-2" id="approved">  Thêm danh mục con </button></a>
                                    </div>
                                    <div class="pagination-section">
                                        <ul
                                            class="pagination pagination-style-1 pagination-rounded justify-content-end mt-3 mb-3">
                                            <li><a href="javascript:void(0);">«</a></li>
                                            <li><a href="javascript:void(0);">1</a></li>
                                            <li><a href="javascript:void(0);">2</a></li>
                                            <li><a href="javascript:void(0);">3</a></li>
                                            <li><a href="javascript:void(0);">4</a></li>
                                            <li><a href="javascript:void(0);">5</a></li>
                                            <li><a href="javascript:void(0);">»</a></li>
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
                    <img src="../assets/img/90x90.jpg" alt="admin-profile" class="img-fluid" />
                </div>
                <p class="user-name mt-4 mb-4">Hoàng Thị Xoan</p>

                <div class="user-links text-left">
                    <ul class="list-unstyled">
                        <li>
                            <a href="./personal-infor-moderator.jsp"><i class="flaticon-user-11"></i> Thông tin cá nhân</a>
                        </li>
                        <li>
                            <a href=""><i class="flaticon-globe"></i> Quản lý</a>
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