package com.fintech.mujer_fintech.controllers.publication;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fintech.mujer_fintech.models.entity.Publication;
import com.fintech.mujer_fintech.models.entity.ReaccionUser;
import com.fintech.mujer_fintech.models.service.publication.PublicationService;

@RestController
@RequestMapping("/api/publications")
public class PublicationController {

    @Autowired
    private PublicationService publicationService;

    // Endpoint para obtener todas las publicaciones
    @GetMapping
    public ResponseEntity<List<Publication>> getPublicaciones() {
        List<Publication> publicaciones = publicationService.getAlPublicaciones();
        return new ResponseEntity<>(publicaciones, HttpStatus.OK);
    }

    // Endpoint para crear una nueva publicación
    @PostMapping("/save")
    public ResponseEntity<Publication> createPublication(@RequestBody Publication publication) {
        Publication savedPublication = publicationService.savePublication(publication);
        return new ResponseEntity<>(savedPublication, HttpStatus.CREATED);
    }

    // Endpoint para obtener el resumen dinámico de reacciones por publicación
    @GetMapping("/reactions-summary")
    public ResponseEntity<List<Map<String, Object>>> getPublicationsWithReactionsSummary() {
        List<Map<String, Object>> response = publicationService.getPublicationsWithReactionsSummary();
        return new ResponseEntity<>(response, HttpStatus.OK);
    }

    // Endpoint para agregar una reacción a una publicación
    @PostMapping("/{publicationId}/react")
    public ResponseEntity<Void> addReaction(@PathVariable Long publicationId, @RequestBody ReaccionUser reaccion) {
        publicationService.addReaction(publicationId, reaccion);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}
