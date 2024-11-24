package com.fintech.mujer_fintech.models.service.curso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Curso;
import com.fintech.mujer_fintech.models.repository.CursoRepository;

@Service
public class CursoService {
    
    @Autowired
    private CursoRepository cursoRepository;

    public List<Curso> getAllCursos(){
        return cursoRepository.findAll();
    }
}
