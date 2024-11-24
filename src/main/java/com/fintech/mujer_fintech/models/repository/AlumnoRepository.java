package com.fintech.mujer_fintech.models.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.Alumno;

@Repository
public interface AlumnoRepository extends JpaRepository<Alumno, Long> {
    
    // Método para buscar por DNI
    Alumno findByDni(String dni);
}
