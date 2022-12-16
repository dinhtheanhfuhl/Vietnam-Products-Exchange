<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
        <title>Thông tin tài khoản </title>
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css" />
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="assets/css/style.css">

        <!--====== Style css ======-->
        <link rel="stylesheet" href="assets/scss/style.css">
        <!--  END CUSTOM STYLE FILE  -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/ecommerce/addedit_product.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
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


            <!--  END MODERN  -->

            <!--  BEGIN CONTENT PART  -->
            <div id="content" class="main-content">
                <!--  BEGIN CONTENT PART  -->

                <div class="container main-infor" style="margin-top: 3%">
                    <h1 class="text-center">Thông tin cá nhân</h1>
                    <div class="row profile">
                        <div class="col-md-3 mt-50 mb-50">
                            <div class="profile-sidebars">
                                <div class="row profile-userpic"> <img style="width: 150px;height: 150px;"
                                        <c:choose>
                                            <c:when test='${sys.avartarImg==""||sys.avartarImg==null}'>
                                                src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                                            </c:when>
                                            <c:otherwise>
                                                src="uploads/${sys.avartarImg}"
                                            </c:otherwise>
                                        </c:choose>
                                        
                                        
                                        
                                        class="img-responsive " alt="ThÃ´ng tin cÃ¡ nhÃ¢n">

                                </div>
                                <div class="profile-usertitle">
                                    <div class="profile-usertitle-name">${sys.name}</div>
                                </div>
                                <div class="profile-userbuttons">
                                    <form action="InforController" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="action" value="uploadImg"/>
                                        <input name="img" class="form-control" type="file" id="formFile">
                                        <button type="submit" class="btn btn-success btn-sm mt-3">Cập nhật</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9 mt-50 mb-50">
                            <div class=" personal-infor ">
                                <div class="col-md-12 col-sm-12 pt-4 pb-4">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td style="vertical-align: text-top">Tên người dùng</td>
                                                <td style="vertical-align: text-top">${sys.name}</td>
                                                <td style="vertical-align: text-top"> </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: text-top">Ngày sinh</td>
                                                <td style="vertical-align: text-top">${sys.dateBirth}</td>
                                                <td style="vertical-align: text-top"> </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: text-top">Giới tính</td>
                                                <td style="vertical-align: text-top">${sys.gender}</td>
                                                <td style="vertical-align: text-top"> </td>
                                            </tr>
                                            <tr>
                                                <td style="vertical-align: text-top">Email</td>
                                                <td style="vertical-align: text-top">${sessionScope.emailLoggin}</td>
                                                <td style="vertical-align: text-top"> </td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <td>${sys.phone}</td>
                                                <td><button type="submit" id="btn-edit" for="formGroupExampleInput"
                                                            class="btn btn-warning ml-10">Chỉnh sửa</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-md-8 col-sm-6 pt-3">
                                    <form action="InforController" method="POST">
                                        <input type="hidden" name="action" value="changePhone"/>
                                        <div class="hidden-edit pt-3" style="height: 170px;">
                                            <div class="form-group ">
                                                <label for="inputName" class="col-sm-6 col-form-label">Số điện thoại mới</label>
                                                <div class="col-sm-10">
                                                    <input name="newPhone" type="text" class="form-control appear-input mb-3 " id="inputName"
                                                           placeholder="nhập số điện thoại mới" aria-label="First name">

                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-secondary updated-infor ml-10 mt-25">Cập
                                                nhật</button>
                                            <button type="submit" class="btn btn-secondary exit ml-10 mt-25">Hủy</button>
                                        </div>
                                    </form>
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
                            <a target="_blank" href="#">Vietnam products exchange</a>
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
    <script src="assets/js/libs/jquery-3.1.1.min.js"></script>
    <script src="assets/js/loader.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="plugins/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="plugins/blockui/jquery.blockUI.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script>
        $(document).ready(function () {
            App.init();
        });
    </script>
    <script src="assets/js/custom.js"></script>
    <!-- END GLOBAL MANDATORY SCRIPTS -->

    <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    <script src="plugins/charts/chartist/chartist.js"></script>
    <script src="plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.min.js"></script>
    <script src="plugins/maps/vector/jvector/worldmap_script/jquery-jvectormap-world-mill-en.js"></script>
    <script src="plugins/calendar/pignose/moment.latest.min.js"></script>
    <script src="plugins/calendar/pignose/pignose.calendar.js"></script>
    <script src="plugins/progressbar/progressbar.min.js"></script>
    <script src="assets/js/default-dashboard/default-custom.js"></script>
    <script src="assets/js/ui-kit/timeline/horizontal-main.js"></script>
    <script src="plugins/charts/amcharts/amcharts.js"></script>
    <script src="plugins/maps/vector/ammaps/ammap_amcharts_extension.js"></script>
    <script src="plugins/maps/vector/ammaps/worldLow.js"></script>
    <script src="plugins/charts/amcharts/radar.js"></script>
    <script src="plugins/charts/amcharts/pie.js"></script>
    <script src="plugins/charts/sparklines/jquery.sparkline.min.js"></script>
    <script src="plugins/charts/amcharts/serial.js"></script>
    <script src="plugins/charts/amcharts/light.js"></script>
    <script src="assets/js/ecommerce-dashboard/ecommerce-custom.js"></script>
    <script src="plugins/table/datatable/datatables.js"></script>
    <script src="plugins/progressbar/progressbar.min.js"></script>
    <script src="assets/js/ecommerce/order.js"></script>
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