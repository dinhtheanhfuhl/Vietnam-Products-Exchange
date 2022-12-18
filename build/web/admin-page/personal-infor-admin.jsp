<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
        <title>Thông tin tài khoản </title>
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="${pageContext.request.contextPath}/assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

        <!--====== Style css ======-->
        <link rel="stylesheet" href="assets/scss/style.css">
        <!--  END CUSTOM STYLE FILE  -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce/addedit_product.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
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
            <div id="content" style="margin-right: 125px" class="main-content">
                <!--  BEGIN CONTENT PART  -->

                <div class="container main-infor" style="margin-top: 10%">
                    <h1 class="text-center">Thông tin cá nhân</h1>
                    <div class="row d-flex align-items-stretch profile">
                        <div class="col-md-3 col-sm-12 mt-50 mb-50">
                            <div style="height: 100%;padding: 20px;" class="profile-sidebars">
                                <div class="profile-userpic row"> 
                                    <img style="object-fit: cover; width: 150px; height: 150px;"
                                         <c:choose>
                                             <c:when test='${sessionScope.systemManager!=null && sessionScope.systemManager.avartarImg!=null && sessionScope.systemManager.avartarImg!=""}'>
                                                 src="uploads/${sessionScope.systemManager.avartarImg}"
                                             </c:when>
                                             <c:when test='${sessionScope.supplier!=null && sessionScope.supplier.avartarImg!=null && sessionScope.supplier.avartarImg!=""}'>
                                                 src="uploads/${sessionScope.supplier.avartarImg}"
                                             </c:when>
                                             <c:otherwise>
                                                 src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                                             </c:otherwise>
                                         </c:choose>
                                         class="img-responsive " alt="ThÃ´ng tin cÃ¡ nhÃ¢n">

                                </div>
                                <div class="profile-usertitle">
                                    <div class="profile-usertitle-name">${sessionScope.systemManager.name}</div>
                                </div>
                                <div class="profile-userbuttons">
                                    <form action="InforController" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="action" value="changeImg"/>
                                        <input name="img" onchange="this.form.submit()" class="form-control" type="file" id="formFile">
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-9 col-sm-12 mt-50 mb-50">
                            <div class=" personal-infor row">
                                <div class="col-md-9 col-sm-12 pt-4 pb-4">
                                    <table class="table">
                                        <tbody>
                                            <tr>
                                                <td>Tên người dùng</td>
                                                <td>${sessionScope.systemManager.name}</td>
                                                <td> </td>
                                            </tr>
                                            <tr>
                                                <td>Ngày sinh</td>
                                                <td>${sessionScope.systemManager.dateBirth}</td>
                                                <td> </td>
                                            </tr>
                                            <tr>
                                                <td>Giới tính</td>
                                                <td>${sessionScope.systemManager.gender}</td>
                                                <td> </td>
                                            </tr>
                                            <tr>
                                                <td>Email</td>
                                                <td>${sessionScope.systemManager.email}</td>
                                                <td> </td>
                                            </tr>
                                            <tr>
                                                <td>Số điện thoại</td>
                                                <td>
                                                    ${sessionScope.systemManager.phone} 
                                                    <button type="submit" id="btn-edit" for="formGroupExampleInput" class="btn btn-warning ml-10">Chỉnh sửa</button>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-md-8 col-sm-6 pt-3">
                                    <form action="InforController">
                                        <input type="hidden" name="action" value="changePhone"/>
                                        <div class="hidden-edit pt-3" style="height: 170px;">
                                            <div class="form-group ">
                                                <label for="inputName" class="col-sm-6 col-form-label">Số điện thoại mới</label>
                                                <div class="col-sm-10">
                                                    <input name="phone" minlength="10" maxlength="11" type="text" class="form-control appear-input mb-3 " id="inputName" placeholder="nhập số điện thoại mới" aria-label="First name">
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-secondary updated-infor ml-10 mt-25">Cập nhật</button>
                                            <button type="button" class="btn btn-secondary exit ml-10 mt-25">Hủy</button>
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
    <script src="${pageContext.request.contextPath}/plugins/table/datatable/datatables.js"></script>
    <script src="${pageContext.request.contextPath}/plugins/progressbar/progressbar.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/ecommerce/order.js"></script>
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