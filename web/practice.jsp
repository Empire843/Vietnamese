<%@include file="includes/header.jsp" %>
<link rel="stylesheet" href="./css/practice_st.css">
</head>
<body>
    <div class="wrapper">
        <%@include file="includes/navbar.jsp" %>
        <div class="content">
            <div class="question-number">
                <%--<ul class="list-question">
                    <li class="question--item"><a href="#" onclick="GetThemeInfo(this.value)">Theme 1</a></li>
                    <li class="question--item"><a href="#" onclick="GetThemeInfo(this.value)">Theme 2</a></li>
                    <li class="question--item"><a href="#" onclick="GetThemeInfo(this.value)">Theme 3</a></li>
                </ul>--%>
            </div>
            <%
            if(session.getAttribute("user") == null){
                response.sendRedirect("login.jsp");
            }
        %>
            <div class="practice_block" dir="auto">
                <div class="question_block" dir="auto">
                    <div class="question" dir="auto"><span class="question_content" id="question_content">Đây là câu hỏi !!! </span></div>
                </div>
                <div class="content-question">
                    <div class="question_image_contain" , dir="auto">
                        <img class="question_img" src="./images/c.jpg" alt="image">
                    </div>
                    <div class="score" id='score'>
                        <span>14</span>
                    </div>
                </div>
                <div class="answer_contain">
                    <button class="answer_button1" role="button" id="buttonA" onclick="CheckAnswer(id)"> A </button>
                    <button class="answer_button2" role="button" id="buttonB" onclick="CheckAnswer(id)"> B </button>
                    <button class="answer_button3" role="button" id="buttonC" onclick="CheckAnswer(id)"> C </button>
                    <button class="answer_button4" role="button" id="buttonD" onclick="CheckAnswer(id)"> D </button>
                </div>
                <script src='./js/practice_js.js'></script>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    </div>
    
</body>

</html>