package com.mycompany.chessgame.controller.admin;

import com.mycompany.chessgame.dal.implement.GameMoveDAO;
import com.mycompany.chessgame.entity.Game_Moves;
import java.io.IOException;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet(name = "GameMoveServlet", urlPatterns = {"/manager-game/game-move"})
public class GameMoveServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            
        // Kiểm tra session admin
        HttpSession session = request.getSession();
        if (session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
            
        String action = request.getParameter("action");
        
        if ("view-detail".equals(action)) {
            try {
                int gameId = Integer.parseInt(request.getParameter("id"));
                GameMoveDAO gameMoveDAO = new GameMoveDAO();
                List<Game_Moves> moves = gameMoveDAO.findByGameId(gameId);
                
                if (moves != null && !moves.isEmpty()) {
                    request.setAttribute("moves", moves);
                    request.setAttribute("gameId", gameId);
                    request.getRequestDispatcher("/view/admin/admin/game-detail.jsp")
                           .forward(request, response);
                } else {
                    // Không tìm thấy nước đi nào
                    request.setAttribute("errorMessage", "No moves found for game ID: " + gameId);
                    request.getRequestDispatcher("/view/admin/admin/list-game.jsp")
                           .forward(request, response);
                }
            } catch (NumberFormatException e) {
                // Xử lý lỗi khi game_id không hợp lệ
                request.setAttribute("errorMessage", "Invalid game ID format");
                request.getRequestDispatcher("/view/admin/admin/list-game.jsp")
                       .forward(request, response);
            }
        } else {
            // Action không hợp lệ
            response.sendRedirect(request.getContextPath() + "/manager-game?action=list-game");
        }
    }
}