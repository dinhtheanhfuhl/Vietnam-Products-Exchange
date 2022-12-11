<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Nông sản tại VnProX</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">

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
                    <li class="breadcrumb-item"><a href="Home">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Danh mục sản phẩm</li>
                </ol>
            </nav>
        </section>
        <div class="orfarm-shop-grid-area pt-100 pb-50">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 order-2 order-lg-1">
                        <div class="orfarm-shop-sidebar">
                            <form>
                                <div class="shop-price-filter">
                                    <h4 class="title">Lọc theo giá</h4>
                                    <div class="price-range">
                                        <label for="">
                                            <input type="number" placeholder="Từ" class="form-control"> - 
                                            <input type="number" placeholder="Đến" class="form-control"></label>                                    
                                    </div>
                                </div>
                                <div class="shop-category-widget">
                                    <h4 class="title">Danh mục cấp 2</h4>
                                    <ul>
                                        <c:forEach items="${allSubCategory}" var="o" >
                                            <input type="checkbox" id="subcate" name="" value="">
                                            <label for="subcate">${o.subCateName}</label><br>
                                        </c:forEach>
                                    </ul>
                                </div>
                                <div class="shop-category-widget">
                                    <h4 class="title">Khu vực giao hàng</h4>
                                    <ul>
                                        <select id="city"  class="form-control">
                                            <option value="">Tất cả thành phố</option>
                                            <c:forEach items="${allCities}" var="o" >
                                                <option value="${o.cityId}">${o.cityName}</option>
                                            </c:forEach>
                                        </select>

                                    </ul>
                                </div>
                                <button class=" btn btn-warning status" type="submit" id="">  Lọc </button>

                            </form>
                        </div>
                    </div>

                    <div class="col-lg-9 order-1 order-lg-2">
                        <div class="row">
                            <div class="banner-collection pb-5 w-300">
                                <img src="image/slider1-min.jpg" alt=""/>
                            </div>
                        </div>
                        <div class="shop-grid-topbar d-flex justify-content-between align-items-center">
                            <select id="product">
                                <option value="">Mới nhất</option>
                                <option value="">Bán chạy nhất</option>
                                <option value="">Giá tăng dần</option>
                                <option value="">Giá giảm dần</option>
                            </select>
                        </div>
                        <div class="row">
                            <c:forEach var="key" items="${mapImages.keySet()}">
                                <div class="col-lg-4 col-md-6">
                                    <div class="single-shop-box">
                                        <a href="MimartDetailProduct?pid=${key.productId}">
                                        <div class="thumb text-center">
                                            <img style="height:200px;object-fit: cover" src="${mapImages.get(key).get(0).getImgPath()}" alt="">
                                        </div>
                                        </a>
                                        <div class="content">

                                            <input type="hidden" id="productId" value="1">

                                            <a style="text-decoration: none" href="MimartDetailProduct?pid=${key.productId}">
                                                <h5>
                                                    ${key.productName}
                                                    ${key.trademark}
                                                    ${key.smell},
                                                    ${key.color}
                                                </h5>
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Từ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;đến
                                            <div class="pricing">
                                                <c:forEach var="hierarchy" items="${mapHierarchy.get(key)}">

                                                    <c:if test="${mapHierarchy.get(key).get(1)!=hierarchy}">
                                                        <div class="discount-price"> <span><fmt:formatNumber type = "number" 
                                                                          pattern = "" value = "${hierarchy.price}" /><sup>vnđ</sup>&nbsp;&nbsp;</span> </div> 
                                                            </c:if>
                                                        </c:forEach>
                                            </div>


                                            <p>${mapCity.get(key).get(0).getCityName()}</p>
                                            <p>Khối lượng: ${key.weight} Kg</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div class="col-lg-12">
                                <div class="bisylms-pagination">
                                    <c:forEach begin="1" end="${end}" var="i">
                                        <!-- <span class="current">1</span> -->
                                        <a href="#">${i}</a>
                                        <!-- <a class="next" href="#">next<i class="fal fa-arrow-right"></i></a> -->
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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