package com.bankmega.ccbmagent.document.services;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.bankmega.ccbmagent.document.model.requests.PointAuthRequest;
import com.bankmega.ccbmagent.document.model.responses.PointAuthResponse;
import com.bankmega.ccbmagent.document.util.AesEncryptionUtil;

@Service
public class GioPointService {
    private final RestTemplate restTemplate = new RestTemplate();
    private final AesEncryptionUtil aesUtil = new AesEncryptionUtil();

    public PointAuthResponse processPointService(PointAuthRequest request) throws Exception {
        PointAuthResponse response = new PointAuthResponse();

        String accessToken;
        switch (request.getAction()) {
            case "auth":
                accessToken = requestAuthForMega(request.getPhoneNo());
                response.setQueryProfile(accessToken);  // Return the accessToken itself
                break;
            case "balance":
                response.setHistoryPoint(requestHistoryPoint(request.getAccessToken()));
                break;
            case "profile":
                response.setQueryProfile(requestQueryProfile(request.getAccessToken()));
                break;
            default:
                throw new IllegalArgumentException("Invalid action provided");
        }

        return response;
    }

    // New method for handling the history pagination request
    public PointAuthResponse getHistoryPoints(String accessToken, String phoneNo, Integer currentPage) throws Exception {
        PointAuthResponse response = new PointAuthResponse();
        response.setQueryHistoryPoint(requestQueryHistoryPoint(accessToken, phoneNo, currentPage));
        return response;
    }

    // Request Authorization from Mega
    private String requestAuthForMega(String phoneNo) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"phoneNo\": \"" + phoneNo + "\"}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        // Send the POST request
        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        // Decrypt the response
        return aesUtil.decrypt(response);
    }

    // Request for history points
    private String requestHistoryPoint(String accessToken) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"accessToken\": \"" + accessToken + "\"}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        // Send the POST request
        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        // Decrypt the response
        return aesUtil.decrypt(response);
    }

    // Request for user profile
    private String requestQueryProfile(String accessToken) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"accessToken\": \"" + accessToken + "\"}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        // Send the POST request
        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        // Decrypt the response
        return aesUtil.decrypt(response);
    }

    // Request for history pagination
    private String requestQueryHistoryPoint(String accessToken, String phoneNo, Integer currentPage) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"phoneNo\": \"" + phoneNo + "\", \"accessToken\": \"" + accessToken + "\", \"currentPage\": " + currentPage + "}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        // Send the POST request
        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        // Decrypt the response
        return aesUtil.decrypt(response);
    }
}
