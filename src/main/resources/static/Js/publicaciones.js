const apiUrlPublications = "http://localhost:8080/api/publications";
const apiUrlPublicationsSave = "http://localhost:8080/api/publications/save";
const apiUrlComments = "http://localhost:8080/api/comentarios";
const apiUrlCommentsSave = "http://localhost:8080/api/comentarios/save";
const apiUrlImagesUpload = "http://localhost:8080/api/imagenes/subir";
const apiUrlReaccionSave = "http://localhost:8080/api/reacciones/save";

// Subir una imagen y publicar junto con ella
function subirImagenYPublicacion(event) {
  event.preventDefault(); // Evitar que el formulario se envíe de forma convencional

  const formData = new FormData();
  const archivo = document.getElementById("imagen").files[0];
  const titulo = document.getElementById("title").value;

  if (!archivo) {
    alert("Selecciona una imagen");
    return;
  }

  // Validar la extensión del archivo
  const extensionesPermitidas = ["image/jpeg", "image/png", "image/gif"];
  if (!extensionesPermitidas.includes(archivo.type)) {
    alert("Solo se permiten archivos de imagen (.jpg, .jpeg, .png, .gif)");
    return;
  }

  formData.append("imagen", archivo);
  formData.append("title", titulo); // Añadir el título de la publicación

  // Subir la imagen primero
  fetch(apiUrlImagesUpload, {
    method: "POST",
    body: formData,
  })
    .then((response) => {
      if (!response.ok) {
        throw new Error("Error al subir la imagen: " + response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      console.log("Respuesta de la subida de imagen:", data);

      // Usamos el id de la imagen que retorna el servidor
      const imageId = data.id;

      // Después de subir la imagen, crear los datos de la publicación
      const publicationData = {
        title: titulo,
        nameImg: {
          id: imageId, // Usamos el id de la imagen
        },
        user: {
          id: 2, // Este valor debe ser dinámico según el usuario autenticado
        },
      };

      // Subir la publicación
      return fetch(apiUrlPublicationsSave, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(publicationData),
      });
    })
    .then((response) => {
      if (!response.ok) {
        throw new Error("Error al guardar la publicación: " + response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      console.log("Publicación guardada:", data);

      // Recargar la página después de guardar la publicación
      window.location.reload();

      // Limpiar formulario
      document.getElementById("postForm").reset();
    })
    .catch((error) => {
      console.error("Error general:", error);
      alert("Error al crear la publicación.");
    });
}

// Cargar publicaciones y comentarios
document.addEventListener("DOMContentLoaded", function () {
  fetch(apiUrlPublications)
    .then((response) => response.json())
    .then((publications) => {
      const postsContainer = document.getElementById("postsContainer");

      publications.forEach((publication) => {
        const post = document.createElement("div");
        post.classList.add("post");
        post.dataset.id = publication.id;

        post.innerHTML = `
          <h3>${publication.title}</h3>
          <h3>${publication.user.username}</h3>
          <img src="${publication.nameImg.url}" alt="${publication.title}">
          <div class="reactions">
            <button class="reaction-btn" data-reaction="like">Me gusta</button>
            <span class="like-count">(${publication.meGusta})</span>
            <button class="reaction-btn" data-reaction="dislike">No me gusta</button>
            <span class="dislike-count">(${publication.noMeGusta})</span>
            <button class="reaction-btn" data-reaction="love">Me encanta</button>
            <span class="love-count">(${publication.meEncanta})</span>
          </div>
          <div class="comments">
            <h4>Comentarios:</h4>
            <ul class="comment-list" id="commentList-${publication.id}">
              <li>Cargando comentarios...</li>
            </ul>
            <form class="comment-form" data-id="${publication.id}">
              <input type="text" class="new-comment" placeholder="Escribe un comentario..." required>
              <button type="submit">Enviar</button>
            </form>
          </div>
        `;

        postsContainer.prepend(post);

        // Cargar los comentarios de la publicación
        loadComments(publication.id);
      });
    })
    .catch((error) => console.error("Error al cargar publicaciones:", error));
});

// Función para cargar comentarios de una publicación
function loadComments(publicationId) {
  fetch(`${apiUrlComments}/publicacion/${publicationId}`)
    .then((response) => response.json())
    .then((comments) => {
      const commentList = document.getElementById(`commentList-${publicationId}`);
      if (comments.length > 0) {
        commentList.innerHTML = comments
          .map(
            (comment) => `
              <li>
                <strong>${comment.user.username}:</strong> ${comment.comentario}
              </li>`
          )
          .join("");
      } else {
        commentList.innerHTML = "<li>No hay comentarios aún.</li>";
      }
    })
    .catch((error) => {
      console.error(`Error al cargar comentarios de publicación ${publicationId}:`, error);
    });
}

// Manejo de reacciones
document.addEventListener("click", function (e) {
  if (e.target.classList.contains("reaction-btn")) {
    const button = e.target;
    const reaction = button.dataset.reaction;
    const post = button.closest(".post");
    const postId = post.dataset.id;

    // Verificar si el usuario ya ha reaccionado a la publicación
    const userId = 1; // Este valor debe ser dinámico según el usuario autenticado
    checkUserReaction(postId, userId).then((existingReaction) => {
      const reactionData = {
        meGusta: false,
        meEncanta: false,
        noMeGusta: false,
        publication: {
          id: postId
        },
        user: {
          id: userId
        }
      };

      // Establecer la reacción según el botón presionado
      if (reaction === "like") {
        reactionData.meGusta = true;
      } else if (reaction === "dislike") {
        reactionData.noMeGusta = true;
      } else if (reaction === "love") {
        reactionData.meEncanta = true;
      }

      // Si el usuario ya reaccionó, actualizamos su reacción, si no, la creamos
      if (existingReaction) {
        updateReaction(existingReaction.id, reactionData);
      } else {
        createReaction(reactionData);
      }
    }).catch((error) => {
      console.error("Error al verificar la reacción:", error);
    });
  }
});

// Función para verificar si el usuario ya ha reaccionado a la publicación
function checkUserReaction(postId, userId) {
  return fetch(`${apiUrlReaccionSave}/usuario/${userId}/publicacion/${postId}`)
    .then(response => {
      if (response.ok) {
        return response.json();
      } else {
        return null; // No hay reacción previa
      }
    })
    .catch(error => {
      console.error("Error al verificar la reacción del usuario:", error);
      return null;
    });
    
}

// Función para actualizar una reacción existente
function updateReaction(reactionId, reactionData) {
  fetch(`${apiUrlReaccionSave}/${reactionId}`, {
    method: "PATCH",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(reactionData),
  })
    .then((response) => response.json())
    .then((updatedReaction) => {
      console.log("Reacción actualizada:", updatedReaction);
      updateReactionCounts(updatedReaction);
    })
    .catch((error) => {
      console.error("Error al actualizar la reacción:", error);
    });
}

// Función para crear una nueva reacción
function createReaction(reactionData) {
  fetch(apiUrlReaccionSave, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(reactionData),
  })
    .then((response) => response.json())
    .then((newReaction) => {
      console.log("Nueva reacción creada:", newReaction);
      updateReactionCounts(newReaction);

      window.location.reload();
    })
    .catch((error) => {
      console.error("Error al crear la reacción:", error);
    });
}

// Función para actualizar los contadores de reacciones en el DOM
function updateReactionCounts(reactionData) {
  const post = document.querySelector(`[data-id='${reactionData.publication.id}']`);
  post.querySelector(".like-count").textContent = `(${reactionData.publication.meGusta})`;
  post.querySelector(".dislike-count").textContent = `(${reactionData.publication.noMeGusta})`;
  post.querySelector(".love-count").textContent = `(${reactionData.publication.meEncanta})`;
}


// Manejo del envío de nuevos comentarios
document.addEventListener("submit", function (e) {
  if (e.target.classList.contains("comment-form")) {
    e.preventDefault();

    const form = e.target;
    const publicationId = form.dataset.id;
    const newCommentInput = form.querySelector(".new-comment");
    const newComment = newCommentInput.value;

    const newCommentData = {
      comentario: newComment,
      user: { id: 2 }, // Reemplazar con el ID del usuario autenticado
      publicacion: { id: publicationId },
    };

    fetch(apiUrlCommentsSave, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(newCommentData),
    })
      .then((response) => {
        if (response.ok) {
          alert("Comentario agregado exitosamente.");
          loadComments(publicationId); // Recargar comentarios de esta publicación
          newCommentInput.value = ""; // Limpiar campo de comentario
        } else {
          alert("Error al agregar el comentario.");
        }
      })
      .catch((error) => {
        console.error("Error al guardar el comentario:", error);
      });
  }
});
