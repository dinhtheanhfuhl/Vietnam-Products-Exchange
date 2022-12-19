<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<aside class="profile-sidebar text-center">
    <div class="profile-content profile-content-scroll">
        <div class="usr-profile">
            <img style="width: 100px; height: 100px; object-fit: cover;"
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
                 class="img-fluid" />
        </div>
        <p class="user-name mt-4 mb-4">
            <c:if test="${sessionScope.systemManager!=null}">${sessionScope.systemManager.name}</c:if>
            <c:if test="${sessionScope.supplier!=null}">${sessionScope.supplier.supplierName}</c:if>
            </p>

            <div class="user-links text-left">
                <ul class="list-unstyled">
                    <li>
                        <a href="InforController"><i class="flaticon-user-11"></i> Thông tin cá nhân</a>
                    </li>
                <c:if test="${sessionScope.supplier!=null}">
                    <li>
                        <a href="EditPassController"><i class="flaticon-lock-1"></i> Thay đổi mật khẩu</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.roleIdLoggin==1}">
                    <li>
                        <a href="AdminController"><i class="flaticon-globe"></i> Quản lý</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.roleIdLoggin==2}">
                    <li>
                        <a href="ModeratorController"><i class="flaticon-globe"></i> Quản lý</a>
                    </li>
                </c:if>
                <c:if test="${sessionScope.roleIdLoggin==3}">
                    <li>
                        <a href="SupplierController"><i class="flaticon-globe"></i> Quản lý</a>
                    </li>
                </c:if>

                <li>
                    <a href="LogoutController"><i class="flaticon-power-off"></i> Đăng xuất</a>
                </li>
            </ul>
        </div>
    </div>
</aside>