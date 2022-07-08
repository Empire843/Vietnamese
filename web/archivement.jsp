<%@page import="java.util.Collections"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@page import="dao.UserDAO"%>
<%@include file="includes/header.jsp" %>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
    <%@include file="includes/navbar.jsp" %>
    <section class="content">
        <H3 class="section-heading">Bảng thành tích</H3>
        <div class="title">
            <ul class="nav1 nav-tabs">
                <li>
                    <h3>Tên thành viên</h3>
                </li>
                <li>
                    <h3>Số điểm</h3>
                </li>
            </ul>
        </div>
        <%
            if(session.getAttribute("user") == null){
                response.sendRedirect("login.jsp");
            }
        %>
        <div class="detail-infor">
            <ul class="nav1">
                <%
                    ArrayList<User> list = (ArrayList<User>)request.getAttribute("listUser");

                    Collections.sort(list, new Comparator<User>(){
                      public int compare(User o1, User o2)
                      {
                         return o2.getNumStar() - o1.getNumStar();
                      }
                    });
                    for(User u:list){
                %>
                <li class="user-infor top top1">
                    <div class="infor">
                        <div class="user-img">
                            <a class="link-user-img" href="#">
                                 <%
                                User user = (User)session.getAttribute("user");
                                UserDAO ud = new UserDAO();
                                if(ud.getImageData(u.getUsername()) == null){
                            %>
                                    <img src="./images/user_1.png" style="width:50px;" alt="avt">
                            <%
                                }else{
                                    
                            %>
                                    <img src="${pageContext.servletContext.contextPath}/ProcessImage?username=<%= u.getUsername()%>" style="width:50px;" alt="avt">
                            <%
                                }
                            %>
                            </a>
                        </div>
                        <a class="link-user-name" href="#"><%= u.getFull_name() %></a>
                    </div>
                    <div class="score"><%= u.getNumStar()%></div>
                </li>
                <hr>
                <%
                    }
                %>
            </ul>
        </div>

    </section>
    <%@include file="includes/footer.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</body>

</html>