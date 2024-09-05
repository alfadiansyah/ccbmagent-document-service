package com.bankmega.ccbmagent.document.config;

import java.io.IOException;
import java.net.SocketException;

import org.springframework.web.filter.OncePerRequestFilter;

import com.bankmega.ccbmagent.document.services.IpBasedAccessService;
import com.bankmega.ccbmagent.document.util.IpBasedAccessUtil;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
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
        String remoteIp = getClientIp(request);
        System.out.println("Original IP: " + remoteIp); // Log the original IP for debugging

        // Handle localhost addresses (IPv4 and IPv6)
        if ("0:0:0:0:0:0:0:1".equals(remoteIp) || "127.0.0.1".equals(remoteIp)) {
            try {
                // Replace with the IP of a specific network interface, e.g., "wlp3s0"
                remoteIp = IpBasedAccessUtil.getLocalIpAddressForInterface("wlp3s0");
            } catch (SocketException e) {
                e.printStackTrace();
                remoteIp = "unknown";
            }
        }

        System.out.println("Effective IP: " + remoteIp); // Log the effective IP address for debugging

        if (ipService.isIpWhitelisted(remoteIp)) {
            filterChain.doFilter(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_FORBIDDEN, "IP Address not whitelisted");
        }
    }

    private String getClientIp(HttpServletRequest request) {
        String ipAddress = request.getHeader("X-Forwarded-For");
        if (ipAddress == null || ipAddress.isEmpty()) {
            ipAddress = request.getHeader("X-Real-IP");
        }
        if (ipAddress == null || ipAddress.isEmpty()) {
            ipAddress = request.getRemoteAddr();
        }
        // X-Forwarded-For can contain multiple IPs, the first one is usually the client IP
        if (ipAddress != null && ipAddress.contains(",")) {
            ipAddress = ipAddress.split(",")[0].trim();
        }
        return ipAddress;
    }
}

// public class IpBasedAccessFilter extends OncePerRequestFilter {

//     private final IpBasedAccessService ipService;

//     public IpBasedAccessFilter(IpBasedAccessService ipService) {
//         this.ipService = ipService;
//     }

//     @Override
//     protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
//             throws ServletException, IOException {
//         String remoteIp = request.getRemoteAddr();
//         System.out.println("Original IP: " + remoteIp); // Log the original IP for debugging

//         // Handle localhost addresses (IPv4 and IPv6)
//         if ("0:0:0:0:0:0:0:1".equals(remoteIp) || "127.0.0.1".equals(remoteIp)) {
//             try {
//                 // Replace with the IP of a specific network interface, e.g., "wlp3s0"
//                 remoteIp = IpBasedAccessUtil.getLocalIpAddressForInterface("wlp3s0");
//             } catch (SocketException e) {
//                 e.printStackTrace();
//                 remoteIp = "unknown";
//             }
//         }

//         System.out.println("Effective IP: " + remoteIp); // Log the effective IP address for debugging

//         if (ipService.isIpWhitelisted(remoteIp)) {
//             filterChain.doFilter(request, response);
//         } else {
//             response.sendError(HttpServletResponse.SC_FORBIDDEN, "IP Address not whitelisted");
//         }
//     }    
// }
