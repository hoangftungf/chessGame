package com.mycompany.chessgame.dal.implement;

import com.mycompany.chessgame.dal.DBContext;
import com.mycompany.chessgame.dal.I_DAO;
import com.mycompany.chessgame.entity.Game;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GameDAO extends DBContext implements I_DAO<Game> {
    
    @Override
    public List<Game> findAll() {
        List<Game> games = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM games";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                games.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return games;
    }

    @Override
    public Map<Integer, Game> findAllMap() {
        Map<Integer, Game> gameMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM games";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Game game = getFromResultSet(resultSet);
                gameMap.put(game.getGame_id(), game);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return gameMap;
    }

    @Override
    public Game findById(Integer id) {
        Game game = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM games WHERE game_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                game = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return game;
    }

    @Override
    public int insert(Game t) {
        int generatedId = 0;
        try {
            connection = getConnection();
            String sql = "INSERT INTO games (game_mode, game_status, result, termination_reason, "
                    + "white_rating_change, black_rating_change, start_time, end_time, "
                    + "white_id, black_id) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, t.getGame_mode());
            statement.setString(2, t.getGame_status());
            statement.setString(3, t.getResult());
            statement.setString(4, t.getTermination_reason());
            statement.setInt(5, t.getWhite_rating_change());
            statement.setInt(6, t.getBlack_rating_change());
            statement.setTimestamp(7, t.getStart_time());
            statement.setTimestamp(8, t.getEnd_time());
            statement.setInt(9, t.getWhite_id());
            statement.setInt(10, t.getBlack_id());
            
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
    public boolean update(Game t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE games SET game_mode=?, game_status=?, result=?, "
                    + "termination_reason=?, white_rating_change=?, black_rating_change=?, "
                    + "start_time=?, end_time=?, "
                    + "white_id=?, black_id=? WHERE game_id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, t.getGame_mode());
            statement.setString(2, t.getGame_status());
            statement.setString(3, t.getResult());
            statement.setString(4, t.getTermination_reason());
            statement.setInt(5, t.getWhite_rating_change());
            statement.setInt(6, t.getBlack_rating_change());
            statement.setTimestamp(7, t.getStart_time());
            statement.setTimestamp(8, t.getEnd_time());
            statement.setInt(9, t.getWhite_id());
            statement.setInt(10, t.getBlack_id());
            statement.setInt(11, t.getGame_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public boolean delete(Game t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM games WHERE game_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getGame_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public Game getFromResultSet(ResultSet rs) throws SQLException {
        Game game = new Game();
        game.setGame_id(rs.getInt("game_id"));
        game.setGame_mode(rs.getString("game_mode"));
        game.setGame_status(rs.getString("game_status"));
        game.setResult(rs.getString("result"));
        game.setTermination_reason(rs.getString("termination_reason"));
        game.setWhite_rating_change(rs.getInt("white_rating_change"));
        game.setBlack_rating_change(rs.getInt("black_rating_change"));
        game.setStart_time(rs.getTimestamp("start_time"));
        game.setEnd_time(rs.getTimestamp("end_time"));
        game.setWhite_id(rs.getInt("white_id"));
        game.setBlack_id(rs.getInt("black_id"));
        return game;
    }
}
