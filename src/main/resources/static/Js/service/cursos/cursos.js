const apiUrlCurso = "http://localhost:8080/api/cursos";

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

    // Llama a la función para renderizar los cursos
    renderCursos(cursos);
  } catch (error) {
    console.error("Hubo un problema al obtener los cursos:", error);
  }
}

function renderCursos(cursos) {
  const carruselContainer = document.querySelector(".carrusel-container");

  // Limpia el contenido previo del carrusel
  carruselContainer.innerHTML = "";

  // Lista de extensiones de imagen posibles
  const imageExtensions = ['.png', '.jpg', '.jpeg',  '.gif'];

  cursos.forEach((curso) => {
    // Crear el path dinámico de la imagen
    const baseImagePath = `/img/cursos/${curso.nombre.toLowerCase().replace(/\s+/g, "-")}`;
    let imagePath = null;

    // Verifica si existe una imagen en alguna de las extensiones posibles
    for (const ext of imageExtensions) {
      const fullPath = baseImagePath + ext;
      if (imageExists(fullPath)) {
        imagePath = fullPath;
        break;
      }
    }

    // Si no se encuentra ninguna imagen válida, usa la imagen por defecto
    imagePath = imagePath || 'default-image.jpg';

    // Crear elementos HTML dinámicamente
    const carruselItem = document.createElement("div");
    carruselItem.classList.add("carrusel-item");

    const cursoImage = document.createElement("img");
    cursoImage.src = curso.imageUrl || imagePath; // Usa la URL dinámica o una por defecto
    cursoImage.alt = `Imagen de ${curso.nombre}`;

    const caption = document.createElement("div");
    caption.classList.add("carrusel-caption");

    const title = document.createElement("h3");
    title.textContent = curso.nombre;

    const description = document.createElement("p");
    description.textContent = curso.descripcion;

    const link = document.createElement("a");
    link.href = "/formulario";
    link.classList.add("btn-inscripcion");
    link.textContent = "Inscribirme";

    // Ensambla el carrusel-item
    caption.appendChild(title);
    caption.appendChild(description);
    caption.appendChild(link);

    carruselItem.appendChild(cursoImage);
    carruselItem.appendChild(caption);

    // Agrega el item al contenedor del carrusel
    carruselContainer.appendChild(carruselItem);
  });
}

// Función para verificar si una imagen existe en la ruta dada
function imageExists(url) {
  const xhr = new XMLHttpRequest();
  xhr.open('HEAD', url, false); // Síncrono para bloquear la ejecución hasta obtener respuesta
  xhr.send();
  return xhr.status !== 404;
}

// Llamar a la función para cargar los cursos al iniciar la página
fetchCursos();
