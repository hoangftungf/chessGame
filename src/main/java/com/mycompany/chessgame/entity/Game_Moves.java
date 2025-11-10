package com.mycompany.chessgame.entity;

import java.sql.Timestamp;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class Game_Moves {
    private Integer move_id;
    private Integer game_id;
    private Integer move_number;
    private String player_color;
    private String move_notation;
    private Boolean is_checkmate;
    private Timestamp created_at;

    public Integer getMove_id() {
        return move_id;
    }

    public void setMove_id(Integer move_id) {
        this.move_id = move_id;
    }

    public Integer getGame_id() {
        return game_id;
    }

    public void setGame_id(Integer game_id) {
        this.game_id = game_id;
    }

    public Integer getMove_number() {
        return move_number;
    }

    public void setMove_number(Integer move_number) {
        this.move_number = move_number;
    }

    public String getPlayer_color() {
        return player_color;
    }

    public void setPlayer_color(String player_color) {
        this.player_color = player_color;
    }

    public String getMove_notation() {
        return move_notation;
    }

    public void setMove_notation(String move_notation) {
        this.move_notation = move_notation;
    }

    public Boolean getIs_checkmate() {
        return is_checkmate;
    }

    public void setIs_checkmate(Boolean is_checkmate) {
        this.is_checkmate = is_checkmate;
    }

    public Timestamp getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Timestamp created_at) {
        this.created_at = created_at;
    }
}
