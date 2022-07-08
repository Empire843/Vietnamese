<%@page import="bean.User"%>
<header class="header">
            <div class="header__logo">
                <a href="#"><img src="./images/logo.jpg" alt=""></a>
            </div>
            <div class="header__menu">
                <ul class="header__list">
                    <li class="header__list--item"><a href="/index.jsp" class="header__list--item--link">Trang chủ</a></li>
                    <li class="header__list--item"><a href="ProcessLearnLesson" class="header__list--item--link">Học tập</a></li>
                    <li class="header__list--item"><a href="/practice.jsp" class="header__list--item--link">Luyện tập</a></li>
                    <li class="header__list--item"><a href="ProcessArchivement" class="header__list--item--link">Thành tích</a></li>
                </ul>
            </div>
            <div class="header__right">
                <%
                    try {
                        if (request.getSession(false) != null) {
                            if (session.getAttribute("user") == null) {
                %>
                                <div class="header__right--btn">
                                        <a href="/login.jsp" ><button class="btn">Đăng nhập</Button></a>
                                        <a href="/register.jsp"><button class="btn">Đăng ký</Button></a>
                                </div>
                <%
//                                response.sendRedirect("/login.jsp");
                            } else {
                %>
                <!-- <div class="header__right--btn">
                                <a href="logout"><button class="btn">Logout</Button></a>
                                <a href="ProcessProfile"><button class="btn">Profile</Button></a>

                </div> -->
                    <div class="dropdown header__right--btn">
                        <button class="avt1">
                            <img id ="img_avt" src ="./images/user_1.png" style="border-radius:50% ;">
                        </button>
                            <div class="dropdown-content">
                                <a href="ProcessProfile">Thông tin cá nhân</a>
                                <a href="logout">Đăng xuất</a>
                            </div>
                    </div>
            
                <%
                            }
                        }else{
                 %>
                        
                 <%
                        }
                    } catch (Exception e) {

                    }
                %>
            </div>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
        </header>
        <div class="nav">
        </div>