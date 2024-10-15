package com.bankmega.ccbmagent.document.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.bankmega.ccbmagent.document.services.GioService;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private final GioService gioService;

    public SecurityConfig(GioService gioService) {
        this.gioService = gioService;
    }

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
          .authorizeHttpRequests(authorize -> authorize
                .requestMatchers("/ccbm/document/**").permitAll() // Allow unrestricted access for specific endpoints
                //ini di allow dulu yaa selama dev
                .requestMatchers("/**").permitAll() // Allow unrestricted access for specific endpoints
                .anyRequest().authenticated() // Require authentication for all other requests
          )
          .csrf(csrf -> csrf.disable()) // Disable CSRF for simplicity; enable in production
          .formLogin(form -> form.disable()) // Default form login setup
          .httpBasic(httpBasic -> httpBasic.disable());
          // .addFilterBefore(new IpBasedAccessFilter(ipService), UsernamePasswordAuthenticationFilter.class);
      
        return http.build();
    }
}
