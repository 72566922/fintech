package com.fintech.mujer_fintech.controllers.curso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.Curso;
import com.fintech.mujer_fintech.models.service.curso.CursoService;

@RestController
@RequestMapping("/api/cursos")
public class CursoController {
    
    @Autowired
    private CursoService cursoService;

    @GetMapping
    public List<Curso> getAllCursos(){
        return cursoService.getAllCursos();
    }
}
