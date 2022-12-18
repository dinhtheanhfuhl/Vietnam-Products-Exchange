<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
        <title>Tạo sản phẩm mới</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!--====== Favicon Icon ======-->
        <link rel="shortcut icon" .href="./image/578b1438ff0a7fc4704aa5ade7625e89.jpeg" type="image/png">

        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="${pageContext.request.contextPath}/assets/css/loader.css" rel="stylesheet" type="text/css" />
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700' rel='stylesheet' type='text/css'>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/plugins.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM STYLES -->
        <link href="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.css" rel="stylesheet" type="text/css">
        <link href="${pageContext.request.contextPath}/assets/css/default-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/assets/css/ecommerce-dashboard/timeline.css" rel="stylesheet" type="text/css" />
        <!--  BEGIN CUSTOM STYLE FILE  -->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/table/datatable/datatables.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/ecommerce/order.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ecommerce/addedit_product.css">
        <!-- END PAGE LEVEL PLUGINS/CUSTOM STYLES -->


    </head>

    <body>
        <div id="eq-loader">
            <div class="eq-loader-div">
                <div class="eq-loading dual-loader mx-auto mb-5"></div>
            </div>
        </div>

        <!--  BEGIN NAVBAR  -->
        <%@include file="header.jsp" %>
        <!--  END NAVBAR  -->

        <!--  BEGIN MAIN CONTAINER  -->

        <div class="main-container" id="container">
            <div class="overlay"></div>
            <div class="ps-overlay"></div>
            <div class="search-overlay"></div>


            <!--  BEGIN MODERN  -->

            <div class="modernSidebar-nav header header navbar">
                <div class="">
                    <nav id="modernSidebar">
                        <ul class="menu-categories pl-0 m-0" id="topAccordion">

                            <li class="menu">
                                <a href="SupplierController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-3d-cube"></i>
                                        <span>Danh sách<br> sản phẩm</span>
                                    </div>
                                </a>
                            </li>
                            <li class="menu">
                                <a href="SupplierOrderController" class="dropdown-toggle collapsed">
                                    <div class="">
                                        <i class="flaticon-list2"></i>
                                        <span>Danh sách<br> đơn hàng</span>
                                    </div>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!--  END MODERN  -->

            <!--  BEGIN CONTENT PART  -->
            <div id="content" class="main-content ">
                <div class="container " style="margin-top: 50px;">
                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 layout-spacing">
                            <div class="statbox widget box box-shadow" >
                                <div style="margin-top: 60px" class="widget-header">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12 col-12">
                                            <h4>Thêm sản phẩm </h4>
                                        </div>
                                    </div>
                                </div>
                                <div class="widget-content widget-content-area add-manage-product-2">
                                    <form method="post" action="SupplierAddController?action=add" enctype="multipart/form-data">
                                        <div class="row">
                                            <div class="col-xl-6 col-md-12">
                                                <div class="card card-default">
                                                    <div class="card-heading">
                                                        <h2 class="card-title"><span>THÔNG TIN CƠ BẢN</span></h2>
                                                    </div>
                                                    <div class="card-body" >
                                                        <div class="card-body" >
                                                            <div class="form-horizontal" style="padding-top: 58px !important;">
                                                                <div class="form-group mb-4">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <label class="col-md-4">Hình ảnh 1*
                                                                                <p id="licennote" >
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                                    </svg>
                                                                                    <a>Định dạng ảnh chấp nhận: .JPG, .JPEG, .PNG</a>
                                                                                </p>
                                                                            </label>
                                                                            <div class="col-md-8">
                                                                                <div class="mb-3">
                                                                                    <div class="custom-file">

                                                                                        <input type="file" required="" class="form-control-file" name="photo1"
                                                                                               id="file-input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <label class="col-md-4">Hình ảnh 2*
                                                                                <p id="licennote" >
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                                    </svg>
                                                                                    <a>Định dạng ảnh chấp nhận: .JPG, .JPEG, .PNG</a>
                                                                                </p></label>
                                                                            <div class="col-md-8">
                                                                                <div class="mb-3">
                                                                                    <div class="custom-file">

                                                                                        <input type="file" required="" class="form-control-file" name="photo2"
                                                                                               id="file-input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <label class="col-md-4">Hình ảnh 3
                                                                                <p id="licennote" >
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                                    </svg>
                                                                                    <a>Định dạng ảnh chấp nhận: .JPG, .JPEG, .PNG</a>
                                                                                </p></label>
                                                                            <div class="col-md-8">
                                                                                <div class="mb-3">
                                                                                    <div class="custom-file">
                                                                                        <input type="file" class="form-control-file" 
                                                                                               id="file-input" name="photo3">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <label class="col-md-4">Hình ảnh 4
                                                                                <p id="licennote" >
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                                    </svg>
                                                                                    <a>Định dạng ảnh chấp nhận: .JPG, .JPEG, .PNG</a>
                                                                                </p></label>
                                                                            <div class="col-md-8">
                                                                                <div class="mb-3">
                                                                                    <div class="custom-file">
                                                                                        <input type="file" class="form-control-file"
                                                                                               id="file-input" name="photo4">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <label class="col-md-4">Hình ảnh 5
                                                                                <p id="licennote" >
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                                    </svg>
                                                                                    <a>Định dạng ảnh chấp nhận: .JPG, .JPEG, .PNG</a>
                                                                                </p></label>
                                                                            <div class="col-md-8">
                                                                                <div class="mb-3">
                                                                                    <div class="custom-file">
                                                                                        <input type="file" class="form-control-file"
                                                                                               id="file-input" name="photo5">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="form-group mb-4">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Mô tả sản phẩm*</label>
                                                                        <div class="col-md-8">

                                                                            <textarea required="" maxlength="5000" style="height: 200px;" rows="4" cols="5" name="description"
                                                                                      class="form-control"></textarea>
                                                                            <span style="color: red;float: right">Tối đa 5000 kí tự</span>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Mã Barcode/SKU*</label>
                                                                        <div class="col-md-8">
                                                                            <input class="form-control" type="number" required="" name="barcode" minlength="8" maxlength="13" type="text">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="form-group">
                                                                        <div class="row">
                                                                            <label class="col-md-4">Giấy tờ chứng nhận*<p id="licennote" >
                                                                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                                    <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                                    </svg>
                                                                                    <a>Định dạng file: .DOCS, .PDF, .JPG, .JPEG, .PNG</a>
                                                                                </p></label>

                                                                            <div class="col-md-8">
                                                                                <div class="mb-3">
                                                                                    <div class="custom-file">

                                                                                        <input required="" type="file" class="form-control-file"
                                                                                               name="lincse"   id="file-input">
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Danh mục</label>
                                                                        <div class="col-md-8">
                                                                            <select class="form-control form-custom mb-4"
                                                                                    name="subCate">

                                                                                <c:forEach var="cate" items="${mapCateSubCate.keySet()}">
                                                                                    <optgroup label="${cate.cateName}">
                                                                                        <c:forEach var="subCate" items="${mapCateSubCate.get(cate)}">
                                                                                            <option value="${subCate.subCateId}">${subCate.subCateName}</option>
                                                                                        </c:forEach>
                                                                                    </optgroup>
                                                                                </c:forEach>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="form-group mb-4">
                                                                    <div class="row">
                                                                        <label class="col-md-4">Khu vực giao hàng</label>
                                                                        <div class="col-md-8">
                                                                            <select multiple size="10" style="height: 50%;" class="form-control form-custom mb-4"
                                                                                    name="cities">

                                                                                <c:forEach var="city" items="${allCities}">
                                                                                    <option value="${city.cityId}">${city.cityName}</option>
                                                                                </c:forEach>


                                                                            </select>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xl-6 col-md-12">
                                                <div class="card card-default">
                                                    <div class="card-heading">
                                                        <h2 class="card-title"><span>THÔNG TIN CHI TIẾT</span></h2>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class="form-horizontal">
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Tên loại sản phẩm*</label>
                                                                    <div class="col-md-8">

                                                                        <input maxlength="50" required="" class="form-control" name="name" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Thương hiệu*</label>
                                                                    <div class="col-md-8">

                                                                        <input maxlength="50" required="" class="form-control" name="trademark" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Hương vị*</label>
                                                                    <div class="col-md-8">

                                                                        <input maxlength="50" required="" class="form-control" name="smell" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Màu sắc</label>
                                                                    <div class="col-md-8">
                                                                        <input maxlength="50" class="form-control" name="color" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Số lượng*</label>
                                                                    <div class="col-md-8">

                                                                        <input type="number" required="" class="form-control" name="weight">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Kiểu đóng gói</label>
                                                                    <div class="col-md-8">
                                                                        <input maxlength="50" class="form-control" name="packing" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Thành phần</label>
                                                                    <div class="col-md-8">

                                                                        <input maxlength="50"  class="form-control" name="element" type="text">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group mb-4">
                                                                <div class="row">
                                                                    <label class="col-md-4">Số lượng & Đơn giá*
                                                                        <p id="licennote1" >
                                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-info-circle" viewBox="0 0 16 16">
                                                                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                                                                            <path d="m8.93 6.588-2.29.287-.082.38.45.083c.294.07.352.176.288.469l-.738 3.468c-.194.897.105 1.319.808 1.319.545 0 1.178-.252 1.465-.598l.088-.416c-.2.176-.492.246-.686.246-.275 0-.375-.193-.304-.533L8.93 6.588zM9 4.5a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
                                                                            </svg>
                                                                            <a></a>
                                                                        </p>
                                                                    </label>
                                                                    <div class="col-md-8">
                                                                        <table class="">
                                                                            <thead>
                                                                                <tr>
                                                                                    <th scope="col">&nbsp;</th>
                                                                                    <th style="min-width: 60px" scope="col">Đơn vị</th>
                                                                                    <th scope="col">Số lượng</th>
                                                                                    <th scope="col">Giá</th>
                                                                                </tr>
                                                                            </thead>
                                                                            <tbody>
                                                                                <tr>
                                                                                    <th scope="row"></th>
                                                                                    <td>Kg</td>
                                                                                    <td><input name="weight1" type="number" required="" class="form-control"></td>
                                                                                    <td><input name="price1" type="number" required="" class="form-control"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th scope="row"></th>
                                                                                    <td></td>
                                                                                    <td><input name="weight2" type="number" required="" class="form-control"></td>
                                                                                    <td><input name="price2" type="number" required="" class="form-control"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <th scope="row"></th>
                                                                                    <td></td>
                                                                                    <td><input name="weight3" type="number" required="" class="form-control"></td>
                                                                                    <td><input name="price3" type="number" required="" class="form-control"></td>
                                                                                </tr>
                                                                            </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="align-center">
                                                    <input value="Huỷ" class="btn" type="submit">
                                                    <input value="Yêu cầu phê duyệt" class="btn" type="submit">
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!--  END CONTENT PART  -->
        <!--  END MODERN  -->
        <footer class="footer-section theme-footer">

            <div class="footer-section-1  sidebar-theme">

            </div>

            <div class="footer-section-2 container-fluid">
                <div class="row">
                    <div id="toggle-grid" class="col-xl-7 col-md-6 col-sm-6 col-12 text-sm-left text-center">
                        <ul class="list-inline links ml-sm-5">
                            <li class="list-inline-item">
                                <a target="_blank" href="#">Vietnam Products Exchange</a>
                            </li>
                        </ul>
                    </div>
                    <div class="col-xl-5 col-md-6 col-sm-6 col-12">
                        <ul
                            class="list-inline mb-0 d-flex justify-content-sm-end justify-content-center mr-sm-3 ml-sm-0 mx-3">
                            <li class="list-inline-item  mr-3">
                                <p class="bottom-footer">&#xA9; 2022 <a target="_blank" href="#">VnProX</a></p>
                            </li>
                            <li class="list-inline-item align-self-center">
                                <div class="scrollTop"><i class="flaticon-up-arrow-fill-1"></i></div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
        <!--  END FOOTER  -->

        <!--  BEGIN PROFILE SIDEBAR  -->
        <%@include file="aside.jsp" %>

        <!-- BEGIN GLOBAL MANDATORY SCRIPTS -->
        <script src="${pageContext.request.contextPath}/assets/js/libs/jquery-3.1.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/loader.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/blockui/jquery.blockUI.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app.js"></script>
        <script>
            $(document).ready(function () {
                App.init();
            });
        </script>
        <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
        <!-- END GLOBAL MANDATORY SCRIPTS -->

        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
        <script src="${pageContext.request.contextPath}/plugins/charts/chartist/chartist.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/maps/vector/jvector/jquery-jvectormap-2.0.3.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/maps/vector/jvector/worldmap_script/jquery-jvectormap-world-mill-en.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/calendar/pignose/moment.latest.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/calendar/pignose/pignose.calendar.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/progressbar/progressbar.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/default-dashboard/default-custom.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/ui-kit/timeline/horizontal-main.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/amcharts.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/maps/vector/ammaps/ammap_amcharts_extension.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/maps/vector/ammaps/worldLow.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/radar.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/pie.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/charts/sparklines/jquery.sparkline.min.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/serial.js"></script>
        <script src="${pageContext.request.contextPath}/plugins/charts/amcharts/light.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/ecommerce-dashboard/ecommerce-custom.js"></script>
        <!-- BEGIN PAGE LEVEL PLUGINS/CUSTOM SCRIPTS -->
    </body>
</html>