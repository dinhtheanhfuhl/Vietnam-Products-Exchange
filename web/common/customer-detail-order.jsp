<!DOCTYPE html>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Chi tiết đơn hàng</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/style.css">

        <!--====== Favicon Icon ======-->
        <link rel="shortcut icon" href="assets/images/favicon.png" type="image/png">

        <!--====== Bootstrap css ======-->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">

        <!--====== Fontawesome css ======-->
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">

        <!--====== Magnific Popup css ======-->
        <link rel="stylesheet" href="assets/css/animate.min.css">

        <!--====== Magnific Popup css ======-->
        <link rel="stylesheet" href="assets/css/magnific-popup.css">

        <!--====== Slick css ======-->
        <link rel="stylesheet" href="assets/css/slick.css">

        <!--====== Default css ======-->
        <link rel="stylesheet" href="assets/css/custom-animation.css">
        <link rel="stylesheet" href="assets/css/default.css">

        <!--====== Style css ======-->
        <link rel="stylesheet" href="assets/scss/style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

    </head>

    <body>

        <%@include file="header.jsp"%>

        <section class="breadcrum">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">

                </ol>
            </nav>
        </section>
        <div class="container ">
        </div>
        <div class="container ">
            <h3>Chi tiết đơn hàng</h3>


            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <p><b>Trạng thái: </b><span> <c:if test="${order.orderStatusId=='1'}">
                                    Chờ xác nhận
                                </c:if>
                                <c:if test="${order.orderStatusId=='2'}">
                                    Đã xác nhận
                                </c:if>
                                <c:if test="${order.orderStatusId=='3'}">
                                    Từ chối đơn hàng
                                </c:if>
                                <c:if test="${order.orderStatusId=='4'}">
                                    Giao hàng thành công
                                </c:if></span></p>

                        <p><b>Mã đơn hàng: </b><span>${order.orderId}</span></p>
                        <p><b>Ngày đặt hàng: </b><span>${orderDetail.orderDate}</span></p>
                        <p><b>Ghi chú: </b><span>${order.note}</span></p>
                    </div>
                    <div class="col-sm">
                        <p><b>Tên người nhận hàng: </b><span>${order.recieverName}</span></p>
                        <p><b>Số điện thoại: </b><span>${order.recieverPhone}</span></p>
                        <p><b>Địa chỉ nhận hàng: </b><span>${order.recieverAddress}</span></p>
                    </div>
                    <div class="col-sm">
                        <button type="button" style="float: right;" class="btn btn-warning status mb-2">Huỷ đơn</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="ordered-detail container">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Giá</th>
                    </tr>
                </thead>
                <c:forEach var="key" items="${mapProduct.keySet()}">
                    <tbody>
                        <tr>
                            <td><img style="margin-right: 100px;position: relative" src="${mapImage.get(key).get(0).getImgPath()}" alt=""></td>
                            <td><b>${mapProduct.get(key).get(0).getProductName()}
                                ${mapProduct.get(key).get(0).productName}
                                ${mapProduct.get(key).get(0).trademark}
                                ${mapProduct.get(key).get(0).smell},
                                ${mapProduct.get(key).get(0).color},
                                ${mapProduct.get(key).get(0).packing}</b>
                            </td>
                            <td><span><b>${key.amount}Kg</b></span></td>
                            <td><span><b><fmt:formatNumber type = "number" 
                                              pattern = "" value = "${key.cost}" /><sup>vnđ</sup>&nbsp;&nbsp;</b></span></td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>

        <%@include file="footer.jsp"%>  

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
        </script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
        <!--====== jquery js ======-->
        <script src="assets/js/vendor/modernizr-3.6.0.min.js"></script>
        <script src="assets/js/vendor/jquery-1.12.4.min.js"></script>

        <!--====== Bootstrap js ======-->
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/popper.min.js"></script>

        <!--====== wow js ======-->
        <script src="assets/js/wow.js"></script>

        <!--====== Slick js ======-->
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>

        <!--====== TweenMax js ======-->
        <script src="assets/js/TweenMax.min.js"></script>

        <!--====== Slick js ======-->
        <script src="assets/js/slick.min.js"></script>

        <!--====== Magnific Popup js ======-->
        <script src="assets/js/jquery.magnific-popup.min.js"></script>

        <!--====== Main js ======-->
        <script src="assets/js/main.js"></script>
        <script src="./cart.js"></script>

    </body>

</html>