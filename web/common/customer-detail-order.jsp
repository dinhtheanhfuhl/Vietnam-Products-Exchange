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

        <header class="header">
            <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar ">
                <div class="container-fluid">

                    <!-- Brand -->
                    <a class="navbar-brand waves-effect" href="Home">
                        <h2 id="logoheader" style="color: #F5AB1E;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
                    </a>

                    <!-- Collapse -->
                    <button class="navbar-toggler" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <!-- Links -->
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">

                        <!-- Left -->
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item active" style="padding-left: 40px;">
                                <a class="nav-link waves-effect  text-header" href="Home">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <div class="dropdown">
                                    <a class="nav-link waves-effect text-header dropdown-toggle" href=""
                                       target="_blank">Giới thiệu
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
                                         id="dropdown-collection">
                                        <a class="dropdown-item" href="InformationController">Về chúng tôi</a>
                                        <a class="dropdown-item" href="PolicyController">Chính sách bảo mật</a>
                                        <a class="dropdown-item" href="ConditionController">Điều khoản dịch vụ</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <c:if test="${sessionScope.roleCusId==null}">
                                    <div class="dropdown">
                                        <a class="nav-link waves-effect text-header " data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo href="">Cửa hàng
                                        </a>
                                    </div>
                                </c:if>

                                <c:if test="${sessionScope.roleCusId!=null}">
                                    <div class="dropdown">
                                        <a class="nav-link waves-effect text-header dropdown-toggle" href="#"
                                           target="_blank">Cửa hàng
                                        </a>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <c:forEach items="${listCate}" var="o" >
                                                <a class="dropdown-item" href="MinimartProductController?cid=${o.cateId}">${o.cateName}</a>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </c:if>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link waves-effect text-header" href="ContactController">Liên hệ</a>
                            </li>
                        </ul>


                        <!-- Right -->

                        <ul class="navbar-nav nav-flex-icons">
                            <c:if test="${sessionScope.roleCusId!=null}">
                                <li class="nav-item">
                                    <form action="SearchProductController" method="post">
                                        <div class="input-group rounded">
                                            <input type="search" class="form-control " required="" name="txtSearch" placeholder="Tìm kiếm" aria-label="Search" aria-describedby="search-addon" />
                                            <button type="submit" class="input-group-text border-0" id="search-addon">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.roleCusId==null}">
                                <li class="nav-item">
                                    <div class="input-group rounded">
                                        <input type="search" class="form-control " required="" name="txtSearch" placeholder="Tìm kiếm" aria-label="Search" aria-describedby="search-addon" />
                                        <button type="submit" class="input-group-text border-0" id="search-addon">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </li>
                            </c:if>

                            <c:if test="${sessionScope.roleCusId!=null}">
                                <li class="nav-item ">
                                    <a href="CartController"  class="nav-link cart-btn pr-3"><i class="fas fa-shopping-cart"></i>
                                    </a>
                                </li>
                            </c:if>
                            <c:if test="${sessionScope.roleCusId==null}">
                                <li class="nav-item ">
                                    <a   class="nav-link cart-btn pr-3"><i class="fas fa-shopping-cart"></i>
                                    </a>
                                </li>
                            </c:if>

                            <li class="nav-item">
                                <div class="dropdown dropdown-user">
                                    <c:if test="${sessionScope.roleCusId==4}">
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                ${sessionScope.nameUser}
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                <a class="dropdown-item" href="CustomerInfoDetail">Thông tin cá nhân</a>
                                                <a class="dropdown-item" href="HistoryOrderController">Lịch sử mua hàng</a>
                                                <a class="dropdown-item" href="./common/changepass.jsp">Thay đổi mật khẩu</a>
                                                <a class="dropdown-item" href="LogoutController">Đăng xuất</a>
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${sessionScope.roleCusId==null}">
                                        <a href="LogginController" class="nav-link border border-light rounded waves-effect">
                                            <i class="fas fa-user"></i>Đăng Nhập
                                        </a>
                                    </c:if>

                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

        </header>

        <section class="breadcrum">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">

                </ol>
            </nav>
        </section>
        <div class="container ">
        </div>
        <div class="container ">
            <h3>Chi tiết đơn hàng - Mã đơn ${order.orderId}</h3>


            <div class="container">
                <div class="row">
                    <div class="col-sm">
                        <p><b>Trạng thái: </b><span> 
                                <c:if test="${order.orderStatusId=='1'}">
                                    Chờ xác nhận
                                </c:if>
                                <c:if test="${order.orderStatusId=='2'}">
                                    Đã xác nhận
                                </c:if>
                                <c:if test="${order.orderStatusId=='3'}">
                                    Từ chối đơn hàng
                                </c:if>
                                <c:if test="${order.orderStatusId=='4'}">
                                    Đang giao
                                </c:if>
                                <c:if test="${order.orderStatusId=='5'}">
                                    Đã huỷ
                                </c:if>
                                <c:if test="${order.orderStatusId=='6'}">
                                    Đã nhận hàng
                                </c:if>
                            </span></p>

                        <p><b>Tổng tiền: </b><span><fmt:formatNumber type = "number" 
                                          pattern = "" value = "${totalPrice}" /><sup>vnđ</sup></span></p>
                        <p><b>Ngày đặt hàng: </b><span>${orderDetail.orderDate}</span></p>
                        <p><b>Ghi chú: </b><span>${order.note}</span></p>
                    </div>
                    <div class="col-sm">
                        <p><b>Tên người nhận hàng: </b><span>${order.recieverName}</span></p>
                        <p><b>Số điện thoại: </b><span>${order.recieverPhone}</span></p>
                        <p><b>Địa chỉ nhận hàng: </b><span>${order.recieverAddress}</span></p>
                    </div>
                    <div class="col-sm">
                        <c:if test="${order.orderStatusId=='1'}"><button type="button" style="float: right;" class="btn btn-warning status mb-2" data-toggle="modal" data-target="#exampleModal">Huỷ đơn</button></c:if>

                        <c:if test="${order.orderStatusId=='4'}">
                            <form action="HistoryOrderDetailController?orderId=${order.orderId}" method="post">
                                <input type="hidden" name="action" value="success">
                                <button type="submit" style="float: right;" class="btn btn-warning status mb-2">Đã nhận hàng</button>
                            </form>
                        </c:if>

                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Bạn có chắc muốn huỷ đơn?</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form action="HistoryOrderDetailController?orderId=${order.orderId}" method="post">
                        <input type="hidden" name="action" value="reject"/>
                        <div class="modal-body">

                            <div class="form-group">
                                <label for="message-text" class="col-form-label">Lý do huỷ đơn:</label>
                                <textarea class="form-control" name="message" id="message-text"></textarea>
                            </div>

                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                            <button type="submit" class="btn btn-success">Gửi</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <div class="ordered-detail container">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">Tên sản phẩm</th>
                        <th scope="col">Nhà cung cấp</th>
                        <th scope="col">Số lượng</th>
                        <th scope="col">Đơn giá</th>
                        <th scope="col">Thành tiền</th>
                    </tr>
                </thead>
                <c:forEach var="key" items="${mapProduct.keySet()}">
                    <tbody>
                        <tr>
                            <td><a href="MimartDetailProduct?pid=${key.productId}"><img style="margin-left: 0px;object-fit: cover;" src="uploads/${mapImage.get(key).get(0).getImgPath()}" alt=""></a></td>
                            <td><a href="MimartDetailProduct?pid=${key.productId}"><p style="width: 200px"><b>${mapProduct.get(key).get(0).getProductName()}
                                            ${mapProduct.get(key).get(0).trademark}
                                            ${mapProduct.get(key).get(0).smell},
                                            ${mapProduct.get(key).get(0).color}</b></p></a>
                            </td>
                            <td>${mapSupplier.get(key).get(0).getSupplierName()}</td>
                            <td><span>${key.amount}Kg</span></td>
                            <td><span><fmt:formatNumber type = "number" 
                                              pattern = "" value = "${key.cost/key.amount}" /><sup>vnđ</sup></span></td>
                            <td><span><fmt:formatNumber type = "number" 
                                              pattern = "" value = "${key.cost}" /><sup>vnđ</sup></span></td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
        </div>

        <%@include file="footer.jsp"%>  

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script>
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var recipient = button.data('whatever') // Extract info from data-* attributes
                var modal = $(this)
                modal.find('.modal-title').text('New message to ' + recipient)
                modal.find('.modal-body input').val(recipient)
            })
        </script>
        <script>

        </script>

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