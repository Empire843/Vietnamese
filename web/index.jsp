<%@include file="includes/header.jsp" %>

<link rel="stylesheet" href="./css/main.css">
</head>
<body>
    <div class="wrapper">
    <%@include file="includes/navbar.jsp" %>
    <div class="main-content">
        <div class="banner__introduce">
            <div class="banner__content">
                <div class="banner__content--text">
                    <h3>Cách học ngôn ngữ miễn phí, vui nhộn và hiệu quả!</h3>
                    
                    <div class="banner__content--btn-area">
                    <%
                        if(session.getAttribute("user") == null){
                        
                    %>
                        <div class="btn-success btn--start"><a href="/login.jsp">Login</a></div>
                    <%
                        }
                    %>
                    </div>
                </div>
                <div class="banner__content--image-area">
                    <img class="banner__welcome banner__content--image" src="./images/1410a87cd38e1dd0449f.jpg" alt="">
                </div>
            </div>
        </div>
        <hr>
        <div class="banner banner__learning">
            <div class="banner__content">
                <div class="banner__content--text">
                    <h3>Giúp môn Tiếng Việt trở nên dễ dàng
                    </h3>
                    <h3>    Vừa học vừa chơi </h3>
                    <!-- <div class="banner__content--btn-area">
                            <div class="btn-success btn--start"><a href="#">Bắt đầu</a></div>
                        </div> -->
                    
                </div>
                <div class="banner__content--image-area">
                    <img class="banner__content--image" src="./images/pixlr-bg-result.png" alt="">
                </div>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</body>

</html>