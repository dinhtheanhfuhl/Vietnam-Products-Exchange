<!doctype html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <title>Liên hệ  </title>
        <!-- Required meta tags -->
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
        <div class="amm-shopping-cart-wrapper">
            <div class="amm-shopping-cart-canvas">
                <div class="amm-shopping_cart">
                    <div class="amm-shopping_cart-top-bar d-flex justify-content-between">
                        <h6>Giỏ hàng</h6>
                        <button class="amm-shopping-cart-close">
                            <i class="fas fa-times"></i>
                        </button>
                    </div><!-- shopping cart top bar -->
                    <div class="amm-shopping_cart-list-items mt-30">
                        <ul>

                        </ul>
                    </div> <!-- shopping_cart list items -->
                    <div class="amm-shopping_cart-btn">
                        <div class="total pt-35 d-flex justify-content-between">
                            <h5>Tổng tiền:</h5>
                            <p>0 <span>đ</span></p>

                        </div>
                        <div class="cart-btn pt-25">
                            <a class="main-btn" href="./ViewCart.html">Xem giỏ hàng</a>
                            <a class="main-btn main-btn-2" href="./payment.html">Thanh toán</a>
                        </div>
                    </div>
                </div> <!-- shopping_cart -->
            </div>
            <div class="overlay"></div>
        </div>
        <section class="breadcrum" >

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item"><a href="Home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Liên hệ</li>
                </ol>
            </nav>
        </section>

        <main role="main">
            <setion class="main-contact ">
                <div class="container">
                    <div class="row contact-cover">
                        <div class="col-lg-5 col-sm-12 form-contact1">
                            <h2 class="text-center">Liên hệ</h2>
                            <form>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Họ Tên</label>
                                    <input  required type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Họ Tên">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email </label>
                                    <input  required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Điện Thoại </label>
                                    <input required type="text" class="form-control" id="exampleInputPassword1" placeholder="Điện Thoại">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Địa Chỉ </label>
                                    <input required type="text" class="form-control" id="exampleInputPassword1" placeholder="Địa Chỉ">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Thông tin</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
                                </div>

                                <button type="submit" class="btn btn-block btn-warning">Gửi Liên Hệ</button>
                            </form>
                        </div>
                        <div class="col-lg-6 col-sm-12 form-contact2">
                            <p>
                                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3723.827534707655!2d105.78990511423683!3d21.03958568599247!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3135ab98e8e55fb7%3A0xb834a420c7ed1b08!2zTmjDoCBCMyBsw6BuZyBxdeG7kWMgdOG6vyB0aMSDbmcgbG9uZw!5e0!3m2!1svi!2s!4v1639970855288!5m2!1svi!2s" width="540" height="400" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                            </p>
                            <h3>SHOWROOM ORFARM HÀ NỘI</h3>
                            <p><strong>Địa chỉ:</strong> Tầng 1, toà B3, Làng quốc tế Thăng Long, Trần Đăng Ninh, Quận Cầu Giấy</p>

                            <p><strong>Điện thoại:</strong> 024 3793 9966 - 091 883 6911</p>
                        </div>
                    </div>
                </div>

            </setion>
        </main>


        <%@include file="footer.jsp"%>  

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
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