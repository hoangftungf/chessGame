package com.mycompany.chessgame.dal.implement;

import com.mycompany.chessgame.dal.DBContext;
import com.mycompany.chessgame.dal.I_DAO;
import com.mycompany.chessgame.entity.Bot_Profiles;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class BotProfileDAO extends DBContext implements I_DAO<Bot_Profiles> {
    
    @Override
    public List<Bot_Profiles> findAll() {
        List<Bot_Profiles> bots = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM bot_profiles";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                bots.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return bots;
    }

    @Override
    public Map<Integer, Bot_Profiles> findAllMap() {
        Map<Integer, Bot_Profiles> botMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM bot_profiles";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Bot_Profiles bot = getFromResultSet(resultSet);
                botMap.put(bot.getBot_id(), bot);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return botMap;
    }

    @Override
    public Bot_Profiles findById(Integer id) {
        Bot_Profiles bot = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM bot_profiles WHERE bot_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                bot = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return bot;
    }

    @Override
    public int insert(Bot_Profiles t) {
        int generatedId = 0;
        try {
            connection = getConnection();
            String sql = "INSERT INTO bot_profiles (name, difficulty, api_endpoint, rating) "
                    + "VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, t.getName());
            statement.setString(2, t.getDifficulty());
            statement.setString(3, t.getApi_endpoint());
            statement.setInt(4, t.getRating());
            
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
    public boolean update(Bot_Profiles t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE bot_profiles SET name=?, difficulty=?, api_endpoint=?, rating=? "
                    + "WHERE bot_id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, t.getName());
            statement.setString(2, t.getDifficulty());
            statement.setString(3, t.getApi_endpoint());
            statement.setInt(4, t.getRating());
            statement.setInt(5, t.getBot_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public boolean delete(Bot_Profiles t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM bot_profiles WHERE bot_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getBot_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public Bot_Profiles getFromResultSet(ResultSet rs) throws SQLException {
        Bot_Profiles bot = new Bot_Profiles();
        bot.setBot_id(rs.getInt("bot_id"));
        bot.setName(rs.getString("name"));
        bot.setDifficulty(rs.getString("difficulty"));
        bot.setApi_endpoint(rs.getString("api_endpoint"));
        bot.setRating(rs.getInt("rating"));
        return bot;
    }
}
