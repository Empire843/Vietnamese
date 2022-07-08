<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-beta2/js/bootstrap.min.js">
        <title>Register User</title>
    </head>
    <body>
        <div class="loginBox">
            <h3>Register</h3>
            <form action="register" method="post">
                <div class="inputBox"> 
                    <input id="full_name" type="text" name="Full_name" placeholder="Họ và tên" required> 
                    <input id="email" type="email" name="Email" placeholder="Email" required> 
                    <input id="uname" type="text" name="Username" placeholder="Tên người dùng" onkeyup="checkUsername();" required>
                    <input id="pass" type="password" name="password" placeholder="Mật khẩu" onkeyup="checkPassword();" required> 
                    <input id="confirm_pass" type="password" name="confirm_password" placeholder="Nhập lại mật khẩu" onkeyup='checkPassword();' required> 
                    <label style="display: block; position: relative;margin-bottom:25px; " id="message">${message_register}</label>
                    <%
                        request.getSession().removeAttribute("message_register");
                    %>
                </div> <input type="submit" name="" value="Đăng ký">
            </form> <a href="#">Forget Password<br> </a>
            <div class="text-center">
                <p style="color: #59238F;"><a href="/login.jsp">Login</a></p>
            </div>
            <script>
//                document.getElementById("pass").addEventListener("keyup", myFunction);
                document.getElementById("confirm_pass").addEventListener("keyup", checkPassword);
                function checkPassword() {
                    var flag = false;
                    if(document.getElementById("confirm_pass").value == document.getElementById("pass").value){
                        document.getElementById('message').style.color = 'green';
                        document.getElementById('message').innerHTML = 'password match';
                        flag = true;
                    }else{
                        document.getElementById('message').style.color = 'red';
                        document.getElementById('message').innerHTML = 'password does not match';
                        flag = false;
                    }
                    return flag;
                }
                document.getElementById("uname").addEventListener("keyup", checkUsername);
                function checkUsername(){
                    var reg = /^[a-zA-Z\-]+$/;
                    var username = document.getElementById("uname");
                    if(reg.test(username)){
                        document.getElementById('message').style.color = 'red';
                        document.getElementById('message').innerHTML = 'Your first name is not valid. Only characters A-Z, a-z and '-' are  acceptable.';
//                        alert("Your first name is not valid. Only characters A-Z, a-z and '-' are  acceptable.");
                        document.frm.firstName.focus();
                        return false;
                    }else{
                        document.getElementById('message').style.color = 'green';
                        document.getElementById('message').innerHTML = 'pdsadsa';
                    }
                    return true;
                }
                
            </script>
        </div>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    </body>
</html>