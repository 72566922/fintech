package com.fintech.mujer_fintech.models.service.formacion_concurso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.FormacionConcurso;
import com.fintech.mujer_fintech.models.repository.FormacionConcursoRepository;

@Service
public class FormacionConcursoService {
    
    @Autowired
    private FormacionConcursoRepository formacionConcursoRepository;

    public List<FormacionConcurso> getAllFormacionConcursos(){
        return formacionConcursoRepository.findAll();
    }
}
