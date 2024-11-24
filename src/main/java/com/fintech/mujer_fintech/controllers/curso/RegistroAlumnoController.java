package com.fintech.mujer_fintech.controllers.curso;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.fintech.mujer_fintech.models.entity.RegistroAlumno;
import com.fintech.mujer_fintech.models.service.curso.RegistroAlumnoService;

import java.util.List;

@RestController
@RequestMapping("/api/registros")
public class RegistroAlumnoController {

    @Autowired
    private RegistroAlumnoService registroAlumnoService;

    @GetMapping
    public List<RegistroAlumno> getAllRegistroAlumnos() {
        return registroAlumnoService.getAllRegistroAlumnos();
    }

    // Endpoint para guardar un nuevo RegistroAlumno
    @PostMapping("/save")
    public RegistroAlumno saveRegistroAlumno(@RequestBody RegistroAlumno registroAlumno) {
        return registroAlumnoService.saveRegistroAlumno(registroAlumno);
    }
}
