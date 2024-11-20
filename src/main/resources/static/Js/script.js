   
    // Agregar interacción al botón de cada evento
document.querySelectorAll('.event-btn').forEach(button => {
    button.addEventListener('click', (event) => {
        const eventCard = event.target.closest('.event-card');
        const eventId = eventCard.getAttribute('data-id');
        alert(`Ver más información sobre el Evento ID: ${eventId}`);
    });
});
const player = document.getElementById('player');

player.addEventListener('play', () => {
    console.log('Reproduciendo música');
});
const text = "Bienvenido a nuestra página. ¡Descubre más!";
const typingElement = document.getElementById('typing-effect');
let index = 0;

function typeText() {
    if (index < text.length) {
        typingElement.textContent += text.charAt(index);
        index++;
        setTimeout(typeText, 100); // Velocidad del efecto
    }
}

typeText();

document.getElementById('confetti-btn').addEventListener('click', () => {
    confetti({
        particleCount: 100,
        spread: 70,
        origin: { y: 0.6 },
    });
});
const textElement = document.getElementById('dynamic-text');
const phrases = ['¡Bienvenido!', '¡Explora nuestro sitio!', '¡Haz clic en los botones!', '¡Disfruta la experiencia!'];
let currentIndex = 0;

function changeText() {
    currentIndex = (currentIndex + 1) % phrases.length;
    textElement.textContent = phrases[currentIndex];
}

setInterval(changeText, 3000);

document.querySelectorAll('.submenu > a').forEach(menu => {
    menu.addEventListener('click', (e) => {
      e.preventDefault();
      const submenu = menu.nextElementSibling;
      submenu.style.display = submenu.style.display === 'block' ? 'none' : 'block';
    });
  });
  // Cambiar color del menú al hacer scroll
window.addEventListener('scroll', () => {
    const menu = document.querySelector('.menu');
    if (window.scrollY > 50) {
      menu.style.background = 'rgba(255, 255, 255, 0.95)';
      menu.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.1)';
    } else {
      menu.style.background = 'rgba(255, 255, 255, 0.9)';
      menu.style.boxShadow = 'none';
    }
  });
  
  // Efecto de navegación suave
  document.querySelectorAll('.menu-list a').forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault();
      document.querySelector(link.getAttribute('href')).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });
  // Smooth Scroll para los enlaces con anclas
document.addEventListener('DOMContentLoaded', () => {
    const links = document.querySelectorAll('a[href^="#"]');
    
    links.forEach(link => {
      link.addEventListener('click', (e) => {
        e.preventDefault();
        
        const targetId = link.getAttribute('href').substring(1);
        const targetElement = document.getElementById(targetId);
        
        if (targetElement) {
          targetElement.scrollIntoView({
            behavior: 'smooth',
            block: 'start'
          });
        }
      });
    });
  });
  
  
  





