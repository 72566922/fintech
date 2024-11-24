package com.fintech.mujer_fintech.models.service.curso;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Alumno;
import com.fintech.mujer_fintech.models.repository.AlumnoRepository;

@Service
public class AlumnoService {

    @Autowired
    private AlumnoRepository alumnoRepository;

    public Alumno saveAlumno(Alumno alumno) {
        return alumnoRepository.save(alumno);  // Guarda el alumno en la base de datos
    }

    public List<Alumno> getAllAlumnos() {
        return alumnoRepository.findAll();  // Obtiene todos los alumnos
    }

    public Alumno getAlumnoByDni(String dni) {
        return alumnoRepository.findByDni(dni);  // Busca un alumno por su DNI
    }
}
