package com.fintech.mujer_fintech.models.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.Comentario;

@Repository
public interface ComentarioRepository extends JpaRepository<Comentario, Long> {

    // Método para obtener comentarios por ID de publicación
    List<Comentario> findByPublicacionId(Long idPublicacion);
}

