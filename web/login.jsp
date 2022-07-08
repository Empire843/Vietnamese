<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="./css/login.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-beta2/js/bootstrap.min.js">
        <title>Login</title>
    </head>
    <body>
        <div class="loginBox form-popup">
            <h3>Sign In</h3>
            <form action="login" method="post" class="form-container">
                <div class="inputBox"> 
                    <input id="username" type="text" name="username" placeholder="Username"> 
                    <input id="password" type="password" name="password" placeholder="Password"> 
                </div> 
                <div class ="message-error">
                    <%
                        if(request.getAttribute("message_error") == null){
                        
                        }else{
                    %>
                        <%=request.getAttribute("message_error") %>
                    <%
                        }
                    %>
                </div>
                <input type="submit" name="" value="Login">
            </form> <a href="reset_password.jsp">Forget Password<br> </a>
            <div class="text-center">
                <p style="color: #59238F;"><a href="register.jsp">Register</a></p>
            </div>
        </div>
    </body>
</html>