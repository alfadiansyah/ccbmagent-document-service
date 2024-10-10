package com.bankmega.ccbmagent.document.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.net.URL;
import java.util.Enumeration;

public class IpBasedAccessUtil {
    public static String getLocalIpAddressForInterface(String interfaceName) throws SocketException {
        Enumeration<NetworkInterface> interfaces = NetworkInterface.getNetworkInterfaces();
        while (interfaces.hasMoreElements()) {
            NetworkInterface networkInterface = interfaces.nextElement();
            if (networkInterface.getName().equalsIgnoreCase(interfaceName)) {
                Enumeration<InetAddress> addresses = networkInterface.getInetAddresses();
                while (addresses.hasMoreElements()) {
                    InetAddress address = addresses.nextElement();
                    if (address.isSiteLocalAddress()) {
                        return address.getHostAddress();
                    }
                }
            }
        }
        throw new SocketException("No local IP address found for the specified network interface.");
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
