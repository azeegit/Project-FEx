package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.AgreementDetails;
import com.b1080265.ProjectFEx.entities.ApplicationStatus;
import org.springframework.stereotype.Service;

@Service
public interface BlockchainService {
    boolean createInvestmentAgreement(AgreementDetails details);
    boolean updateInvestmentAgreementStatus(Long agreementId, ApplicationStatus status);

}