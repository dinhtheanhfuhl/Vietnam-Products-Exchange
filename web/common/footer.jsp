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
    <div class="main-footer container">
        <div class="row m14 container">
            <div class="col-lg-4 col-sm-6 col-xs-12">
                <div class="text-footer">
                    <h4>Giới thiệu</h4>
                    <p>Vietnam Products Exchange (VnProX) là một nền tảng kết nối các nhà cung cấp nông sản Việt với các thương lái, 
                        siêu thị mini nhằm  kích cầu tiêu dùng hàng Việt đến tất cả người dân.
                        Chúng tôi luôn đảm bảo mọi thông tin của tất cả mặt hàng nông sản xuất hiện trên sàn là chính xác nhất.
                    </p>
                    <div class="logo-1">
                        <img class="w-100" src="img/logo_bct_019590229b4c4dfda690236b67f7aff4.jpg" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-2 col-sm-6 col-xs-12">
                <div class="text-footer">
                    <h4>Liên kết</h4>
                    <p><a href="InformationController">Về chúng tôi</a></p>
                    <p><a href="PolicyController">Chính sách bảo mật</a></p>
                    <p><a href="ConditionController">Điều khoản dịch vụ</a></p>
                    <p><a href="ContactController">Liên hệ</a></p>

                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="text-footer ">
                    <h4>Thông tin liên hệ</h4>
                    <div class="d-flex">
                        <span class="mr-2"><svg class="svg-inline--fa fa-map-marker-alt fa-w-12" aria-hidden="true"
                                                focusable="false" data-prefix="fas" data-icon="map-marker-alt" role="img"
                                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" data-fa-i2svg="">
                            <path fill="currentColor"
                                  d="M172.268 501.67C26.97 291.031 0 269.413 0 192 0 85.961 85.961 0 192 0s192 85.961 192 192c0 77.413-26.97 99.031-172.268 309.67-9.535 13.774-29.93 13.773-39.464 0zM192 272c44.183 0 80-35.817 80-80s-35.817-80-80-80-80 35.817-80 80 35.817 80 80 80z">
                            </path>
                            </svg><!-- <i class="fas fa-map-marker-alt"></i> --></span>
                        <p>Toà nhà New Center, ngõ 26, phố Đỗ Quang, phường Trung Hoà, quận Cầu Giấy, Hà Nội </p>
                    </div>

                    <div class="d-flex">
                        <span class="mr-2"><svg class="svg-inline--fa fa-blender-phone fa-w-18" aria-hidden="true"
                                                focusable="false" data-prefix="fas" data-icon="blender-phone" role="img"
                                                xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg="">
                            <path fill="currentColor"
                                  d="M392 64h166.54L576 0H192v352h288l17.46-64H392c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h114.18l17.46-64H392c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h140.36l17.46-64H392c-4.42 0-8-3.58-8-8V72c0-4.42 3.58-8 8-8zM158.8 335.01l-25.78-63.26c-2.78-6.81-9.8-10.99-17.24-10.26l-45.03 4.42c-17.28-46.94-17.65-99.78 0-147.72l45.03 4.42c7.43.73 14.46-3.46 17.24-10.26l25.78-63.26c3.02-7.39.2-15.85-6.68-20.07l-39.28-24.1C98.51-3.87 80.09-.5 68.95 11.97c-92.57 103.6-92 259.55 2.1 362.49 9.87 10.8 29.12 12.48 41.65 4.8l39.41-24.18c6.89-4.22 9.7-12.67 6.69-20.07zM480 384H192c-35.35 0-64 28.65-64 64v32c0 17.67 14.33 32 32 32h352c17.67 0 32-14.33 32-32v-32c0-35.35-28.65-64-64-64zm-144 96c-17.67 0-32-14.33-32-32s14.33-32 32-32 32 14.33 32 32-14.33 32-32 32z">
                            </path>
                            </svg><!-- <i class="fas fa-blender-phone"></i> --></span>
                        <p>1900.636.099</p>
                    </div>
                    <div class="d-flex">
                        <span class="mr-2"><svg class="svg-inline--fa fa-paper-plane fa-w-16" aria-hidden="true" focusable="false"
                                                data-prefix="fas" data-icon="paper-plane" role="img" xmlns="http://www.w3.org/2000/svg"
                                                viewBox="0 0 512 512" data-fa-i2svg="">
                            <path fill="currentColor"
                                  d="M476 3.2L12.5 270.6c-18.1 10.4-15.8 35.6 2.2 43.2L121 358.4l287.3-253.2c5.5-4.9 13.3 2.6 8.6 8.3L176 407v80.5c0 23.6 28.5 32.9 42.5 15.8L282 426l124.6 52.2c14.2 6 30.4-2.9 33-18.2l72-432C515 7.8 493.3-6.8 476 3.2z">
                            </path>
                            </svg><!-- <i class="fas fa-paper-plane"></i> --></span>
                        <p>vnproxservice@gmail.com</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-sm-6 col-xs-12">
                <div class="text-footer">
                    <h4>Fanpage</h4>
                    <div>
                        <iframe src="https://www.facebook.com/plugins/page.php?href=https%3A%2F%2Fwww.facebook.com%2Fprofile.php%3Fid%3D100088443501649&tabs=messages&width=340&height=130&small_header=false&adapt_container_width=true&hide_cover=false&show_facepile=true&appId" width="340" height="130" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="bottom-footer mb-3">
        <div class="row">
            <div class="col ">
                <ul class="ft-bottom container">
                    <li class="copy-right">
                        <p style="font-size: 14px;">Copyright © 2022 Powered by VnProx. Powered by VnProx</p>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</html>