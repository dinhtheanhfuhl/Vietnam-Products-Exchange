<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
        <title>Thông tin tài khoản</title>
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="../assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css" />
        <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="../plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="../assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="../assets/css/style.css">

        <!--====== Style css ======-->
        <link rel="stylesheet" href="assets/scss/style.css">
        <!--  END CUSTOM STYLE FILE  -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="../plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="../plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="../assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/ecommerce/addedit_product.css" rel="stylesheet" type="text/css" />
        <link href="../assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
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
                <a class="navbar-brand waves-effect">
                    <h2 id="logoheader" style="color: #F5AB1E;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
                </a>
            </div>
            <ul class="navbar-nav flex-row mr-auto">
                <li class="nav-item ml-4 d-lg-none d-sm-block d-none">
                    <form class="form-inline search-full form-inline search animated-search" role="search">
                        <i class="flaticon-search-1 d-lg-none d-block"></i>
                        <input type="text" class="form-control search-form-control ml-lg-auto" placeholder="">
                    </form>
                </li>

            </ul>

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
                                        <span>Danh sách<br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="./moderator-list-order.jsp" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>Danh sách<br> đơn hàng</span>
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
                <!--  BEGIN CONTENT PART  -->

                <div class="container main-infor" style="margin-top: 10%">
                    <h1 class="text-center">Thông tin cá nhân</h1>
                    <div class="row profile">
                        <div class="col-md-3 mt-50 mb-50">
                            <div class="profile-sidebars">
                                <div class="profile-userpic"> <img
                                        src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                                        class="img-responsive " alt="ThÃ´ng tin cÃ¡ nhÃ¢n">

                                </div>
                                <div class="profile-usertitle">
                                    <div class="profile-usertitle-name"> Tên người dùng</div>
                                </div>
                                <div class="profile-userbuttons">
                                    <button type="button" class="btn btn-success btn-sm"> Upload Image</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9 mt-50 mb-50">
                            <div class=" personal-infor ">
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Tên người dùng</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <input type="text" required class="form-control" id="inputpass"
                                                           placeholder="tên người dùng">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Ngày sinh</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <input type="date" required class="form-control" id="inputpass"
                                                           placeholder="ngày sinh">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Giới tính</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <select class="form-control" name="gender" id="gender">
                                                        <option value="male">Nam</option>
                                                        <option value="female">Nữ</option>
                                                        <option value="other">Khác</option>
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Email</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <input type="email" required class="form-control" id="inputpass"
                                                           placeholder="email">
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="col-md-8 col-sm-6 pt-3">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td> <label for="formGroupExampleInput" class="name-infor" style="margin-left: -20px;">Số điện thoại</label>
                                                </td>
                                                <td class="display-userName">
                                                    <input style="margin-left: 22px;" type="text" class="form-control" id="formGroupExampleInput"
                                                           placeholder="số điện thoại">
                                                </td>
                                                <td> <button type="submit" id="btn-edit" for="formGroupExampleInput"
                                                             class="btn btn-warning ml-10">Chỉnh sửa</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="hidden-edit pt-3" style="height: 170px;">
                                        <div class="form-group ">
                                            <label for="inputName" class="col-sm-6 col-form-label">Số điện thoại mới</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control appear-input mb-3 " id="inputName"
                                                       placeholder="nhập số điện thoại mới" aria-label="First name">

                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-secondary updated-infor ml-10 mt-25">Cập
                                            nhật</button>
                                        <button type="submit" class="btn btn-secondary exit ml-10 mt-25">Hủy</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!--  END CONTENT PART  -->
        </div>
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
    <aside class="profile-sidebar text-center">
        <div class="profile-content profile-content-scroll">
            <div class="usr-profile">
                <img src="../assets/img/90x90.jpg" alt="admin-profile" class="img-fluid" />
            </div>
            <p class="user-name mt-4 mb-4">HXoan</p>
            <div class="user-links text-left">
                <ul class="list-unstyled">
                    <li>
                        <a href="./personal-infor-moderator.jsp"><i class="flaticon-user-11"></i> Thông tin cá nhân</a>
                    </li>
                    <li>
                        <a href="moderator-list-product.jsp"><i class="flaticon-globe"></i> Quản lý</a>
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
    <script src="../plugins/table/datatable/datatables.js"></script>
    <script src="../plugins/progressbar/progressbar.min.js"></script>
    <script src="../assets/js/ecommerce/order.js"></script>
    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
</body>

</html>
<script>

                                        document.getElementById("btn-edit").onclick = function () {

                                            document.querySelector(".personal-infor .hidden-edit").style.display = 'block';
                                            document.querySelector(".personal-infor .hidden-edit").style.margin = '0 0 0 22%';
                                            document.querySelector(".personal-infor .name-infor").style.padding = '0 0 0 43%';
                                            document.querySelector(".personal-infor table .display-userName").style.display = 'none';
                                            document.querySelector(".personal-infor #btn-edit").style.display = 'none';
                                        };
                                        document.querySelector(".exit").onclick = function () {

                                            document.querySelector(".personal-infor .hidden-edit").style.display = 'none';
                                            document.querySelector(".personal-infor table .display-userName").style.display = 'block';
                                            document.querySelector(".personal-infor .name-infor").style.padding = '0 0 0 24%';
                                            document.querySelector(".personal-infor #btn-edit").style.display = 'block';
                                        };
                                        document.getElementById("btn-edit-2").onclick = function () {

                                            document.querySelector(".personal-infor .hidden-pass").style.display = 'block';
                                            document.querySelector(".personal-infor .hidden-pass").style.margin = '0 0 0 22%';
                                            document.querySelector(".personal-infor .pass-infor").style.padding = '0 0 0 43%';
                                            document.querySelector(".personal-infor table .display-userName-3").style.display = 'none';
                                            document.querySelector(".personal-infor #btn-edit-2").style.display = 'none';
                                        };
                                        document.querySelector(".exit-pass").onclick = function () {
                                            document.querySelector(".personal-infor .hidden-pass").style.display = 'none';
                                            document.querySelector(".personal-infor table .display-userName-3").style.display = 'block';
                                            document.querySelector(".personal-infor .pass-infor").style.padding = '0 0 0 24%';
                                            document.querySelector(".personal-infor #btn-edit-2").style.display = 'block';
                                        };
</script>

</html>