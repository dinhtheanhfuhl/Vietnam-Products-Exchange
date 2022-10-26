<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <title>Admin OrFarm </title>
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
            <a href="index.html" class=""> <img width="190px" src="../image/coollogo_com-7162464-removebg-preview.png"
                    class="img-fluid" alt="logo"></a>
        </div>
        <ul class="navbar-nav flex-row mr-auto">
            <li class="nav-item ml-4 d-lg-none d-sm-block d-none">
                <form class="form-inline search-full form-inline search animated-search" role="search">
                    <i class="flaticon-search-1 d-lg-none d-block"></i>
                    <input type="text" class="form-control search-form-control  ml-lg-auto" placeholder="Search...">
                </form>
            </li>
            <li class="nav-item d-lg-block d-none">
                <form class="form-inline form-inline search animated-search" role="search">
                    <i class="flaticon-search-1 d-lg-none d-block"></i>
                    <input type="text" class="form-control search-form-control" placeholder="Tìm kiếm tại đây...">
                </form>
            </li>
        </ul>

        <ul class="navbar-nav flex-row ml-lg-auto">

            <li
                class="nav-item dropdown language-dropdown ml-4 mr-4 pr-3 pl-3 align-self-center d-lg-inline-block d-none">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="flagDropdown" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                    <span class="">VN</span>
                </a>
            </li>


            <li class="nav-item dropdown message-dropdown ml-lg-4 mr-lg-4 d-sm-block d-none align-self-center">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="message-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="icon flaticon-mail-25"></span><span class="badge badge-primary">13</span>
                </a>
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
                                            <p class="meta-user-name mr-3 mb-0">Lê Văn Bình</p>
                                            <p class="meta-time align-self-center mb-0">04.11.21</p>
                                        </div>
                                        <p class="message-text mb-0 ">Chất lượng sản phẩm tốt</p>
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
                                            <p class="meta-title mr-3 mb-0">1 email mới</p>
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
                                            <p class="meta-user-name mr-3 mb-0">Bình An</p>
                                            <p class="meta-time align-self-center mb-0">04.02.21</p>
                                        </div>
                                        <p class="message-text mb-0 ">Chất lượng sản phẩm tốt </p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </li>

            <li class="nav-item dropdown notification-dropdown ml-3 mr-lg-4 align-self-center">
                <a href="javascript:void(0);" class="nav-link dropdown-toggle" id="notification-dropdown"
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="icon flaticon-bell-4"></span><span class="badge badge-success">15</span>
                </a>
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
                                        <span>Nguyễn Văn A</span>
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
                                        <span>Nguyễn Văn B</span>
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
                                        <span>Đỗ Thị Nga</span>
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
                                        <span>Lê Ngọc Hà</span>
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
                            <a href="./admin.html">
                                <div class="">
                                    <i class="flaticon-computer-6"></i>
                                    <span>Thống kê</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu">
                            <a href="./order.html" class="dropdown-toggle collapsed">
                                <div class="">
                                    <i class="flaticon-cart-1"></i>
                                    <span>Đơn hàng</span>
                                </div>
                            </a>

                        </li>
                        <li class="menu">
                            <a href="./product.html" class="dropdown-toggle collapsed">
                                <div class="">
                                    <i class="flaticon-home-line"></i>
                                    <span>Sản phẩm</span>
                                </div>
                            </a>
                        </li>

                        <li class="menu">
                            <a href="./hub.html" class="dropdown-toggle collapsed">
                                <div class="">
                                    <i class="flaticon-home-line"></i>
                                    <span>Kho Hàng</span>
                                </div>
                            </a>

                        </li>


                        <li class="menu">
                            <a href="#uiAccount" data-toggle="collapse" aria-expanded="false"
                                class="dropdown-toggle collapsed">
                                <div class="">
                                    <i class="flaticon-user-7"></i>
                                    <span>Tài khoản</span>
                                </div>
                            </a>
                            <div class="submenu list-unstyled collapse eq-animated eq-fadeInUp" id="uiAccount"
                                data-parent="#topAccordion">
                                <div class="submenu-scroll">
                                    <ul class="list-unstyled mt-4">
                                        <li>
                                            <ul class="list-unstyled sub-submenu collapse show eq-animated eq-fadeInUp"
                                                id="ui-features">
                                                <li>
                                                    <a href="./user.html">Khách hàng</a>
                                                </li>
                                                <li>
                                                    <a href="./staff.html">Nhân viên</a>
                                                </li>

                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
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
                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">

                        <div class="statbox widget box box-shadow">
                            <div class="widget-header">
                                <div class="page-header ">
                                    <div class="page-title col-xl-12 col-md-12 col-sm-12 col-12 mb-3">
                                        <h3>Danh sách khách hàng
                                        </h3>


                                    </div>
                                </div>

                                <div class="widget-header mb-5">
                                    <div class="row">

                                        <div class="col-lg-12">
                                            <form class="top-action" method="GET" action="">
                                                <div id="filter">
                                                    <input type="text" name="id" placeholder="ID" value=""
                                                        class="form-control">
                                                    <input type="text" name="address" placeholder="Tên" value=""
                                                        class="form-control">
                                                    <input type="text" name="address" placeholder="Số điện thoại"
                                                        value="" class="form-control">
                                                    <input type="email" name="address" placeholder="Email" value=""
                                                        class="form-control">

                                                    <button class="btn btn-info"
                                                        style="padding: 0 10px; background: none; border: none;"
                                                        title="Tìm kiếm">
                                                        <i class="flaticon-search" aria-hidden="true"
                                                            style="color:#469408;font-size: 25px;line-height: 42px;"></i>
                                                    </button>
                                                    <input name="export" type="submit" value="Xuất Excel"
                                                        class="btn btn-danger">

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
                                                <th>ID</th>

                                                <th>Họ Tên</th>

                                                <th>SĐT</th>
                                                <th>Email</th>
                                                <th>Địa chỉ</th>

                                                <th>Mật khẩu</th>
                                                <th>Hành động</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-center">
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td>001</td>
                                                <td>Trần Thị Lan</td>

                                                <td>0385647925</td>
                                                <td>cb@gmail.com</td>
                                                <td>Hà Nội</td>
                                                <td>0nhafurd</td>
                                                <td class="align-center">
                                                    <ul class="table-controls">
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Edit">
                                                                <i class="flaticon-edit"></i>
                                                            </a>
                                                        </li>
                                                        <li>
                                                            <a href="javascript:void(0);" data-toggle="tooltip"
                                                                data-placement="top" title="Delete">
                                                                <i class="flaticon-delete-5"></i>
                                                            </a>
                                                        </li>
                                                    </ul>
                                                </td>

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
            <p class="user-name mt-4 mb-4">Hoàng Thị Xoan</p>
            <p>LV-1</p>
            <progress id="file" value="32" max="100"> 32% </progress>

            <div class="user-links text-left">
                <ul class="list-unstyled">
                    <li>
                        <a href="#"><i class="flaticon-mail-22"></i> Email: abc@gmail.com</a>
                    </li>
                    <li>
                        <a href="#"><i class="flaticon-telephone"></i> Điện thoại: 0123458759</a>
                    </li>
                    <li>
                        <a href="#"><i class="flaticon-location-1"></i> Địa chỉ: Hà Nội</a>
                    </li>
                    <li>
                        <a href="#"><i class="flaticon-power-off"></i> Logout</a>
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
            "paginate": { "previous": "<i class='flaticon-arrow-left-1'></i>", "next": "<i class='flaticon-arrow-right'></i>" },
            "info": " Hiện thị _PAGE_ trong _PAGES_"
        },
        drawCallback: function (settings) { $('[data-toggle="tooltip"]').tooltip(); }
    });
</script>
<!--  END CUSTOM SCRIPT FILES  -->

</html>