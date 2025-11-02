/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.chessgame.entity;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author tungm
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Game {
    private Integer game_id;
    private String game_mode;
    private String game_status;
    private String result;
    private String termination_reason;
    private Integer white_rating_change;
    private Integer black_rating_change;
    private Timestamp start_time;
    private Timestamp end_time;
    private String white_type;
    private String black_type;
    private Integer white_id;
    private Integer black_id;

    public Integer getGame_id() {
        return game_id;
    }

    public void setGame_id(Integer game_id) {
        this.game_id = game_id;
    }

    public String getGame_mode() {
        return game_mode;
    }

    public void setGame_mode(String game_mode) {
        this.game_mode = game_mode;
    }

    public String getGame_status() {
        return game_status;
    }

    public void setGame_status(String game_status) {
        this.game_status = game_status;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public String getTermination_reason() {
        return termination_reason;
    }

    public void setTermination_reason(String termination_reason) {
        this.termination_reason = termination_reason;
    }

    public Integer getWhite_rating_change() {
        return white_rating_change;
    }

    public void setWhite_rating_change(Integer white_rating_change) {
        this.white_rating_change = white_rating_change;
    }

    public Integer getBlack_rating_change() {
        return black_rating_change;
    }

    public void setBlack_rating_change(Integer black_rating_change) {
        this.black_rating_change = black_rating_change;
    }

    public Timestamp getStart_time() {
        return start_time;
    }

    public void setStart_time(Timestamp start_time) {
        this.start_time = start_time;
    }

    public Timestamp getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Timestamp end_time) {
        this.end_time = end_time;
    }

    public String getWhite_type() {
        return white_type;
    }

    public void setWhite_type(String white_type) {
        this.white_type = white_type;
    }

    public String getBlack_type() {
        return black_type;
    }

    public void setBlack_type(String black_type) {
        this.black_type = black_type;
    }

    public Integer getWhite_id() {
        return white_id;
    }

    public void setWhite_id(Integer white_id) {
        this.white_id = white_id;
    }

    public Integer getBlack_id() {
        return black_id;
    }

    public void setBlack_id(Integer black_id) {
        this.black_id = black_id;
    }
}
