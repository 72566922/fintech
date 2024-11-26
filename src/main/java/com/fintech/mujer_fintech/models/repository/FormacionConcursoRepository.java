package com.fintech.mujer_fintech.models.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.FormacionConcurso;

@Repository
public interface FormacionConcursoRepository extends JpaRepository<FormacionConcurso, Long>{
    
}
