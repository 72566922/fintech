package com.fintech.mujer_fintech.models.service.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.EventUserRoleTicket;
import com.fintech.mujer_fintech.models.repository.EventUserRoleTicketRepository;

@Service
public class EventUserRoleTicketService {
    
    @Autowired
    private EventUserRoleTicketRepository eventUserRoleTicketRepository;

    public List<EventUserRoleTicket> getAllEventUserRoleTickets(){
        return eventUserRoleTicketRepository.findAll();
    }
}
