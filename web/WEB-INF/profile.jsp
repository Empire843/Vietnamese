<%@page import="dao.UserDAO"%>
<%@include file="/includes/header.jsp" %>
<%@page import="bean.User"%>
<link rel="stylesheet" href="./css/profile.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    function chooseFile(fileInput) {
        if (fileInput.files && fileInput.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#image').attr('src', e.target.result);
            }
            reader.readAsDataURl(fileInput.files[0]);
        }
    }
    var data = []
    function add() {
        var item_id = 1;
        var item_ten = document.getElementById("ten").value;
        var item_sinh = document.getElementById("sinh").value;
        var item_gioitinh = document.getElementById("gioitinh").value;
        var item_diachi = document.getElementById("diachi").value;
        var item_email = document.getElementById("email").value;
        var item_password = document.getElementById("password").value;

        var item = {
            Id: item_id,
            Ten: item_ten,
            Sinh: item_sinh,
            Gioitinh: item_gioitinh,
            Diachi: item_diachi,
            Email: item_email,
            Password: item_password

        }

        let index = data.findIndex((c) => c.Id == item.Id);
        if (index >= 0) {
            data.splice(index, 1, item);

        } else {
            data.push(item);
        }

        render()
        clear()
    }

    function render() {
        table = `<tr>
                <th>Tên</th>
                <th>Sinh năm</th>
                <th>Giới Tính</th>
                <th>Địa chỉ</th>
                <th>Email</th>
                <th>Password</th>
            </tr>`
        for (let i = 0; i < data.length; i++) {
            table += `<tr>
                <td>${data[i].Ten}</td>
                <td>${data[i].Sinh}</td>
                <td>${data[i].Gioitinh}</td>
                <td>${data[i].Diachi}</td>
                <td>${data[i].Email}</td>
                <td>${data[i].Password}</td>
                </tr>`
        }
        document.getElementById("render").innerHTML = table;
    }

    function clear() {
        document.getElementById("id").value = "";
        document.getElementById("ten").value = "";
        document.getElementById("sinh").value = "";
        document.getElementById("gioitinh").value = "";
        document.getElementById("diachi").value = "";
        document.getElementById("email").value = "";
        document.getElementById("password").value = "";
    }

</script>
</head>

<body>
    <div class="homepage-container">
        <%@include file="/includes/navbar.jsp" %>
        <div class="yellow-bar"></div>
        <!-- Duy -->
        <div class="lesson">
            <div class="profile">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="card mau">
                                <div class="card-header bg-transparent text-center">
                                    
                                <%
                                    User user = (User)session.getAttribute("user");
                                    UserDAO ud = new UserDAO();
                                    if(ud.getImageData(user.getUsername()) == null){
                                %>
                                    <img class="profile_img"
                                        src="./images/user_1.png"
                                        alt="Avatar User"  width="150px" height="150px">
                                <%
                                    }else{

                                %>
                                    <img class="profile_img"
                                            src="${pageContext.servletContext.contextPath}/ProcessImage?username=${sessionScope.user.username}"
                                            alt="Avatar User"  width="150px" height="150px">
                                <%
                                    }
                                %>
                                    <h3><%= user.getFull_name() %></h3>
                                <input class="inputfile" type="file" name="" id="imageFile" onchange="chooseFile(this)"
                                           accept="image/gif, image/jpeg, image/png, image/jpg"> 
                                </div>
                                <!-- <div class="card-body">
                                    <p class="mb-0"><strong class="pr-1"></strong></p>
                                </div> -->
                            </div>
                        </div>
                         <div class="col-lg-8" id="display-infor">
                            <div class="card shadow-sm">
                                <div class="card-header bg-transparent ">
                                    <h3>Thông tin cá nhân</h3>
                                </div>
                                <div class="card-body">
                                    <table class="table">
                                        <tr>
                                            <th width="30%">Họ và tên</th>
                                            <td>
                                                <!-- <input type="text"></input> -->
                                                <%= user.getFull_name() %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Email</th>
                                            <td>
                                                <%= user.getEmail()%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Giới tính</th>
                                            <td>
                                               <%= user.getGender() %>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="30%">Tên đăng nhập</th>
                                            <td>
                                                <%= user.getUsername()%>
                                            </td>
                                        </tr>
                                    </table>
                                    <button class="card-header2" type="button" onclick="forward(1)">Sửa thông tin</button>
                                    
                                </div>
                            </div>
                            <div style="height: 25px"></div>
<%--                            <div class="card shadow-sm">--%>
<%--                                <div class="card-header bg-transparent ">--%>
<%--                                    <h3 class="">Giới thiệu về bản thân</h3>--%>
<%--                                </div>--%>
<%--                                <div class="card-body">--%>
<%--                                    <p>Hello</p>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        </div>
                            <div class="col-lg-8" id="edit-infor" style="display: none">
                                <div class="card shadow-sm mau">
                                    <div class="card-header bg-transparent">
                                        <h3>Thông tin cá nhân</h3>
                                    </div>
                                    <form action="ChangeProfile" method = "get"  >
                                        <div class="card-body">
                                            <table class="table">
                                                <tr>
                                                    <th width="30%">Tên đăng nhập</th>
                                                    <td>
                                                        <%= user.getUsername() %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th width="30%">Họ và tên</th>
                                                    <td>
                                                        <input type="text" name="ten"></input>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th width="30%">Giới tính</th>
                                                    <td>
                                                        <input type="text" name="gender"></input>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th width="30%">Email</th>
                                                    <td>
                                                        <input type="text" name="mail"></input>
                                                    </td>
                                                </tr>

                                            </table>
                                            <td>



                                                <button type = "submit" class="card-header2" >Cập nhật thông tin khách
                                                    hàng</button>

                                            </td>

                                            <div class="message"><%= request.getAttribute("message") %></div>
                                        <table class="table" id="render">
                                            <!--                                        <th>Tên</th>
                                                                    <th>Năm sinh</th>
                                                                    <th>Giới Tính</th>
                                                                    <th>Địa chỉ</th>
                                                                    <th>Email</th>
                                                                    <th>Password</th>-->
                                        </table>

                                    </div>
                                    </form>
                                    <button class="card-header2" onclick="forward(2)">Hủy bỏ</button>
                                </div>
                                <div style="height: 25px"></div>
<%--                                <div class="card shadow-sm mau">--%>
<%--                                    <div class="card-header bg-transparent ">--%>
<%--                                        <h3 class="">Giới thiệu về bản thân</h3>--%>
<%--                                    </div>--%>
<%--                                    <div class="card-body">--%>
<%--                                        <p>Hello</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
                        <script>
                            function forward(val){
                                if(val == 1){
                                    document.getElementById("display-infor").style.display = 'none';
                                    document.getElementById("edit-infor").style.display='block';
                                }else{
                                    document.getElementById("display-infor").style.display='block';
                                    document.getElementById("edit-infor").style.display='none';
                                }
                            }
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@include file="/includes/footer.jsp" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
</body>
</html>
