// URL de la API de eventos
const apiUrl = "http://localhost:8080/api/events";

// URL de la API para obtener eventos por tipo (y usando el id)
const apiUrlById = "http://localhost:8080/api/events/by/";

// Lista de extensiones de imagen aceptadas
const imageExtensions = [".png", ".jpeg", ".jpg", ".webp"];

// Bandera para controlar el llenado único del filtro de tipos de eventos
let isEventTypeFilterFilled = false;

// Función para obtener los eventos desde la API
async function fetchEventos() {
  try {
    console.log("Fetching events from:", apiUrl);

    // Realiza una solicitud GET a la API
    const response = await fetch(apiUrl);

    // Verifica si la respuesta es exitosa
    if (!response.ok) {
      throw new Error(`Error al obtener eventos: ${response.statusText}`);
    }

    // Convierte la respuesta a JSON
    const eventos = await response.json();
    console.log("Eventos obtenidos antes de ordenar:", eventos);

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

    // Llama a la función para renderizar los eventos
    renderEventos(eventos);

    // Llama a la función para llenar el select de tipos de evento (solo si no está lleno)
    fillEventTypeFilter(eventos);

  } catch (error) {
    console.error("Hubo un problema al obtener los eventos:", error);
  }
}



// Función para llenar el select de tipos de eventos con los IDs
function fillEventTypeFilter(eventos) {
  if (isEventTypeFilterFilled) {
    console.log("El filtro de tipos de evento ya está lleno. No se llenará nuevamente.");
    return;
  }

  console.log("Llenando el filtro de tipos de evento...");
  const eventTypeFilter = document.getElementById("eventTypeFilter");
  const eventTypes = new Set();

  // Extrae los tipos únicos de los eventos
  eventos.forEach(evento => {
    if (evento.type && evento.type.id) {
      eventTypes.add(evento.type.id);
    }
  });

  console.log("Tipos de evento encontrados:", eventTypes);

  // Llena el select con las opciones de tipo de evento
  eventTypes.forEach(typeId => {
    const eventType = eventos.find(evento => evento.type.id === typeId).type.name;
    const option = document.createElement("option");
    option.value = typeId; // Usamos el ID del tipo
    option.textContent = eventType; // Mostramos el nombre del tipo
    eventTypeFilter.appendChild(option);
  });

  isEventTypeFilterFilled = true; // Marca que el filtro ya está lleno
}

// Función para verificar qué extensión de imagen está disponible
async function fetchImageWithFallback(basePath) {
  console.log("Verificando imágenes para el evento:", basePath);

  for (const ext of imageExtensions) {
    const url = `${basePath}${ext}`;
    try {
      const response = await fetch(url, { method: "HEAD" });
      if (response.ok) {
        console.log("Imagen encontrada:", url);
        return url;
      }
    } catch (error) {
      // Silencia los errores de extensiones no encontradas
    }
  }

  console.log("Imagen no encontrada, retornando imagen por defecto");
  return "http://localhost:8080/img/default-event.png";
}

// Función para renderizar los eventos en el DOM
async function renderEventos(eventos) {
  console.log("Renderizando eventos en el DOM...");
  const eventosContainer = document.querySelector(".events-list");

  if (!eventosContainer) {
    console.warn("No se encontró el contenedor para los eventos en el DOM.");
    return;
  }

  eventosContainer.innerHTML = "";

  for (const evento of eventos) {
    const basePath = `/img/eventos/${evento.title.toLowerCase().replace(/\s+/g, '-')}`;
    const imageUrl = await fetchImageWithFallback(basePath);

    const eventItem = document.createElement("div");
    eventItem.className = "event-item";

    eventItem.innerHTML = `
      <img src="${imageUrl}" alt="${evento.title}" class="event-image">
      <div class="event-content">
        <h3 class="event-title">${evento.title}</h3>
        <p class="event-description">${evento.description}</p>
        <p class="event-description">${evento.mode}</p>
        <p class="event-description">${evento.timeStart}</p>
        <p class="event-description">${evento.type.name}</p>
        <p class="event-date"><strong>Fecha:</strong> ${evento.date}</p>
        <button class="event-btn">Más Información</button>
      </div>
    `;

    console.log("Evento renderizado:", evento.title);
    eventosContainer.appendChild(eventItem);
  }
}

// Función para filtrar los eventos por ID de tipo de evento
// Función para filtrar los eventos por ID de tipo de evento
async function fetchEventosByTypeId(id) {
  console.log("Filtrando eventos por tipo de ID:", id);

  try {
    const response = await fetch(`${apiUrlById}${id}`);
    if (!response.ok) {
      throw new Error(`Error al obtener eventos filtrados por tipo con ID: ${response.statusText}`);
    }

    const eventos = await response.json();
    console.log("Eventos obtenidos antes de ordenar:", eventos);

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

    console.log("Eventos filtrados y ordenados:", eventos);

    // Renderiza los eventos filtrados
    renderEventos(eventos);

  } catch (error) {
    console.error("Hubo un problema al obtener eventos filtrados por ID:", error);
  }
}


// Agrega el evento al select de tipo de evento
document.getElementById("eventTypeFilter").addEventListener("change", (e) => {
  const selectedTypeId = e.target.value;
  console.log("ID de tipo de evento seleccionado:", selectedTypeId);

  if (selectedTypeId) {
    fetchEventosByTypeId(selectedTypeId);
  } else {
    fetchEventos();
  }
});

// Llama a la función cuando el DOM esté completamente cargado
document.addEventListener("DOMContentLoaded", () => {
  console.log("El DOM está completamente cargado, obteniendo eventos...");
  fetchEventos();
});
