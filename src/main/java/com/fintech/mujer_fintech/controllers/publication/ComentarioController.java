package com.fintech.mujer_fintech.controllers.publication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.Comentario;
import com.fintech.mujer_fintech.models.service.publication.ComentarioService;

@RestController
@RequestMapping("/api/comentarios")
public class ComentarioController {

    @Autowired
    private ComentarioService comentarioService;

    // Obtener todos los comentarios
    @GetMapping
    public List<Comentario> getComentarios() {
        return comentarioService.getAllComentarios();
    }

    // Obtener comentarios por ID de publicación
    @GetMapping("/publicacion/{idPublicacion}")
    public List<Comentario> getComentariosByPublicacion(@PathVariable Long idPublicacion) {
        return comentarioService.getComentariosByPublicacion(idPublicacion);
    }

    // Guardar un nuevo comentario
    @PostMapping("/save")
    public Comentario createComentario(@RequestBody Comentario comentario) {
        return comentarioService.saveComentario(comentario);
    }
}

