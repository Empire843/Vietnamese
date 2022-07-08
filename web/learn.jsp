<%@ page import="bean.Lesson" %>
<%@ page import="java.util.ArrayList" %>
<%@include file="includes/header.jsp" %>
<link rel="stylesheet" href="./css/learn.css">
<link rel="stylesheet" href="./css/main.css">

</head>
<body>
    <div class="homepage-container">
        <%@include file="includes/navbar.jsp" %>
        <div class="yellow-bar"></div>
        <div class="white-bar">
            <!-- Duy -->
            <div class="white-bar__text">
                Giúp con học giỏi Tiếng Việt Lớp 1 hơn một cách nhanh chóng. Video bài giảng Tiếng Việt 
                Lớp 1 hiện đại có minh họa trực quan, ngắn gọn, cực kỳ dễ hiểu và thú vị. Nội dung bài luyện
                tập phong phú được biên soạn bám sát theo nội dung SGK Tiếng Việt Lớp 1 mới - Bộ Kết nối tri thức.
            </div>
        </div>
        <%
            if(session.getAttribute("user") == null){
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="lesson">
            <div class="lesson-wrapper">
                <!-- Duy -->
                <div class="banner">
                    <ul class="list__lesson">

                       <%
                       ArrayList<Lesson> list = (ArrayList<Lesson>)session.getAttribute("listLesson");
                       
                       for (Lesson o : list) {
                               
                       %>
                        <li class="list__lesson-item">
                            <a href="ProcessLesson?id=<%= o.getId() %>" class="list__lesson-item-link">
                                <%= o.getLessonName() %>
                            </a>
                        </li>
                        <%
                            }     
                       %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <%@include file="includes/footer.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</body>
</html>