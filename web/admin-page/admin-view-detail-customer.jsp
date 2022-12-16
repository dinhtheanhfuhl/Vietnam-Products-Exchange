<!DOCTYPE html>
<%
    if (session.getAttribute("roleIdLoggin") == null || (int) session.getAttribute("roleIdLoggin") != 1) {
        request.getRequestDispatcher("../common/error.jsp").forward(request, response);
        return;
    }
%>
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
                                <a href="AdminController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-user-1"></i>
                                        <span>Danh sách <br> người dùng</span>
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
                    <h1 class="text-center">Thông tin người dùng</h1>
                    <div class="row profile">
                        <div class="col-md-3 mt-50 mb-50">
                            <div class="profile-sidebars">
                                <div class="profile-userpic"> <img
                                        src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                                        class="img-responsive " alt="ThÃ´ng tin cÃ¡ nhÃ¢n">

                                </div>
                                <div class="profile-usertitle">
                                    <div class="profile-usertitle-name">${cus.customerName}</div>
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
                                                    <p type="text" id="inputpass"
                                                       value="" >${cus.customerName}</p>
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
                                                    <p type="text" id="inputpass"
                                                       value="" >${cus.dateBirth}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>

                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" style="margin-left: 5px;" class="form-label pass-infor">Giới tính</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <p type="text" id="inputpass"
                                                       value="" >${cus.gender}</p>
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
                                                    <p type="text" id="inputpass"
                                                       value="" >${cus.email}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>

                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Số điện thoại</label>
                                                </td>

                                                <td class="display-userName-3">
                                                    <p type="text" id="inputpass"
                                                       value="" >${cus.phone}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Nhà cung cấp</label>
                                                </td>

                                                <td class="display-userName-3">
                                                    <p type="text" id="inputpass"
                                                       value="" >${cus.shopName}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label for="inputpass" class="form-label pass-infor">Địa chỉ chính</label>
                                                </td>

                                                <td class="display-userName-3">
                                                    <p>${cus.mainAddress}</p>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label class="form-label pass-infor">Giấy phép</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <a href="">Tải xuống giấy phép</a>
                                                </td>
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td><label class="form-label pass-infor">Trạng thái</label>
                                                </td>
                                                <td class="display-userName-3">
                                                    <c:choose>
                                                        <c:when test="${acc.status==1}">Chờ phê duyệt</c:when>
                                                        <c:when test="${acc.status==2}">Đã chấp thuận</c:when>
                                                        <c:when test="${acc.status==3}">Từ chối tài khoản</c:when>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <c:if test="${acc.status==3}">
                                    <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <label style="margin-left: -10px"; class="form-label pass-infor">Lý do bị từ chối</label>
                                                    </td>

                                                    <td class="display-userName-3">
                                                        <p>${ma.messageDescribe}p</p>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${acc.status==1}">
                                    <div class="col-md-8 col-sm-6 pt-4 pb-4">
                                        <table>
                                            <tbody>
                                                <tr>
                                                    <td><label style="margin-left: -10px"; class="form-label pass-infor">Hành động</label>
                                                    </td>
                                                    <td class="display-userName-3">
                                                        <a href="DetailCustomerController?action=accept&acc-id=${acc.accId}&cus-id=${cus.customerId}" class="btn btn-success mb-1">Phê duyệt tài khoản</a>
                                                        <button href="" class="btn btn-danger mb-1" data-toggle="modal" data-target="#exampleModal">Từ chối tài khoản</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>

                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Từ chối tài khoản</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <form action="DetailCustomerController?action=reject&acc-id=${acc.accId}&cus-id=${cus.customerId}" method="POST" id="reject-form">
                                                            <div class="form-group">
                                                                <label for="message-text" class="col-form-label">Lý do từ chối: </label>
                                                                <textarea name="reason" class="form-control" id="message-text"></textarea>
                                                            </div>
                                                        </form>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Huỷ</button>
                                                        <input type="submit" value="Gửi" class="btn btn-success" form="reject-form"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
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
    <script>
        $('#exampleModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget) // Button that triggered the modal
            var recipient = button.data('whatever') // Extract info from data-* attributes
            // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
            // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
            var modal = $(this)
            modal.find('.modal-body input').val(recipient)
        })
    </script>
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