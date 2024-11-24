package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;

@Entity
@Table(name = "curso")
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    @NotNull
    @Size(min = 1, max = 255)
    private String nombre;

    @Column(nullable = false, length = 500)
    @NotNull
    @Size(min = 1, max = 500)
    private String descripcion;

    @PositiveOrZero
    private Double precio;

    @Column(length = 50)
    private String type;

    @Enumerated(EnumType.STRING)
    private Modalidad modalidad;


    public enum Modalidad {
        PRESENCIAL, VIRTUAL
    }

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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Modalidad getModalidad() {
        return modalidad;
    }

    public void setModalidad(Modalidad modalidad) {
        this.modalidad = modalidad;
    }

    // Getters, setters, equals, hashCode, toString
}
