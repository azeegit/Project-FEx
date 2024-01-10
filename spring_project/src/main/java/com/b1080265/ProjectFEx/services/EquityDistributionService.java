package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Campaign;
import com.b1080265.ProjectFEx.gameTheory.PayOff;
import com.b1080265.ProjectFEx.gameTheory.Player;
import com.b1080265.ProjectFEx.gameTheory.Strategy;

public interface EquityDistributionService {
    void distributeEquity(Campaign campaign);

    PayOff calculatePayoff(Player player, Strategy strategy);
}
