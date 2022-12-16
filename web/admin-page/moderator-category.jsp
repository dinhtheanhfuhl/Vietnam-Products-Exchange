<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <link href="${pageContext.request.contextPath}/assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />\
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
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
                                <a href="ModeratorController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>Danh sách<br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="ModeratorOrderController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>Danh sách<br> đơn hàng</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="ModeratorCategoryController" class="dropdown-toggle collapsed">
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
                            <div style="margin-top: 80px;" class="statbox widget box">
                                <h3>Danh sách danh mục</h3>
                                <div class="widget-content-area">
                                    <a href="ModeratorAddCateController?action=show"><button style="background-color: #439A97; color: #F5F5F5 !important;" class=" btn status mb-2" id="approved">  Thêm danh mục cấp 1 </button></a>
                                    <a href="ModeratorAddSubCateController?action=show"><button style="background-color: #439A97; color: #F5F5F5 !important;" class=" btn status mb-2" id="approved">  Thêm danh mục cấp 2 </button></a>
                                    <div class="table-responsive new-products">
                                        <table class="table table-bordered table-striped">

                                            <tbody class="text-center">
                                                <tr style="background-color: #F5AB1E !important;color: #F5F5F5 !important;">
                                                    <th>ID</th>
                                                    <th>Danh mục cấp 1</th>
                                                    <th>Danh mục cấp 2</th>
                                                    <th>Xoá</th>
                                                </tr>
                                                <c:forEach var="key" items="${mapSubcategorys.keySet()}">
                                                    <tr style="text-align: left;">
                                                        <td>${key.cateId}</td>
                                                        <td>${key.cateName}</td>
                                                        <c:if test="${mapSubcategorys.get(key).size()>0}">
                                                            <td>${mapSubcategorys.get(key).get(0).subCateName}</td>
                                                            <td style="text-align: center;" ><a class="delete-button-subcate" data-toggle="modal" 
                                                                   data-link="ModeratorCategoryController?action=delete&id=${mapSubcategorys.get(key).get(0).subCateId}"  
                                                                   onclick="deleteFunction(this.dataset.link)"   
                                                                   <c:if test="${mapSubcategoryStatus.get(mapSubcategorys.get(key).get(0)) == false}">data-target="#exampleModal1" </c:if>
                                                                   <c:if test="${mapSubcategoryStatus.get(mapSubcategorys.get(key).get(0)) == true}">data-target="#exampleModal2" </c:if>
                                                                       href="#"><i class="flaticon-delete"></i></a></td>
                                                            </tr>
                                                    </c:if>
                                                    <c:if test="${mapSubcategorys.get(key).size()>1}">
                                                        <c:forEach var="subcategory" items="${mapSubcategorys.get(key)}">
                                                            <c:if test="${subcategory!=mapSubcategorys.get(key).get(0)}">
                                                                <tr style="text-align: left;">
                                                                    <td></td>
                                                                    <td></td>
                                                                    <td>${subcategory.subCateName}</td>
                                                                    <td style="text-align: center;"><a class="delete-button-subcate" data-toggle="modal" 
                                                                           data-link="ModeratorCategoryController?action=delete&id=${subcategory.subCateId}"  
                                                                           onclick="deleteFunction(this.dataset.link)"   
                                                                           <c:if test="${mapSubcategoryStatus.get(subcategory) == false}">data-target="#exampleModal1" </c:if>
                                                                           <c:if test="${mapSubcategoryStatus.get(subcategory) == true}">data-target="#exampleModal2" </c:if>
                                                                               href="#"><i class="flaticon-delete"></i></a></td>
                                                                    </tr>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </c:forEach>
                                            <script>
                                                function deleteFunction(str) {
                                                    const linkBtn = document.querySelector("#delete-btn-sub-link");
                                                    linkBtn.setAttribute("href", str);
                                                }
                                            </script>               
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
            <div class="modal fade" id="exampleModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Bạn có muốn xoá danh mục này?
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-danger status mb-2" data-dismiss="modal">Huỷ</a>
                            <a id="delete-btn-sub-link" href="" type="button" class="btn btn-warning status mb-2">Có</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Danh mục này đang chứa sản phẩm. Không thể xoá.
                        </div>
                        <div class="modal-footer">
                            <a type="button" class="btn btn-danger status mb-2" data-dismiss="modal">Huỷ</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END MAIN CONTAINER -->
            <!-- END MAIN CONTAINER -->

            <!--  BEGIN FOOTER  -->


            <!--  END FOOTER  -->

            <!--  BEGIN PROFILE SIDEBAR  -->
            <%@include file="aside.jsp" %>
            <!--  BEGIN PROFILE SIDEBAR  -->
    </body>
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


</html>