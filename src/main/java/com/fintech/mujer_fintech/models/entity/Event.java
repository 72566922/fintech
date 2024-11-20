package com.fintech.mujer_fintech.models.entity;

import jakarta.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
@Table(name = "events")
public class Event {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String title; // Título del evento

    @Column(nullable = false)
    private String description; // Descripción del evento

    @ManyToOne
    @JoinColumn(name = "categoria_event", nullable = false)
    private TypeEvent type; // Relación con CategoriaEvent

    @ManyToOne
    @JoinColumn(name = "user_role", nullable = false)
    private UserRole userRoleOrganizador;

    

    @Column(nullable = false)
    private String mode;  // Tipo de evento (concierto, conferencia, etc.)

    @Column(nullable = false)
    private LocalDate date; // Fecha del evento

    @Column(nullable = false)
    private LocalTime timeStart; // Hora de inicio del evento

    @Column(nullable = false)
    private LocalTime timeEnd; // Hora de finalización del evento

    @Column(nullable = false)
    private double price; // Precio del evento

    @Column(nullable = false)
    private int capacity; // Capacidad total del evento

    @Column(nullable = false)
    private int remainingCapacity; // Plazas disponibles

    @Column(nullable = false)
    private boolean enabled; // Indica si el evento está habilitado

    public Event() {
    }

    public Event(String title, String description, TypeEvent type, String mode, LocalDate date,
                 LocalTime timeStart, LocalTime timeEnd, double price, int capacity, boolean enabled, UserRole userRoleOrganizador) {
        this.title = title;
        this.description = description;
        this.mode = mode;
        this.type = type;
        this.date = date;
        this.timeStart = timeStart;
        this.timeEnd = timeEnd;
        setPrice(price);
        setCapacity(capacity);
        this.remainingCapacity = capacity; // Inicializa remainingCapacity a la capacidad total
        this.enabled = enabled;
        this.userRoleOrganizador = userRoleOrganizador;
    }

    // Getters y Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public TypeEvent getType() {
        return type;
    }

    public void setType(TypeEvent type) {
        this.type = type;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getTimeStart() {
        return timeStart;
    }

    public void setTimeStart(LocalTime timeStart) {
        this.timeStart = timeStart;
    }

    public LocalTime getTimeEnd() {
        return timeEnd;
    }

    public void setTimeEnd(LocalTime timeEnd) {
        this.timeEnd = timeEnd;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        if (price < 0) {
            throw new IllegalArgumentException("El precio no puede ser negativo");
        }
        this.price = price;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        if (capacity < 0) {
            throw new IllegalArgumentException("La capacidad no puede ser negativa");
        }
        this.capacity = capacity;
    }

    public UserRole getUserRoleOrganizador() {
        return userRoleOrganizador;
    }

    public void setUserRoleOrganizador(UserRole userRoleOrganizador) {
        this.userRoleOrganizador = userRoleOrganizador;
    }

    public int getRemainingCapacity() {
        return remainingCapacity;
    }

    public void setRemainingCapacity(int remainingCapacity) {
        if (remainingCapacity < 0 || remainingCapacity > this.capacity) {
            throw new IllegalArgumentException("La capacidad restante debe estar entre 0 y la capacidad total");
        }
        this.remainingCapacity = remainingCapacity;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public boolean isFull() {
        return remainingCapacity <= 0;
    }

    @Override
    public String toString() {
        return "Event{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", mode=" + mode +
                ", type='" + type + '\'' +
                ", date=" + date +
                ", timeStart=" + timeStart +
                ", timeEnd=" + timeEnd +
                ", price=" + price +
                ", capacity=" + capacity +
                ", remainingCapacity=" + remainingCapacity +
                ", enabled=" + enabled +
                ", organizador=" + userRoleOrganizador +
                '}';
    }
}
