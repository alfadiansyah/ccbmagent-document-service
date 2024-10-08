package com.bankmega.ccbmagent.document.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;

public class IpBasedAccessUtil {
    public static String getLocalIpAddress() {
        try {
            InetAddress inetAddress = InetAddress.getLocalHost();
            return inetAddress.getHostAddress();
        } catch (Exception e) {
            e.printStackTrace();
            return "unknown";
        }
    }

    // Method to get the public IP address
    public static String getPublicIpAddress() {
        String publicIp = "unknown";
        try {
            URL url = new URL("https://api.ipify.org"); // You can use other services like https://ifconfig.me or https://icanhazip.com
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("GET");
            connection.setRequestProperty("User-Agent", "Mozilla/5.0");
            BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            publicIp = in.readLine();
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return publicIp;
    }
}
