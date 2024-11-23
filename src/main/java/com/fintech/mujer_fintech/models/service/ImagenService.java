package com.fintech.mujer_fintech.models.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

import jakarta.annotation.PostConstruct;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fintech.mujer_fintech.models.entity.Imagen;
import com.fintech.mujer_fintech.models.repository.ImagenRepository;

@Service
public class ImagenService {

    @Value("${ruta.imagenes}")
    private String rutaImagenes;

    private final ImagenRepository imagenRepository;

    public ImagenService(ImagenRepository imagenRepository) {
        this.imagenRepository = imagenRepository;
    }

    /**
     * Valida que la propiedad `ruta.imagenes` esté configurada.
     */
    @PostConstruct
    public void validarRutaImagenes() {
        if (rutaImagenes == null || rutaImagenes.isEmpty()) {
            throw new IllegalStateException("La ruta para almacenar imágenes no está configurada correctamente.");
        }
    }

    /**
     * Guarda una imagen en el sistema de archivos y en la base de datos.
     *
     * @param archivo MultipartFile que representa la imagen a subir.
     * @return Objeto Imagen guardado en la base de datos.
     * @throws IOException Si ocurre un error al guardar la imagen.
     */
    public Imagen guardarImagen(MultipartFile archivo) throws IOException {
        if (archivo.isEmpty()) {
            throw new IllegalArgumentException("No se ha enviado ningún archivo.");
        }

        Path directorio = Paths.get(rutaImagenes);
        if (!Files.exists(directorio)) {
            Files.createDirectories(directorio);
        }

        String nombreArchivo = UUID.randomUUID().toString() + "_" + archivo.getOriginalFilename();
        Path rutaCompleta = directorio.resolve(nombreArchivo);
        Files.write(rutaCompleta, archivo.getBytes());

        Imagen imagen = new Imagen();
        imagen.setNombre(nombreArchivo);
        imagen.setUrl("/img/publicaciones/" + nombreArchivo);

        return imagenRepository.save(imagen);
    }

    /**
     * Elimina una imagen del sistema de archivos y de la base de datos.
     *
     * @param id ID de la imagen a eliminar.
     * @throws IOException Si ocurre un error al eliminar la imagen.
     */
    public void eliminarImagen(Long id) throws IOException {
        Imagen imagen = imagenRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Imagen no encontrada con ID: " + id));
        
        Path rutaCompleta = Paths.get(rutaImagenes).resolve(imagen.getNombre());
        Files.deleteIfExists(rutaCompleta);

        imagenRepository.delete(imagen);
    }

    /**
     * Lista todas las imágenes almacenadas en la base de datos.
     *
     * @return Lista de todas las imágenes.
     */
    public List<Imagen> listarTodasLasImagenes() {
        return imagenRepository.findAll();
    }

    /**
     * Valida la extensión del archivo subido.
     *
     * @param archivo MultipartFile que representa la imagen a validar.
     * @throws IllegalArgumentException Si el archivo no tiene una extensión válida.
     */
    public void validarExtension(MultipartFile archivo) {
        String nombreArchivo = archivo.getOriginalFilename();
        if (nombreArchivo == null || !nombreArchivo.matches(".*\\.(jpg|jpeg|png|gif|PNG)$")) {
            throw new IllegalArgumentException("El archivo debe ser una imagen con extensión .jpg, .jpeg, .png o .gif");
        }
    }
}
