// comentarios.js
const apiUrlComent = "http://localhost:8080/api/comentarios/publicacion/{idPublicacion}";

// Supongamos que ya tienes el ID de la publicación
const idPublicacion = 1;
const postContainer = document.getElementById("post");

// Llamar al API para obtener los comentarios
fetch(apiUrlComent.replace("{idPublicacion}", idPublicacion))
  .then((response) => response.json())
  .then((comments) => {
    // Construir la sección de comentarios
    postContainer.innerHTML = `
      <div class="comments">
        <h4>Comentarios:</h4>
        <ul class="comment-list">
          ${comments
            .map(
              (comment) => `
                <li>
                  <strong>Usuario:</strong> ${comment.users.username} <br>
                  <strong>Comentario:</strong> ${comment.comentario.comentario}
                </li>`
            )
            .join("")}
        </ul>
        <form class="comment-form" onsubmit="submitComment(event)">
          <input type="text" id="newComment" placeholder="Escribe un comentario..." required>
          <button type="submit">Enviar</button>
        </form>
      </div>
    `;
  })
  .catch((error) => {
    console.error("Error al obtener los comentarios:", error);
    postContainer.innerHTML = `<p>Error al cargar los comentarios.</p>`;
  });

// Función para manejar el envío de un nuevo comentario
function submitComment(event) {
  event.preventDefault();

  const newComment = document.getElementById("newComment").value;

  // Configura el objeto para el comentario
  const newCommentData = {
    comentario: newComment,
    publicacion_id: idPublicacion,
    user_id: 2, // Ajusta esto según el usuario actual
  };

  // Enviar el nuevo comentario al servidor
  fetch("http://localhost:8080/api/comentarios", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(newCommentData),
  })
    .then((response) => {
      if (response.ok) {
        alert("Comentario agregado exitosamente.");
        location.reload(); // Recargar la página para mostrar el nuevo comentario
      } else {
        throw new Error("Error al agregar el comentario.");
      }
    })
    .catch((error) => {
      console.error("Error al agregar el comentario:", error);
      alert("No se pudo agregar el comentario.");
    });
}
