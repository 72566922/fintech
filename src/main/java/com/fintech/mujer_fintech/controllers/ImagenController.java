package com.fintech.mujer_fintech.controllers;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fintech.mujer_fintech.models.entity.Imagen;
import com.fintech.mujer_fintech.models.service.ImagenService;

@RestController
@RequestMapping("/api/imagenes")
public class ImagenController {

    private final ImagenService imagenService;

    public ImagenController(ImagenService imagenService) {
        this.imagenService = imagenService;
    }

    @Autowired
    private ImagenService imagenService2;

    @GetMapping
    public List<Imagen> getAllImagenes(){
        return imagenService2.listarTodasLasImagenes();
    }

    @PostMapping("/subir")
    public ResponseEntity<?> subirImagen(@RequestParam("imagen") MultipartFile archivo) {
        try {
            // Validar la extensión del archivo usando tanto el tipo MIME como la extensión
            String tipoArchivo = archivo.getContentType();
            if (tipoArchivo == null || 
                (!tipoArchivo.equals("image/jpeg") && !tipoArchivo.equals("image/png") && !tipoArchivo.equals("image/gif"))) {
                return ResponseEntity.badRequest()
                        .body("Solo se permiten archivos de imagen (.jpg, .jpeg, .png, .gif)");
            }

            // Validar también la extensión del archivo
            imagenService.validarExtension(archivo);

            // Delegar la lógica al servicio
            Imagen imagen = imagenService.guardarImagen(archivo);
            
            // Crear una respuesta con los detalles de la imagen
            return ResponseEntity.ok(new ImageResponse(imagen.getId(), imagen.getUrl()));
            
        } catch (IllegalArgumentException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (IOException e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("Error al subir la imagen: " + e.getMessage());
        }
    }

    // Clase de respuesta con JSON
    public static class ImageResponse {
        private Long id;
        private String url;

        public ImageResponse(Long id, String url) {
            this.id = id;
            this.url = url;
        }

        public Long getId() {
            return id;
        }

        public String getUrl() {
            return url;
        }
    }
}
