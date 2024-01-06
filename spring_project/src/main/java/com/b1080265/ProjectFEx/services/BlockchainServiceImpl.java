package com.b1080265.ProjectFEx.services;

import com.b1080265.ProjectFEx.entities.AgreementDetails;
import com.b1080265.ProjectFEx.entities.ApplicationStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.*;

@Service
public class BlockchainServiceImpl implements BlockchainService {

    private final String NEAR_RPC_URL = "https://rpc.testnet.near.org"; // Change to mainnet URL if needed

    @Override
    public boolean createInvestmentAgreement(AgreementDetails details) {
        String requestBody = constructCreateAgreementJsonRpcBody(details);
        System.out.println("hihihhihhihhh");
        return sendJsonRpcRequest(requestBody);
    }

    @Override
    public boolean updateInvestmentAgreementStatus(Long agreementId, ApplicationStatus status) {
        String requestBody = constructUpdateStatusJsonRpcBody(agreementId, status);
        return sendJsonRpcRequest(requestBody);
    }

    private String constructCreateAgreementJsonRpcBody(AgreementDetails details) {
        return String.format(
                "{\"jsonrpc\": \"2.0\", \"id\": 1, \"method\": \"call\", \"params\": {"
                        + "\"contractId\": \"zeeshannear.testnet\", \"methodName\": \"create_agreement\","
                        + "\"args\": {\"startup_id\": %d, \"investor_id\": %d, \"campaign_id\": %d, \"terms\": \"%s\"},"
                        + "\"gas\": \"100000000000000\", \"deposit\": \"0\", \"signerId\": \"zeeshannear.testnet\"}}",
                details.getStartupId(), details.getInvestorId(), details.getCampaignId(), details.getTerms().replace("\"", "\\\"")
        );
    }

    private String constructUpdateStatusJsonRpcBody(Long agreementId, ApplicationStatus status) {
        return String.format(
                "{\"jsonrpc\": \"2.0\", \"id\": 2, \"method\": \"call\", \"params\": {"
                        + "\"contractId\": \"zeeshannear.testnet\", \"methodName\": \"modify_agreement\","
                        + "\"args\": {\"agreement_id\": %d, \"new_status\": \"%s\"},"
                        + "\"gas\": \"100000000000000\", \"deposit\": \"0\", \"signerId\": \"zeeshannear.testnet\"}}",
                agreementId, status.name()
        );
    }

    private boolean sendJsonRpcRequest(String jsonBody) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<String> request = new HttpEntity<>(jsonBody, headers);
            ResponseEntity<String> response = restTemplate.postForEntity(NEAR_RPC_URL, request, String.class);
            return response.getStatusCode() == HttpStatus.OK;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
