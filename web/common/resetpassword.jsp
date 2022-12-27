<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <title>Thay đổi mật khẩu </title>
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
        <section class="breadcrum" >
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item">Trang chủ</li>
                    <li class="breadcrumb-item" aria-current="page">Đặt lại mật khẩu</li>
                </ol>
            </nav>
        </section>

        <main role="main">
            <section class="resetPass">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <div class="acc-reset" id="customerResetPass">
                                <div class="reset-title">
                                    <h2>Đặt lại mật khẩu</h2>
                                </div>
                                <form action="EditPassController" method="POST">
                                    <c:if test="${accId!=null}">
                                        <input type="hidden" name="accId" value="${accId}"/>
                                    </c:if>
                                    <input type="hidden" name="action" value="editpass"/>
                                    <div class="login-reset">
                                        <ul class="fill-form">
                                            <li class="log-resetEmail input-group ">
                                                <label for="exampleInputEmail">Mật khẩu mới</label>
                                                <br>
                                                <input name="pass" type="password" class="form-control" id="exampleInputEmail" placeholder="nhập mật khẩu mới">
                                            </li>
                                            <li class="log-resetEmail input-group ">
                                                <label for="exampleInputEmail">Nhập lại mật khẩu mới</label>
                                                <br>
                                                <input name="rePass" type="password" class="form-control" id="exampleInputEmail" placeholder="nhập lại mật khẩu mới">
                                            </li>
                                            <li class="log-resetEmail input-group ">
                                                <span class="text-warning">${error}</span>
                                            </li>
                                            <li class="form-btn" >
                                                <div class="form-action-btn">
                                                    <!-- <div class="form-action-btn"> -->
                                                    <button style="margin-top: 30px; margin-bottom: 15px;" id="submit" type="submit" class="btn btn-warning">Gửi</button>
                                                    <br>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
        </main>
        <%@include file="footer.jsp"%>  
    </body>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="./main.js"></script>
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
</html>