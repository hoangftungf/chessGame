/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.chessgame.controller.admin;

import com.mycompany.chessgame.config.GlobalConfig;
import com.mycompany.chessgame.dal.implement.PlayerDAO;

import com.mycompany.chessgame.entity.Players;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.sql.Date;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Dell
 */
@WebServlet(name = "ManagerPlayerServlet", urlPatterns = {"/manager-player"})
public class ManagerPlayerServlet extends HttpServlet {

    // private static final int ITERATIONS = 65536;
    // private static final int KEY_LENGTH = 256;
    // private static final int SALT_LENGTH = 16;

    PlayerDAO playerDAO = new PlayerDAO();
    public static final String URL_LIST_ACCOUNT = "view/admin/admin/list-account.jsp";
    public static final String URL_ACCOUNT = "view/admin/admin/account.jsp";
    public static final String URL_ADD_ACCOUNT = "view/admin/admin/add-account.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "list-account":
                viewListAccount(request, response);
                break;
            case "account-detail":
                viewAccoutDetail(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "account-delete":
                deleteAccountDoPost(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void viewListAccount(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // gọi tới hàm findAll() của PlayerDAO
        List<Players> listAccount = playerDAO.findAll();
        // set list vào request
        request.setAttribute("listAccount", listAccount);
        request.getRequestDispatcher(URL_LIST_ACCOUNT).forward(request, response);
    }

    private void viewAccoutDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        // find account by ID
        Players account = playerDAO.findById(id);

        request.setAttribute("typeOfAction", "view");
        request.setAttribute(GlobalConfig.SESSION_ACCOUNT, account);
        request.getRequestDispatcher(URL_ACCOUNT).forward(request, response);
    }

    private void deleteAccountDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            // Lấy ID của tài khoản cần xóa từ request
            Integer id = Integer.parseInt(request.getParameter("id"));

            // Thực hiện xóa tài khoản từ database
            Players deleteAccount = playerDAO.findById(id);
            boolean result = playerDAO.delete(deleteAccount);

            // Goi lai list account
            List<Players> listAccount = playerDAO.findAll();

            // Set kết quả lên session
            session.setAttribute("deleteSuccess", result);
            session.setAttribute("message", "Đã xóa tài khoản thành công!");
            session.setAttribute("listAccount", listAccount);
            // Chuyển hướng về trang danh sách tài khoản
            response.sendRedirect(URL_LIST_ACCOUNT);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

//    private void viewAccountByAscRating(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//            PlayerDAO playerDAO = new PlayerDAO();
//            List<Players> listPlayer = playerDAO.getAllPlayerssOrderByRatingAsc();
//        } catch (Exception e) {
//
//        }
//    }f
//
//    private void viewAccountByDescRating(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        try {
//
//        } catch (Exception e) {
//
//        }
//    }
}
