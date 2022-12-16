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
            <div id="carouselExampleControls"  class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active" >
                        <img style="height: 545px;object-fit: cover"  class="d-block w-100" src="image/silder3.jpg" alt="First slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title-diff">
                                    <h2 style="color: white;">100% của người Việt</h2>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item" >
                        <img class="d-block w-100" style="height: 545px;object-fit: cover" src="image/slider2.jpg" alt="Third slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title-diff">
                                    <h2 style="color: #00ff00;">Đa Dạng Uy Tín</h2>
                                    <h4 style="color: #00ff00;">Đảm Bảo Chất Lượng</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img style="height: 545px;object-fit: cover" class="d-block w-100" src="image/pexels-photo-5273003.jpeg" alt="Second slide">
                        <div class="carousel-caption d-none d-md-block">
                            <div class="row">
                                <div class="col-sm-4 text-title-diff">
                                    <h2 style="color: white;">Nông sản ngon</h2>
                                    <h6 style="color: white;">
                                    </h6>
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
        <section class="mt-5 product">
            <div class="container">
                <div class="title text-center pb-10  ">
                    <h2>Sản phẩm nổi bật</h2>
                </div>
                <c:if test="${sessionScope.roleCusId==null}">
                    <div class="row">
                        <div class="product-slider">
                            <c:forEach var="key" items="${mapImages.keySet()}">
                                <div class="col-md-3">
                                    <div class="card">
                                        <a style="text-decoration: none;" data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo"><img class="card-img-top" style="object-fit: cover;height: 200px;" src="uploads/${mapImages.get(key).get(0).getImgPath()}" alt="Card image cap"></a>
                                        <div class="card-body">
                                            <a style="text-decoration: none;" data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo">
                                                <h5 class="card-title">${key.productName} ${key.trademark}</h5>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
                <c:if test="${sessionScope.roleCusId!=null}">
                    <div class="row">
                        <div class="product-slider">
                            <c:forEach var="key" items="${mapImages.keySet()}">
                                <div class="col-md-3">
                                    <div class="card">
                                        <a style="text-decoration: none;" href="MimartDetailProduct?pid=${key.productId}">
                                            <img class="card-img-top" style="object-fit: cover;height: 200px;" src="uploads/${mapImages.get(key).get(0).getImgPath()}" alt="Card image cap">
                                        </a>
                                        <div class="card-body">
                                            <a style="text-decoration: none;" href="MimartDetailProduct?pid=${key.productId}">
                                                <h5 class="card-title">${key.productName} ${key.trademark}</h5>
                                            </a>
                                            <h6 style="margin-top: 15px;">${mapSuppliers.get(key).get(0).getShopName()}</h6>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
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
                <c:if test="${sessionScope.roleCusId==null}">
                    <div class="row">
                        <c:forEach var="key" items="${mapImages2.keySet()}">
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="pro-loop">
                                    <div class="product-block product-resize">
                                        <div class="product-img">
                                            <a style="text-decoration: none;" data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo">
                                                <img class="w-100" style="object-fit: cover;height: 200px;width: 100px" src="uploads/${mapImages2.get(key).get(0).getImgPath()}" alt="">
                                            </a>
                                            <div class="box-pro-detail ">
                                                <h5 class="card-title">
                                                    <a style="text-decoration: none;" data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo">
                                                        <h5 class="card-title">${key.productName} ${key.trademark}</h5>
                                                    </a>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>
                <c:if test="${sessionScope.roleCusId!=null}">
                    <div class="row">
                        <c:forEach var="key" items="${mapImages2.keySet()}">
                            <div class="col-md-3 col-sm-6 mb-3">
                                <div class="pro-loop">
                                    <div class="product-block product-resize">
                                        <div class="product-img">
                                            <a style="text-decoration: none;" href="MimartDetailProduct?pid=${key.productId}">
                                                <img class="w-100" style="object-fit: cover;height: 200px;width: 100px" src="uploads/${mapImages2.get(key).get(0).getImgPath()}" alt="">
                                            </a>
                                            <div class="box-pro-detail ">
                                                <h5 class="card-title">
                                                    <a style="text-decoration: none;margin-top: 25px;" href="MimartDetailProduct?pid=${key.productId}">
                                                        <h5 class="card-title">${key.productName} ${key.trademark}</h5>
                                                    </a>
                                                    <h6>${mapSupplier2.get(key).get(0).getShopName()}</h6>
                                                </h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </c:if>


            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form>
                                <div class="form-group">
                                    <h4 id="message-text">Vui lòng đăng nhập!</h4>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                            <a href="LogginController"><button class="btn btn-warning" type="button" >Đăng nhập</button></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!--====== SHOPPING CART PART START ======-->



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
        <script>$('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget)
                var recipient = button.data('whatever')
                var modal = $(this)
            })</script>
    </body>

</html>