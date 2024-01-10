package com.b1080265.ProjectFEx.gameTheory;

import com.b1080265.ProjectFEx.services.EquityDistributionServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class GameTheoreticEquityServiceImpl implements GameTheoriticEquityService {

    @Autowired
    private EquityDistributionServiceImpl equityDistributionService;

    @Override
    public void analyzeGame(Game game) {
        // Assuming game has already been set up with players and their strategies

        for (Player player : game.getPlayers()) {
            Strategy optimalStrategy = findOptimalStrategy(player, game);
            PayOff payoff = equityDistributionService.calculatePayoff(player, optimalStrategy);
            game.getChosenStrategies().put(player, optimalStrategy);
            game.getPayoffs().put(player, payoff);
        }

        // Optionally, find Nash Equilibrium if applicable
        findNashEquilibrium(game);
    }

    private Strategy findOptimalStrategy(Player player, Game game) {
        Strategy bestStrategy = new Strategy("Initial Strategy");
        double bestPayoffValue = Double.MIN_VALUE;

        for (Strategy strategy : player.getAvailableStrategies()) {
            double payoffValue = simulateStrategy(player, strategy, game);
            if (payoffValue > bestPayoffValue) {
                bestStrategy = strategy;
                bestPayoffValue = payoffValue;
            }
        }
        return bestStrategy;
    }

    private void findNashEquilibrium(Game game) {
        // Implement Nash Equilibrium logic
        // Placeholder: Checking if each player's strategy is their best response given the strategies of others
        for (Player player : game.getPlayers()) {
            for (Strategy strategy : player.getAvailableStrategies()) {
                if (!isBestResponse(player, strategy, game)) {
                    return; // Not a Nash Equilibrium if any strategy is not the best response
                }
            }
        }
        // If reached here, the current strategies form a Nash Equilibrium
        game.setIsNashEquilibrium(true);
    }

    private boolean isBestResponse(Player player, Strategy strategy, Game game) {
        double currentPayoff = equityDistributionService.calculatePayoff(player, strategy).getValue();
        for (Strategy altStrategy : player.getAvailableStrategies()) {
            if (!altStrategy.equals(strategy)) {
                double altPayoff = simulateStrategy(player, altStrategy, game);
                if (altPayoff > currentPayoff) {
                    return false; // There is a better response available
                }
            }
        }
        return true; // The strategy is a best response given others' strategies
    }

    private double simulateStrategy(Player player, Strategy strategy, Game game) {
        // Simulate the strategy and calculate expected payoff
        // This method would need to understand the interactions among players' strategies
        // and how these interactions influence the payoff of the given player.
        // Placeholder logic for simulation
        double simulatedPayoff = 0.0;
        // ... simulation logic ...
        return simulatedPayoff;
    }
}
