/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import bean.User;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        doPost(request, response);
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String message = "";
        String full_name = request.getParameter("Full_name");
        String email = request.getParameter("Email");
        String username = request.getParameter("Username");
        String password = request.getParameter("password");
        
        UserDAO ud = new UserDAO();
        User user = new User();
        user.setFull_name(full_name);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        
        String url = "/register.jsp";
        if(ud.checkExist(username)){
            message = "username đã tồn tại! vui lòng chọn username khác";
            request.getSession().setAttribute("message_register", message);
        }else{
            if(ud.addNewUser(user)){
                message = "Đăng ký tài khoản thành công!!!";
                request.getSession().setAttribute("message_register", message);
                url = "/login.jsp";
            }else{
                message = "Đăng ký tài khoản thất bại!!!";
                request.getSession().setAttribute("message_register", message);
                url ="/register.jsp";
            }
        }
        response.sendRedirect(url);
    }
}
