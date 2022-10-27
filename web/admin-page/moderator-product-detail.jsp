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
                <a class="navbar-brand waves-effect" href="../home.jsp">
                    <h2 id="logoheader" style="color: #F5AB1E;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
                </a>
            </div>

            <ul class="navbar-nav flex-row ml-lg-auto">
                <li class="nav-item dropdown message-dropdown ml-lg-4 mr-lg-4 d-sm-block d-none align-self-center">

                    <div class="dropdown-menu  position-absolute p-0 eq-animated eq-fadeInUp"
                         aria-labelledby="message-dropdown">
                        <div class="">
                            <a class="dropdown-item">
                                <div class="">
                                    <div class="media notification-new">
                                        <div class="usr-img align-self-center mr-3">
                                            <img class="usr-img rounded-circle" src="assets/img/90x90.jpg" alt="profile">
                                        </div>
                                        <div class="media-body">
                                            <div class="d-flex justify-content-between">
                                                <p class="meta-user-name mr-3 mb-0">LÃª VÄn BÃ¬nh</p>
                                                <p class="meta-time align-self-center mb-0">04.11.21</p>
                                            </div>
                                            <p class="message-text mb-0 ">Cháº¥t lÆ°á»£ng sáº£n pháº©m tá»t</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a class="dropdown-item">
                                <div class="">
                                    <div class="media notification-new">
                                        <div class="notification-icon align-self-center mr-3">
                                            <i class="flaticon-mailbox"></i>
                                        </div>
                                        <div class="media-body">
                                            <div class="d-flex justify-content-between">
                                                <p class="meta-title mr-3 mb-0">1 email má»i</p>
                                                <p class="meta-time align-self-center mb-0">04.10.19</p>
                                            </div>
                                            <p class="message-text mb-0 ">Anderson.Daisy@mail.com</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a class="dropdown-item">
                                <div class="">
                                    <div class="media">
                                        <div class="usr-img align-self-center mr-3">
                                            <img class="usr-img rounded-circle" src="assets/img/90x90.jpg" alt="profile">
                                        </div>
                                        <div class="media-body">
                                            <div class="d-flex justify-content-between">
                                                <p class="meta-user-name mr-3 mb-0">BÃ¬nh An</p>
                                                <p class="meta-time align-self-center mb-0">04.02.21</p>
                                            </div>
                                            <p class="message-text mb-0 ">Cháº¥t lÆ°á»£ng sáº£n pháº©m tá»t </p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </div>
                    </div>
                </li>

                <li class="nav-item dropdown notification-dropdown ml-3 mr-lg-4 align-self-center">

                    <div class="dropdown-menu position-absolute eq-animated eq-fadeInUp"
                         aria-labelledby="notification-dropdown">
                        <div class="notification-scroll">
                            <div class="dropdown-item">
                                <a href="">
                                    <div class="media">
                                        <div class="user-profile">
                                            <img src="assets/img/90x90.jpg" alt="admin-profile" class="img-fluid">
                                        </div>
                                        <div class="media-body">
                                            <span>Nguyá»n VÄn A</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a href="">
                                    <div class="media">
                                        <div class="user-profile">
                                            <img src="assets/img/90x90.jpg" alt="admin-profile" class="img-fluid">
                                        </div>
                                        <div class="media-body">
                                            <span>Nguyá»n VÄn B</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a href="">
                                    <div class="media">
                                        <div class="user-profile">
                                            <img src="assets/img/90x90.jpg" alt="admin-profile" class="img-fluid">
                                        </div>
                                        <div class="media-body">
                                            <span>Äá» Thá» Nga</span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                            <div class="dropdown-item">
                                <a href="">
                                    <div class="media">
                                        <div class="user-profile">
                                            <img src="assets/img/90x90.jpg" alt="admin-profile" class="img-fluid">
                                        </div>
                                        <div class="media-body">
                                            <span>LÃª Ngá»c HÃ </span>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </li>

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
                                <a href="./personal-infor-moderator.jsp" 
                                   class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-user-11"></i>
                                        <span>Thông tin tài khoản</span>
                                    </div>
                                </a>
                            </li>
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
                        </ul>
                    </nav>

                </div>
            </div>
            <!--  END MODERN  -->

            <!--  BEGIN CONTENT PART  -->
            <div id="content" class="main-content container">
                <a href="moderator-list-product.jsp" class="btn btn-primary btn-order"> Trở về d/s sp chờ duyệt</a>
                <p>&nbsp;</p>
                <h4 class="h3-order">Chi tiết sản phẩm</h4>
                <div class="widget-content widget-content-area view-order-detail">
                    <div class="table-responsive mb-4">
                        <table id="ecommerce-product-list" class="table  table-bordered">
                            <thead>
                                <tr class="text-center">
                                    <th>Ảnh</th>
                                    <th>Tên</th>
                                    <th>Khoảng giá</th>
                                    <th>Khu vực giao hàng</th>
                                    <th>Giấy tờ chứng nhận </th>
                                    <th>Trạng thái </th>
                                </tr>
                            </thead>
                            <tbody >
                                <tr  class="text-center">
                                    <td class="text-center"><img class="product-list-img" src="assets/img/90x90.jpg"></td>
                                    <td>Vải thiều siêu ngọt Bắc Giang  - Giống vải không hạt, mọng nước</td>
                                    <td>
                                        50 - 500 kg: <b>đ139.000</b><br>
                                        150 - 600 kg: <b>đ99.000<br></b>
                                        250 - 700 kg: <b>đ19.000</b>
                                    </td>
                                    <td>sd</td>
                                    <td>ssss</td>
                                    <td><button class=" btn btn-success status mb-2" id="approved">  Đã phê duyệt </button>
                                    <button class=" btn btn-danger status mb-2" id="approved"> Bị từ chối </button>
                                    </td>
                                </tr>
                            </tbody>

                        </table>
                    </div>
                </div>
                <div class="view-order">
                    <div class="summary-order">
                        <table >
                             <tr>
                                <th>Tổng quan cửa hàng</th>
                                <td>
                                    Lorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elit
                                </td>
                            </tr>

                            <tr>
                                <th>Danh mục hàng</th>
                                <td>02</td>
                            </tr>
                            <tr>
                                <th>Mã Barcode / SKU</th>
                                <td>Hoàng Xoan</td>
                            </tr>
                            <tr>
                                <th>Tên loại sản phẩm</th>
                                <td>0123456789</td>
                            </tr>
                            <tr>
                                <th>Thương hiệu</th>
                                <td>Nam Sách Hải Dương</td>
                            </tr>
                            <tr>
                                <th>Hương vị</th>
                                <td>127,000đ</td>
                            </tr>
                            <tr>
                                <th>Màu sắc</th>
                                <td>Lorem ipsum dolor, sit amet consectetur adipisicing elit.</td>
                            </tr>
                            <tr>
                                <th>Trọng lượng</th>
                                <td>Lodipisiciit.</td>
                            </tr>
                            <tr>
                                <th>Kiểu đóng gói</th>
                                <td>Lorelit.</td>
                            </tr>
                            <tr>
                                <th>Thành phần</th>
                                <td>Lorem r adipisicing elit.</td>
                            </tr>
                            <tr>
                                <th>Xuất xứ</th>
                                <td>Lorem ipsum dolorng elit.</td>
                            </tr>
                            <tr>
                                <th>Ngày sản xuất</th>
                                <td>icing elit.</td>
                            </tr>
                            <tr>
                                <th>Ngày hết hạn</th>
                                <td>Loremelit.</td>
                            </tr>
                            <tr>
                                <th>Mô tả sản phẩm</th>
                                <td>
                                    Lorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elitLorem ipsum dolorng elit
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="button-status ">
                        <h5>Hành động</h5>
                        <button class=" btn btn-success status mb-2" id="approved">  Phê duyệt </button>
                        <button class=" btn btn-danger status mb-2" id="canceled">  Từ chối </button>

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