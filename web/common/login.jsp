<!DOCTYPE html>
<html lang="en">
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Đăng nhập</title>
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
                    <li class="breadcrumb-item"><a href="Home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Tài khoản</li>
                </ol>
            </nav>
        </section>
        <div class="section-ptb customer-page register-page" style="padding-bottom: 80px;">
            <div class="container">
                <div class="row log-acc-page register-acc-page pt-5 justify-content-center">
                    <div class="col-lg-4 col-sm-12">
                        <div class="acc-page">
                            <div class="login">
                                <form action="LogginController" method="post">
                                    <div class="login-form-container">
                                        <input type="hidden" name="action" value="login"/>
                                        <div class="title-text ">
                                            <h2>Đăng nhập</h2>
                                            <p>Vui lòng nhập thông tin của bạn!</p>
                                        </div>
                                        <div class="form-group fill-form log-email">
                                            <label for="exampleInputPassword1">Email</label>
                                            <input name="email" type="email" required="" class="form-control" id="exampleInputPassword1"
                                                   placeholder="Nhập Email">
                                        </div>
                                        <div class="form-group fill-form log-lastName">
                                            <label for="exampleInputPassword1">Mật khẩu</label>
                                            <input name="password" type="password" required="" class="form-control" maxlength="20" id="exampleInputPassword1"
                                                   placeholder="Nhập mật khẩu">
                                        </div>
                                        <c:if test="${error!=null}">
                                            <div class="form-group fill-form log-lastName">
                                                <p  class="text-danger">${error}</p>
                                            </div>
                                        </c:if>
                                        <button type="submit" class="btn btn-primary btn-warning form-control">Đăng nhập</button>


                                        <div class="pt-3">
                                            <a href="EditPassController?action=show-forgot-pass" style="color: #f5ab1e;  " id="recoverPass">Quên mật khẩu?</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-sm-12">
                        <div class="acc-page-2">
                            <div class="side-form">
                                <div class="acc-title">
                                    <h6>Bạn chưa có tài khoản? </h6>
                                    <div class="account-option-action">
                                        <a href="RegisterController" id="customer_register">
                                            Tạo tài khoản
                                            <!-- <button type="button" class="btn btn-outline-warning"></button> -->
                                        </a>
                                    </div>
                                </div>
                                <div class="term-privacy">
                                    <p class="term-con">
                                        <span>
                                            <sup>*</sup>
                                        </span>
                                        <a href="ConditionController" target="_blank">Điều khoản dịch vụ</a>
                                    </p>
                                    <p class="pri-pol ">

                                        <span> Sự riêng tư và bảo mật của bạn không quan trọng đối với chúng tôi. Để biết thêm thông tin về cách chúng tôi sử dụng dữ liệu của bạn, hãy đọc điều khoản dưới đây.
                                        </span>
                                        <br>
                                        <a href="PolicyController" target="_blank" style="margin: 5px"> Chính sách bảo mật</a>
                                    </p>
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