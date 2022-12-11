<!DOCTYPE html>
<html lang="en">

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <title>Thông tin cá nhân</title>
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

        <%@include file="header.jsp" %>

        <section class="breadcrum">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item"><a href="./index.html">Home</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tài khoản</li>
                    <li class="breadcrumb-item active" aria-current="page">Thông tin cá nhân</li>
                </ol>
            </nav>
        </section>
        <div class="container main-infor">
            <h1 class="text-center">THÔNG TIN CÁ NHÂN</h1>
            <div class="row profile">

                <div class="col-md-3 mt-50 mb-50">
                    <div class="profile-sidebar">
                        <div style="margin-top: 50px;" class="profile-userpic"> 
                            <img
                                src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                                class="img-responsive " alt="Thông tin cá nhân">
                        </div>
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name"> ${customerDetail.customerName}</div>
                        </div>
                        <div class="profile-userbuttons">
                            <button type="button" class="btn btn-success btn-sm"> <a href="./index.html">Trang
                                    chủ</a></button>

                        </div>
                    </div>
                </div>
                <div class="col-md-9 mt-50 mb-50">
                    <div class=" personal-infor ">

                        <div class="col-md-8 col-sm-6 pt-3">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th>Họ tên</th>
                                        <td>${customerDetail.customerName}</td>
                                    </tr>
                                    <tr>
                                        <th>Giới tính</th>
                                        <td>${customerDetail.gender}</td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td>${customerDetail.email}</td>
                                    </tr>
                                    <tr>
                                        <th>SĐT</th>
                                        <td>${customerDetail.phone}</td>
                                    </tr>
                                    <tr>
                                        <th>Tên cửa hàng</th>
                                        <td>${customerDetail.shopName}</td>
                                    </tr>
                                    <tr>
                                        <th>Địa chỉ chính</th>
                                        <td>${customerDetail.mainAddress}</td>
                                    </tr>
                                    <tr>
                                        <th>Giấy phép</th>
                                        <td>Larry</td>
                                    </tr>
                                    <tr>
                                        <th>Trạng thái</th>
                                        <td><c:choose>
                                                <c:when test="${account.status == true}"><a class="btn btn-success">Đang hoạt động</a></c:when>
                                                <c:otherwise><a href="DetailCustomerController?action=accept-account&cus-id=${customer.customerId}&acc-id=${account.accId}" class="btn btn-success">Chấp thuận tài khoản</a></c:otherwise>
                                            </c:choose></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="amm-shopping-cart-wrapper">
    <div class="amm-shopping-cart-canvas">
        <div class="amm-shopping_cart">
            <div class="amm-shopping_cart-top-bar d-flex justify-content-between">
                <h8 col-sm-6>Giỏ hàng</h6>
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
<script language='javascript' type='text/javascript'>
            function check(input) {
                if (input.value != document.getElementById('password').value) {
                    input.setCustomValidity('Password Must be Matching.');
                } else {
                    // input is valid -- reset the error message
                    input.setCustomValidity('');
                }
            }
</script>
<script>

    document.getElementById("btn-edit").onclick = function () {

        document.querySelector(".personal-infor .hidden-edit").style.display = 'block';
        document.querySelector(".personal-infor .hidden-edit").style.margin = '0 0 0 22%';
        document.querySelector(".personal-infor .name-infor").style.padding = '0 0 0 43%';
        document.querySelector(".personal-infor table .display-userName").style.display = 'none';
        document.querySelector(".personal-infor #btn-edit").style.display = 'none';
    };
    document.querySelector(".exit").onclick = function () {

        document.querySelector(".personal-infor .hidden-edit").style.display = 'none';
        document.querySelector(".personal-infor table .display-userName").style.display = 'block';
        document.querySelector(".personal-infor .name-infor").style.padding = '0 0 0 24%';
        document.querySelector(".personal-infor #btn-edit").style.display = 'block';
    };
    document.getElementById("btn-edit-2").onclick = function () {

        document.querySelector(".personal-infor .hidden-pass").style.display = 'block';
        document.querySelector(".personal-infor .hidden-pass").style.margin = '0 0 0 22%';
        document.querySelector(".personal-infor .pass-infor").style.padding = '0 0 0 43%';
        document.querySelector(".personal-infor table .display-userName-3").style.display = 'none';
        document.querySelector(".personal-infor #btn-edit-2").style.display = 'none';
    };
    document.querySelector(".exit-pass").onclick = function () {
        document.querySelector(".personal-infor .hidden-pass").style.display = 'none';
        document.querySelector(".personal-infor table .display-userName-3").style.display = 'block';
        document.querySelector(".personal-infor .pass-infor").style.padding = '0 0 0 24%';
        document.querySelector(".personal-infor #btn-edit-2").style.display = 'block';
    };
</script>
</body>

</html>