<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Tạo tài khoản</title>
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
                    <a class="navbar-brand waves-effect" href="./home.jsp">
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
                                <a class="nav-link waves-effect  text-header" href="./index.html">Trang chủ

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
                                        <a class="dropdown-item" href="./hoaqua.html">Trái cây</a>
                                        <a class="dropdown-item" href="./dokho.html">Rau củ sạch</a>
                                        <a class="dropdown-item" href="./dokho.html">Các loại hạt</a>
                                    </div>
                                </div>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link waves-effect text-header" href="./contact.html">Liên hệ</a>
                            </li>
                        </ul>


                        <!-- Right -->
                        <ul class="navbar-nav nav-flex-icons">
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

        <section class="breadcrum">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item"><a href="./home.jsp">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page"> Tạo tài khoản</li>
                </ol>
            </nav>
        </section>
        <div class="section-ptb customer-page register-page" style="padding-bottom: 80px;">
            <div class="container">
                <div class="row log-acc-page register-acc-page pt-5 justify-content-center">
                    <div class="col-lg-4 col-sm-12">
                        <div class="acc-page">
                            <div class="login">
                                <form action="index.html">
                                    <div class="login-form-container">
                                        <div class="title-text ">
                                            <h2>Tạo tài khoản</h2>
                                            <p>Vui lòng đăng kí thông tin vào bên dưới!</p>
                                        </div>
                                        <div class="form-group fill-form log-email">
                                            <label>Tên người dùng*</label>
                                            <input type="text" required="" class="form-control" id="exampleInputPassword1"
                                                   placeholder="nhập tên người dùng">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label for="exampleInputPassword1">Mật khẩu*</label>
                                            <input name="password" required="" id="password" type="password" class="form-control" 
                                                   placeholder=" nhập mật khẩu">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label for="exampleInputPassword1">Xác nhận mật khẩu*</label>
                                            <input type="password" required="" name="confirm_password" id="confirm_password" class="form-control" 
                                                   placeholder="xác nhận mật khẩu">
                                            <span id='message'></span>
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label for="exampleInputPassword1">Ngày sinh*</label>
                                            <input type="date" required="" class="form-control"
                                                   placeholder="ngày sinh">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label for="exampleInputPassword1">Giới tính*</label>
                                            <select class="form-control" name="gender" id="gender">
                                                <option value="male">Nam</option>
                                                <option value="female">Nữ</option>
                                                <option value="other">Khác</option>
                                            </select>
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label>Email*</label>
                                            <input required="" type="email" class="form-control"
                                                   placeholder="nhập email">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label>Số điện thoại*</label>
                                            <input required="" type="text" class="form-control" 
                                                   placeholder="nhập số điện thoại">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label >Vai trò*</label>
                                            <select class="form-control" name="role" id="gender">
                                                <option value="">Nhà cung cấp</option>
                                                <option value="">Minimart</option>
                                            </select>
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label>Tên cửa hàng*</label>
                                            <input required="" type="text" class="form-control" 
                                                   placeholder="nhập tên cửa hàng">
                                        </div> 
                                        <div class="form-group fill-form log-lastName">
                                            <label>Địa chỉ cơ sở chính*</label>
                                            <input type="password"  required="" class="form-control" 
                                                   placeholder="nhập địa chỉ cơ sở chính">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label>Giấy phép*</label>
                                            <input type="file" required="" class="form-control-file"
                                                   id="file-input">
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
                                        <a href="./login.jsp" id="customer_register">
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