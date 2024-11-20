package com.fintech.mujer_fintech.models.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Event;
import com.fintech.mujer_fintech.models.repository.EventRepository;

@Service
public class EventService {
    
    @Autowired
    private EventRepository eventRepository;

    public List<Event> getAllEvents(){
        return eventRepository.findAll();
    }

    public List<Event> getEventsByTypeId(Long typeId){
        return eventRepository.findByType_Id(typeId);
    }
}
