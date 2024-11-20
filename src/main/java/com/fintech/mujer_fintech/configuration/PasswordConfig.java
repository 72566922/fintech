package com.fintech.mujer_fintech.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class PasswordConfig {

    @Bean(name = "customPasswordEncoder") // Cambia el nombre del bean aquí
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
