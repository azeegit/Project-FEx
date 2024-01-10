package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.Campaign;
import com.b1080265.ProjectFEx.entities.InvestorApplication;
import com.b1080265.ProjectFEx.gameTheory.PayOff;
import com.b1080265.ProjectFEx.gameTheory.Player;
import com.b1080265.ProjectFEx.gameTheory.Strategy;
import com.b1080265.ProjectFEx.repositories.InvestorApplicationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquityDistributionServiceImpl implements EquityDistributionService {

    private final InvestorApplicationRepository investorApplicationRepository;

    @Autowired
    public EquityDistributionServiceImpl(InvestorApplicationRepository investorApplicationRepository) {
        this.investorApplicationRepository = investorApplicationRepository;
    }

    @Override
    public void distributeEquity(Campaign campaign) {
        // Get the total amount sought and the equity offered from the campaign
        int totalAmountSought = campaign.getAmountSought();
        int totalEquityOffered = campaign.getEquityOffered();

        // Iterate over each application to the campaign
        for (InvestorApplication application : campaign.getInvestorApplications()) {
            // Calculate the percentage of total investment made by the investor
            double investmentShare = (double) application.getInvestorGivingAmount() / totalAmountSought;

            // Calculate the amount of equity to be distributed to the investor
            int equity = (int) (investmentShare * totalEquityOffered);

            // Set the equity amount for the investor's application
            application.setEquityReceived(equity);

            // Persist changes to the database using the appropriate repository
            investorApplicationRepository.save(application);
        }
    }

    private double calculateTotalEquityValue(Player player, double equityPercent) {
        // Placeholder logic to calculate the total value of equity
        // Could involve accessing campaign details, investment amounts, etc.
        // This is a simplified example:
        double startupValuation = player.getStartup().getValuation(); // Hypothetical method in Player class
        return startupValuation * equityPercent / 100;
    }

    @Override
    public PayOff calculatePayoff(Player player, Strategy strategy) {
        // The method implementation will depend on how Payoff, Player, and Strategy are defined
        // Example logic (assuming equity distribution based on investment):
        // 1. Calculate the total equity the player would receive based on the strategy
        // 2. Determine the value of that equity (could be based on the startup's valuation)
        // 3. Create and return a new Payoff object with the calculated value

        // Placeholder for calculation logic:
        double equityPercent = strategy.getEquityPercent(); // Hypothetical method in Strategy class
        double totalEquityValue = calculateTotalEquityValue(player, equityPercent);

        return new PayOff(totalEquityValue);
    }
}
