package com.fintech.mujer_fintech.models.service.publication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Publication;
import com.fintech.mujer_fintech.models.repository.PublicationRepository;

@Service
public class PublicationService {
    
    @Autowired
    private PublicationRepository publicationRepository;

    // Método para obtener todas las publicaciones
    public List<Publication> getAlPublicaciones(){
        return publicationRepository.findAll();
    }

    // Método para guardar una nueva publicación
    public Publication savePublication(Publication publication) {
        // Puedes agregar lógica adicional si es necesario, como validación o configuración predeterminada
        publication.setMeGusta(0);  // Inicializa el valor de meGusta
        publication.setMeEncanta(0); // Inicializa el valor de meEncanta
        publication.setNoMeGusta(0); // Inicializa el valor de noMeGusta
        return publicationRepository.save(publication); // Guarda la publicación en la base de datos
    }
}
