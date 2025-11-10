package com.mycompany.chessgame.controller.admin;

import com.mycompany.chessgame.dal.implement.GameMoveDAO;
import com.mycompany.chessgame.entity.Game_Moves;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GameHistoryServlet", urlPatterns = {"/game/history"})
public class GameHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing game ID");
            return;
        }

        try {
            int gameId = Integer.parseInt(idParam);
            GameMoveDAO dao = new GameMoveDAO();
            // Lấy danh sách nước đi theo gameId
            List<Game_Moves> moves = dao.findByGameId(gameId);

            request.setAttribute("gameId", gameId);
            request.setAttribute("moves", moves);
            // Forward tới trang gameHistory
            request.getRequestDispatcher("/view/admin/admin/gameHistory.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid game ID");
        } catch (Exception e) {
            throw new ServletException("Error loading game history", e);
        }
    }
}