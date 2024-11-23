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
    const extensionesPermitidas = ["image/jpeg", "image/png", "image/gif"]; // Tipos permitidos
    if (!extensionesPermitidas.includes(archivo.type)) {
        alert("Solo se permiten archivos de imagen (.jpg, .jpeg, .png, .gif)");
        return;
    }

    formData.append("imagen", archivo);
    formData.append("title", titulo); // Añadir el título de la publicación

    // Imprimir los datos que se van a enviar (en este caso, el archivo y el título)
    console.log("Datos enviados:");
    console.log("Título:", titulo);
    console.log("Imagen:");
    console.log("Nombre del archivo:", archivo.name);
    console.log("Tipo del archivo:", archivo.type);

    // Subir la imagen primero
    fetch("/api/imagenes/subir", {
        method: "POST",
        body: formData,
    })
        .then((response) => {
            if (!response.ok) {
                throw new Error("Error al subir la imagen: " + response.statusText);
            }
            return response.json(); // Ahora tratamos la respuesta como JSON
        })
        .then((data) => {
            console.log("Respuesta de la subida de imagen:", data);

            // Usamos el id de la imagen que retorna el servidor
            const imageId = data.id;

            // Después de subir la imagen, crear los datos de la publicación
            const publicationData = {
                title: titulo,
                nameImg: {
                    id: imageId // Usamos el id de la imagen
                },
                user: {
                    id: 2
                }
            };

            // Subir la publicación
            return fetch("http://localhost:8080/api/publications/save", {
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
            return response.json(); // Tratar la respuesta de la publicación como JSON
        })
        .then((data) => {
            document.getElementById("resultado").innerText = "Publicación guardada con éxito: " + data;
            console.log("Publicación guardada:", data);
        })
        .catch((error) => {
            console.error("Error general:", error);
            document.getElementById("resultado").innerText = "Error: " + error.message;
        });

}
