package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "event_userrole_ticket")
public class EventUserRoleTicket {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "event_user_role_id", nullable = false)
    private EventUserRole eventUserRole;

    @ManyToOne
    @JoinColumn(name = "ticket", nullable = false)
    private Ticket ticket;

    @Column(nullable = false)
    private boolean enabled;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public EventUserRole getEventUserRole() {
        return eventUserRole;
    }

    public void setEventUserRole(EventUserRole eventUserRole) {
        this.eventUserRole = eventUserRole;
    }

    public Ticket getTicket() {
        return ticket;
    }

    public void setTicket(Ticket ticket) {
        this.ticket = ticket;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
