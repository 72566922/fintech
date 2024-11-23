// URL de la API de eventos de aceleradoras
const apiUrlAceleradoras = "http://localhost:8080/api/events/by/4";

// Lista de extensiones de imagen aceptadas
const imageExtensionsAceleradoras = [".png", ".jpeg", ".jpg", ".webp"];

// Función para obtener los eventos desde la API
// Función para obtener los eventos desde la API
async function fetchEventosAceleradoras() {
  try {
    const response = await fetch(apiUrlAceleradoras);

    if (!response.ok) {
      throw new Error(`Error al obtener eventos: ${response.statusText}`);
    }

    const eventos = await response.json();

    // Ordena los eventos por fecha (menor a mayor) y luego por hora de inicio
    eventos.sort((a, b) => {
      const dateA = new Date(a.date);
      const dateB = new Date(b.date);

      // Comparación por fecha
      if (dateA - dateB !== 0) {
        return dateA - dateB;
      }

      // Comparación por hora de inicio si las fechas son iguales
      const timeA = a.timeStart.split(":").map(Number); // Convierte "HH:mm" a [HH, mm]
      const timeB = b.timeStart.split(":").map(Number);

      // Comparación de horas y minutos
      return timeA[0] - timeB[0] || timeA[1] - timeB[1];
    });

    console.log("Eventos ordenados por fecha y hora:", eventos);

    // Renderiza los eventos
    renderEventosAceleradoras(eventos);
  } catch (error) {
    console.error("Hubo un problema al obtener los eventos de aceleradoras:", error);
  }
}


// Función para verificar qué extensión de imagen está disponible
async function fetchImageWithFallbackAceleradoras(basePath) {
  for (const ext of imageExtensionsAceleradoras) {
    const url = `${basePath}${ext}`;
    try {
      const response = await fetch(url, { method: "HEAD" });
      if (response.ok) {
        return url;
      }
    } catch (error) {}
  }
  return "http://localhost:8080/img/default-event.png";
}

// Función para renderizar los eventos en el DOM
async function renderEventosAceleradoras(eventos) {
  const eventosContainer = document.querySelector(".acelerados-list");

  if (!eventosContainer) {
    console.warn("No se encontró el contenedor para los eventos de aceleradoras en el DOM.");
    return;
  }

  eventosContainer.innerHTML = "";

  for (const evento of eventos) {
    const basePath = `/img/eventos/${evento.title.toLowerCase().replace(/\s+/g, '-')}`;
    const imageUrl = await fetchImageWithFallbackAceleradoras(basePath);

    const eventItem = document.createElement("div");
    eventItem.className = "acelerado-item";
    eventItem.innerHTML = `
      <div class="acelerado-image-container"><img src="${imageUrl}" alt="${evento.title}" class="acelerado-image"></div>
      <div class="acelerado-content">
        <h3 class="acelerado-title">${evento.title}</h3>
        <p class="acelerado-description">${evento.description}</p>
        <p class="acelerado-description">${evento.mode}</p>
        <p class="acelerado-description">${evento.timeStart}</p>
        <p class="acelerado-date"><strong>Fecha:</strong> ${evento.date}</p>
        <button class="event-btn">Más Información</button>
      </div>
    `;

    eventosContainer.appendChild(eventItem);
  }
}

document.addEventListener("DOMContentLoaded", fetchEventosAceleradoras);
