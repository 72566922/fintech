package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@Entity
@Table(name = "publicaciones")
public class Publication {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 255)
    @NotBlank(message = "El título no puede estar vacío")
    @Size(max = 255, message = "El título no puede superar los 255 caracteres")
    private String title;

    @ManyToOne
    @JoinColumn(name = "image_id", nullable = false)
    private Imagen nameImg;

    @Column(nullable = false)
    private int meGusta = 0;   // Inicialización en 0

    @Column(nullable = false)
    private int meEncanta = 0;  // Inicialización en 0

    @Column(nullable = false)
    private int noMeGusta = 0; // Inicialización en 0

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    // Getters y Setters (opcional)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Imagen getNameImg() {
        return nameImg;
    }

    public void setNameImg(Imagen nameImg) {
        this.nameImg = nameImg;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getMeGusta() {
        return meGusta;
    }

    public void setMeGusta(int meGusta) {
        this.meGusta = meGusta;
    }

    public int getNoMeGusta() {
        return noMeGusta;
    }

    public void setNoMeGusta(int noMeGusta) {
        this.noMeGusta = noMeGusta;
    }

    public int getMeEncanta() {
        return meEncanta;
    }

    public void setMeEncanta(int meEncanta) {
        this.meEncanta = meEncanta;
    }
}

