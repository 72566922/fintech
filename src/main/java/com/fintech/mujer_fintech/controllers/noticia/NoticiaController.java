package com.fintech.mujer_fintech.controllers.noticia;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fintech.mujer_fintech.models.entity.Noticia;
import com.fintech.mujer_fintech.models.service.noticia.NoticiaService;

@RestController
@RequestMapping("/api/noticias")
public class NoticiaController {
    
    @Autowired
    private NoticiaService noticiaService;

    @GetMapping
    public List<Noticia> getAllNoticias() {
        return noticiaService.getAllNoticias();
    }
}
