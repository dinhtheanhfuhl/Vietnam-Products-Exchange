<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Cart</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="css/style.css">
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

        <main style="margin-top: 100px;">
            <div class="container-fluid" >
                <form action="OrderController" method="post">
                    <div class="row">
                        <div class="col-lg-7 col-sm-12 pt-5 payment-right">


                            <div class="form-group">
                                <h3>Th??ng tin ?????t h??ng</h3>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">T??n ng?????i nh???n h??ng*</label>
                                    <input required type="text" class="form-control" maxlength="50" id="exampleInputPhone" name="receiverName" placeholder="Nh???p t??n ng?????i nh???n h??ng">
                                </div>
                                <label>?????a ch??? ?????t h??ng*</label>
                                <div class="input-group mb-3">
                                    <input required type="text" class="form-control" maxlength="255" id="exampleInputAddress" name="receiverAddress" placeholder="Nh???p ?????a ch??? ?????t h??ng">
                                </div>

                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">S??? ??i???n tho???i*</label>
                                    <input required type="number" class="form-control" id="exampleInputAddress" name="receiverPhone" placeholder="Nh???p s??? ??i???n tho???i">
                                </div>
                                <div class="form-group">
                                    <label for="exampleFormControlTextarea1">Ghi ch??</label>
                                    <textarea class="form-control" id="exampleFormControlTextarea1" name="note" rows="4"></textarea>
                                </div>

                            </div>
                            <div class="right">
                                <p>M???i s??? ri??ng t?? v?? th??ng tin c???a b???n ?????u ???????c ch??ng t??i b???o m???t.</p>
                            </div>
                        </div>
                        <div class="col-lg-5 col-sm-12 payment-left">
                            <div class="payment-left-display pr-80">
                                <div class="showProduct">
                                    <ul id="mainCartPayment">
                                    </ul>
                                </div>

                                <div class="sumPriceproduct">
                                    <p><b>Ph????ng th???c giao h??ng:</b> <span>&nbsp;Nh?? cung c???p giao h??ng</span></p>
                                    <p><b>Ph????ng th???c thanh to??n:</b> <span>&nbsp;Thanh to??n khi nh???n h??ng(COD) </span></p></b>

                                </div>
                                <div class="sumarizePrice ">
                                    <input type="hidden" value="${totalCart}" name="totalprice">
                                    <p>T???ng ti???n: <span class="padding-price"><fmt:formatNumber type = "number" 
                                                      pattern = "" value = "${totalCart}" /><sup>vn??</sup>&nbsp;&nbsp;</span></p>
                                </div>
                                <div class="success-order row pb-5 ">
                                    <button id="btn-order" type="submit" class="btn-buy btn btn-success mt-2 ml-3">?????t h??ng</button>
                                    <a href="CartController" style="font-size: 20px" class="back">Quay l???i</a>
                                </div>
                                <p>*Ph????ng th???c giao h??ng h??? tr??? th???i ??i???m hi???n t???i l?? nh?? cung c???p giao. Ph?? giao h??ng s??? ???????c nh?? cung c???p li??n h??? v???i ng?????i nh???n h??ng qua s??? ??i???n tho???i.</p>
                                <p>*Ph????ng th???c thanh to??n h??? tr??? th???i gian th???i ??i???m hi???n t???i l?? thanh to??n khi nh???n h??ng(Ti???n m???t ho???c chuy???n kho???n)</p>
                            </div>

                        </div>
                    </div>
                </form>
            </div>
        </main>

    </body>
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
    <script type="text/javascript">
        $(window).load(function () {
            showProductToPayment();
            checkProduct();
        });


    </script>

</html>