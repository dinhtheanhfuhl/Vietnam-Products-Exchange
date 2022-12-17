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

        <style>

            .side_view{
                justify-content: center;
                display: inline-block;
            }
            .side_view img{
                width: 5.5rem;
                height: 5.5rem;
                object-fit: cover;
                cursor: pointer;
                margin:0.5rem;
            }

        </style>
    </head>


    <body>
        <%@include file="header.jsp"%>
        <section class="breadcrum">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item">Trang chủ</li>
                    <li class="breadcrumb-item " >${cateName}</li>
                    <li class="breadcrumb-item " aria-current="page"> ${product.productName}
                        ${product.trademark}</li>
                </ol>
            </nav>
        </section>

        <main>
            <section class="shop-details-area pb-20">
                <div class="container">
                    <c:if test="${not empty message}">
                        <div class="alert alert-${alert}" role="alert">
                            <i class="fa fa-${icon}"></i>
                            <b>${message}</b>
                        </div>

                    </c:if>

                    <div class="row ">
                        <div class="col-lg-6">
                            <div class="shop-details-thumb">
                                <div class="shop-details-thumb-slider-active">
                                    <img src="uploads/${product.img}" style="height: 400px;object-fit: cover;" alt="" id="mainimage" >
                                </div>
                            </div>
                            <c:forEach items="${listProduct}" var="i">
                                <div class="side_view">
                                    <img src="uploads/${i.img}" alt="" onclick="change(this.src)">
                                </div>
                            </c:forEach>
                        </div>
                        <div class="col-lg-6">
                            <div class="shop-product-details-content pl-70 mt-35" >
                                <h2 class="title">
                                    ${product.productName}
                                    ${product.trademark}
                                    ${product.smell},
                                    ${product.color}
                                </h2>
                                <span>${min} - ${medium-1} kg<br>
                                    <span style="color: #009900"><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${priceMax}" /><sup>vnđ</sup>/Kg</span></span>
                                <span>${medium} - ${max-1} kg<br>
                                    <span style="color: #009900"><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${priceMedium}" /><sup>vnđ</sup>/Kg</span></span>
                                <span> &#8805; ${max} kg<br>
                                    <span style="color: #009900"><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${priceMin}" /><sup>vnđ</sup>/Kg</span></span>
                                <div class="pricing">
                                    <div class="discount-price mr-15"><span>Danh mục</span> </div>
                                </div>

                                <p>${subcate.subCateName}</p>
                                <div class="pricing">
                                    <div class="discount-price mr-15"><span>Số lượng</span> </div>
                                </div>
                                <p><fmt:formatNumber type = "number" 
                                                  pattern = "" value = "${product.weight}" /> Kg</p>

                                <div class="pricing">
                                    <div class="discount-price mr-15"><span>Nhà cung cấp</span> </div>
                                </div>
                                <p>${product.shopName}</p>
                                <form action="AddToCartController?pid=${product.productId}" method="post">
                                    <div class="shop-buttons d-block d-sm-flex align-items-center">
                                        <input id="inputweight" class="form-control" required="" type="number" placeholder="Nhập Kilogram" min="${min}" max="2000000000" name="amount" style="width: 150px;" />
                                        <input class="main-btn ml-10" type="submit" value="Thêm vào giỏ">
                                        <input type="hidden" name="proId" value="${product.productId}">
                                    </div> 
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <div class="shop-details-info-area pt-35 pb-50 ">
                <div class="container">
                    <div class="tab">
                        <button class="tablinks" id="defaultOpen" onclick="openCity(event, 'des')">Mô tả sản phẩm</button>
                        <button class="tablinks" onclick="openCity(event, 'overview')">Tổng quan cửa hàng</button>
                        <button class="tablinks" onclick="openCity(event, 'licence')">Giấy phép chứng nhận</button>
                    </div>

                    <div id="des" class="tabcontent">
                        <hp>
                            <p>Thành phần: ${product.element}</p>
                        </hp>
                        <hp>
                            <p>Kiểu đóng gói: ${product.packing}</p>
                        </hp>
                        <hp>
                            <p>Mô tả: ${product.description}</p>
                        </hp>
                    </div>

                    <div id="overview" class="tabcontent">
                        <p>Tên nhà cung cấp: ${supplier.supplierName}</p>
                        <p>Số điện thoại liên hệ: ${supplier.phone}</p>
                        <p>Địa chỉ cơ sở chính: ${supplier.mainAddress}</p>
                        <p>Giấy phép kinh doanh: <a href="#">${supplier.businessLicense}</a></p>
                    </div>

                    <div id="licence" class="tabcontent">
                        <p><a href="#">${product.productCertificate}</a></p>
                    </div>

                </div>
            </div>                      

            <!--====== orfarm SHOP DETAILS PART ENDS ======-->


            <!--====== orfarm SHOP RELATED PRODUCT PART ENDS ======-->

            <div class="shop-related-area pt-10 pb-80">
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
                        <c:forEach var="key" items="${mapImages.keySet()}">
                            <div class="col-lg-3 col-md-6">
                                <div class="single-shop-box">
                                    <div class="thumb text-center">
                                        <a href="MimartDetailProduct?pid=${key.productId}"><img style="object-fit: cover;height: 200px;" src="uploads/${mapImages.get(key).get(0).getImgPath()}" alt=""></a>
                                    </div>
                                    <div class="content">
                                        <a style="text-decoration: none;" href="MimartDetailProduct?pid=${key.productId}">
                                            <h5>${key.productName}
                                                ${key.trademark},
                                                ${key.smell},
                                                ${key.color}
                                            </h5>
                                        </a>
                                        <p>Khối lượng: ${key.weight} Kg</p>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
        </main>
        <%@include file="footer.jsp"%> 
    </body>
    <script type="text/javascript">
        const change = src => {
            document.getElementById('mainimage').src = src;
        };
    </script>
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