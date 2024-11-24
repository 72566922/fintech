package com.fintech.mujer_fintech.controllers.curso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.Alumno;
import com.fintech.mujer_fintech.models.service.curso.AlumnoService;

@RestController
@RequestMapping("/api/alumnos")
public class AlumnoController {

    @Autowired
    private AlumnoService alumnoService;

    @GetMapping
    public List<Alumno> getAllAlumnos() {
        return alumnoService.getAllAlumnos();
    }

    // Endpoint para buscar un alumno por DNI
    @GetMapping("/dni/{dni}")
    public Alumno getAlumnoByDni(@PathVariable String dni) {
        return alumnoService.getAlumnoByDni(dni);
    }

    // Endpoint para registrar un nuevo alumno
    @PostMapping("/save")
    public ResponseEntity<Alumno> createAlumno(@RequestBody Alumno alumno) {
        try {
            Alumno nuevoAlumno = alumnoService.saveAlumno(alumno);
            return new ResponseEntity<>(nuevoAlumno, HttpStatus.CREATED);
        } catch (Exception e) {
            return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
    }
}
