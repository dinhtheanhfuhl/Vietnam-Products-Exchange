<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Chi tiết đơn hàng</title>
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
        <link href="../assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="../plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="../assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="../assets/css/style.css">
        <link rel="stylesheet" href="../assets/css/ecommerce/addedit_product.css">
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
                                <a href="ModeratorController" 
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
            <div id="content" class="main-content ">
                <div class="container " style="margin-top: 50px;">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow" >
                                <div class="widget-header">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content widget-content-area add-manage-product-2">
                                    <div class="row">
                                        <div class="col-xl-7 col-md-12">
                                            <div class="card card-default">
                                                <div class="card-heading">
                                                    <h2 class="card-title"><span>Thông tin bên đặt hàng</span></h2>
                                                </div>
                                                <div class="card-body" >
                                                    <div class="card-body" >
                                                        <form class="form-horizontal" style="padding-top: 58px !important;">
                                                            <div class="form-group mb-4">
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Người đặt
                                                                        </label>
                                                                        <div class="col-md-8">
                                                                            <div class="mb-3">
                                                                                <p> Nguyen Van A</p>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Email
                                                                        </label>
                                                                        <div class="col-md-8">
                                                                            <div class="mb-3">
                                                                                aaaaa@gmail.com
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <label class="col-md-4">
                                                                            Sđt </label>
                                                                        <div class="col-md-8">
                                                                            <div class="mb-3">
                                                                                <div class="custom-file">
                                                                                    02342323
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Địa chỉ nhận hàng
                                                                        </label>
                                                                        <div class="col-md-8">
                                                                            <div class="mb-3">
                                                                                <div class="custom-file">
                                                                                    24 Hai Ba Trung
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="form-group">
                                                                    <div class="row">
                                                                        <label class="col-md-4">
                                                                            Phương thức giao hàng</label>
                                                                        <div class="col-md-8">
                                                                            <div class="mb-3">
                                                                                <div class="custom-file">
                                                                                    Nhà cung cấp giao hàng
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Phương thức thanh toán</label>
                                                                    <div class="col-md-8">
                                                                        Thanh toán khi nhận hàng (COD)
                                                                    </div>

                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Lời nhắn</label>
                                                                    <div class="col-md-8">
                                                                        anh adisacas đá ádasd ádas dấd a
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </form>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-xl-5 col-md-12">
                                            <div class="card card-default">
                                                <div class="card-heading">
                                                    <h2 class="card-title"><span>Thông tin Nhà cung cấp</span></h2>
                                                </div>
                                                <div class="card-body">
                                                    <form class="form-horizontal">
                                                        <div class="form-group mb-4">
                                                            <div class="row">
                                                                <label class="col-md-4">Nhà cung cấp</label>
                                                                <div class="col-md-8">
                                                                    DUng Ha
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="form-group mb-4">
                                                            <div class="row">
                                                                <label class="col-md-4">Email</label>
                                                                <div class="col-md-8">
                                                                    sfsdfsd@gmai.com
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-4">
                                                            <div class="row">
                                                                <label class="col-md-4">Sđt</label>
                                                                <div class="col-md-8">
                                                                    004234324324
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-4">
                                                            <div class="row">
                                                                <label class="col-md-4">Đia chỉ kho hàng</label>
                                                                <div class="col-md-8">
                                                                    26 Nguyen Chi Thanh
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group mb-4">
                                                            <div class="row">
                                                                <label class="col-md-4">Trọng lượng</label>
                                                                <div class="col-md-8">
                                                                    <input type="number" class="form-control" placeholder="Ví dụ: 400g, 20kg,..." name="discount" type="text">
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </form>
                                                </div>
                                            </div>
                                            <div style="margin-top: 250px;margin-left: -840px;">
                                                <div class="form-group mb-4" >
                                                    <div class="row">
                                                        <label class="col-md-4"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                                            <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                                            </svg><b>Chi tiết đơn hàng</b></label>
                                                        <div class="col-md-8">

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <div class="row">
                                                        <label class="col-md-4">Thời gian đặt hàng</label>
                                                        <div class="col-md-8">
                                                            12/12/222
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <div class="row">
                                                        <label class="col-md-4">Nhà cung cấp xác nhận</label>
                                                        <div class="col-md-8">
                                                            ...............
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <div class="row">
                                                        <label class="col-md-4">Trạng thái</label>
                                                        <div class="col-md-8">
                                                            ................
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <div class="row">
                                                        <label class="col-md-4"><b>Mã đơn hàng </b></label>
                                                        <div class="col-md-8">
                                                            21324324324
                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="form-group mb-4">
                                                    <div class="row">
                                                        <label class="col-md-4"><b>Trạng thái</b></label>
                                                        <div class="col-md-8">
                                                            <input value="Chờ NCC Xác nhận" class="btn btn-gradient-success" >
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">STT</th>
                                                <th scope="col">Tên hàng</th>
                                                <th scope="col">Mã Barcode</th>
                                                <th scope="col">Số lượng</th>
                                                <th scope="col">Đơn giá</th>
                                                <th scope="col">Tổng</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td>Mark</td>
                                                <td>Otto</td>
                                                <td>@mdo</td>
                                                <td>@mdo</td>
                                                <td>@mdo</td>
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
        <aside class="profile-sidebar text-center">
            <div class="profile-content profile-content-scroll">
                <div class="usr-profile">
                    <img src="../assets/img/90x90.jpg" alt="admin-profile" class="img-fluid" />
                </div>
                <p class="user-name mt-4 mb-4">Hoàng Thị Xoan</p>
                <div class="user-links text-left">
                    <ul class="list-unstyled">
                        <li>
                            <a href="./personal-infor-supplier.jsp"><i class="flaticon-user-11"></i> Thông tin cá nhân</a>
                        </li>
                        <li>
                            <a href="../changepass.jsp"><i class="flaticon-lock-1"></i> Thay đổi mật khẩu</a>
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
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    </body>
</html>