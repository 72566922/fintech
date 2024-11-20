package com.fintech.mujer_fintech.models.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.fintech.mujer_fintech.models.entity.Event;

@Repository
public interface EventRepository extends JpaRepository<Event, Long>{
    List<Event> findByType_Id(Long id);
}
