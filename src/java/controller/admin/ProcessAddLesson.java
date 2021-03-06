/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Lesson;
import dao.LessonDAO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Quach Dinh Kien
 */
public class ProcessAddLesson extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String tenBaiHoc = request.getParameter("name_lesson");
        String chuVietHoa = request.getParameter("write_upper");
        String chuVietThuong = request.getParameter("write_lower");
        String chuInHoa = request.getParameter("print_upper");
        String chuInThuong = request.getParameter("print_lower");
        String amThanh = request.getParameter("sound_lesson");
        // add lesson
        request.setAttribute("message", "");
        LessonDAO ld = new LessonDAO();
        Lesson lesson = new Lesson();
        
        lesson.setLessonName(tenBaiHoc); // tam thoi chi co ten thoi vi chua co anh
        lesson.setWriteCa(chuVietHoa); // okruu
        lesson.setWriteNo(chuVietThuong);
        lesson.setPrintCa(chuInHoa);
        lesson.setPrintNo(chuInThuong);
        if(ld.addLesson(lesson)){
            session.setAttribute("message", "Th??m b??i h???c th??nh c??ng!");
        }else{
            session.setAttribute("message", "Th??m b??i h???c th???t b???i!");
        }
//        RequestDispatcher dis = request.getRequestDispatcher("addLesson.jsp");
//        dis.forward(request, response);
        response.sendRedirect("addLesson.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
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
