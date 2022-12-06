<!doctype html>
<html lang="en">
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <head>
        <title>Điều khoản dịch vụ </title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="../css/style.css">

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
        <link rel="stylesheet" href="../assets/scss/style.css">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    </head>

    <body>

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
                            <li class="nav-item active" style="padding-left: 40px;">
                                <a class="nav-link waves-effect  text-header" href="Home">Trang chủ
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <div class="dropdown">
                                    <a class="nav-link waves-effect text-header dropdown-toggle" href=""
                                       target="_blank">Giới thiệu
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
                                         id="dropdown-collection">
                                        <a class="dropdown-item" href="./information.jsp">Về chúng tôi</a>
                                        <a class="dropdown-item" href="./policy.jsp">Chính sách bảo mật</a>
                                        <a class="dropdown-item" href="./condition.jsp">Điều khoản dịch vụ</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <div class="dropdown">
                                    <a class="nav-link waves-effect text-header dropdown-toggle" href="./shop.html"
                                       target="_blank">Cửa hàng

                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="./fruit.jsp">Trái cây</a>
                                        <a class="dropdown-item" href="./dokho.html">Rau củ sạch</a>
                                        <a class="dropdown-item" href="./dokho.html">Các loại hạt</a>
                                        <a class="dropdown-item" href="./dokho.html">Tất cả sản phẩm</a>
                                    </div>
                                </div>

                            </li>

                            <li class="nav-item">
                                <a class="nav-link waves-effect text-header" href="./contact.jsp">Liên hệ</a>
                            </li>
                        </ul>


                        <!-- Right -->
                        <ul class="navbar-nav nav-flex-icons">
                            <li class="nav-item ">
                                <a href="#"  class="nav-link cart-btn amm-shopping-cart-open pr-3"><i onclick="shoppingCarts()" class="fas fa-shopping-cart"></i>
                                    <span class="quantity-amm-shopping-cart-open">0</span></a>

                            </li>

                            <li class="nav-item">
                                <div class="dropdown dropdown-user">
                                    <a href="login.jsp" class="nav-link border border-light rounded waves-effect" target="_blank">
                                        <i class="fas fa-user"></i>Đăng Nhập
                                    </a>

                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <div class="amm-shopping-cart-wrapper">
            <div class="amm-shopping-cart-canvas">
                <div class="amm-shopping_cart">
                    <div class="amm-shopping_cart-top-bar d-flex justify-content-between">
                        <h6>Giỏ hàng</h6>
                        <button class="amm-shopping-cart-close">
                            <i class="fas fa-times"></i>
                        </button>
                    </div><!-- shopping cart top bar -->
                    <div class="amm-shopping_cart-list-items mt-30">
                        <ul>

                        </ul>
                    </div> <!-- shopping_cart list items -->
                    <div class="amm-shopping_cart-btn">
                        <div class="total pt-35 d-flex justify-content-between">
                            <h5>Tổng tiền:</h5>
                            <p>0 <span>đ</span></p>

                        </div>
                        <div class="cart-btn pt-25">
                            <a class="main-btn" href="./ViewCart.html">Xem giỏ hàng</a>
                            <a class="main-btn main-btn-2" href="./payment.html">Thanh toán</a>
                        </div>
                    </div>
                </div> <!-- shopping_cart -->
            </div>
            <div class="overlay"></div>
        </div>
        <section class="breadcrum">

            <nav aria-label="breadcrumb">
                <ol class="breadcrumb container">
                    <li class="breadcrumb-item"><a href="Home">Trang chủ</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Điều khoản dịch vụ</li>
                </ol>
            </nav>
        </section>

        <main role="main">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-policy" style="text-align: justify;">
                        <h4 class="pt-50">ĐIỀU KHOẢN DỊCH VỤ</h4>
                        <h5>Chào mừng bạn đến với OrFarm Store!</h5>
                        <p>Cảm ơn bạn đã sử dụng các sản phẩm và dịch vụ của chúng tôi (“Dịch vụ”). Dịch vụ được cung cấp
                            bởi Doanh nghiệp OrFarm. Có trụ sở tạiTầng 1, toà B3, Làng quốc tế Thăng Long, Trần Đăng Ninh,
                            Quận Cầu Giấy,Việt Nam.
                        </p>
                        <p>Bằng việc sử dụng Dịch vụ của chúng tôi, bạn đang đồng ý với các điều khoản này. Vui lòng đọc
                            kỹ các điều khoản này.</p>
                        <p>Chính sách bảo mật sẽ giải thích cách chúng tôi tiếp nhận, sử dụng và (trong trường hợp nào đó)
                            tiết lộ thông tin cá nhân của bạn. Chính sách cũng sẽ giải thích các bước chúng tôi thực hiện để
                            bảo mật thông tin cá nhân của khách hàng. Cuối cùng, Chính sách bảo mật sẽ giải thích quyền lựa
                            chọn của quý khách về việc thu thập, sử dụng và tiết lộ thông tin cá nhân của mình.</p>
                        <strong>Mục đích và phạm vi thu thập thông tin</strong>
                        <p class="pt-20 ">Các thông tin thông tin cá nhân của các thành viên, có thể được chúng tôi sử dụng vào những mục
                            đích hợp pháp dưới đây:</p>
                        <p>– Sử dụng để xác nhận đặt hàng khi khách có nhu cầu mua bất kỳ sp nào trên website</p>
                        <p>– Dùng trong gửi thông báo, thực hiện các chương trình quảng cáo, PR cho các dịch vụ mới được sử
                            dụng trên website</p>
                        <p>
                            + Cung cấp thông tin về dịch vụ bằng email.

                        </p>
                        <p>
                            + Dùng để phân tích xu hướng tiêu dùng của khách hàng, với mục đích xây dựng những dịch vụ mới,
                            hoặc cải thiện những dịch vụ cũ.

                        </p>
                        <p>+ Dùng để liên lạc với thành viên khi chúng tôi điều tra thông tin khách hàng, tổ chức khuyến
                            mại, trao đổi ý kiến thông tin trên bảng đánh giá, bình luận.

                        </p>
                        <p>+ Dùng để trả lời các thắc mắc của khách hàng: chúng tôi sẽ trả lời thành viên bằng email, điện
                            thoại, hoặc gửi thư tới địa chỉ của thành viên, khi thành viên thắc mắc</p> <strong>Điều lệ khác
                            về thông tin cá nhân</strong>
                        <p class="pt-20">Chúng tôi có thể dùng thông tin cá nhân của bạn để nghiên cứu thị trường. chi tiết
                            sẽ được ẩn và chỉ được dùng để thống kê. Quý khách có thể từ chối không tham gia bất cứ lúc nào.
                            Bất kỳ câu trả lời cho khảo sát hoặc thăm dò dư luận mà chúng tôi cần bạn làm sẽ không được
                            chuyển cho bên thứ ba. Việc cần thiết duy nhất là tiết lộ email của bạn nếu bạn muốn tham gia.
                            Câu trả lời sẽ được lưu tách riêng với email của bạn.</p>
                        <strong>Phạm vi sử dụng thông tin</strong>
                        <p class="pt-20 ">Chúng tôi cam kết chỉ sử dụng thông tin trong nội bộ theo đúng như những mục đích đã đề ra.

                        </p>
                        <strong>Thời gian lưu trữ thông tin</strong>
                        <p class="pt-20">Chúng tôi sẽ lưu trữ các Thông tin cá nhân do Khách hàng cung cấp trên các hệ thống
                            nội bộ của chúng tôi trong quá trình cung cấp dịch vụ cho Khách hàng hoặc cho đến khi hoàn thành
                            mục đích thu thập hoặc khi Khách hàng có yêu cầu hủy các thông tin đã cung cấp.

                        </p> <strong>Cam kết bảo mật thông tin cá nhân khách hàng</strong>
                        <p class="pt-20 ">Thông tin của khách hàng được cam kết bảo mật tuyệt đối theo chính sách bảo
                            vệ thông tin cá nhân . Việc thu thập và sử dụng thông tin của mỗi khách hàng chỉ được thực hiện
                            khi có sự đồng ý của khách hàng đó , trừ trường hợp buộc phải cung cấp khi Cơ quan chức năng yêu
                            cầu.Không sử dụng, không chuyển giao, cung cấp hay tiết lộ cho bên thứ 3 nào về thông tin cá
                            nhân của thành viên khi không có sự cho phép đồng ý từ thành viên.</p>
                        <p>Trong trường hợp máy chủ lưu trữ thông tin bị hacker tấn công dẫn đến mất mát dữ liệu cá nhân
                            thành viên, ban quản trị website sẽ có trách nhiệm thông báo vụ việc cho cơ quan chức năng điều
                            tra xử lý kịp thời và thông báo cho thành viên được biết.</p>
                        <p>Trong trường hợp khách hàng phát hiện thông tin cá nhân bị sử dụng sai mục đích hoặc bị xâm phạm
                            thì khách hàng có thể gửi khiếu nại thông qua kênh chăm sóc khách hàng của chúng tôi, khi nhận
                            được các thông tin khiếu nại của thành viên, chúng tôi sẽ dùng mọi biện pháp cần thiết để ngăn
                            chặng không cho thông tin cá nhân đó bị tiếp tục xâm phạm, đồng thời có các biện pháp hỗ trợ để
                            bảo vệ quyền và lợi ích hợp pháp của khách hàng.Khách hàng có quyền gửi khiếu nại về việc lộ
                            thông tin cá nhân cho bên thứ 3 đến Ban quản trị của website. Khi tiếp nhận những phản hồi này,
                            chúng tôi sẽ xác nhận lại thông tin, phải có trách nhiệm trả lời lý do và hướng dẫn thành viên
                            khôi phục và bảo mật lại thông tin.</p>
                        <strong>Sử dụng Dịch vụ của chúng tôi</strong>
                        <p class="pt-20 ">Bạn phải tuân thủ mọi chính sách đã cung cấp cho bạn trong phạm vi Dịch vụ.</p>
                        <p>Không được sử dụng trái phép Dịch vụ của chúng tôi. Ví dụ: không được gây trở ngại cho Dịch vụ
                            của chúng tôi hoặc tìm cách truy cập chúng bằng phương pháp nào đó không thông qua giao diện và
                            hướng dẫn mà chúng tôi cung cấp. Bạn chỉ có thể sử dụng Dịch vụ của chúng tôi theo như được luật
                            pháp cho phép, bao gồm cả các luật và quy định hiện hành về quản lý xuất khẩu và tái xuất khẩu.
                            Chúng tôi có thể tạm ngừng hoặc ngừng cung cấp Dịch vụ của chúng tôi cho bạn nếu bạn không tuân
                            thủ các điều khoản hoặc chính sách của chúng tôi hoặc nếu chúng tôi đang điều tra hành vi bị
                            nghi ngờ là sai phạm.</p>
                        <p>Việc bạn sử dụng Dịch vụ của chúng tôi không có nghĩa là bạn được sở hữu bất cứ các quyền sở hữu
                            trí tuệ nào đối với Dịch vụ của chúng tôi hoặc nội dung mà bạn truy cập. Bạn không được sử
                            dụng nội dung từ Dịch vụ của chúng tôi trừ khi bạn được chủ sở hữu nội dung đó cho phép hoặc
                            được luật pháp cho phép. Các điều khoản này không cấp cho bạn quyền sử dụng bất kỳ thương hiệu
                            hoặc lôgô nào được sử dụng trong Dịch vụ của chúng tôi. Không được xóa, che khuất hoặc thay đổi
                            bất kỳ thông báo pháp lý nào được hiển thị trong hoặc kèm theo Dịch vụ của chúng tôi.</p>
                        <strong>Bảo vệ sự riêng tư và bản quyền</strong>
                        <p class="pt-20 ">Chính sách của OrFarm Store về sự riêng tư giải thích cách chúng tôi xử lý dữ liệu cá nhân của
                            bạn và bảo vệ sự riêng tư của bạn khi bạn sử dụng Dịch vụ của chúng tôi. Bằng việc sử dụng Dịch
                            vụ của chúng tôi, bạn đang đồng ý rằng OrFarm Storecó thể những sử dụng dữ liệu đó theo chính
                            sách của chúng tôi về sự riêng tư.</p>
                        <p>Chúng tôi phúc đáp các thông báo cáo buộc về vi phạm bản quyền và chấm dứt tài khoản của người
                            tái phạm theo quy trình nêu trong Đạo luật bản quyền kỹ thuật số thiên niên kỷ của Việt Nam.</p>
                        <p>Chúng tôi cung cấp thông tin giúp chủ sở hữu bản quyền quản lý các sở hữu trí tuệ của họ trên
                            mạng. Nếu bạn cho rằng ai đó đang vi phạm bản quyền của bạn và bạn muốn thông báo cho chúng tôi,
                            bạn có thể tìm thông tin về cách gửi thông báo và chính sách của Mona về việc phúc đáp thông báo
                            tại Trung tâm trợ giúp của chúng tôi.</p>
                        <strong>Sửa đổi và chấm dứt Dịch vụ của chúng tôi</strong>
                        <p class="pt-20 ">Chúng tôi không ngừng thay đổi và cải tiến Dịch vụ của mình. Chúng tôi có thể thêm hoặc xóa các
                            chức năng hoặc tính năng và chúng tôi cũng có thể tạm ngừng hoặc ngừng hoàn toàn một Dịch vụ.
                        </p>
                        <p>Bạn có thể ngừng sử dụng Dịch vụ của chúng tôi bất kỳ lúc nào, mặc dù chúng tôi sẽ rất tiếc khi
                            bạn không còn sử dụng Dịch vụ của chúng tôi nữa. OrFarm Store cũng có thể ngừng cung cấp Dịch vụ
                            cho bạn hay thêm hoặc tạo ra những giới hạn mới cho Dịch vụ của chúng tôi bất kỳ lúc nào.</p>
                        <p>Chúng tôi tin rằng bạn sở hữu dữ liệu của bạn và việc bảo toàn quyền truy cập của bạn đối với dữ
                            liệu đó là điều quan trọng. Nếu chúng tôi ngừng một Dịch vụ nào đó, khi khả thi và hợp lý, chúng
                            tôi sẽ cung cấp cho bạn thông báo trước hợp lý và cơ hội để đưa thông tin ra khỏi Dịch vụ đó.
                        </p>
                        <strong>Quy định và hình thức thanh toán</strong>
                        <p class="pt-20 ">Đối với các hợp đồng của OrFarm Store chúng tôi sẽ lấy trước (deposit) 50% giá trị hợp đồng để
                            làm các chi phí thực hiện dự án. Sau khi kết thúc dự án chúng tôi sẽ lấy 50% số tiền còn lại của
                            khách hàng mà trong hợp đồng đã ghi rõ.</p>
                        <p>Mọi khoảng thu từ OrFarm Store đều có biên lai thu tiền đầy đủ tạo nên sự tin tưởng đối với khách
                            hàng.</p>
                        <p class="mb-50">Đối với các khoảng dịch vụ thêm ngoài hợp đồng chúng tôi sẽ trao đổi với quý khách và sẽ thanh
                            toán 1 lần duy nhất sau khi dự án đã hoàn thành.</p>

                    </div>
                </div>
            </div>
        </main>

        <%@include file="footer.jsp"%>  

        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
                integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
                integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous">
        </script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
                integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous">
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
    </body>

</html>