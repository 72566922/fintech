package com.fintech.mujer_fintech.models.entity;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "curso")
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String iniciativa;
    private String organizador;
    private Double precio;

    @Column(name = "fecha_inicio")
    private LocalDate fechaInicio;

    private String estado;
    private String url;

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


    public String getIniciativa() {
        return iniciativa;
    }


    public void setIniciativa(String iniciativa) {
        this.iniciativa = iniciativa;
    }


    public String getOrganizador() {
        return organizador;
    }


    public void setOrganizador(String organizador) {
        this.organizador = organizador;
    }

    public Double getPrecio() {
        return precio;
    }


    public void setPrecio(Double precio) {
        this.precio = precio;
    }


    public LocalDate getFechaInicio() {
        return fechaInicio;
    }


    public void setFechaInicio(LocalDate fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public String getEstado() {
        return estado;
    }


    public void setEstado(String estado) {
        this.estado = estado;
    }


    public String getUrl() {
        return url;
    }


    public void setUrl(String url) {
        this.url = url;
    }


    public Modalidad getModalidad() {
        return modalidad;
    }


    public void setModalidad(Modalidad modalidad) {
        this.modalidad = modalidad;
    }

    
}
