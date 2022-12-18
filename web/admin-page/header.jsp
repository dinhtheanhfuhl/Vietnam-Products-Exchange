<%-- 
    Document   : header
    Created on : Dec 18, 2022, 11:11:07 AM
    Author     : DEKUPAC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<header class="desktop-nav header navbar fixed-top">
    <div class="nav-logo mr-sm-5 ml-sm-4">
        <a href="javascript:void(0);" class="nav-link sidebarCollapse d-inline-block mr-sm-5"
           data-placement="bottom">
            <i class="flaticon-menu-line-3"></i>
        </a>
        <a class="navbar-brand waves-effect" href="Home">
            <h2 id="logoheader" style="color: #F5AB1E;font-family: 'Signika Negative';font-weight: 700;">VnProX</h2>
        </a>
    </div>

    <ul class="navbar-nav flex-row ml-lg-auto">


        <li class="nav-item dropdown user-profile-dropdown pl-4 pr-lg-0 pr-2 ml-lg-2 mr-lg-4  align-self-center">
            <a href="javascript:void(0);" class="nav-link dropdown-toggle user">
                <div class="user-profile d-lg-block d-none">
                    <img style="width: 40px !important; height: 40px !important; object-fit: cover;"
                         <c:choose>
                             <c:when test='${sessionScope.systemManager!=null && sessionScope.systemManager.avartarImg!=null && sessionScope.systemManager.avartarImg!=""}'>
                                 src="uploads/${sessionScope.systemManager.avartarImg}"
                             </c:when>
                             <c:when test='${sessionScope.supplier!=null && sessionScope.supplier.avartarImg!=null && sessionScope.supplier.avartarImg!=""}'>
                                 src="uploads/${sessionScope.supplier.avartarImg}"
                             </c:when>
                             <c:otherwise>
                                 src="https://hocwebgiare.com/thiet_ke_web_chuan_demo/bootstrap_user_profile/images/profile_user.jpg"
                             </c:otherwise>
                         </c:choose>
                         alt="admin-profile" class="img-fluid">
                </div>
                <i class="flaticon-user-7 d-lg-none d-block"></i>
            </a>
        </li>
    </ul>
</header>
