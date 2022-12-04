<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Chi tiết sản phẩm</title>
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
        <section class="breadcrum">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item"><a href="./home.jsp">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh mục sản phẩm</li>
                    <li class="breadcrumb-item active" aria-current="page">Sản phẩm</li>
                </ol>
            </nav>
        </section>
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
        <main>
            <section class="shop-details-area pt-100 pb-100">
                <div class="container">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}" role="alert">
                            ${message}
                        </div>
                    </c:if>

                    <div class="row ">
                        <div class="col-lg-6">
                            <div class="shop-details-thumb">
                                <div class="shop-details-thumb-slider-active">
                                    <div class="item ">
                                        <img src="${product.img}" alt="">
                                    </div>
                                </div>
                            </div>
                            <div class="shop-small-slider-active mt-10">
                                <div class="item">
                                    <img src="assets/images/shop-details-small-1.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img src="assets/images/shop-details-small-2.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img src="assets/images/shop-details-small-3.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img src="assets/images/shop-details-small-4.jpg" alt="">
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="shop-product-details-content pl-70 mt-35" >
                                <h2 class="title">${product.productName}</h2>
                                <span>${min} - ${medium} kg<br>
                                    <span><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${priceMax}" /><sup>vnđ</sup></span></span>
                                <span>${medium} - ${max} kg<br>
                                    <span><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${priceMedium}" /><sup>vnđ</sup></span></span>
                                <span> > ${max} kg<br>
                                    <span><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${priceMin}" /><sup>vnđ</sup></span></span>
                                <div class="pricing">
                                    <div class="discount-price mr-15"><span>Danh mục</span> </div>
                                </div>

                                <p>${subcate.subCateName}</p>
                                <div class="pricing">
                                    <div class="discount-price mr-15"><span>Trọng lượng</span> </div>
                                </div>
                                <p>${product.weight} Kg</p>

                                <div class="pricing">
                                    <div class="discount-price mr-15"><span>Nhà cung cấp</span> </div>
                                </div>
                                <p>${product.shopName}</p>
                                <form action="AddToCartController?pid=${product.productId}" method="post">
                                    <div class="shop-buttons d-block d-sm-flex align-items-center">
                                        <input class="form-control" required="" type="number" placeholder="Nhập trọng lượng" min="${min}" max="2000000000" name="amount" style="width: 150px;" />

                                        <input class="main-btn ml-10" type="submit" value="Thêm vào giỏ">
                                        <input type="hidden" name="proId" value="${product.productId}">
                                    </div> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="shop-details-info-area pt-85 pb-100 ">
                <div class="container">
                    <div class="tab">
                        <button class="tablinks" id="defaultOpen" onclick="openCity(event, 'des')">Mô tả sản phẩm</button>
                        <button class="tablinks" onclick="openCity(event, 'overview')">Tổng quan cửa hàng</button>
                        <button class="tablinks" onclick="openCity(event, 'licence')">Giấy phép chứng nhận</button>
                    </div>

                    <div id="des" class="tabcontent">
                        <h4>
                            ${product.description}
                        </h4>
                    </div>

                    <div id="overview" class="tabcontent">
                        <h4>Tên nhà cung cấp</h4>
                        <p>Nông Sản Dũng Hà Giải Phóng</p> 
                        <h4>Địa chỉ</h4>
                        <p>Q. Hoàng Mai, Hà Nội</p> 
                    </div>

                    <div id="licence" class="tabcontent">
                        <h4>Giấy phép chứng nhận</h4>
                        <p>giấy phép here</p>
                        <p>giấy phép here</p>
                        <p>giấy phép here</p>
                    </div>

                </div>
            </div>                      

            <!--====== orfarm SHOP DETAILS PART ENDS ======-->


            <!--====== orfarm SHOP RELATED PRODUCT PART ENDS ======-->

            <div class="shop-related-area pt-90 pb-170">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="orfarm-section-title text-center">
                                <h3 class="orfarm-title">Các sản phẩm liên quan</h3>
                                <p>Khám phá thêm nhiều sản phẩm bên dưới để đưa ra lựa chọn tốt nhất cho bạn và gia đình. </p><i class="fas fa-heart"></i><i class="fas fa-heart"></i><i class="fas fa-heart"></i>
                            </div>
                        </div>
                    </div>
                    <div class="row shop-related-product-slider-active">
                        <div class="col-lg-3 col-md-6">
                            <div class="single-shop-box">
                                <div class="thumb text-center">
                                    <img src="assets/images/shop-grid-1.jpg" alt="">
                                    <div class="reborn">
                                        <span>Sale</span>
                                    </div>
                                    <div class="cart-list-icon">
                                        <ul>
                                            <li><a href="#"><i class="fal fa-shopping-bag"></i></a></li>
                                            <li><a href="#"><i class="fal fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fal fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="content">
                                    <ul>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star-half-alt"></i></li>
                                    </ul>
                                    <a href="./productdetail.html">Cà Tím</a>
                                    <div class="pricing">
                                        <div class="discount-price">21.000đ </div> 
                                        <div class="regular-price">25.000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="single-shop-box">
                                <div class="thumb text-center">
                                    <img src="assets/images/shop-grid-2.jpg" alt="">
                                    <div class="reborn">
                                    </div>
                                    <div class="cart-list-icon">
                                        <ul>
                                            <li><a href="#"><i class="fal fa-shopping-bag"></i></a></li>
                                            <li><a href="#"><i class="fal fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fal fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="content">
                                    <ul>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star-half-alt"></i></li>
                                    </ul>
                                    <a href="./productdetail.html">Cà Tím</a>
                                    <div class="pricing">
                                        <div class="discount-price">21.000đ </div> 
                                        <div class="regular-price">25.000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="single-shop-box">
                                <div class="thumb text-center">
                                    <img src="assets/images/shop-grid-3.jpg" alt="">
                                    <div class="reborn">
                                        <span>Hot</span>
                                    </div>
                                    <div class="cart-list-icon">
                                        <ul>
                                            <li><a href="#"><i class="fal fa-shopping-bag"></i></a></li>
                                            <li><a href="#"><i class="fal fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fal fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="content">
                                    <ul>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star-half-alt"></i></li>
                                    </ul>
                                    <a href="./productdetail.html">Cà Tím</a>
                                    <div class="pricing">
                                        <div class="discount-price">21.000đ </div> 
                                        <div class="regular-price">25.000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="single-shop-box">
                                <div class="thumb text-center">
                                    <img src="assets/images/shop-grid-4.jpg" alt="">
                                    <div class="reborn">
                                    </div>
                                    <div class="cart-list-icon">
                                        <ul>
                                            <li><a href="#"><i class="fal fa-shopping-bag"></i></a></li>
                                            <li><a href="#"><i class="fal fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fal fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="content">
                                    <ul>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star-half-alt"></i></li>
                                    </ul>
                                    <a href="./productdetail.html">Cà Tím</a>
                                    <div class="pricing">
                                        <div class="discount-price">21.000đ </div> 
                                        <div class="regular-price">25.000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="single-shop-box">
                                <div class="thumb text-center">
                                    <img src="assets/images/shop-grid-5.jpg" alt="">
                                    <div class="reborn">
                                        <span>New</span>
                                    </div>
                                    <div class="cart-list-icon">
                                        <ul>
                                            <li><a href="#"><i class="fal fa-shopping-bag"></i></a></li>
                                            <li><a href="#"><i class="fal fa-heart"></i></a></li>
                                            <li><a href="#"><i class="fal fa-eye"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="content">
                                    <ul>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star"></i></li>
                                        <li><i class="fas fa-star-half-alt"></i></li>
                                    </ul>
                                    <a href="./productdetail.html">Cà Tím</a>
                                    <div class="pricing">
                                        <div class="discount-price">21.000đ </div> 
                                        <div class="regular-price">25.000đ</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp"%> 
    </body>
    <script>
        function openCity(evt, cityName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(cityName).style.display = "block";
            evt.currentTarget.className += " active";
        }
        document.getElementById("defaultOpen").click();
    </script>
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
</html> 