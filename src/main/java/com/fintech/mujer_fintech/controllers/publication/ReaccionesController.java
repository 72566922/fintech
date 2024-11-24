package com.fintech.mujer_fintech.controllers.publication;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.ReaccionUser;
import com.fintech.mujer_fintech.models.service.publication.ReaccionService;

@RestController
@RequestMapping("/api/reacciones")
public class ReaccionesController {

    @Autowired
    private ReaccionService reaccionService;

    @GetMapping
    public List<ReaccionUser> getReaccionUsers() {
        return reaccionService.getAllReaccionUsers();
    }

    // Endpoint para crear una nueva reacción
    @PostMapping("/save")
    public ReaccionUser saveReaccionUser(@RequestBody ReaccionUser reaccion) {
        return reaccionService.saveReaccionUser(reaccion);
    }

    // Endpoint para eliminar una reacción
    @DeleteMapping("/{id}")
    public void deleteReaccionUser(@PathVariable Long id) {
        reaccionService.deleteReaccionUser(id);
    }
}

