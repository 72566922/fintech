package com.fintech.mujer_fintech.models.service.publication;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Publication;
import com.fintech.mujer_fintech.models.entity.ReaccionUser;
import com.fintech.mujer_fintech.models.repository.PublicationRepository;
import com.fintech.mujer_fintech.models.repository.ReaccionRepository;

@Service
public class PublicationService {

    @Autowired
    private PublicationRepository publicationRepository;

    @Autowired
    private ReaccionRepository reaccionRepository;

    // Obtener todas las publicaciones
    public List<Publication> getAlPublicaciones() {
        return publicationRepository.findAll();
    }

    // Guardar una nueva publicación con los valores iniciales de reacciones
    public Publication savePublication(Publication publication) {
        publication.setMeGusta(0);
        publication.setMeEncanta(0);
        publication.setNoMeGusta(0);
        return publicationRepository.save(publication);
    }

    // Agregar una reacción a una publicación y actualizar los conteos
    public void addReaction(Long publicationId, ReaccionUser reaccion) {
        // Asociar la reacción con la publicación
        Publication publication = publicationRepository.findById(publicationId)
                .orElseThrow(() -> new RuntimeException("Publicación no encontrada"));
        reaccion.setPublication(publication);
        reaccionRepository.save(reaccion);

        // Actualizar los conteos de la publicación
        updateReactionCounts(publicationId);
    }

    // Actualizar las sumas de reacciones en una publicación
    public void updateReactionCounts(Long publicationId) {
        Publication publication = publicationRepository.findById(publicationId)
                .orElseThrow(() -> new RuntimeException("Publicación no encontrada"));

        int totalMeGusta = reaccionRepository.countByPublicationIdAndMeGustaTrue(publicationId);
        int totalMeEncanta = reaccionRepository.countByPublicationIdAndMeEncantaTrue(publicationId);
        int totalNoMeGusta = reaccionRepository.countByPublicationIdAndNoMeGustaTrue(publicationId);

        publication.setMeGusta(totalMeGusta);
        publication.setMeEncanta(totalMeEncanta);
        publication.setNoMeGusta(totalNoMeGusta);

        publicationRepository.save(publication);
    }

    // Obtener el resumen dinámico de reacciones por publicación
    public List<Map<String, Object>> getPublicationsWithReactionsSummary() {
        List<Object[]> results = reaccionRepository.getReactionSummary();
        List<Map<String, Object>> response = new ArrayList<>();

        for (Object[] result : results) {
            Map<String, Object> summary = new HashMap<>();
            summary.put("id", result[0]);
            summary.put("meGusta", result[1]);
            summary.put("meEncanta", result[2]);
            summary.put("noMeGusta", result[3]);
            response.add(summary);
        }

        return response;
    }
}
