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
        <%@include file="header.jsp"%>
        <section class="breadcrum">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item">Trang chủ</li>
                    <li class="breadcrumb-item" aria-current="page">Xem giỏ hàng</li>
                </ol>
            </nav>
        </section>

        <main>
            <div class="container">
                <div class="row">
                    <div class="col-lg-9 mt-10 mb-50">
                        <h3>Giỏ hàng</h3>
                        <div class="displayProduct">
                            <c:if test="${not empty message}">
                                <div class="alert alert-${alert}" role="alert">
                                    <i class="fa fa-${icon}"></i>
                                    ${message}
                                    "${productName}"
                                    ${message2}
                                    ${AmountInStore}Kg
                                </div>
                            </c:if>
                            <ul id="mainCart" class="pb-3">
                                <div class="ordered-detail container">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">&nbsp;</th>
                                                <th scope="col">Tên sản phẩm</th>
                                                <th scope="col">Số lượng(Kg)</th>
                                                <th scope="col">Đơn giá</th>
                                                <th scope="col">Thành tiền</th>
                                                <th scope="col">Xoá</th>
                                            </tr>
                                        </thead>
                                        <c:forEach var="key" items="${mapImages.keySet()}" >
                                            <tbody>
                                                <tr>
                                                    <td><img src="uploads/${mapImages.get(key).get(0).getImgPath()}" alt="" style="object-fit: cover;margin-left: 0px;height: 100px"></td>
                                                    <td><a style="text-decoration: none;" href="MimartDetailProduct?pid=${mapProduct.get(key).get(0).productId}">
                                                            <h6>${mapProduct.get(key).get(0).productName}<br>
                                                                ${mapProduct.get(key).get(0).trademark}<br>
                                                                ${mapProduct.get(key).get(0).smell},
                                                                ${mapProduct.get(key).get(0).color}</h6></a>
                                                    </td>
                                                    <td><form action="CheckCartAmountController" method="post">
                                                            <input style="width: 50%;" type="number" max="2000000000" value="${key.amount}" name="amount" id="amount" onblur="this.form.submit()">
                                                            <input  type="hidden" onblur="this.form.submit()" name="cartItemId" value="${key.cartId}">
                                                            <input  type="hidden"  onblur="this.form.submit()" name="cartProducId" value="${mapProduct.get(key).get(0).productId}">
                                                        </form>
                                                        <c:if test="${mapCartItemStatus.get(key)==false}">
                                                            <p style="color: red;">Số lượng sản phẩm<br>trong kho không đủ</p>
                                                        </c:if>
                                                    </td>
                                                    <td><fmt:formatNumber type = "number"
                                                                      pattern = "" value = "${mapProHie.get(key).price}" /><sup>vnđ/kg</sup></td>
                                                    <td><fmt:formatNumber type = "number"
                                                                      pattern = "" value = "${mapProHie.get(key).price*key.amount}" /><sup>vnđ</sup></td>
                                                    <td><a style="margin-left: 10px;" href="DeleteCartController?pid=${mapProduct.get(key).get(0).getProductId()}&&cid=${key.cartId}"><i class="icon-delete1 fas fa-trash-alt"></i></a></td>
                                                </tr>
                                            </tbody>
                                        </c:forEach>
                                    </table>
                                </div>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 box-fee mt-70 mb-50 pt-3">
                        <div class="immidiate-fee sum-fee" style="color: rgb(49, 189, 21);">
                            Tổng tiền: <span class="prices"><fmt:formatNumber type = "number" 
                                              pattern = "" value = "${totalCart}" /><sup>vnđ</sup>&nbsp;&nbsp;</span>
                        </div>
                        <div class="payment">
                            <a style="margin-left: 50px;<c:if test="${totalCart==0 || totalCart==null}">pointer-events: none; cursor: default;</c:if>" 
                               href="CheckOutController"><button  id="btn-order" 
                                                                   type="submit" class="<c:if test="${totalCart==0 || totalCart==null}">disabled</c:if> btn-buy btn btn-success mt-2 ml-3">Thanh toán</button></a>

                        </div>
                    </div>
                </div>
            </div>
        </main>

        <%@include file="footer.jsp"%>  

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script>
        </script>
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
        <script type="text/javascript">
            $(window).load(function () {
                showProduct();
                immidiateSum();

            });


        </script>
    </body>
</html>