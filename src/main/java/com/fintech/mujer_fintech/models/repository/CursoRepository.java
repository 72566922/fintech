package com.fintech.mujer_fintech.models.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.Curso;

@Repository
public interface CursoRepository extends JpaRepository<Curso, Long>{
    
}
