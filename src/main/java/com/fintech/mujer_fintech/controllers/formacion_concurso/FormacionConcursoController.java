package com.fintech.mujer_fintech.controllers.formacion_concurso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.FormacionConcurso;
import com.fintech.mujer_fintech.models.service.formacion_concurso.FormacionConcursoService;

@RestController
@RequestMapping("/api/formacion-concursos")
public class FormacionConcursoController {
    
    @Autowired
    private FormacionConcursoService formacionConcursoService;

    @GetMapping
    public List<FormacionConcurso> getAllFormacionConcursos(){
        return formacionConcursoService.getAllFormacionConcursos();
    }
}
