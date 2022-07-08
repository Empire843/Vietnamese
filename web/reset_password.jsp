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
            <h3>Reset Password</h3>
            <form action="reset_password" method="post">
                <div class="inputBox"> 
                    <input id="uname" type="text" name="Username" placeholder="Username" required>
                    <input id="email" type="email" name="Email" placeholder="Email" required> 
                    <label style="display: block; position: relative;margin-bottom:25px; " id="message">${message_reset}</label>
                    <%
                        request.getSession().removeAttribute("message_reset");
                    %>
                </div> <input type="submit" name="" value="Submit">
            </form>
            <div class="text-center">
                <p style="color: #59238F;"><a href="/login.jsp">Login</a></p>
                <p style="color: #59238F;"><a href="/register.jsp">Register Account</a></p>
            </div>
        </div>
    </body>
</html>