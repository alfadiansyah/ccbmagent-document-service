package com.bankmega.ccbmagent.document.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

import com.bankmega.ccbmagent.document.services.IpBasedAccessService;

@Configuration
public class SecurityConfig {

    private final IpBasedAccessService ipService;

    public SecurityConfig(IpBasedAccessService ipService) {
        this.ipService = ipService;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(authorize -> authorize
                        .requestMatchers("/ccbm/document/**").permitAll() // Allow unrestricted access for other
                        // endpoints
                        .anyRequest().authenticated() // Require authentication for all other requests
                )
                .csrf(csrf -> csrf.disable()) // Disable CSRF for simplicity; enable in production
                .formLogin(form -> form.disable()) // Default form login setup
                .httpBasic(httpBasic -> httpBasic.disable());
                // .addFilterBefore(new IpBasedAccessFilter(ipService),UsernamePasswordAuthenticationFilter.class); 

        return http.build();
    }

    
}