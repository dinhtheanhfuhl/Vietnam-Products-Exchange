<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Danh sách người dùng hệ thống </title>
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
                    <h2 id="logoheader" style="color: #359640;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
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
                                <a href="./personal-infor-admin.jsp" 
                                   class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-user-7"></i>
                                        <span>Thông tin tài khoản</span>
                                    </div>
                                </a>

                            </li>
                            <li class="menu">
                                <a href="./listuser.jsp" 
                                   class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-user-1"></i>
                                        <span>Quản lý tài khoản</span>
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

                                <div class="widget-header">
                                    <div class="page-header ">
                                        <div class="page-title col-xl-12 col-md-12 col-sm-12 col-12 mb-5">
                                            <h3>Quản lý người dùng hệ thống</h3>
                                            <!-- <a href="./add-staff.html" class="btn btn-warning">Thêm nhân viên</a> -->
                                        </div>
                                    </div>
                                    <div class="widget-header mb-5">
                                        <div class="row">

                                            <div class="col-lg-12">
                                                <form class="top-action" method="GET" action="">
                                                    <div id="filter">
                                                        <input type="text" name="id" placeholder="Tên người dùng" value="" class="form-control">
                                                        <input type="text" name="address" placeholder="Tên nhà cung cấp" value=""
                                                               class="form-control">
                                                        <select class="form-control" >
                                                            <option value="male">Hà Nội</option>
                                                            <option value="female">Thanh Hoá</option>
                                                            <option value="other">Hải Dương</option>
                                                        </select>
                                                        <input type="text" name="address" placeholder="Số điện thoại" value=""
                                                               class="form-control">
                                                        <input type="email" name="address" placeholder="Email" value=""
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
                                </div>

                                <div class="widget-content widget-content-area">
                                    <div class="table-responsive mb-4">
                                        <table id="ecommerce-product-list" class="table  table-bordered">
                                            <thead>
                                                <tr class="text-center">
                                                    <th>STT</th>
                                                    <th>Tên người dùng</th>
                                                    <th>Tên nhà cung cấp</th>
                                                    <th>Khu vực</th>
                                                    <th>SĐT</th>
                                                    <th>Role</th>
                                                    <th>Email</th>
                                                    <th>Chi tiết</th>
                                                </tr>
                                            </thead>
                                            <tbody class="text-center">
                                                <tr>
                                                    <td>001</td>
                                                    <!-- <td class="text-center">
                                                        <a class="product-list-img" href="javascript: void(0);"><img src="../assets/img/60x60.jpg" alt="product"></a></td> -->
                                                    <td>Lan</td>
                                                    <td>Lan</td>
                                                    <td>1/1/1990</td>
                                                    <td>0385647925</td>
                                                    <td>cb@gmail.com</td>
                                                    <td>Hà nội</td>
                                                    <td>2/3/2021</td>
                                                    <!-- <td class="align-center">
                                                        <ul class="table-controls">
                                                            <li>
                                                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Edit">
                                                                    <i class="flaticon-edit"></i>
                                                                </a>
                                                            </li>
                                                            <li>
                                                                <a href="javascript:void(0);" data-toggle="tooltip" data-placement="top" title="Delete">
                                                                    <i class="flaticon-delete-5"></i>
                                                                </a>
                                                            </li>
                                                        </ul>
                                                    </td> -->
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

        <!--  BEGIN FOOTER  -->

        <footer class="footer-section theme-footer">

            <div class="footer-section-1  sidebar-theme">

            </div>

            <div class="footer-section-2 container-fluid">
                <div class="row">
                    <div id="toggle-grid" class="col-xl-7 col-md-6 col-sm-6 col-12 text-sm-left text-center">
                        <ul class="list-inline links ml-sm-5">
                            <li class="list-inline-item">
                                <a target="_blank" href="#">OrFarm Store</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-xl-5 col-md-6 col-sm-6 col-12">
                        <ul
                            class="list-inline mb-0 d-flex justify-content-sm-end justify-content-center mr-sm-3 ml-sm-0 mx-3">
                            <li class="list-inline-item  mr-3">
                                <p class="bottom-footer">&#xA9; 2022 <a target="_blank" href="#">OrFarm Store</a></p>
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
                <p class="user-name mt-4 mb-4">HoÃ ng Thá» Xoan</p>
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