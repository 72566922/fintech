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


    @GetMapping("/estudios")
    public String mostrarEstudios() {
        return "/Secciones/estudios";
    }

    @GetMapping("/comunidad")
    public String mostrarComunidad() {
        return "/Secciones/comunidad";
    }
    @GetMapping("/aceleradoras")
    public String mostrarAceleradoras() {
        return "/Secciones/aceleradoras";
    }

}
