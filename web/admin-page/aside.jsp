<%-- 
    Document   : sideBar.jsp
    Created on : Dec 15, 2022, 10:14:21 AM
    Author     : ductd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<aside class="profile-sidebar text-center">
            <div class="profile-content profile-content-scroll">
                <div class="usr-profile">
                    <img src="${pageContext.request.contextPath}/assets/img/90x90.jpg" alt="admin-profile" class="img-fluid" />
                </div>
                <p class="user-name mt-4 mb-4">Hoàng Thị Xoan</p>

                <div class="user-links text-left">
                    <ul class="list-unstyled">
                        <li>
                            <a href="./personal-infor-moderator.jsp"><i class="flaticon-user-11"></i> Thông tin cá nhân</a>
                        </li>
                        <li>
                            <a href="moderator-list-product.jsp"><i class="flaticon-globe"></i> Quản lý</a>
                        </li>
                        <li>
                            <a href="#"><i class="flaticon-power-off"></i> Đăng xuất</a>
                        </li>
                    </ul>
                </div>
            </div>
        </aside>
