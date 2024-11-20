// URL de la API de eventos
const apiUrl = "http://localhost:8080/api/noticias";

// Lista de extensiones de imagen aceptadas
const imageExtensions = [".png", ".jpeg", ".jpg", ".webp"];

// Función para obtener los eventos desde la API
async function fetchNoticias() {
    try {
        // Realiza una solicitud GET a la API
        const response = await fetch(apiUrl);

        // Verifica si la respuesta es exitosa
        if (!response.ok) {
            throw new Error(`Error al obtener noticias: ${response.statusText}`);
        }

        // Convierte la respuesta a JSON
        const noticias = await response.json();

        // Llama a la función para renderizar los noticias
        renderNoticias(noticias);
    } catch (error) {
        // Maneja errores y los imprime en consola
        console.error("Hubo un problema al obtener los noticias:", error);
    }
}

// Función para verificar qué extensión de imagen está disponible
async function fetchImageWithFallback(basePath) {
    for (const ext of imageExtensions) {
        const url = `${basePath}${ext}`;
        try {
            // Realiza una solicitud HEAD para verificar si la imagen existe
            const response = await fetch(url, { method: "HEAD" });
            if (response.ok) {
                return url; // Retorna la URL válida
            }
        } catch (error) {
            // Silencia los errores de extensiones no encontradas
        }
    }
    // Retorna una imagen por defecto si no se encuentra ninguna
    return "http://localhost:8080/img/default-event.png";
}

// Función para renderizar los noticias en el DOM
async function renderNoticias(noticias) {
    // Selecciona el contenedor donde se mostrarán los noticias
    const noticiasContainer = document.querySelector(".news-container");

    if (!noticiasContainer) {
        console.warn("No se encontró el contenedor para los noticias en el DOM.");
        return;
    }

    // Limpia el contenido previo del contenedor
    noticiasContainer.innerHTML = "";

    // Itera sobre los noticias y genera el HTML correspondiente
    for (const noticia of noticias) {
        // Genera la base URL de la imagen
        const basePath = `/img/noticias/${noticia.title.toLowerCase().replace(/\s+/g, '-')}`;

        // Verifica cuál extensión de imagen está disponible
        const imageUrl = await fetchImageWithFallback(basePath);

        // Crea un elemento div con la clase "event-item"
        const noticiaItem = document.createElement("div");
        noticiaItem.className = "news-card";

        // Estructura HTML para cada evento, incluyendo la imagen
        noticiaItem.innerHTML = `
      <img src="${imageUrl}" alt="${noticia.title}">
      <div class="content">
          <h3>${noticia.title}</h3>
          <p>${noticia.resumen}</p>
          <span class="date">${noticia.date}</span>
          <a href="#" class="read-more">Leer más</a>
      </div>
    `;

        // Agrega el noticia al contenedor
        noticiasContainer.appendChild(noticiaItem);
    }
}

// Llama a la función cuando el DOM esté completamente cargado
document.addEventListener("DOMContentLoaded", fetchNoticias);
