const apiUrlCurso = "http://localhost:8080/api/cursos";

// Función para obtener los cursos desde la API
async function fetchCursos() {
  try {
    console.log("Fetching cursos from:", apiUrlCurso);
    
    // Realiza una solicitud GET a la API
    const response = await fetch(apiUrlCurso);
    
    // Verifica si la respuesta es exitosa
    if (!response.ok) {
      throw new Error(`Error al obtener cursos: ${response.statusText}`);
    }

    // Convierte la respuesta a JSON
    const cursos = await response.json();
    console.log("Cursos obtenidos:", cursos);

    // Si no hay cursos, muestra un mensaje
    if (cursos.length === 0) {
      const message = document.createElement("p");
      message.textContent = "No se encontraron cursos.";
      document.querySelector(".carrusel-container").appendChild(message);
      return;
    }

    // Llama a la función para renderizar los cursos
    renderCursos(cursos);
  } catch (error) {
    console.error("Hubo un problema al obtener los cursos:", error);
  }
}

// Función para renderizar los cursos en el carrusel
async function renderCursos(cursos) {
  const carruselContainer = document.querySelector(".carrusel-container");
  
  // Limpia el contenido previo del carrusel
  carruselContainer.innerHTML = "";

  // Recorre cada curso y crea los elementos del carrusel
  for (const curso of cursos) {
    const baseImagePath = `/img/cursos/${curso.iniciativa.toLowerCase().replace(/\s+/g, "-")}`;
    let imagePath = await getValidImagePath(baseImagePath);

    // Crear el elemento del carrusel para cada curso
    const carruselItem = document.createElement("div");
    carruselItem.classList.add("carrusel-item");

    const cursoImage = document.createElement("img");
    cursoImage.src = imagePath || 'default-image.jpg'; // Usa la imagen por defecto si no se encuentra una válida
    cursoImage.alt = `Imagen de ${curso.iniciativa}`;

    const caption = document.createElement("div");
    caption.classList.add("carrusel-caption");

    const title = document.createElement("h3");
    title.textContent = curso.iniciativa;

    const description = document.createElement("p");
    description.textContent = curso.organizador;

    const fechaInit = document.createElement("p");
    fechaInit.textContent = new Date(curso.fechaInicio).toLocaleDateString();

    const precio = document.createElement("p");
    precio.textContent = `$${curso.precio.toFixed(2)}`;

    const link = document.createElement("a");
    link.href = curso.url;
    link.classList.add("btn-inscripcion");
    link.textContent = "Inscribirme";

    // Ensamblar el item del carrusel
    caption.appendChild(title);
    caption.appendChild(description);
    caption.appendChild(fechaInit);
    caption.appendChild(precio);
    caption.appendChild(link);

    carruselItem.appendChild(cursoImage);
    carruselItem.appendChild(caption);

    // Agregar el item al contenedor del carrusel
    carruselContainer.appendChild(carruselItem);
  }
}

// Función para verificar si una imagen existe en una ruta dada
async function imageExists(url) {
  try {
    const response = await fetch(url, { method: 'HEAD' });
    return response.ok;
  } catch (error) {
    console.error("Error al verificar la imagen:", error);
    return false;
  }
}

// Función para obtener una imagen válida
async function getValidImagePath(basePath) {
  const imageExtensions = ['.png', '.jpg', '.jpeg', '.gif'];

  // Recorre las extensiones posibles y verifica si la imagen existe
  for (const ext of imageExtensions) {
    const fullPath = basePath + ext;
    if (await imageExists(fullPath)) {
      return fullPath; // Retorna la primera imagen válida encontrada
    }
  }

  return null; // Retorna null si no se encuentra una imagen válida
}

// Llamar a la función para cargar los cursos al iniciar la página
fetchCursos();
