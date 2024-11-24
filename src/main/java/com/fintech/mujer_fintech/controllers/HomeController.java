package com.fintech.mujer_fintech.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping({"/", "/inicio"})

    public String mostrarHome() {
        return "template";
    }

    @GetMapping("/eventos")
    public String mostrarEventos() {
        return "/Secciones/eventos";
    }

    @GetMapping("/concursos")
    public String mostrarEstudios() {
        return "/Secciones/concursos";
    }

    @GetMapping("/cursos")
    public String mostrarCursos() {
        return "/Secciones/cursos";
    }

    @GetMapping("/aceleradoras")
    public String mostrarAceleradoras() {
        return "/Secciones/aceleradoras";
    }

    @GetMapping("/publicaciones")
    public String mostrarPublicaciones() {
        return "/Secciones/publicaciones";
    }

    @GetMapping("/noticias")
    public String mostrarNoticias() {
        return "/Secciones/noticias";
    }

    @GetMapping("/imagenes")
    public String mostrarImagenes() {
        return "/Secciones/imagen";
    }

    @GetMapping("/formulario")
    public String mostrarFormulario() {
        return "/Secciones/formulario";
    }

}
