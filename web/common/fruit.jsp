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
                    <li class="breadcrumb-item">Trang chủ</li>
                    <li class="breadcrumb-item" aria-current="page">${cateName}</li>
                </ol>
            </nav>
        </section>
        <div class="orfarm-shop-grid-area pb-50">
            <div class="container">
                <div class="row">

                    <div class="col-lg-3 order-2 order-lg-1">
                        <div class="orfarm-shop-sidebar">
                            <form action="MinimartProductController" method="POST">
                                <c:if test="${cid!=null}">
                                    <input name="cid" type="hidden" value="${cid}"/>
                                </c:if>
                                <c:if test="${txtSearch!=null}">
                                    <input name="txtSearch" type="hidden" value="${txtSearch}"/>
                                </c:if>
                                <input name="filter1" type="hidden" value="filter1"/>
                                <div class="shop-price-filter">
                                    <h4 class="title">Lọc theo giá</h4>
                                    <div class="price-range">
                                        <div class="row">
                                            <input value="${begin}" class="col-md-4 form-control m-2" min="0"  name="begin" type="number" placeholder="Từ"> 
                                            <input value="${end}" class="col-md-4 form-control m-2" min="0" name="end" type="number" placeholder="Đến">    
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${strSearch==null}">
                                    <div class="shop-category-widget">
                                        <h4 class="title">Danh mục sản phẩm</h4>
                                        <ul>
                                            <c:forEach items="${allSubCategory}" var="o" >
                                                <input <c:if test="${mapSubCateSelected.get(o.subCateId)!=null}">checked</c:if> name="subCateId" value="${o.subCateId}" type="checkbox" id="subcate${o.subCateName}">
                                                <label for="subcate${o.subCateName}">${o.subCateName}</label><br>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>
                                <div class="shop-category-widget">
                                    <h4 class="title">Khu vực giao hàng</h4>
                                    <ul>
                                        <div class="row">
                                            <select class="form-control col-md-8 ml-2" name="cityId" id="city">
                                                <option <c:if test="${cityId==0}">selected</c:if> value="0">Tất cả thành phố</option>
                                                <c:forEach items="${allCities}" var="o" >
                                                    <option <c:if test="${cityId==o.cityId}">selected</c:if> value="${o.cityId}">${o.cityName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </ul>
                                </div>
                                <c:if test="${sessionScope.roleIdLoggin==null}">
                                    <button disabled="" class="mt-5 btn btn-warning status" type="submit" id="">  Lọc </button>
                                </c:if>
                                <c:if test="${sessionScope.roleIdLoggin!=null}">
                                    <button class="mt-2 btn btn-warning status" type="submit" id="">  Lọc </button>
                                </c:if>
                            </form>
                        </div>
                    </div>
                    <div class="col-lg-9 order-1 order-lg-2">
                        <form action="MinimartProductController" method="POST">
                            <div class="d-flex justify-content-end">

                                <c:if test="${cid!=null}">
                                    <input type="hidden" name="cid" value="${cid}"/>
                                </c:if>
                                <c:if test="${txtSearch!=null}">
                                    <input type="hidden" name="txtSearch" value="${txtSearch}"/>
                                </c:if>
                                <c:if test="${filter1!=null}">
                                    <input type="hidden" name="begin" value="${begin}"/>
                                    <input type="hidden" name="end" value="${end}"/>
                                    <input type="hidden" name="cityId" value="${cityId}"/>
                                    <c:if test="${subCateIds!=null}">
                                        <c:forEach var="cityId" items="${subCateIds}">
                                            <input type="hidden" name="cityId" value="${cityId}"/>
                                        </c:forEach>
                                    </c:if>
                                </c:if>
                                
                            </div>
                        </form>
                        <div class="row">
                            <c:if test="${sessionScope.roleIdLoggin!=null||sessionScope.roleIdLoggin==1||sessionScope.roleIdLoggin==2||sessionScope.roleIdLoggin==3}">
                                <c:forEach var="key" items="${mapImages.keySet()}">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single-shop-box">
                                            <a href="MimartDetailProduct?pid=${key.productId}">
                                                <div class="thumb text-center">
                                                    <img style="height:200px;object-fit: cover" src="uploads/${mapImages.get(key).get(0).getImgPath()}" alt="">
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
                                                <div class="pricing">
                                                    <c:forEach var="hierarchy" items="${mapHierarchy.get(key)}">

                                                        <c:if test="${mapHierarchy.get(key).get(1)!=hierarchy}">
                                                            <div style="color: #009900" class="discount-price"> <span><fmt:formatNumber type = "number" 
                                                                              pattern = "" value = "${hierarchy.price}" /><sup>vnđ</sup>&nbsp;&nbsp;</span> </div> 
                                                                </c:if>
                                                            </c:forEach>
                                                </div>


                                                <p><svg style="color: #009900" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                                                    <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                    <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                    </svg>
                                                    ${mapCity.get(key).get(0).getCityName()}</p>
                                                <p>Số lượng : <fmt:formatNumber type="number" groupingUsed="true" value="${key.weight}" /> Kg</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${sessionScope.roleIdLoggin==null}">
                                <c:forEach var="key" items="${mapImages.keySet()}">
                                    <div class="col-lg-4 col-md-6">
                                        <div class="single-shop-box">
                                            <a href="" data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo">
                                                <div class="thumb text-center">
                                                    <img style="height:200px;object-fit: cover" src="uploads/${mapImages.get(key).get(0).getImgPath()}" alt="">
                                                </div>
                                            </a>
                                            <div class="content">

                                                <input type="hidden" id="productId" value="1">

                                                <a style="text-decoration: none" data-toggle="modal" href="" data-target="#exampleModal" data-whatever="@mdo">
                                                    <h5>
                                                        ${key.productName}
                                                        ${key.trademark}
                                                        ${key.smell},
                                                        ${key.color}
                                                    </h5>
                                                </a>
                                                <p><svg style="color: #009900" xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-geo-alt" viewBox="0 0 16 16">
                                                    <path d="M12.166 8.94c-.524 1.062-1.234 2.12-1.96 3.07A31.493 31.493 0 0 1 8 14.58a31.481 31.481 0 0 1-2.206-2.57c-.726-.95-1.436-2.008-1.96-3.07C3.304 7.867 3 6.862 3 6a5 5 0 0 1 10 0c0 .862-.305 1.867-.834 2.94zM8 16s6-5.686 6-10A6 6 0 0 0 2 6c0 4.314 6 10 6 10z"/>
                                                    <path d="M8 8a2 2 0 1 1 0-4 2 2 0 0 1 0 4zm0 1a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
                                                    </svg>${mapCity.get(key).get(0).getCityName()}</p>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title" id="exampleModalLabel">Thông báo</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <form>
                                                <div class="form-group">
                                                    <h4 id="message-text">Vui lòng đăng nhập!</h4>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-danger" data-dismiss="modal">Đóng</button>
                                            <a href="LogginController"><button class="btn btn-warning" type="button" >Đăng nhập</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <c:if test="${mapImages.size()!=0}">
                                <div class="col-lg-12">
                                    <div class="bisylms-pagination">
                                        <c:forEach begin="1" end="4" var="i">
                                            <!-- <span class="current">1</span> -->
                                            <a href="#">${i}</a>
                                            <!-- <a class="next" href="#">next<i class="fal fa-arrow-right"></i></a> -->
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:if>
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
        <script>$('#exampleModal').on('show.bs.modal', function (event) {
                                        var button = $(event.relatedTarget)
                                        var recipient = button.data('whatever')
                                        var modal = $(this)
                                    })</script>
    </body>
</html>