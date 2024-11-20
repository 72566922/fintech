package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import java.time.LocalDate;

@Entity
@Table(name = "noticias")
public class Noticia {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 255)
    @NotBlank(message = "El título no puede estar vacío")
    @Size(max = 255, message = "El título no puede superar los 255 caracteres")
    private String title;

    @Column(nullable = false, length = 255)
    @NotBlank(message = "El responsable no puede estar vacío")
    @Size(max = 255, message = "El responsable no puede superar los 255 caracteres")
    private String responsable;

    @Column(nullable = false, length = 255)
    @Email(message = "El correo debe tener un formato válido")
    @NotBlank(message = "El correo no puede estar vacío")
    @Size(max = 255, message = "El correo no puede superar los 255 caracteres")
    private String correo;

    @Lob
    @Column(nullable = false)
    @NotBlank(message = "El resumen no puede estar vacío")
    @Size(max = 10000, message = "El resumen no puede superar los 10,000 caracteres")
    private String resumen;

    @Column(nullable = false)
    @PastOrPresent(message = "La fecha no puede estar en el futuro")
    private LocalDate date;

    @Column(nullable = false, length = 255)
    @NotBlank(message = "La URL no puede estar vacía")
    @Size(max = 255, message = "La URL no puede superar los 255 caracteres")
    private String url;

    // Constructor por defecto
    public Noticia() {}

    // Método de pre-persistencia para inicializar la fecha
    @PrePersist
    public void prePersist() {
        if (this.date == null) {
            this.date = LocalDate.now(); // Asignar la fecha actual si no se establece
        }
    }

    // Getters y Setters
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

    public String getResponsable() {
        return responsable;
    }

    public void setResponsable(String responsable) {
        this.responsable = responsable;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getResumen() {
        return resumen;
    }

    public void setResumen(String resumen) {
        this.resumen = resumen;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
