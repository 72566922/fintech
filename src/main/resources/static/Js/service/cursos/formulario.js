const apiUrlCurso = "http://localhost:8080/api/cursos";
const apiUrlAlumno = "http://localhost:8080/api/alumnos/dni/{dni}";
const apiUrlAlumnoSave = "http://localhost:8080/api/alumnos/save";
const apiUrlRegistroAlumnoSave = "http://localhost:8080/api/registros/save";

// Función para obtener los cursos desde la API
async function fetchCursos() {
  try {
    const response = await fetch(apiUrlCurso);
    if (!response.ok) {
      throw new Error(`Error al obtener cursos: ${response.statusText}`);
    }
    const cursos = await response.json();
    renderCursos(cursos);
  } catch (error) {
    console.error("Hubo un problema al obtener los cursos:", error);
  }
}

// Función para renderizar los cursos en el select
function renderCursos(cursos) {
  const selectElement = document.getElementById('course');
  selectElement.innerHTML = '<option value="">-- Selecciona un curso --</option>';
  cursos.forEach(curso => {
    const option = document.createElement('option');
    option.value = curso.id;  // ID del curso
    option.textContent = curso.nombre;  // Nombre del curso
    selectElement.appendChild(option);
  });
}

// Función para verificar si el alumno existe por DNI
async function checkAlumnoExistente(dni) {
  const url = apiUrlAlumno.replace("{dni}", dni);
  try {
    const response = await fetch(url);
    if (response.ok) {
      const alumno = await response.json();
      return alumno;  // Retorna los datos del alumno si existe
    } else {
      return null;  // Retorna null si el alumno no existe
    }
  } catch (error) {
    console.error("Error al consultar el alumno:", error);
    return null;
  }
}

// Función para registrar un nuevo alumno
async function registerAlumno(alumnoData) {
  try {
    const response = await fetch(apiUrlAlumnoSave, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(alumnoData)  // Estructura de datos que espera la API
    });
    if (!response.ok) {
      throw new Error(`Error al registrar alumno: ${response.statusText}`);
    }
    const alumno = await response.json();
    return alumno;  // Retorna el alumno registrado
  } catch (error) {
    console.error("Error al registrar alumno:", error);
    return null;
  }
}

// Función para registrar al alumno en el curso
// Función para registrar al alumno en el curso
// Función para registrar al alumno en el curso
async function registerRegistroAlumno(registroAlumnoData) {
  // Crear la estructura esperada para la API
  const registroAlumnoDataConvertido = {
    alumno: { id: Number(registroAlumnoData.alumnoId) },  // Convertir alumnoId a número
    curso: { id: Number(registroAlumnoData.cursoId) }  // Convertir cursoId a número
  };

  console.log("Datos del registro a enviar (convertidos):", registroAlumnoDataConvertido);  // Imprimir los datos antes de enviarlos

  try {
    const response = await fetch(apiUrlRegistroAlumnoSave, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(registroAlumnoDataConvertido)  // Enviar los datos estructurados correctamente
    });
    if (!response.ok) {
      throw new Error(`Error al registrar el curso: ${response.statusText}`);
    }
    const registro = await response.json();
    console.log("Registro exitoso:", registro);  // Imprimir la respuesta del servidor
    return registro;
  } catch (error) {
    console.error("Error al registrar el curso:", error);
    return null;
  }
}




window.onload = function () {
  fetchCursos();
  const form = document.getElementById("registrationForm");

  form.addEventListener("submit", async function (event) {
    event.preventDefault();

    const dni = document.getElementById("dni").value;
    const fullName = document.getElementById("fullName").value;
    const lastName = document.getElementById("lastName").value;
    const email = document.getElementById("email").value;
    const phone = document.getElementById("phone").value;
    const courseId = document.getElementById("course").value;

    // Verificar si el alumno ya está registrado
    const alumnoExistente = await checkAlumnoExistente(dni);

    if (alumnoExistente) {
      // Si el alumno existe, solo registrar el curso para el alumno
      const registroAlumnoData = {
        alumnoId: alumnoExistente.id,  // Usamos el ID del alumno existente
        cursoId: courseId  // ID del curso seleccionado
      };
      const registro = await registerRegistroAlumno(registroAlumnoData);
      if (registro) {
        alert("Inscripción exitosa.");
      }
    } else {
      // Si el alumno no existe, registrarlo primero
      const alumnoData = {
        dni,
        nombre: fullName,
        apellido: lastName,
        correo: email,
        celular: phone
      };

      const alumnoRegistrado = await registerAlumno(alumnoData);

      if (alumnoRegistrado) {
        // Una vez registrado el alumno, registrar su inscripción en el curso
        const registroAlumnoData = {
          alumnoId: alumnoRegistrado.id,  // Usamos el ID del nuevo alumno registrado
          cursoId: courseId  // ID del curso seleccionado
        };
        const registro = await registerRegistroAlumno(registroAlumnoData);
        if (registro) {
          alert("Inscripción exitosa.");
        }
      }
    }
  });
};
