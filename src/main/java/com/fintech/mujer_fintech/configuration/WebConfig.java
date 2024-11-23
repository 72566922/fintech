package com.fintech.mujer_fintech.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/img/publicaciones/**")
                .addResourceLocations("file:" + "C:/Users/Morales/Desktop/fintechCertus/mujer_fintech/src/main/resources/static/img/publicaciones/");
    }
}


