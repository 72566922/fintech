package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "reacciones")
public class ReaccionUser {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne
    @JoinColumn(name = "publication_id", nullable = false)
    private Publication publication;
    
    private boolean meGusta;
    private boolean noMeGusta;
    private boolean meEncanta;


    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public Publication getPublication() {
        return publication;
    }
    public void setPublication(Publication publication) {
        this.publication = publication;
    }
    public boolean isMeGusta() {
        return meGusta;
    }
    public void setMeGusta(boolean meGusta) {
        this.meGusta = meGusta;
    }
    public boolean isNoMeGusta() {
        return noMeGusta;
    }
    public void setNoMeGusta(boolean noMeGusta) {
        this.noMeGusta = noMeGusta;
    }
    public boolean isMeEncanta() {
        return meEncanta;
    }
    public void setMeEncanta(boolean meEncanta) {
        this.meEncanta = meEncanta;
    }
}
