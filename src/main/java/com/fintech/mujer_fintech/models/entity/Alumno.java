package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "alumno")
public class Alumno {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotNull
    @Size(min = 1, max = 100)
    private String nombre;

    @Column(nullable = false)
    @NotNull
    @Size(min = 1, max = 100)
    private String apellido;

    @Column(nullable = false, unique = true, length = 8)
    @NotNull
    @Pattern(regexp = "\\d{8}", message = "El DNI debe tener 8 dígitos")
    private String dni;

    @Column(nullable = false, unique = true)
    @NotNull
    @Email
    private String correo;

    @Column(nullable = false, length = 9)
    @NotNull
    @Pattern(regexp = "\\d{9}", message = "El celular debe tener 9 dígitos")
    private String celular;

    

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getCelular() {
        return celular;
    }

    public void setCelular(String celular) {
        this.celular = celular;
    }

    // Getters, setters, equals, hashCode, toString
    // (añade implementaciones para facilitar la depuración y pruebas)
}
