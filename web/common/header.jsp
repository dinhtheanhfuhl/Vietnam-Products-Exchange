<!doctype html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Cart</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="../css/style.css">
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
        <link rel="stylesheet" href="../assets/scss/style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    </head>

    <header class="header">
        <nav class="navbar fixed-top navbar-expand-lg navbar-light white scrolling-navbar ">
            <div class="container-fluid">

                <!-- Brand -->
                <a class="navbar-brand waves-effect" href="Home">
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
                        <li class="nav-item " style="padding-left: 40px;">
                            <a class="nav-link waves-effect text-header" href="Home">Trang ch???
                            </a>
                        </li>
                        <li class="nav-item">
                            <div class="dropdown">
                                <a class="nav-link waves-effect text-header dropdown-toggle" href=""
                                   target="_blank">Gi???i thi???u
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
                                     id="dropdown-collection">
                                    <a class="dropdown-item" href="InformationController">V??? ch??ng t??i</a>
                                    <a class="dropdown-item" href="PolicyController">Ch??nh s??ch b???o m???t</a>
                                    <a class="dropdown-item" href="ConditionController">??i???u kho???n d???ch v???</a>
                                </div>
                            </div>
                        </li>
                        <li class="nav-item">


                            <div class="dropdown">
                                <a class="nav-link waves-effect text-header dropdown-toggle" href="#"
                                   >C???a h??ng
                                </a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${listCate}" var="o" >
                                        <a class="dropdown-item" href="MinimartProductController?cid=${o.cateId}">${o.cateName}</a>
                                    </c:forEach>
                                </div>
                            </div>

                        </li>

                        <li class="nav-item">
                            <a class="nav-link waves-effect text-header" href="ContactController">Li??n h???</a>
                        </li>
                    </ul>


                    <!-- Right -->

                    <ul class="navbar-nav nav-flex-icons">
                        <c:if test="${sessionScope.roleIdLoggin!=null}">
                            <li class="nav-item">
                                <form action="MinimartProductController" method="post">
                                    <div class="input-group rounded">
                                        <input <c:if test="${txtSearch!=null}">value="${txtSearch}"</c:if> type="search" class="form-control " required="" name="txtSearch" placeholder="T??m ki???m" aria-label="Search" aria-describedby="search-addon" />
                                            <button type="submit" class="input-group-text border-0" id="search-addon">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </form>
                                </li>
                        </c:if>

                        <c:if test="${sessionScope.roleIdLoggin==null}">
                            <li class="nav-item">
                                <div class="input-group rounded">
                                    <input <c:if test="${txtSearch!=null}">value="${txtSearch}"</c:if> type="search" class="form-control" required="" name="txtSearch" placeholder="T??m ki???m" aria-label="Search" aria-describedby="search-addon" />
                                        <button type="submit" class="input-group-text border-0" id="search-addon">
                                            <i class="fas fa-search"></i>
                                        </button>
                                    </div>
                                </li>
                        </c:if>

                        <c:if test="${sessionScope.roleIdLoggin==4}">
                            <sql:setDataSource var="datas" 
                                               driver="com.microsoft.sqlserver.jdbc.SQLServerDriver"
                                               url="jdbc:sqlserver://LAPTOP-AFFRQ6U2\\SQLEXPRESS:1433;
                                               databaseName=vnprox;encrypt=false"
                                               user="sa" password="123456"/>

                            <li class="nav-item ">
                                <a href="CartController"  class="nav-link cart-btn amm-shopping-cart-open pr-3">
                                    <i class="fas fa-shopping-cart">
                                        <c:if test="${sessionScope.roleIdLoggin==4}">
                                            <sql:query dataSource="${datas}" var="result">
                                                select COUNT(*) as sumCart from CartItem where CartID = 
                                                (select CartID from cart where CartID = ${sessionScope.customer.customerId})
                                            </sql:query>
                                            <c:forEach var = "row" items = "${result.rows}">
                                                <span class="quantity-amm-shopping-cart-open">${row.sumCart}</span>
                                            </c:forEach>
                                        </c:if>
                                    </i>
                                </a>
                            </li>
                        </c:if>
                        <li class="nav-item">
                            <div  class="dropdown dropdown-user">
                                <c:if test="${sessionScope.roleIdLoggin!=null}">
                                    <div class="dropdown">
                                        <c:if test="${sessionScope.roleIdLoggin==4}">
                                            <button  style="background-color: white !important;color: black;"  class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <img style="height: 30px;width: 30px;border-radius: 500px; display: inline" src="uploads/${sessionScope.customer.avartarImg}">
                                                &nbsp;<span style="vertical-align: baseline; display: inline;"> ${sessionScope.nameUser}</span>
                                            </button>
                                        </c:if>
                                        <c:if test="${sessionScope.roleIdLoggin==1||sessionScope.roleIdLoggin==2}">
                                            <button  style="background-color: white !important;color: black;"  class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <img style="height: 30px;width: 30px;border-radius: 500px; display: inline" src="uploads/${sessionScope.systemManager.avartarImg}">
                                                &nbsp;<span style="vertical-align: baseline; display: inline;">${sessionScope.systemManager.name}</span>
                                            </button>
                                        </c:if>
                                        <c:if test="${sessionScope.roleIdLoggin==3}">
                                            <button  style="background-color: white !important;color: black;"  class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <img style="height: 30px;width: 30px;border-radius: 500px; display: inline" src="uploads/${sessionScope.supplier.avartarImg}">
                                                &nbsp;<span style="vertical-align: baseline; display: inline;">${sessionScope.supplier.supplierName}</span>
                                            </button>
                                        </c:if>

                                        <div style="position: absolute;left: -10px !important;" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <c:choose >
                                                <c:when test="${sessionScope.roleIdLoggin==4}">
                                                    <a class="dropdown-item" href="CustomerInfoDetail">Th??ng tin c?? nh??n</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a class="dropdown-item" href="InforController">Th??ng tin c?? nh??n</a>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:if test="${sessionScope.roleIdLoggin==4}">
                                                <a class="dropdown-item" href="HistoryOrderController">L???ch s??? mua h??ng</a>
                                            </c:if>
                                            <c:if test="${sessionScope.roleIdLoggin!=4}">
                                                <c:choose>
                                                    <c:when test="${sessionScope.roleIdLoggin==1}">
                                                        <a class="dropdown-item" href="AdminController">Qu???n l??</a>
                                                    </c:when>
                                                    <c:when test="${sessionScope.roleIdLoggin==2}">
                                                        <a class="dropdown-item" href="ModeratorController">Qu???n l??</a>
                                                    </c:when>
                                                    <c:when test="${sessionScope.roleIdLoggin==3}">
                                                        <a class="dropdown-item" href="SupplierController">Qu???n l??</a>
                                                    </c:when>
                                                </c:choose>

                                            </c:if>
                                            <c:if test="${sessionScope.roleIdLoggin==3||sessionScope.roleIdLoggin==4}">
                                                <a class="dropdown-item" href="EditPassController?action=show-change-pass">Thay ?????i m???t kh???u</a>
                                            </c:if>
                                            <a class="dropdown-item" href="LogoutController">????ng xu???t</a>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${sessionScope.roleIdLoggin==null}">
                                    <a href="LogginController" class="nav-link border border-light rounded waves-effect">
                                        <i class="fas fa-user"></i>????ng Nh???p</a>
                                    </c:if>

                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

</html>