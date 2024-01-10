package com.b1080265.ProjectFEx.gameTheory;

import com.b1080265.ProjectFEx.gameTheory.Player;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Game {
    private List<Player> players;
    private Map<Player, Strategy> chosenStrategies;
    private Map<Player, PayOff> payoffs;

    // Constructor
    public Game(List<Player> players) {
        this.players = players;
        this.chosenStrategies = new HashMap<>();
        this.payoffs = new HashMap<>();
    }

    // Getters and Setters
    public List<Player> getPlayers() {
        return players;
    }

    public void setPlayers(List<Player> players) {
        this.players = players;
    }

    public Map<Player, Strategy> getChosenStrategies() {
        return chosenStrategies;
    }

    public void setChosenStrategies(Map<Player, Strategy> chosenStrategies) {
        this.chosenStrategies = chosenStrategies;
    }

    public Map<Player, PayOff> getPayoffs() {
        return payoffs;
    }

    public void setPayoffs(Map<Player, PayOff> payoffs) {
        this.payoffs = payoffs;
    }

    // Other methods
    public void addPlayer(Player player) {
        this.players.add(player);
    }

    public void assignStrategyToPlayer(Player player, Strategy strategy) {
        this.chosenStrategies.put(player, strategy);
    }

    public void assignPayoffToPlayer(Player player, PayOff payoff) {
        this.payoffs.put(player, payoff);
    }

    // Method to run the game and determine strategies and payoffs
    public void runGame() {
        // Logic to run the game, possibly invoking a service to determine strategies and calculate payoffs
    }

    public void setIsNashEquilibrium(boolean b) {
    }

    // Additional methods as required for your game logic
}
