const nearAPI = require('near-api-js');
const { connect, keyStores, utils } = nearAPI;


// const { KeyPair } = nearAPI.utils;

// // Generate a new key pair
// const newKeyPair = KeyPair.fromRandom('ed25519');

// // Output the private and public keys
// console.log("Private Key:", newKeyPair.toString());
// console.log("Public Key:", newKeyPair.getPublicKey().toString());


async function createInvestmentAgreement(contractId, privateKey, agreementDetails) {
    // Configure NEAR connection
    const config = {
        networkId: "testnet",
        keyStore: new keyStores.InMemoryKeyStore(),
        nodeUrl: "https://rpc.testnet.near.org",
        walletUrl: "https://wallet.testnet.near.org",
        helperUrl: "https://helper.testnet.near.org",
        explorerUrl: "https://explorer.testnet.near.org",
    };

    // Add private key to keystore
    const keyPair = nearAPI.utils.KeyPair.fromString(privateKey);
    await config.keyStore.setKey(config.networkId, contractId, keyPair);

    // Connect to NEAR
    const near = await connect(config);
    const account = await near.account(contractId);

    // Convert agreement details to base64
    const args = {
        startup_id: agreementDetails.startupId,
        investor_id: agreementDetails.investorId,
        campaign_id: agreementDetails.campaignId,
        terms: agreementDetails.terms
    };

    // Call the smart contract
    const result = await account.functionCall({
        contractId,
        methodName: "create_agreement",
        args, // Pass the formatted args here
        gas: "100000000000000",
        attachedDeposit: "0",
    });

    console.log("Transaction Result:", result);
}

async function updateInvestmentAgreementStatus(contractId, privateKey, agreementId, newStatus) {
    // Similar setup as createInvestmentAgreement
    const config = {
        networkId: "testnet",
        keyStore: new keyStores.InMemoryKeyStore(),
        nodeUrl: "https://rpc.testnet.near.org",
        walletUrl: "https://wallet.testnet.near.org",
        helperUrl: "https://helper.testnet.near.org",
        explorerUrl: "https://explorer.testnet.near.org",
    };

    // Add private key to keystore
    const keyPair = nearAPI.utils.KeyPair.fromString(privateKey);
    await config.keyStore.setKey(config.networkId, contractId, keyPair);

    // Connect to NEAR and create an account instance
    const near = await connect(config);
    const account = await near.account(contractId);

    // Convert arguments to base64
    const args = {
        agreement_id: agreementId,
        new_status: newStatus
    };

    // Call the smart contract
    const result = await account.functionCall({
        contractId,
        methodName: "modify_agreement",
        args, // Pass the formatted args here
        gas: "100000000000000",
        attachedDeposit: "0",
    });

    console.log("Transaction Result:", result);
}

async function main() {
    const args = process.argv.slice(2);
    const operation = args[0];

    const contractId = "zeeshannear.testnet"; // Replace with your contract's account ID
    const privateKey = "ed25519:41inutaARnmawSg3xT8Cvp5sLhByZK4D7Aaiy2Ag4o36p1ii9Gjt1oEXXGtLH18ye9voNnikDjKrsrp3RabthgRn"; // Replace with your private key

    if (operation === "createInvestmentAgreement") {
        // Extract arguments for createInvestmentAgreement
        const startupId = args[1];
        const investorId = args[2];
        const campaignId = args[3];
        const terms = args[4];

        const agreementDetails = {
            startupId,
            investorId,
            campaignId,
            terms
        };

        await createInvestmentAgreement(contractId, privateKey, agreementDetails);
    } else if (operation === "updateInvestmentAgreementStatus") {
        // Extract arguments for updateInvestmentAgreementStatus
        const agreementId = args[1];
        const newStatus = args[2];

        await updateInvestmentAgreementStatus(contractId, privateKey, agreementId, newStatus);
    }
}

main().catch(console.error);


// Example usage
const contractId = "zeeshannear.testnet"; // Replace with your contract's account ID
const privateKey = "ed25519:41inutaARnmawSg3xT8Cvp5sLhByZK4D7Aaiy2Ag4o36p1ii9Gjt1oEXXGtLH18ye9voNnikDjKrsrp3RabthgRn"; // Replace with your private key

const agreementDetails = {
    startupId: 1,
    investorId: 2,
    campaignId: 3,
    terms: "Terms of the agreement"
};

// Export the functions so they can be used elsewhere
module.exports = {
    createInvestmentAgreement,
    updateInvestmentAgreementStatus
};

// createInvestmentAgreement(contractId, privateKey, agreementDetails)
//     .catch(console.error);

// updateInvestmentAgreementStatus(contractId, privateKey, 1, "Accepted")
//     .catch(console.error);
