package com.fintech.mujer_fintech.controllers.event;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.Event;
import com.fintech.mujer_fintech.models.entity.EventUserRole;
import com.fintech.mujer_fintech.models.entity.EventUserRoleTicket;
import com.fintech.mujer_fintech.models.entity.TypeEvent;
import com.fintech.mujer_fintech.models.service.event.EventService;
import com.fintech.mujer_fintech.models.service.event.EventUserRoleService;
import com.fintech.mujer_fintech.models.service.event.EventUserRoleTicketService;
import com.fintech.mujer_fintech.models.service.event.TypeEventService;

@RestController
@RequestMapping("/api/events")
public class EventController {

    @Autowired
    private EventService eventService;

    @GetMapping
    public List<Event> getAllEvents() {
        return eventService.getAllEvents();
    }

    @GetMapping("/by/{typeId}")
    public ResponseEntity<List<Event>> getEventsByTypeId(@PathVariable Long typeId) {
        List<Event> events = eventService.getEventsByTypeId(typeId);

        if (events.isEmpty()) {
            return ResponseEntity.noContent().build(); // Si no hay eventos, regresa 204 No Content
        }

        return ResponseEntity.ok(events); // Si hay eventos, regresa 200 OK con la lista
    }

    @Autowired
    private TypeEventService typeEventService;

    @GetMapping("/type")
    public List<TypeEvent> getAllTypeEvents() {
        return typeEventService.getAllTypeEvents();
    }

    @Autowired
    private EventUserRoleService eventUserRoleService;

    @GetMapping("/user")
    public List<EventUserRole> getAllEventUserRoles() {
        return eventUserRoleService.getAllEventUserRoleRepositories();
    }

    @Autowired
    private EventUserRoleTicketService eventUserRoleTicketService;

    @GetMapping("/user/ticket")
    public List<EventUserRoleTicket> getAEventUserRoleTickets() {
        return eventUserRoleTicketService.getAllEventUserRoleTickets();
    }
}
