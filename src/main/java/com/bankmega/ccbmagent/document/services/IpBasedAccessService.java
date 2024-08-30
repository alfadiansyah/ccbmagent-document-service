package com.bankmega.ccbmagent.document.services;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Service;

@Service
public class IpBasedAccessService {
    private final Set<String> whitelistedIps = new HashSet<>();

    public IpBasedAccessService(){
        // contoh
        whitelistedIps.add("192.168.1.1");
        whitelistedIps.add("10.0.0.1");

        //IPv4 pribadi || sesuaikan dengan ip address dari vpn
        whitelistedIps.add("172.18.80.1");
        // IPv4Public
        whitelistedIps.add("202.162.208.26");
        // localhost
        whitelistedIps.add("127.0.0.1"); 
        whitelistedIps.add("192.168.144.1");
    }
    public boolean isIpWhitelisted(String ip) {
        return whitelistedIps.contains(ip);
    }
}
