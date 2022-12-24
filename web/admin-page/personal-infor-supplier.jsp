<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" />
        <title>Thông tin tài khoản</title>
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
        <!--  END CUSTOM STYLE FILE  -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce/addedit_product.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

                <div class="container main-infor" style="margin-top: 10%">
                    <h1 class="text-center">Thông tin người dùng</h1>
                    <div class="row profile">
                        <div class="col-md-3 mt-50 mb-50">
                            <div class="profile-sidebars">
                                <div class="profile-userpic"> 
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
                                         class="img-responsive">
                                </div>
                                <div class="profile-usertitle">
                                    <div class="profile-usertitle-name">${sessionScope.supplier.supplierName}</div>
                                    <form action="InforController" method="POST" enctype="multipart/form-data">
                                        <input type="hidden" name="action" value="changeImg"/>
                                        <input name="img" class="p-2 bg-white" onchange="this.form.submit()" type="file"/>
                                    </form>
                                </div>
                                <div class="profile-userbuttons">

                                </div>
                            </div>
                        </div>
                        <div class="col-md-9 mt-50 mb-50">
                            <div class=" personal-infor ">
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label for="inputpass" class="form-label pass-infor">Tên người dùng</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">

                                                    <p>${sessionScope.supplier.supplierName}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label for="inputpass" class="form-label pass-infor">Ngày sinh</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">

                                                    <p>${sessionScope.supplier.dateBirth}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label id="inputpass" class="form-label pass-infor">Giới tính</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">

                                                    <p>${sessionScope.supplier.gender}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label for="inputpass" class="form-label pass-infor">Email</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">

                                                    <p>${sessionScope.supplier.email}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label style="margin-left: -15px;" class="form-label pass-infor">Số điện thoại</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">
                                                    <p style="margin-left: 13px;" >${sessionScope.supplier.phone}</p>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;"> <button type="submit" id="btn-edit" for="formGroupExampleInput1"
                                                                                                            class="btn btn-warning ml-10">Chỉnh sửa</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="hidden-edit pt-3" style="height: 170px;">
                                        <form action="InforController" method="POST">
                                            <input type="hidden" name="action" value="changePhone"/>
                                            <div class="form-group ">
                                                <label for="inputName" class="col-sm-6 col-form-label">Số điện thoại mới</label>
                                                <div class="col-sm-10">
                                                    <input name="phone" type="text" class="form-control appear-input mb-3 " id="inputName" placeholder="nhập số điện thoại mới" aria-label="First name">
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-secondary updated-infor ml-10 mt-25">Cập
                                                nhật</button>
                                            <button type="button" class="btn btn-secondary exit ml-10 mt-25">Hủy</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label id="suppliertext" class="form-label pass-infor">Nhà cung cấp</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">
                                                    <p id="supplierinput"   
                                                       >${sessionScope.supplier.shopName}</p>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;"> <button type="submit" id="btn-edit-2" for="formGroupExampleInput"
                                                                                                            class="btn btn-warning ml-10">Chỉnh sửa</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="hidden-pass pt-3" style="height: 170px;">
                                        <form action="InforController" method="POST">
                                            <input type="hidden" name="action" value="changeShopName" />
                                            <div class="form-group ">
                                                <label for="inputName" class="col-sm-6 col-form-label">Nhà cung cấp</label>
                                                <div class="col-sm-10">
                                                    <input name="shopName" type="text" class="form-control appear-input mb-3 " placeholder="nhập tên nhà cung cấp" aria-label="First name">
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-secondary updated-infor ml-10 mt-25">Cập nhật</button>
                                            <button type="button" class="btn btn-secondary exit-pass ml-10 mt-25">Hủy</button>
                                        </form>
                                    </div>
                                </div>

                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label id="suppliertext" class="form-label pass-infor">Địa chỉ chính</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">
                                                    <p style="margin-left: 13px;">${sessionScope.supplier.mainAddress}</p>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;"> <button type="submit" id="btn-edit-3" for="formGroupExampleInput"
                                                                                                            class="btn btn-warning ml-10">Chỉnh sửa</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div class="hidden-pass-3 pt-3" style="height: 170px;">
                                        <form action="InforController" method="POST">
                                            <input type="hidden" name="action" value="changeMainAddress"/>
                                            <div class="form-group ">
                                                <label for="inputName" class="col-sm-6 col-form-label">Địa chỉ chính</label>
                                                <div class="col-sm-10">
                                                    <input name="mainAddress" type="text" class="form-control appear-input mb-3 " id="inputName" placeholder="nhập tên địa chỉ chính" aria-label="First name">
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-secondary updated-infor ml-10 mt-25">Cập nhật</button>
                                            <button type="button" class="btn btn-secondary exit-pass-3 ml-10 mt-25">Hủy</button>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label for="inputName" class="form-label pass-infor">Giấy phép kinh doanh</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top;" class="display-userName-3">
                                                    <form action="DownLoadFileController" method="POST">
                                                        <input type="hidden" name="action" value="downloadFile"/>
                                                        <input type="hidden" name="file" value="${sessionScope.supplier.businessLicense}"/>
                                                        <button type="submit" class="btn btn-info">Tải xuống giấy phép <i class="fa fa-download"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td style="text-align: left; vertical-align: top;"><label for="inputName" class="form-label pass-infor">Trạng thái</label>
                                                </td>
                                                <td style="text-align: left; vertical-align: top" class="display-userName-3">
                                                    <c:choose>
                                                        <c:when test="${account.status == true}">
                                                            <a class="btn btn-success">Đang hoạt động</a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="DetailSuppilerController?action=accept-account&sup-id=${sessionScope.supplierId}&acc-id=${account.accId}" class="">Tài khoản đã được thuận</a>
                                                        </c:otherwise>
                                                    </c:choose>
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
                                                document.querySelector(".personal-infor #btn-edit").style.display = 'none';
                                            };
                                            document.querySelector(".exit").onclick = function () {

                                                document.querySelector(".personal-infor .hidden-edit").style.display = 'none';
                                                document.querySelector(".personal-infor #btn-edit").style.display = 'block';
                                            };

</script>
<script>

    document.getElementById("btn-edit-2").onclick = function () {

        document.querySelector(".personal-infor .hidden-pass").style.display = 'block';
        document.querySelector(".personal-infor .hidden-pass").style.margin = '0 0 0 22%';
        document.querySelector(".personal-infor #btn-edit-2").style.display = 'none';
    };
    document.querySelector(".exit-pass").onclick = function () {

        document.querySelector(".personal-infor .hidden-pass").style.display = 'none';
        document.querySelector(".personal-infor #btn-edit-2").style.display = 'block';
    };</script>

<script>

    document.getElementById("btn-edit-3").onclick = function () {

        document.querySelector(".personal-infor .hidden-pass-3").style.display = 'block';
        document.querySelector(".personal-infor .hidden-pass-3").style.margin = '0 0 0 22%';
        document.querySelector(".personal-infor #btn-edit-3").style.display = 'none';
    };
    document.querySelector(".exit-pass-3").onclick = function () {

        document.querySelector(".personal-infor .hidden-pass-3").style.display = 'none';
        document.querySelector(".personal-infor #btn-edit-3").style.display = 'block';
    };</script>

</html>