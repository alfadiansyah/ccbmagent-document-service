package com.bankmega.ccbmagent.document.services;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import org.springframework.stereotype.Service;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import com.bankmega.ccbmagent.document.model.requests.PointAuthRequest;
import com.bankmega.ccbmagent.document.model.responses.PointAuthResponse;
import com.bankmega.ccbmagent.document.util.AesEncryptionUtil;

@Service
public class PointService {
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

    public PointAuthResponse getHistoryPoints(String accessToken, String phoneNo, Integer currentPage) throws Exception {
        PointAuthResponse response = new PointAuthResponse();
        response.setQueryHistoryPoint(requestQueryHistoryPoint(accessToken, phoneNo, currentPage));
        return response;
    }

    private String requestAuthForMega(String phoneNo) throws Exception {
    String configIp = "http://10.14.20.154:30001/securitybp";
    HttpHeaders headers = new HttpHeaders();
    headers.setContentType(MediaType.APPLICATION_JSON);
    headers.set("bu", "mega");
    headers.set("secret", "082208222250");
    headers.set("action", "authorize");

    String encryptedData = aesUtil.encrypt("{\"phoneNo\": \"" + phoneNo + "\"}");

    String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

    HttpEntity<String> entity = new HttpEntity<>(requestBody, headers);

    try {
        String response = restTemplate.postForObject(configIp, entity, String.class);
        return aesUtil.decrypt(response); 
    } catch (HttpStatusCodeException e) {
        String errorResponse = e.getResponseBodyAsString();
        throw new RuntimeException("Error response: " + errorResponse, e);
    } catch (Exception e) {
        throw new RuntimeException("Encryption/Decryption failed", e);
    }
}

    

    private String requestHistoryPoint(String accessToken) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"accessToken\": \"" + accessToken + "\"}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        return aesUtil.decrypt(response);
    }

    private String requestQueryProfile(String accessToken) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"accessToken\": \"" + accessToken + "\"}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        return aesUtil.decrypt(response);
    }

    private String requestQueryHistoryPoint(String accessToken, String phoneNo, Integer currentPage) throws Exception {
        String configIp = "http://10.14.20.154:30001/securitybp";
        String key = "Random1234567890";
        String iv = "RandomInitVector";

        String encryptedData = aesUtil.encrypt("{\"phoneNo\": \"" + phoneNo + "\", \"accessToken\": \"" + accessToken + "\", \"currentPage\": " + currentPage + "}");

        String requestBody = "{\"channel_id\":\"000022\",\"service_id\":\"POINT01\",\"key_id\":\"AXCVSFDJKAGDKAGDKAFG\",\"data\":{\"msg\":\"" + encryptedData + "\"}}";

        String response = restTemplate.postForObject(configIp, requestBody, String.class);

        return aesUtil.decrypt(response);
    }
}
