/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Question;
import bean.Word;
import dao.LessonDAO;
import dao.QuestionDAO;
import dao.UserDAO;
import dao.WordDAO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Quach Dinh Kien
 */
public class ProcessAddQuestionWord extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession();
        
        boolean checkAddWord = true;
        boolean checkAddQuestion = true;
        String contentWord = request.getParameter("content_word");
        String soundWord = request.getParameter("sound_word");
        String imgWord = request.getParameter("img_word");

        // add question
        if(contentWord.equals("") && soundWord.equals("") && imgWord.equals("")){
            checkAddWord = false;
        }
        String question = request.getParameter("question_content");
        String ans1 = request.getParameter("ans1");
        String ans2 = request.getParameter("ans2");
        String ans3 = request.getParameter("ans3");
        String ans4 = request.getParameter("ans4");
        if(question.equals("") && ans1.equals("") && ans2.equals("") && ans3.equals("") && ans4.equals("")){
            checkAddQuestion = false;
        }
     //   String imgQues = request.getParameter("sound_question");

        QuestionDAO questionDao = new QuestionDAO();
        WordDAO wordDao = new WordDAO();
        String message = "";
        request.setAttribute("message", "");

        String chooseID = request.getParameter("select_sub");
        if (chooseID.equals("none")) {
            message = "Vui lòng chọn bài học!";
            request.setAttribute("message_Ques_Word", message);
            response.sendRedirect("/addLesson.jsp");
        }
         else {
            int lessonID = Integer.parseInt(request.getParameter("select_sub"));
            Word word = new Word();
            word.setIdLession(lessonID);
//            word.setSound(soundWord);
            word.setImg(imgWord);
            word.setWord(contentWord);

            Question ques = new Question();
            ques.setIdLession(lessonID);
            ques.setQuestion(question);
            ques.setAns1(ans1);
            ques.setAns2(ans2);
            ques.setAns3(ans3);
            ques.setAns4(ans4);
            // ques.set(imgQues);
            if(checkAddWord == true){
                if(wordDao.addWord(word)){
                    request.getSession().setAttribute("message_Ques_Word", "Thêm từ thành công!");
                }else{
                    request.getSession().setAttribute("message_Ques_Word", "Thêm từ thất bại!");
                }
            }
            if(checkAddQuestion == true){
                if(questionDao.addQuestion(ques)){
                    request.getSession().setAttribute("message_Ques_Word", "Thêm câu hỏi thành công!");
                }else{
                    request.getSession().setAttribute("message_Ques_Word", "Thêm câu hỏi thất bại!");
                }
            }
            response.sendRedirect("/addLesson.jsp");
//            RequestDispatcher rd = request.getRequestDispatcher("/addLesson.jsp");
//            rd.forward(request, response);
        }
    }


    // private boolean CheckIfCouldAdd(){
    //     String contentWord = request.getParameter("content_word");
    //     String soundWord = request.getParameter("sound_word");
    //     String imgWord = request.getParameter("img_word");

    //     // add question
    //     String question = request.getParameter("question");
    //     String ans1 = request.getParameter("ans1");
    //     String ans2 = request.getParameter("ans2");
    //     String ans3 = request.getParameter("ans3");
    //     String ans4 = request.getParameter("ans4");


    //     if (contentWord.equalsIgnoreCase("") || question.equalsIgnoreCase("") || ans1.equalsIgnoreCase("") || ans2.equalsIgnoreCase("") || ans3.equalsIgnore == null || ans3 == null || ans4 == null) 
    //         return false ;


    //     return true; 

    // }
    // create function convert text-to-speech use google api

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
