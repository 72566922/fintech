package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "alumno_curso")
public class RegistroAlumno {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "alumno_id", nullable = false)
    private Alumno alumno;

    @ManyToOne
    @JoinColumn(name = "curso_id", nullable = false)
    private Curso curso;

    // Constructor vacío
    public RegistroAlumno() {
    }

    // Constructor con parámetros
    public RegistroAlumno(Alumno alumno, Curso curso) {
        this.alumno = alumno;
        this.curso = curso;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Alumno getAlumno() {
        return alumno;
    }

    public void setAlumno(Alumno alumno) {
        this.alumno = alumno;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }

    // Método toString (opcional, útil para depuración)
    @Override
    public String toString() {
        return "RegistroAlumno{" +
               "id=" + id +
               ", alumno=" + alumno +
               ", curso=" + curso +
               '}';
    }
}
