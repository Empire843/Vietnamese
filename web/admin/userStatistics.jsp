<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@page import="dao.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/admin_users.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <title>Document</title>
</head>
<body class="h-100 overflow-hidden">
    <div class="d-flex h-100">  
        <div class="">
            <div class="h-100 overflow-hidden">
                <div class="d-flex h-100 flex-column flex-shrink-0 bg-light" style="width: 280px;">
                    <div class="logo-container">

                    </div>
                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="d-flex align-items-center list-tools p-2">
                            <i class="fa-solid fa-book admin-tools-icon" style="width: 20px;"></i>
                            <a href="addLesson.jsp" class="nav-link link-dark" aria-current="page">Thêm bài học</a>
                        </li>
                        <li class="d-flex align-items-center list-tools p-2 active-admin-tools">
                            <i class="fa-solid fa-users admin-tools-icon" style="width: 20px;"></i>
                            <a href="UserStatistics" class="nav-link link-dark">Thống kê người dùng</a>
                        </li>
                        <li class="d-flex align-items-center list-tools p-2">
                            <i class="fa-solid fa-book-open admin-tools-icon" style="width: 20px;"></i>
                            <a href="LessonStatistics" class="nav-link link-dark">Thống kê bài học</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="w-100">
            <header class="p-3 border-bottom">
                <div class="container">
                  <div class="d-flex flex-wrap align-items-center justify-content-end justify-content-lg-end">
            
                    <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3">
                      <input type="search" class="form-control" placeholder="Search..." aria-label="Search">
                    </form>
            
                    <div class="dropdown text-end">
                      <a href="#" class="d-block link-dark text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
                            <img class="profile_img" src="./images/user_1.png" alt="Avatar User" width="32" height="32" class="rounded-circle">
                      </a>
                      <ul class="dropdown-menu text-small" aria-labelledby="dropdownUser1" style="">
                        <li><a class="dropdown-item" href="#">New project...</a></li>
                        <li><a class="dropdown-item" href="#">Settings</a></li>
                        <li><a class="dropdown-item" href="#">Profile</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="logout">Sign out</a></li>
                      </ul>
                    </div>
                  </div>
                </div>
            </header>
            <div class="h-100 pt-3 px-3 overflow-auto">
                <table class="table table-hover">
                    <thead>
                      <tr>
                        <th scope="col">STT</th>
                        <th scope="col">Họ và tên</th>
                        <th scope="col">Ảnh</th>
                        <th scope="col">Email</th>
                        <th scope="col">Gender</th>
                        <th scope="col">Number Lesson Completed</th>
                        <th scope="col">Star Number</th>
                        <th scope="col"></th>
                      </tr>
                    </thead>
                    <tbody>
                        <%
                        ArrayList<User> list = (ArrayList<User>)request.getAttribute("listUser");
                        int i = 1;
                        for(User u:list){
                        %>
                      <tr>
                        <th scope="row"><%= i %></th>
                        <td><%= u.getFull_name() %></td>
                        <td>
                            <%
                                User user = (User)session.getAttribute("user");
                                UserDAO ud = new UserDAO();
                                if(ud.getImageData(u.getUsername()) == null){
                            %>
                                    <img class="profile_img"
                                        src="./images/user_1.png"
                                        alt="Avatar User"
                                        width="50" height="50" class="rounded-circle">
                            <%
                                }else{
                                    
                            %>
                                    <img class="profile_img"
                                            src="${pageContext.servletContext.contextPath}/ProcessImage?username=<%= u.getUsername() %>"
                                            alt="Avatar User"
                                            width="50" height="50" class="rounded-circle">
                            <%
                                }
                            %>
                            <!-- <img src="https://s120-ava-talk.zadn.vn/8/1/9/6/39/120/d8b1bf93072087e093ed8d3c702b3dd6.jpg" > -->
                        </td>
                        <td><%= u.getEmail() %></td>
                        <td><%= u.getGender() %></td>
                        <td><%= u.getNumLesson()%></td>
                        <td><%= u.getNumStar()%></td>
                        <td>
                            <div class="w-100 h-100 d-flex align-items-center justify-content-center"> 
                                <div class="icons-table">
                                    <a href="deleteUser?username=<%= u.getUsername() %>" <i class="fa-solid fa-trash-can"></i></a>
                                </div>
                            </div>
                        </td>
                      </tr>
                        <%
                            i++;
                           }
                        %>
                    </tbody>
                  </table>
            </div>
        </div>
    </div>
    
   
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>