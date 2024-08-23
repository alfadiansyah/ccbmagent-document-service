package com.bankmega.ccbmagent.document.config;

import java.io.IOException;

import org.springframework.web.filter.OncePerRequestFilter;

import com.bankmega.ccbmagent.document.services.IpBasedAccessService;
import com.bankmega.ccbmagent.document.util.IpBasedAccessUtil;

import jakarta.servlet.FilterChain;
import jakarta.servlet.GenericFilter;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class IpBasedAccessFilter extends OncePerRequestFilter {

    private final IpBasedAccessService ipService;

    public IpBasedAccessFilter(IpBasedAccessService ipService) {
        this.ipService = ipService;
    }

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
            throws ServletException, IOException {
        // TODO Auto-generated method stub
        String remoteIp = IpBasedAccessUtil.getLocalIpAddress();
        System.out.println("Local IP: " + remoteIp); // Log the IP address for debugging

        // Handle localhost addresses (IPv4 and IPv6)
        // if ("0:0:0:0:0:0:0:1".equals(remoteIp)) {
        //     remoteIp = IpUtil.getLocalIpAddress();
        // }

        System.out.println("Request IP: " + remoteIp); // Log the IP address for debugging

        if (ipService.isIpWhitelisted(remoteIp)) {
            filterChain.doFilter(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "IP Address not whitelisted");
        }
    }    
}