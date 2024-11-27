const apiUrlFormacionConcurso = "http://localhost:8080/api/formacion-concursos";
const imagesPath = "/img/formacion-concursos/proximos"; // Ruta donde se encuentran las imágenes

// Función para obtener datos y renderizarlos
async function renderFormacionConcurso() {
    try {
        const response = await fetch(apiUrlFormacionConcurso);
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }

        const data = await response.json();

        // Seleccionamos el contenedor de las tarjetas
        const cardsContainer = document.querySelector(".cards-container");

        // Limpiamos cualquier contenido previo
        cardsContainer.innerHTML = "";

        // Iteramos sobre los datos para generar las tarjetas
        data.forEach(evento => {
            const card = document.createElement("div");
            card.classList.add("card");

            const eventTitle = document.createElement("h2");
            eventTitle.textContent = evento.iniciativa;

            const eventImage = document.createElement("img");
            eventImage.src = `${imagesPath}/${evento.iniciativa.replace(/ /g, "-")}.PNG`;
            eventImage.alt = evento.iniciativa;

            const eventDescription = document.createElement("p");
            eventDescription.textContent = evento.resumen;

            const eventDate = document.createElement("p");
            eventDate.innerHTML = `<strong>Fecha:</strong> ${evento.fechaInicio} - ${evento.fechaFin}`;

            const eventPrice = document.createElement("p");
            eventPrice.innerHTML = `<strong>Precio:</strong> ${evento.precio === 0 ? "Gratuito" : `S/ ${evento.precio}`}`;

            const eventOrganizer = document.createElement("p");
            eventOrganizer.innerHTML = `<strong>Organizador:</strong> ${evento.organizador}`;

            // Crear el botón para más detalles
            const detailsButton = document.createElement("button");
            detailsButton.textContent = "Ir a";
            detailsButton.classList.add("details-button");
            detailsButton.onclick = () => {
                window.open(evento.url, "_blank"); // Abrir el enlace del evento en una nueva pestaña
            };

            // Añadimos los elementos a la tarjeta
            card.appendChild(eventTitle);
            card.appendChild(eventImage);
            card.appendChild(eventDescription);
            card.appendChild(eventDate);
            card.appendChild(eventPrice);
            card.appendChild(eventOrganizer);
            card.appendChild(detailsButton); // Agregamos el botón a la tarjeta

            // Añadimos la tarjeta al contenedor
            cardsContainer.appendChild(card);
        });

    } catch (error) {
        console.error("Error al obtener o renderizar los datos:", error);
    }
}

// Llamamos a la función al cargar la página
renderFormacionConcurso();
