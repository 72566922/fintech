package com.fintech.mujer_fintech.models.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.ReaccionUser;

@Repository
public interface ReaccionRepository extends JpaRepository<ReaccionUser, Long> {

    @Query("SELECT r.publication.id AS publicationId, " +
            "SUM(CASE WHEN r.meGusta = true THEN 1 ELSE 0 END) AS meGustaCount, " +
            "SUM(CASE WHEN r.meEncanta = true THEN 1 ELSE 0 END) AS meEncantaCount, " +
            "SUM(CASE WHEN r.noMeGusta = true THEN 1 ELSE 0 END) AS noMeGustaCount " +
            "FROM ReaccionUser r GROUP BY r.publication.id")
    List<Object[]> getReactionSummary();


    // Contar reacciones de tipo 'me gusta' para una publicación
    int countByPublicationIdAndMeGustaTrue(Long publicationId);

    // Contar reacciones de tipo 'me encanta' para una publicación
    int countByPublicationIdAndMeEncantaTrue(Long publicationId);

    // Contar reacciones de tipo 'no me gusta' para una publicación
    int countByPublicationIdAndNoMeGustaTrue(Long publicationId);
}
