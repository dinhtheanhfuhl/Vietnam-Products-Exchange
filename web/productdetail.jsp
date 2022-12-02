<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                        <a class="dropdown-item" href="./information.html">Về chúng tôi</a>
                                        <a class="dropdown-item" href="./policy.html">Chính sách bảo mật</a>
                                        <a class="dropdown-item" href="./condition.html">Điều khoản dịch vụ</a>
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
                                <a href="CartController"  class="nav-link cart-btn pr-3"><i class="fas fa-shopping-cart"></i>
                                </a>
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
                                <span>50 - 500 kg<br>
                                    đ 239.000</span>
                                <span>100 - 700 kg<br>
                                    đ 139.000</span>
                                <span>150 - 1500 kg<br>
                                    đ 39.000</span>
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
                                        <input class="form-control" required="" type="number" placeholder="Nhập trọng lượng" name="amount" style="width: 150px;" />

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
        <footer>
            <div class="main-footer container">
                <div class="row m14 container">
                    <div class="col-lg-4 col-sm-6 col-xs-12">
                        <div class="text-footer">
                            <h4>Giới thiệu</h4>
                            <p>Vietnam Products Exchange (VnProX) là một nền tảng kết nối các nhà cung cấp nông sản Việt với các thương lái, 
                                siêu thị mini nhằm  kích cầu tiêu dùng hàng Việt đến tất cả người dân.
                                Chúng tôi luôn đảm bảo mọi thông tin của tất cả mặt hàng nông sản xuất hiện trên sàn là chính xác nhất.
                            </p>
                            <div class="logo-1">
                                <img class="w-100" src="img/logo_bct_019590229b4c4dfda690236b67f7aff4.jpg" alt="">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-sm-6 col-xs-12">
                        <div class="text-footer">
                            <h4>Liên kết</h4>
                            <p><a href="./information.jsp">Về chúng tôi</a></p>
                            <p><a href="./policy.jsp">Chính sách bảo mật</a></p>
                            <p><a href="./condition.jsp">Điều khoản dịch vụ</a></p>
                            <p><a href="./contact.jsp">Liên hệ</a></p>

                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-xs-12">
                        <div class="text-footer ">
                            <h4>Thông tin liên hệ</h4>
                            <div class="d-flex">
                                <span class="mr-2"><svg class="svg-inline--fa fa-map-marker-alt fa-w-12" aria-hidden="true"
                                                        focusable="false" data-prefix="fas" data-icon="map-marker-alt" role="img"
                                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" data-fa-i2svg="">
                                    <path fill="currentColor"
                                          d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z">
                                    </path>
                                    </svg><!-- <i class="fas fa-map-marker-alt"></i> --></span>
                                <p>Tầng 1, toà B3, Làng quốc tế Thăng Long, Trần Đăng Ninh, Quận Cầu Giấy.</p>
                            </div>
                            <div class="d-flex">
                                <span class="mr-2"><svg class="svg-inline--fa fa-phone-alt fa-w-16" aria-hidden="true" focusable="false"
                                                        data-prefix="fas" data-icon="phone-alt" role="img" xmlns="http://www.w3.org/2000/svg"
                                                        viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor"
                                          d="M497.39 361.8l-112-48a24 24 0 0 0-28 6.9l-49.6 60.6A370.66 370.66 0 0 1 130.6 204.11l60.6-49.6a23.94 23.94 0 0 0 6.9-28l-48-112A24.16 24.16 0 0 0 122.6.61l-104 24A24 24 0 0 0 0 48c0 256.5 207.9 464 464 464a24 24 0 0 0 23.4-18.6l24-104a24.29 24.29 0 0 0-14.01-27.6z">
                                    </path>
                                    </svg><!-- <i class="fas fa-phone-alt"></i> --></span>
                                <p>1900.636.099</p>
                            </div>
                            <div class="d-flex">
                                <span class="mr-2"><svg class="svg-inline--fa fa-blender-phone fa-w-18" aria-hidden="true"
                                                        focusable="false" data-prefix="fas" data-icon="blender-phone" role="img"
                                                        xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                                    <path fill="currentColor"
                                          d="M392 64h166.54L576 0H192v352h288l17.46-64H392c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h114.18l17.46-64H392c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h140.36l17.46-64H392c-4.42 0-8-3.58-8-8V72c0-4.42 3.58-8 8-8zM158.8 335.01l-25.78-63.26c-2.78-6.81-9.8-10.99-17.24-10.26l-45.03 4.42c-17.28-46.94-17.65-99.78 0-147.72l45.03 4.42c7.43.73 14.46-3.46 17.24-10.26l25.78-63.26c3.02-7.39.2-15.85-6.68-20.07l-39.28-24.1C98.51-3.87 80.09-.5 68.95 11.97c-92.57 103.6-92 259.55 2.1 362.49 9.87 10.8 29.12 12.48 41.65 4.8l39.41-24.18c6.89-4.22 9.7-12.67 6.69-20.07zM480 384H192c-35.35 0-64 28.65-64 64v32c0 17.67 14.33 32 32 32h352c17.67 0 32-14.33 32-32v-32c0-35.35-28.65-64-64-64zm-144 96c-17.67 0-32-14.33-32-32s14.33-32 32-32 32 14.33 32 32-14.33 32-32 32z">
                                    </path>
                                    </svg><!-- <i class="fas fa-blender-phone"></i> --></span>
                                <p>1900.636.099</p>
                            </div>
                            <div class="d-flex">
                                <span class="mr-2"><svg class="svg-inline--fa fa-paper-plane fa-w-16" aria-hidden="true" focusable="false"
                                                        data-prefix="fas" data-icon="paper-plane" role="img" xmlns="http://www.w3.org/2000/svg"
                                                        viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor"
                                          d="M476 3.2L12.5 270.6c-18.1 10.4-15.8 35.6 2.2 43.2L121 358.4l287.3-253.2c5.5-4.9 13.3 2.6 8.6 8.3L176 407v80.5c0 23.6 28.5 32.9 42.5 15.8L282 426l124.6 52.2c14.2 6 30.4-2.9 33-18.2l72-432C515 7.8 493.3-6.8 476 3.2z">
                                    </path>
                                    </svg><!-- <i class="fas fa-paper-plane"></i> --></span>
                                <p>hi@NongsanViet.com</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-6 col-xs-12">
                        <div class="text-footer">
                            <h4>Fanpage</h4>
                            <div>
                                <iframe
                                    src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2FN%25C3%25B4ng-S%25E1%25BA%25A3n-Vi%25E1%25BB%2587t-OrFar%20m-110915468100836&tabs=timeline&width=280&height=500&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId=5834788679872299"
                                    width="340" height="130" style="border:none;overflow:hidden" scrolling="no" frameborder="0"
                                    allowfullscreen="true"
                                    allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="bottom-footer mb-3">
                <div class="row">
                    <div class="col ">
                        <ul class="ft-bottom container">
                            <li class="copy-right">
                                <p style="font-size: 14px;">Copyright © 2022 Powered by VnProx. Powered by VnProx</p>
                            </li>
                            <li class="social-media">

                                <a href="">
                                    <i class="fab fa-facebook-f"></i>
                                </a>
                                <a href="">
                                    <i class="fab fa-twitter"></i>
                                </a>
                                <a href="">
                                    <i class="fab fa-instagram"></i>
                                </a>

                                <a href="">
                                    <i class="fab fa-youtube"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>  
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