<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Tạo tài khoản</title>
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
                    <li class="breadcrumb-item">Trang chủ</li>
                    <li class="breadcrumb-item" aria-current="page"> Đăng nhập</li>
                    <li class="breadcrumb-item" aria-current="page"> Tạo tài khoản</li>
                </ol>
            </nav>
        </section>
        <div class="section-ptb customer-page register-page" style="padding-bottom: 80px;">
            <div class="container">
                <div class="row log-acc-page register-acc-page pt-5 justify-content-center">
                    <div class="col-lg-4 col-sm-12">
                        <div class="acc-page">
                            <div class="login">
                                <form action="RegisterController" method="POST" enctype="multipart/form-data">
                                    <div class="login-form-container">
                                        <input type="hidden" name="action" value="reg"/>
                                        <div class="title-text ">
                                            <h2>Tạo tài khoản</h2>
                                            <p>Vui lòng đăng kí thông tin vào bên dưới!</p>
                                        </div>
                                        <div class="form-group fill-form log-email">
                                            <label style="color: #505056;">Tên người dùng*</label>
                                            <input style="color: #505056;" name="name" type="text" required maxlength="50" class="form-control" 
                                                   placeholder="nhập tên người dùng">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;" for="exampleInputPassword1">Mật khẩu*</label>
                                            <input style="color: #505056;" name="password" required="" id="password" minlength="8" maxlength="20" type="password" class="form-control" 
                                                   placeholder=" nhập mật khẩu">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;" for="exampleInputPassword1">Xác nhận mật khẩu*</label>
                                            <input style="color: #505056;" type="password" required="" name="re-password" id="confirm_password" class="form-control" 
                                                   placeholder="xác nhận mật khẩu">
                                            <span id='message'></span>
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;" for="exampleInputPassword1">Ngày sinh*</label>
                                            <input style="color: #505056;" name="date-birth" placeholder="dd-mm-yyyy" value="" min="1900-01-01" max="2030-12-31" type="date" required="" class="form-control"
                                                   placeholder="ngày sinh">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;" for="exampleInputPassword1">Giới tính*</label>
                                            <select style="color: #505056;" class="form-control" name="gender" id="gender">
                                                <option value="nam">Nam</option>
                                                <option value="nữ">Nữ</option>
                                                <option value="khác">Khác</option>
                                            </select>
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Email*</label>
                                            <input style="color: #505056;" name="email" required="" type="email" class="form-control"
                                                   placeholder="nhập email">
                                        </div> 
                                        <c:if test="${messDupMail!=null}">
                                            <div class="form-group fill-form log-lastName">
                                                <span class="text-danger">${messDupMail}</span>
                                            </div> 
                                        </c:if>
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Số điện thoại*</label>
                                            <input style="color: #505056;" name="phone" required="" type="number" class="form-control" 
                                                   placeholder="nhập số điện thoại">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Vai trò*</label>
                                            <select style="color: #505056;" class="form-control" name="role" id="gender">
                                                <option value="3">Nhà cung cấp</option>
                                                <option value="4">Minimart</option>
                                            </select>
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Thành phố*</label>
                                            <select style="color: #505056;" class="form-control" name="city" id="gender">
                                                <c:forEach var="c" items="${cities}">
                                                    <option value="${c.cityId}">${c.cityName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Tên cửa hàng*</label>
                                            <input style="color: #505056;" name="shop-name" required="" type="text" maxlength="255" class="form-control" 
                                                   placeholder="nhập tên cửa hàng">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Địa chỉ cơ sở chính*</label>
                                            <input style="color: #505056;" name="main-address" type="text" maxlength="255" required="" class="form-control" 
                                                   placeholder="nhập địa chỉ cơ sở chính">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label style="color: #505056;">Giấy phép*</label>
                                            <input style="color: #505056;" name="lincse" type="file" required="" class="form-control-file"
                                                   accept=".docx,application/pdf,image/jpeg,image/gif,image/png"  id="file-input">
                                        </div> 
                                        <button type="submit" class="btn btn-primary btn-warning form-control">Đăng ký</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="acc-page-2">
                            <div class="side-form">
                                <div class="acc-title">
                                    <h6>Bạn đã có tài khoản? </h6>
                                    <div class="account-option-action">
                                        <a href="LogginController" id="customer_register">
                                            Đăng nhập
                                            <!-- <button type="button" class="btn btn-outline-warning"></button> -->
                                        </a>
                                    </div>
                                </div>
                                <div class="term-privacy">
                                    <p class="term-con">
                                        <span>
                                            <sup>*</sup>
                                        </span>
                                        <a href="" target="_blank"> Điều khoản và điều kiện</a>
                                    </p>
                                    <p class="pri-pol ">

                                        <span> Sự riêng tư và bảo mật của bạn không quan trọng đối với chúng tôi. Để biết thêm thông tin về cách chúng tôi sử dụng dữ liệu của bạn, hãy đọc điều khoản dưới đây.
                                        </span>
                                        <br>
                                        <a href="" target="_blank" style="margin: 5px"> Chính sách điều khoản</a>
                                    </p>
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
                        <h6>Giá» hÃ ng</h6>
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
                            <h5>Tá»ng tiá»n:</h5>
                            <p>0 <span>Ä</span></p>

                        </div>
                        <div class="cart-btn pt-25">
                            <a class="main-btn" href="./ViewCart.html">Xem giá» hÃ ng</a>
                            <a class="main-btn main-btn-2" href="./payment.html">Thanh toÃ¡n</a>
                        </div>
                    </div>
                </div> <!-- shopping_cart -->
            </div>
            <div class="overlay"></div>
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
        <script>$('#password, #confirm_password').on('keyup', function () {
                if ($('#password').val() == $('#confirm_password').val()) {
                    $('#message').html('').css('color', 'green');
                } else
                    $('#message').html('Mật khẩu chưa trùng khớp').css('color', 'red');
            });</script>
    </body>
</html>