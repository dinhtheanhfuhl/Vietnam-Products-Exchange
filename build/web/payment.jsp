<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Cart</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="./css/style.css">
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
                                <a class="nav-link waves-effect  text-header" href="./home.jsp">Trang chủ
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
                                        <a class="dropdown-item" href="./information.jsp">Về chúng tôi</a>
                                        <a class="dropdown-item" href="./policy.jsp">Chính sách bảo mật</a>
                                        <a class="dropdown-item" href="./condition.jsp">Điều khoản dịch vụ</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <div class="dropdown">
                                    <a class="nav-link waves-effect text-header dropdown-toggle" href="./shop.html"
                                       target="_blank">Cửa hàng

                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <c:forEach items="${listCate}" var="o" >
                                            <a class="dropdown-item" href="MinimartProductController?cid=${o.cateId}">${o.cateName}</a>
                                        </c:forEach>
                                    </div>
                                </div>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link waves-effect text-header" href="./contact.jsp">Liên hệ</a>
                            </li>
                        </ul>


                        <!-- Right -->
                        <ul class="navbar-nav nav-flex-icons">
                            <li class="nav-item">
                                <div class="input-group rounded">
                                    <input type="search" class="form-control " placeholder="Tìm kiếm" aria-label="Search" aria-describedby="search-addon" />
                                    <span class="input-group-text border-0" id="search-addon">
                                        <i class="fas fa-search"></i>
                                    </span>
                                </div>
                            </li>
                            <li class="nav-item ">
                                <a href="#"  class="nav-link cart-btn amm-shopping-cart-open pr-3"><i onclick="shoppingCarts()" class="fas fa-shopping-cart"></i>
                                    <span class="quantity-amm-shopping-cart-open">0</span></a>

                            </li>
                            <li class="nav-item">
                                <div class="dropdown dropdown-user">
                                    <a href="login.jsp" class="nav-link border border-light rounded waves-effect" target="_blank">
                                        <i class="fas fa-user"></i>Đăng Nhập
                                    </a>

                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <main style="margin-top: 100px;">
            <div class="container-fluid" >
                <form action="OrderController" method="post">
                    <div class="row">
                        <div class="col-lg-7 col-sm-12 pt-5 payment-right">


                            <div class="form-group">
                                <h3>Thông tin đặt hàng</h3>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Tên người nhận hàng</label>
                                    <input required type="text" class="form-control" id="exampleInputPhone" name="receiverName" placeholder="nhập tên người nhận">
                                </div>
                                <label>Địa chỉ đặt hàng</label>
                                <div class="input-group mb-3">
                                    <input required type="text" class="form-control" id="exampleInputAddress" name="receiverAddress" placeholder="nhập địa chỉ đặt hàng">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Số điện thoại</label>
                                    <input required type="text" class="form-control" id="exampleInputAddress" name="receiverPhone" placeholder="nhập số điện thoại">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Ghi chú</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" name="note" rows="4"></textarea>
                                </div>

                            </div>
                            <div class="right">
                                <p>Mọi sự riêng tư và thông tin của bạn đều được chúng tôi bảo mật.</p>
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-12 payment-left">

                            <div class="payment-left-display pr-80">
                                <div class="showProduct">
                                    <ul id="mainCartPayment">
                                    </ul>
                                </div>

                                <div class="sumPriceproduct">
                                    <p><b>Phương thức giao hàng:</b> <span>&nbsp;Nhà cung cấp giao hàng</span></p>
                                    <p><b>Phương thức thanh toán:</b> <span>&nbsp;Thanh toán khi nhận hàng(COD) </span></p></b>

                                </div>
                                <div class="sumarizePrice ">
                                    <p>Tổng tiền: <span class="padding-price">0 </span><sup>đ</sup></p>
                                </div>
                                <div class="success-order row pb-5 ">
                                    <button id="btn-order" type="submit" class="btn-buy btn btn-success mt-2 ml-3">Đặt hàng</button>
                                    <a href="CartController" class="back">Quay lại</a>
                                </div>
                                <p>*Phương thức giao hàng hỗ trợ thời điểm hiện tại là nhà cung cấp giao. Phí giao hàng sẽ được nhà cung cấp liên hệ với người nhận hàng qua số điện thoại.</p>
                                <p>*Phương thức thanh toán hỗ trợ thời gian thời điểm hiện tại là thanh toán khi nhận hàng(Tiền mặt hoặc chuyển khoản)</p>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </main>

    </body>
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
    <script type="text/javascript">
                                    $(window).load(function () {
                                        showProductToPayment();
                                        checkProduct();
                                    });


    </script>

</html>