package com.fintech.mujer_fintech.controllers.publication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.fintech.mujer_fintech.models.entity.Publication;
import com.fintech.mujer_fintech.models.service.publication.PublicationService;

@RestController
@RequestMapping("/api/publications")
public class PublicationController {

    @Autowired
    private PublicationService publicationService;

    // Endpoint para obtener todas las publicaciones
    @GetMapping
    public List<Publication> getPublicaciones(){
        return publicationService.getAlPublicaciones();
    }

    // Endpoint para crear una nueva publicación
    @PostMapping("/save")
    public ResponseEntity<Publication> createPublication(@RequestBody Publication publication){
        // Llama al servicio para guardar la publicación
        Publication savedPublication = publicationService.savePublication(publication);
        return new ResponseEntity<>(savedPublication, HttpStatus.CREATED); // Retorna el objeto guardado con el status 201
    }
}
