/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.chessgame.controller.admin;

import com.mycompany.chessgame.dal.implement.GameDAO;
import com.mycompany.chessgame.dal.implement.PlayerDAO;
import com.mycompany.chessgame.entity.Game;
import com.mycompany.chessgame.entity.Players;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.List;

/**
 *
 * @author tungm
 */
@WebServlet(name = "GamesServlet", urlPatterns = { "/GamesServlet" })
public class GamesServlet extends HttpServlet {

    GameDAO gameDAO = new GameDAO();
    PlayerDAO playerDAO = new PlayerDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        final int pageSize = 10;
        int currentPage = 1;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try {
                currentPage = Integer.parseInt(pageParam);
                if (currentPage < 1) {
                    currentPage = 1;
                }
            } catch (NumberFormatException e) {
                currentPage = 1;
            }
        }

        int totalGames = gameDAO.countAll();
        int totalPages = (int) Math.ceil((double) totalGames / pageSize);
        if (totalPages == 0) {
            totalPages = 1;
        }
        if (currentPage > totalPages) {
            currentPage = totalPages;
        }

        int offset = (currentPage - 1) * pageSize;
        List<Game> listGame = gameDAO.findPage(offset, pageSize);
        List<Players> listPLayer = playerDAO.findAll();

        System.out.println("Number of games found: " + listGame.size());
        request.setAttribute("listGame", listGame);
        request.setAttribute("listPlayer", listPLayer);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("totalGames", totalGames);
        request.setAttribute("hasGames", totalGames > 0);
        request.getRequestDispatcher("view/admin/admin/list-game.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action) {
            case "game-delete":
                deleteGameDoPost(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    private void deleteGameDoPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            // Lấy ID của tài khoản cần xóa từ request
            Integer id = Integer.parseInt(request.getParameter("id"));

            // Thực hiện xóa lịch sử trận đấu từ database
            Game deleteGame = gameDAO.findById(id);
            boolean result = gameDAO.delete(deleteGame);

            // Goi lai list game
            // Set kết quả lên session
            session.setAttribute("deleteSuccess", result);
            session.setAttribute("message", "Đã xóa lịch sử trận đấu thành công!");
            // Chuyển hướng về trang danh sách game
            response.sendRedirect(request.getContextPath() + "/GamesServlet");
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
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
