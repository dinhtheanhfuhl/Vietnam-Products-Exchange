<%-- 
    Document   : header.jsp
    Created on : Dec 16, 2022, 5:04:47 PM
    Author     : DEKUPAC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="desktop-nav header navbar fixed-top">
    <div class="nav-logo mr-sm-5 ml-sm-4">

        <a class="navbar-brand waves-effect" href="Home">
            <h2 id="logoheader" style="color: #F5AB1E;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
        </a>
    </div>
    <ul class="navbar-nav flex-row mr-auto">
        <li class="nav-item ml-4 d-lg-none d-sm-block d-none">
            <form class="form-inline search-full form-inline search animated-search" role="search">
                <i class="flaticon-search-1 d-lg-none d-block"></i>
                <input type="text" class="form-control search-form-control ml-lg-auto" placeholder="">
            </form>
        </li>

    </ul>

    <ul class="navbar-nav flex-row ml-lg-auto">

        <li class="nav-item dropdown user-profile-dropdown pl-4 pr-lg-0 pr-2 ml-lg-2 mr-lg-4  align-self-center">
            <a href="javascript:void(0);" class="nav-link dropdown-toggle user">
                <div class="user-profile d-lg-block d-none">
                    <img style="width: 40px !important; height: 40px !important"
                        <c:choose>
                            <c:when test="${roleIdLoggin==1}">
                                src="uploads/${systemManager.avartarImg}"
                            </c:when>
                        </c:choose>
                        alt="admin-profile" class="img-fluid">
                </div>
                <i class="flaticon-user-7 d-lg-none d-block"></i>
            </a>
        </li>
    </ul>
</header>
