<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Sàn nông sản</title>
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
         <div class="banner-top pt-5">
            <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" style=" transform: scale(1.5);">
                        <img class="d-block w-100" src="image/slider1-min.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title">
                                    <h2>Nông trại xanh</h2>
                                    <h6>
                                        Mát mẻ & Sức khoẻ
                                    </h6>
                                    <a href="#">ĐẾN SÀN NGAY</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style=" transform: scale(1.2);">
                        <img class="d-block w-100" src="image/slider1-min.jpg" alt="Third slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title-diff">
                                    <h2>Tinh khiết và trong lành</h2>
                                    <h6>
                                        Giảm 20%
                                    </h6>
                                    <a href="#">ĐẾN SÀN NGAY</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style=" transform: scale(1.2);">
                        <img class="d-block w-100" src="image/slider1-min.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title-diff">
                                    <h2>Sức khoẻ là số 1</h2>
                                    <h6>
                                        Nông sản xịn
                                    </h6>
                                    <a href="#">ĐẾN SÀN NGAY</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" style=" transform: scale(1.2);">
                        <img class="d-block w-100" src="image/slider1-min.jpg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title-diff">
                                    <h2>Rau xanh, sạch, ngon</h2>
                                    <h6>
                                        Mua nhanh kẻo hết
                                    </h6>
                                    <a href="#">ĐẾN SÀN NGAY</a>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>


        <div class="pt-50">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-sm-3  ">
                        <div class="banner-block banner-hover">
                            <img style="height: 350px;object-fit: cover" class=" lazyloaded" src="https://suckhoedoisong.qltns.mediacdn.vn/Images/bichvan/2017/04/28/Univadis_27.4_Nhung_loai_thuc_pham_chua_nhieu_nuoc_nen_an_vao_mua_he_BS_Thu_Van.jpg">
                            <div class="banner-content text-left">
                                <h4 style="color:#ffff00;text-align: center">Dưa hấu <br> 100% Tươi Ngon</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-3  ">
                        <div class="banner-block banner-hover">
                            <img style="height: 350px;object-fit: cover" class=" lazyloaded" src="https://antican.vn/wp-content/uploads/2020/10/ung-thu-vu-nen-an-qua-gi-1.jpg">
                            <div class="banner-content text-left">
                                <h4 style="color:#cc0000;text-align: center" style="color: #232323;">Cam lòng vàng<br> siêu hot</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <section class="mt-5 product">
            <div class="container">
                <div class="title text-center pb-10  ">
                    <h2>Sản phẩm nổi bật</h2>
                </div>

                <div class="row">
                    <div class="product-slider">
                        <c:forEach var="key" items="${mapImages.keySet()}">
                            <div class="col-md-2">
                                <div class="card">
                                    <img class="card-img-top" style="object-fit: cover;height: 200px;" src="${mapImages.get(key).get(0).getImgPath()}" alt="Card image cap">
                                    <div class="card-body">
                                        <a style="text-decoration: none;" href="MimartDetailProduct?pid=${key.productId}">
                                            <h5 class="card-title">${key.productName} ${key.trademark}</h5>
                                        </a>
                                        <h6>${mapSuppliers.get(key).get(0).getShopName()}</h6>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </section>
        <div class="gallery">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="titlepage pt-3 pb-3">
                            <h2>Sản phẩm mới nhất</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <c:forEach var="key" items="${mapImages2.keySet()}">
                        <div class="col-md-3 col-sm-6 mb-3">
                            <div class="pro-loop">
                                <div class="product-block product-resize">
                                    <div class="product-img">
                                        <img class="w-100" style="object-fit: cover;height: 200px;width: 100px" src="${mapImages2.get(key).get(0).getImgPath()}" alt="">
                                        <div class="box-pro-detail ">
                                            <h5 class="card-title">
                                                <a style="text-decoration: none;margin-top: 25px;" href="MimartDetailProduct?pid=${key.productId}">
                                                    <h5 class="card-title">${key.productName} ${key.trademark}</h5>
                                                </a>
                                            </h5>
                                            <h6>${mapSupplier2.get(key).get(0).getShopName()}</h6>


                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>


        <!--====== SHOPPING CART PART START ======-->

        <div class="amm-shopping-cart-wrapper">
            <div class="amm-shopping-cart-canvas" id="amm-shopping-cart-canvas">
                <div class="amm-shopping_cart">
                    <div class="amm-shopping_cart-top-bar d-flex justify-content-between">
                        <h6>Giỏ hàng</h6>
                        <button onclick="removeShoppingCart()" class="amm-shopping-cart-close">
                            <i class="fas fa-times"></i>
                        </button>
                    </div><!-- shopping cart top bar -->
                    <div class="amm-shopping_cart-list-items mt-30" id="showCart">
                        <ul>

                        </ul>
                    </div> <!-- shopping_cart list items -->
                    <div class="amm-shopping_cart-btn">
                        <div class="total pt-35 d-flex justify-content-between">
                            <h5>Tổng tiền:</h5>
                            <p><span>0 <sup>đ</sup></span></p>

                        </div>
                        <div class="cart-btn pt-25">
                            <a class="main-btn" onclick="viewCarts()" href="./ViewCart.html">Xem giỏ hàng</a>
                            <a class="main-btn main-btn-2" href="./payment.html">Thanh toán</a>
                        </div>
                    </div>
                </div> <!-- shopping_cart -->
            </div>
            <div onclick="openOverlay()" class="overlay" id="overlay"></div>
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
                $(document).ready(function () {
                    $('.cate-slider').slick({
                        slidesToShow: 5,
                        slidesToScroll: 1,
                        responsive: [{
                                breakpoint: 1024,
                                settings: {
                                    slidesToShow: 5,
                                    slidesToScroll: 1,

                                }
                            }, {
                                breakpoint: 800,
                                settings: {
                                    slidesToShow: 4,
                                    slidesToScroll: 2,
                                    dots: false
                                }
                            }, {
                                breakpoint: 480,
                                settings: {
                                    slidesToShow: 1,
                                    slidesToScroll: 1
                                }
                            }

                        ]

                    });
                });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('.product-slider').slick({
                    slidesToShow: 4,
                    slidesToScroll: 1,
                    responsive: [{
                            breakpoint: 1024,
                            settings: {
                                slidesToShow: 4,
                                slidesToScroll: 3,
                                infinite: true,

                            }
                        }, {
                            breakpoint: 800,
                            settings: {
                                slidesToShow: 2,
                                slidesToScroll: 2
                            }
                        }, {
                            breakpoint: 480,
                            settings: {
                                slidesToShow: 1,
                                slidesToScroll: 1
                            }
                        }

                    ]
                });
            });
        </script>
        <script>
            $('.fader').hover(function () {
                $(this).find("img:last").fadeToggle();
            });

        </script>
        <script type='text/javascript'>
            //<![CDATA[
            function getTimeRemaining(endtime) {
                var t = Date.parse(endtime) - Date.parse(new Date());
                var seconds = Math.floor((t / 1000) % 60);
                var minutes = Math.floor((t / 1000 / 60) % 60);
                var hours = Math.floor((t / (1000 * 60 * 60)) % 24);
                var days = Math.floor(t / (1000 * 60 * 60 * 24));
                return {
                    'total': t,
                    'days': days,
                    'hours': hours,
                    'minutes': minutes,
                    'seconds': seconds
                };
            }

            function initializeClock(id, endtime) {
                var clock = document.getElementById(id);
                var daysSpan = clock.querySelector('.days');
                var hoursSpan = clock.querySelector('.hours');
                var minutesSpan = clock.querySelector('.minutes');
                var secondsSpan = clock.querySelector('.seconds');

                function updateClock() {
                    var t = getTimeRemaining(endtime);

                    daysSpan.innerHTML = t.days;
                    hoursSpan.innerHTML = ('0' + t.hours).slice(-2);
                    minutesSpan.innerHTML = ('0' + t.minutes).slice(-2);
                    secondsSpan.innerHTML = ('0' + t.seconds).slice(-2);

                    if (t.total <= 0) {
                        clearInterval(timeinterval);
                    }
                }

                updateClock();
                var timeinterval = setInterval(updateClock, 1000);
            }

            var deadline = new Date(Date.parse(new Date()) + 15 * 24 * 60 * 60 * 1000);
            initializeClock('clockdiv', deadline);
            //]]>
        </script>
    </body>

</html>