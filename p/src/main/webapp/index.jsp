<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html lang="es">
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VACUKIDS - App de Vacunación</title>
    <link rel="stylesheet" href="css\Style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;800&display=swap" rel="stylesheet">
    </head>

    <body>

    <a href="Controlador?action=listar_centros" >Centros</a>

    <header class="header">
    <div class="header__brand">
    <div class="logo-circle">
    <div class="heart"></div>
    </div>
    <h1 class="header__appname">VACUKIDS</h1>
    </div>

    <nav class="nav-wrapper">
    <a href="Controlador?action=mostrar_registro" class="nav-link">Registrarse</a>
    <a href="Controlador?action=login" class="nav-link">Iniciar Sesión</a>
    </nav>
    </header>


    <main class="main-container">
    <!-- Sección Principal -->

    <section class="hero">
    <div class="hero__content">
    <h2 class="hero__title">Registro fácil y vacúnate</h2>
    <p class="hero__description">
    VACUKIDS te ofrece un registro sencillo para vacunarte en el servicio de vacunación más cercano a tu ubicación.
    Accesible en móvil y online para todos.
    </p>
    <div class="hero__divider"></div>
    <a href="Controlador?action=login" class="btn btn--primary">Iniciar sesión</a>
        <div class="hero__divider"></div>
        <a href="Controlador?action=mostrar_registro" class="btn btn--primary">Eres nuevo? Registrate</a>
    </div>

    <div class="hero__image">
    <img src="css/Imagenes/nnn.JPG" alt="Ilustración de vacunación">
    </div>
    </section>


    <!-- Pasos para vacunarte -->
    <section class="section steps">
    <h2 class="section-title">Pasos para <span class="highlight">vacunarte</span></h2>
    <div class="section-divider"></div>
    <div class="steps__grid">
    <div class="card step-card">
    <div class="step-number">1</div>
    <img src="css/Imagenes/step1.png" alt="Conoce tu vacuna">
    <h3 class="card__title">Conoce la vacuna</h3>
    <p>Infórmate sobre los tipos de vacuna y sus posibles efectos secundarios.</p>
    </div>

    <div class="card step-card">
    <div class="step-number">2</div>
    <img src="css/Imagenes/ubicacion.png" alt="Ubicación centro">
    <h3 class="card__title">Encuentra el centro más cercano</h3>
    <p>Consulta la ubicación y fecha del servicio de vacunación.</p>
    </div>

    <div class="card step-card">
    <div class="step-number">3</div>
    <img src="css/Imagenes/registro.png" alt="Icono de Registro">
    <h3 class="card__title">Regístrate</h3>
    <p>Completa tu registro y los requisitos necesarios.</p>
    </div>

    <div class="card step-card">
    <div class="step-number">4</div>
    <img src="css/Imagenes/inyeccion.png" alt="Icono vacunación">
    <h3 class="card__title">Vacúnate</h3>
    <p>Acude al centro de vacunación y recibe tu dosis.</p>
    </div>
    </div>
    </section>
    </main>

    <footer class="footer">
    <div class="footer__container">
    <div class="footer__column">
    <div class="header__brand">
    <div class="header__logo">
    <div class="heart"></div>
    </div>
    </div>
    <p>Proporcionamos un registro fácil para vacunarte en el centro más cercano. Disponible en móvil y web para todos.</p>
    </div>

    <div class="footer__column">
    <h4>Sobre Nosotros</h4>
    <ul>
    <li><a href="#">Quiénes somos</a></li>
    <li><a href="#">Blog</a></li>
    <li><a href="#">Servicios</a></li>
    <li><a href="#">App</a></li>
    </ul>
    </div>

    <div class="footer__column">
    <h4>Servicios</h4>
    <ul>
    <li><a href="#">Información de vacunas</a></li>
    <li><a href="#">Ubicación de vacunación</a></li>
    <li><a href="#">Llamadas de emergencia</a></li>
    <li><a href="#">Certificado QR</a></li>
    </ul>
    </div>

    <div class="footer__column">
    <h4>Ayuda</h4>
    <ul>
    <li><a href="#">Centro de ayuda</a></li>
    <li><a href="#">Contacto</a></li>
    <li><a href="#">Instrucciones</a></li>
    <li><a href="#">Cómo funciona</a></li>
    </ul>
    </div>
    </div>
    </footer>
    </body>


    </html>

