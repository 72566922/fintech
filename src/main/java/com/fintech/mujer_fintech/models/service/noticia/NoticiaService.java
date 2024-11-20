package com.fintech.mujer_fintech.models.service.noticia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fintech.mujer_fintech.models.entity.Noticia;
import com.fintech.mujer_fintech.models.repository.NoticiaRepository;

@Service
public class NoticiaService {

    @Autowired
    private NoticiaRepository noticiaRepository;

    public List<Noticia> getAllNoticias(){
        return noticiaRepository.findAll();
    }
    
}
