package com.bankmega.ccbmagent.document.services;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bankmega.ccbmagent.document.mappers.IpWhitelistMapper;

@Service
public class IpBasedAccessService {
    private final Set<String> whitelistedIps = new HashSet<>();
    private final IpWhitelistMapper ipWhitelistMapper;

    @Autowired
    public IpBasedAccessService(IpWhitelistMapper ipWhitelistMapper) {
        this.ipWhitelistMapper = ipWhitelistMapper;
        reloadWhitelistedIps("api_attachment"); // Load initial IPs
    }

    public void reloadWhitelistedIps(String accessFunction) {
        try {
            List<String> ipList = ipWhitelistMapper.getWhitelistedIpsByFunction(accessFunction);
            whitelistedIps.clear();
            whitelistedIps.addAll(ipList);
            System.out.println("Whitelisted IPs reloaded: " + whitelistedIps);
        } catch (Exception e) {
            System.err.println("Error loading whitelisted IPs: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public boolean isIpWhitelisted(String ip) {
        return whitelistedIps.contains(ip);
    }
}
