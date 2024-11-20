package com.fintech.mujer_fintech.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.HttpBasicConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable()) // Desactiva CSRF para pruebas (no recomendado para producción)
                .authorizeHttpRequests(auth -> auth
                                .anyRequest().permitAll() // Permite acceso sin autenticación a todas las rutas
                )
                .httpBasic(withDefaults()); // Habilita autenticación básica

        return http.build(); // Construye la cadena de filtros
    }

    private Customizer<HttpBasicConfigurer<HttpSecurity>> withDefaults() {
        return Customizer.withDefaults(); // Cambia a esto para evitar la excepción
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
