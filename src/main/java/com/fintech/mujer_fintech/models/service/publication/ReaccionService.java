package com.fintech.mujer_fintech.models.service.publication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.ReaccionUser;
import com.fintech.mujer_fintech.models.repository.ReaccionRepository;

@Service
public class ReaccionService {

    @Autowired
    private ReaccionRepository reaccionRepository;

    @Autowired
    private PublicationService publicationService;

    // Método para obtener todas las reacciones
    public List<ReaccionUser> getAllReaccionUsers() {
        return reaccionRepository.findAll();
    }

    // Método para guardar una nueva reacción
    public ReaccionUser saveReaccionUser(ReaccionUser reaccion) {
        // Guardar la reacción
        ReaccionUser savedReaccion = reaccionRepository.save(reaccion);

        // Actualizar las sumas de las reacciones en la publicación
        publicationService.updateReactionCounts(reaccion.getPublication().getId());

        return savedReaccion;
    }
    
    // Método para eliminar una reacción
    public void deleteReaccionUser(Long reaccionId) {
        ReaccionUser reaccion = reaccionRepository.findById(reaccionId)
                .orElseThrow(() -> new RuntimeException("Reacción no encontrada"));

        // Eliminar la reacción
        reaccionRepository.delete(reaccion);

        // Actualizar las sumas de las reacciones en la publicación
        publicationService.updateReactionCounts(reaccion.getPublication().getId());
    }
}

