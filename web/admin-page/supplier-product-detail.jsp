<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ecommerce/addedit_product.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->
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

            <div class="modernSidebar-nav header header navbar">
                <div class="">
                    <nav id="modernSidebar">
                        <ul class="menu-categories pl-0 m-0" id="topAccordion">

                            <li class="menu">
                                <a href="SupplierController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>Danh sách<br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="SupplierOrderController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>Danh sách<br> đơn hàng</span>
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
                <p>&nbsp;</p>

                <p>&nbsp;</p>
                <span></span>


                <div class="view-order">

                    <div class="summary-order">
                        <div style="margin-top: 70px" class="mt-10">
                            <h4>Chi tiết sản phẩm</h4>
                            <form style="margin-bottom: 20px" action="SupplierDetailPController" method="POST">
                                <c:choose>
                                    <c:when test="${product.statusId==1}">
                                        <input type="hidden" name="id" value="${product.productId}"/>
                                        <input type="hidden" name="action" value="cancel"/>
                                        <input style="min-width: 200px" type="submit" value="Huỷ yêu cầu" class="btn btn-danger"/>
                                    </c:when>
                                    <c:when test="${product.statusId==2}">
                                        <input type="hidden" name="id" value="${product.productId}"/>
                                        <input type="hidden" name="action" value="hidden"/>
                                        <input style="min-width: 200px" type="submit" value="Ẩn sản phẩm" class="btn btn-secondary"/>
                                    </c:when>
                                    <c:when test="${product.statusId==3}">
                                        <input type="hidden" name="id" value="${product.productId}"/>
                                        <input type="hidden" name="action" value="re-request"/>
                                        <input style="min-width: 200px" type="submit" value="Tạo lại sản phẩm" class="btn btn-secondary"/>
                                    </c:when>
                                    <c:when test="${product.statusId==4}">
                                        <input type="hidden" name="id" value="${product.productId}"/>
                                        <input type="hidden" name="action" value="cancel-hidden"/>
                                        <input style="min-width: 200px" type="submit" value="Bỏ ẩn sản phẩm" class="btn btn-success"/>
                                    </c:when>
                                </c:choose>
                            </form>
                        </div>
                        <table class="table table-bordered table-striped">
                            <tr>
                                <th style="min-width: 300px;padding-top: 50px;">Ảnh</th>
                                <td>
                                    <c:forEach var="img" items="${listProImgs}">
                                        <img style="width: 100px; height: 100px; object-fit: cover;" class="product-list-img" src="uploads/${img.imgPath}"> 
                                    </c:forEach>
                                </td>
                            </tr> 
                            <tr>
                                <th>Tên</th>
                                <td>
                                    ${product.productName}
                                    ${product.trademark}
                                    ${product.color},
                                    ${product.smell}
                                </td>
                            </tr> 
                            <tr>
                                <th style="padding-top:30px;">Khoảng giá</th>
                                <td>
                                    <c:forEach var="lp" items="${listProHies}">
                                        > ${lp.quantity} kg: <b> <span><fmt:formatNumber type = "number" 
                                                                                       pattern = "" value = "${lp.price}" /><sup>vnđ</sup>&nbsp;&nbsp;</span></b><br>
                                            </c:forEach>
                                </td>
                            </tr> 
                            <tr>
                                <th style="padding-top:20px;">Khu vực giao hàng</th>
                                <td>
                                    <c:forEach var="i" begin="0" end="${listCities.size()-2}" >
                                        <b>${listCities.get(i).cityName}, 
                                        </c:forEach>
                                        ${listCities.get(listCities.size()-1).cityName}</b> 
                                </td>
                            </tr> 
                            <tr>
                                <th>Danh mục hàng</th>
                                <td>${cate.cateName}</td>
                            </tr>
                            <tr>
                                <th>Mã Barcode / SKU</th>
                                <td>${product.barCode}</td>
                            </tr>
                            <tr>
                                <th>Tên loại sản phẩm</th>
                                <td>
                                    ${product.productName}
                                </td>
                            </tr>
                            <tr>
                                <th>Thương hiệu</th>
                                <td>${product.trademark}</td>
                            </tr>
                            <tr>
                                <th>Hương vị</th>
                                <td>${product.smell}</td>
                            </tr>
                            <tr>
                                <th>Màu sắc</th>
                                <td>${product.color}</td>
                            </tr>
                            <tr>
                                <th>Số lượng</th>
                                <td>
                                    <span><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${product.weight}" />Kg</span>
                                </td>
                            </tr>
                            <tr>
                                <th>Kiểu đóng gói</th>
                                <td>${product.packing}</td>
                            </tr>
                            <tr>
                                <th>Thành phần</th>
                                <td>${product.element}</td>
                            </tr>
                            <tr>
                                <th style="padding-top:20px;">Mô tả sản phẩm</th>
                                <td>${product.description}</td>
                            </tr>
                            <tr>
                                <th>Giấy tờ chứng nhận</th>
                                <td>
                                    <form action="DownLoadFileController" method="POST">
                                        <input type="hidden" name="action" value="downloadFile"/>
                                        <input type="hidden" name="file" value="${product.productCertificate}"/>
                                        <button type="submit" class="btn btn-info">Tải xuống giấy phép <i class="fa fa-download"></i></button>
                                    </form>
                                </td>
                            </tr>
                            <tr>
                                <th>Trạng thái</th>
                                <td>
                                    <c:choose>
                                        <c:when test="${product.statusId == 1}"><span class="badge rounded-pill red">CHỜ PHÊ DUYỆT</span></c:when>
                                        <c:when test="${product.statusId == 2}"><span class="badge rounded-pill red">ĐÃ PHÊ DUYỆT</span></c:when>
                                        <c:when test="${product.statusId == 3}"><span class="badge rounded-pill red">BỊ TỪ CHỐI</span></c:when>
                                        <c:when test="${product.statusId == 4}"><span class="badge rounded-pill red">ĐÃ ẨN</span></c:when>
                                    </c:choose>
                                </td>
                            </tr>
                        </table>
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