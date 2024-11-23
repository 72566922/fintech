package com.fintech.mujer_fintech.models.service.publication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Comentario;
import com.fintech.mujer_fintech.models.repository.ComentarioRepository;

@Service
public class ComentarioService {

    @Autowired
    private ComentarioRepository comentarioRepository;

    // Obtener todos los comentarios
    public List<Comentario> getAllComentarios() {
        return comentarioRepository.findAll();
    }

    // Obtener comentarios por ID de publicación
    public List<Comentario> getComentariosByPublicacion(Long idPublicacion) {
        return comentarioRepository.findByPublicacionId(idPublicacion);
    }

    // Guardar un nuevo comentario
    public Comentario saveComentario(Comentario comentario) {
        return comentarioRepository.save(comentario);
    }

}
