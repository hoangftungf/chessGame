/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.chessgame.dal.implement;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mycompany.chessgame.dal.DBContext;
import com.mycompany.chessgame.dal.I_DAO;
import com.mycompany.chessgame.entity.Players;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 *
 * @author Dell
 */
public class PlayerDAO extends DBContext implements I_DAO<Players> {

    @Override
    public List<Players> findAll() {
        List<Players> players = new ArrayList<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM players";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                players.add(getFromResultSet(resultSet));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return players;
    }

    @Override
    public Map<Integer, Players> findAllMap() {
        Map<Integer, Players> playerMap = new HashMap<>();
        try {
            connection = getConnection();
            String sql = "SELECT * FROM players";
            statement = connection.prepareStatement(sql);
            resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Players player = getFromResultSet(resultSet);
                playerMap.put(player.getPlayer_id(), player);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return playerMap;
    }

    @Override
    public Players findById(Integer id) {
        Players player = null;
        try {
            connection = getConnection();
            String sql = "SELECT * FROM players WHERE player_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, id);
            resultSet = statement.executeQuery();
            if (resultSet.next()) {
                player = getFromResultSet(resultSet);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return player;
    }

    @Override
    public int insert(Players t) {
        int generatedId = 0;
        try {
            connection = getConnection();
            String sql = "INSERT INTO players (player_name, email, password_hash, display_name, "
                    + "rating, status, role, created_at, updated_at) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setString(1, t.getPlayer_name());
            statement.setString(2, t.getEmail());
            statement.setString(3, t.getPassword_hash());
            statement.setString(4, t.getDisplay_name());
            statement.setInt(5, t.getRating());
            statement.setString(6, t.getStatus());
            java.sql.Date currentDate = new java.sql.Date(System.currentTimeMillis());
            statement.setDate(8, currentDate);
            statement.setDate(9, currentDate);

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
    public boolean update(Players t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "UPDATE players SET player_name=?, email=?, password_hash=?, display_name=?, "
                    + "rating=?, status=?, role=?, updated_at=? "
                    + "WHERE player_id=?";
            statement = connection.prepareStatement(sql);
            statement.setString(1, t.getPlayer_name());
            statement.setString(2, t.getEmail());
            statement.setString(3, t.getPassword_hash());
            statement.setString(4, t.getDisplay_name());
            statement.setInt(5, t.getRating());
            statement.setString(6, t.getStatus());
            statement.setDate(8, new java.sql.Date(System.currentTimeMillis()));
            statement.setInt(9, t.getPlayer_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public boolean delete(Players t) {
        boolean result = false;
        try {
            connection = getConnection();
            String sql = "DELETE FROM players WHERE player_id=?";
            statement = connection.prepareStatement(sql);
            statement.setInt(1, t.getPlayer_id());
            result = statement.executeUpdate() > 0;
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeResources();
        }
        return result;
    }

    @Override
    public Players getFromResultSet(ResultSet rs) throws SQLException {
        Players player = new Players();
        player.setPlayer_id(rs.getInt("player_id"));
        player.setPlayer_name(rs.getString("player_name"));
        player.setEmail(rs.getString("email"));
        player.setPassword_hash(rs.getString("password_hash"));
        player.setDisplay_name(rs.getString("display_name"));
        player.setRating(rs.getInt("rating"));
        player.setStatus(rs.getString("status"));
        player.setCreated_at(rs.getDate("created_at"));
        player.setUpdated_at(rs.getDate("updated_at"));
        return player;
    }
    

    public static void main(String[] args) {
        PlayerDAO dao = new PlayerDAO();
        for (Players player : dao.findAll()) {
            System.out.println(player);
        }
    }
}
