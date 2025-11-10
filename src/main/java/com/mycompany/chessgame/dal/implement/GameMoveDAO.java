package com.mycompany.chessgame.dal.implement;

import com.mycompany.chessgame.dal.DBContext;
import com.mycompany.chessgame.dal.I_DAO;
import com.mycompany.chessgame.entity.Game_Moves;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GameMoveDAO extends DBContext implements I_DAO<Game_Moves> {
    
    @Override
    public List<Game_Moves> findAll() {
        List<Game_Moves> moves = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM game_moves";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                moves.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return moves;
    }

    @Override
    public Map<Integer, Game_Moves> findAllMap() {
        Map<Integer, Game_Moves> moveMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM game_moves";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Game_Moves move = getFromResultSet(resultSet);
                moveMap.put(move.getMove_id(), move);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return moveMap;
    }

    @Override
    public Game_Moves findById(Integer id) {
        Game_Moves move = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM game_moves WHERE move_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                move = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return move;
    }

    @Override
    public int insert(Game_Moves t) {
        int generatedId = 0;
        try {
            connection = getConnection();
            String sql = "INSERT INTO game_moves (game_id, move_number, player_color, "
                    + "move_notation, is_checkmate, created_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setInt(1, t.getGame_id());
            statement.setInt(2, t.getMove_number());
            statement.setString(3, t.getPlayer_color());
            statement.setString(4, t.getMove_notation());
            statement.setBoolean(5, t.getIs_checkmate());
            statement.setTimestamp(6, t.getCreated_at());
            
            statement.executeUpdate();
            ResultSet rs = statement.getGeneratedKeys();
            if (rs.next()) {
                generatedId = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return generatedId;
    }

    @Override
    public boolean update(Game_Moves t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE game_moves SET game_id=?, move_number=?, player_color=?, "
                    + "move_notation=?, is_checkmate=?, created_at=? "
                    + "WHERE move_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getGame_id());
            statement.setInt(2, t.getMove_number());
            statement.setString(3, t.getPlayer_color());
            statement.setString(4, t.getMove_notation());
            statement.setBoolean(5, t.getIs_checkmate());
            statement.setTimestamp(6, t.getCreated_at());
            statement.setInt(7, t.getMove_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public boolean delete(Game_Moves t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM game_moves WHERE move_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getMove_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public Game_Moves getFromResultSet(ResultSet rs) throws SQLException {
        Game_Moves move = new Game_Moves();
        move.setMove_id(rs.getInt("move_id"));
        move.setGame_id(rs.getInt("game_id"));
        move.setMove_number(rs.getInt("move_number"));
        move.setPlayer_color(rs.getString("player_color"));
        move.setMove_notation(rs.getString("move_notation"));
        move.setIs_checkmate(rs.getBoolean("is_checkmate"));
        move.setCreated_at(rs.getTimestamp("created_at"));
        return move;
    }

    // Implement lấy danh sách nước đi theo gameId, sắp xếp theo thứ tự lượt đi
    public List<Game_Moves> findByGameId(int gameId) {
        List<Game_Moves> moves = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM game_moves WHERE game_id = ? ORDER BY move_number ASC, move_id ASC";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, gameId);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                moves.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return moves;
    }
}
