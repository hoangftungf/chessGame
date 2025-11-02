package com.mycompany.chessgame.entity;

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
public class Bot_Profiles {
    private Integer bot_id;
    private String name;
    private String difficulty;
    private String api_endpoint;
    private Integer rating;

    public Integer getBot_id() {
        return bot_id;
    }

    public void setBot_id(Integer bot_id) {
        this.bot_id = bot_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getApi_endpoint() {
        return api_endpoint;
    }

    public void setApi_endpoint(String api_endpoint) {
        this.api_endpoint = api_endpoint;
    }

    public Integer getRating() {
        return rating;
    }

    public void setRating(Integer rating) {
        this.rating = rating;
    }
}
