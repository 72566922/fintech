// URL de la API de eventos de inversión-fondo
const apiUrlInversion = "http://localhost:8080/api/events/by/3";

// Lista de extensiones de imagen aceptadas
const imageExtensionsInversion = [".png", ".jpeg", ".jpg", ".webp"];

// Función para obtener los eventos desde la API
async function fetchEventosInversion() {
  try {
    const response = await fetch(apiUrlInversion);

    if (!response.ok) {
      throw new Error(`Error al obtener eventos: ${response.statusText}`);
    }

    const eventos = await response.json();
    renderEventosInversion(eventos);
  } catch (error) {
    console.error("Hubo un problema al obtener los eventos de inversión-fondo:", error);
  }
}

// Función para verificar qué extensión de imagen está disponible
async function fetchImageWithFallbackInversion(basePath) {
  for (const ext of imageExtensionsInversion) {
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
async function renderEventosInversion(eventos) {
  const eventosContainer = document.querySelector(".inversionistas-list");

  if (!eventosContainer) {
    console.warn("No se encontró el contenedor para los eventos de inversión-fondo en el DOM.");
    return;
  }

  eventosContainer.innerHTML = "";

  for (const evento of eventos) {
    const basePath = `/img/eventos/${evento.title.toLowerCase().replace(/\s+/g, '-')}`;
    const imageUrl = await fetchImageWithFallbackInversion(basePath);

    const eventItem = document.createElement("div");
    eventItem.className = "inversionista-item";
    eventItem.innerHTML = `
      <div class="inversionista-card">
          <img src="${imageUrl}" alt="${evento.title}" class="inversionista-logo">
          <h3 class="inversionista-title">${evento.title}</h3>
          <p class="inversionista-description">${evento.description}</p>
          <p class="inversionista-description">${evento.mode}</p>
          <p class="inversionista-description">${evento.timeStart}</p>
          <p class="inversionista-date"><strong>Fecha:</strong> ${evento.date}</p>
          <button class="event-btn">Más Información</button>
      </div>
    `;

    eventosContainer.appendChild(eventItem);
  }
}

document.addEventListener("DOMContentLoaded", fetchEventosInversion);