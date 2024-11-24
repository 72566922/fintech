package com.fintech.mujer_fintech.models.service.curso;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.RegistroAlumno;
import com.fintech.mujer_fintech.models.repository.RegistroAlumnoRepository;

import java.util.List;

@Service
public class RegistroAlumnoService {

    @Autowired
    private RegistroAlumnoRepository registroAlumnoRepository;

    public List<RegistroAlumno> getAllRegistroAlumnos() {
        return registroAlumnoRepository.findAll();
    }

    // Método para guardar un RegistroAlumno
    public RegistroAlumno saveRegistroAlumno(RegistroAlumno registroAlumno) {
        return registroAlumnoRepository.save(registroAlumno);
    }
}
