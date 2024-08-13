package com.bankmega.ccbmagent.document.config;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;

@Configuration
public class OpenAPIDocumentationConfig {

  @Bean
  public OpenAPI customOpenAPI() {

    Info info = new Info().title("CCBM Agent Document Service")
        .version("v1.0.0")
        .description("Dokumentasi endpoint UI untuk Service Document CCBM");
    SecurityScheme securityScheme = new SecurityScheme()
        .type(SecurityScheme.Type.APIKEY)
        .in(SecurityScheme.In.HEADER)
        .name("username")
        .description("Enter username");
    Components components = new Components().addSecuritySchemes("username", securityScheme);
    return new OpenAPI().components(components).security(List.of(new SecurityRequirement().addList("username")))
        .info(info);
  }

}

