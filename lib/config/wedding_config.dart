import 'package:flutter/material.dart';

/// ╔═══════════════════════════════════════════════════════════════════════════╗
/// ║                    CONFIGURACIÓN DE LA INVITACIÓN                         ║
/// ║                                                                           ║
/// ║  Edita las variables de abajo para personalizar la invitación.           ║
/// ║  No necesitas tocar ningún otro archivo.                                  ║
/// ╚═══════════════════════════════════════════════════════════════════════════╝

class WeddingConfig {
  // ═══════════════════════════════════════════════════════════════════════════
  // INFORMACIÓN DE LA PAREJA
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const String groomName = 'Carlos';
  static const String brideName = 'María';
  static const String groomFullName = 'Carlos Eduardo Rodríguez López';
  static const String brideFullName = 'María Fernanda García Hernández';
  
  // Padres del novio
  static const String groomFather = 'Roberto Rodríguez';
  static const String groomMother = 'Ana López de Rodríguez';
  
  // Padres de la novia
  static const String brideFather = 'José García';
  static const String brideMother = 'Carmen Hernández de García';

  // ═══════════════════════════════════════════════════════════════════════════
  // FECHA Y HORA
  // ═══════════════════════════════════════════════════════════════════════════
  
  static final DateTime weddingDate = DateTime(2026, 6, 15, 16, 0);
  static const String weddingDateText = '15 de Junio, 2026';
  static const String ceremonyTime = '4:00 PM';
  static const String receptionTime = '6:00 PM';

  // ═══════════════════════════════════════════════════════════════════════════
  // UBICACIONES
  // ═══════════════════════════════════════════════════════════════════════════
  
  // Ceremonia religiosa
  static const String ceremonyVenue = 'Iglesia San José';
  static const String ceremonyAddress = 'Av. Principal #123, Col. Centro';
  static const String ceremonyCity = 'Tegucigalpa, Honduras';
  static const String ceremonyMapsUrl = 'https://maps.google.com/?q=Iglesia+San+Jose+Tegucigalpa';
  
  // Recepción
  static const String receptionVenue = 'Salón de Eventos El Jardín';
  static const String receptionAddress = 'Blvd. Morazán #456';
  static const String receptionCity = 'Tegucigalpa, Honduras';
  static const String receptionMapsUrl = 'https://maps.google.com/?q=Salon+El+Jardin+Tegucigalpa';

  // ═══════════════════════════════════════════════════════════════════════════
  // MENSAJE PERSONALIZADO
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const String welcomeMessage = '''
Con la bendición de Dios y de nuestros padres,
tenemos el honor de invitarte a celebrar
nuestra unión en matrimonio.
''';

  static const String rsvpMessage = 'Por favor confirma tu asistencia antes del 1 de Junio';
  static const String dressCode = 'Formal / Etiqueta';

  // ═══════════════════════════════════════════════════════════════════════════
  // CONTACTO
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const String whatsappNumber = '50412345678';
  static const String contactEmail = 'boda.carlos.maria@gmail.com';

  // ═══════════════════════════════════════════════════════════════════════════
  // MESA DE REGALOS / INFORMACIÓN ADICIONAL
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const bool showGiftRegistry = true;
  static const String giftRegistryText = 'Tu presencia es nuestro mejor regalo';
  static const String bankInfo = '''
Banco: BAC Honduras
Cuenta: 123-456-789
A nombre de: Carlos Rodríguez
''';

  // ═══════════════════════════════════════════════════════════════════════════
  // GALERÍA DE FOTOS (URLs de las imágenes)
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const List<String> galleryImages = [
    'https://images.unsplash.com/photo-1519741497674-611481863552?w=600',
    'https://images.unsplash.com/photo-1529636798458-92182e662485?w=600',
    'https://images.unsplash.com/photo-1511285560929-80b456fea0bc?w=600',
    'https://images.unsplash.com/photo-1606216794074-735e91aa2c92?w=600',
    'https://images.unsplash.com/photo-1583939003579-730e3918a45a?w=600',
    'https://images.unsplash.com/photo-1465495976277-4387d4b0b4c6?w=600',
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  // HISTORIA DE AMOR (Timeline)
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const List<Map<String, String>> loveStory = [
    {
      'date': 'Marzo 2020',
      'title': 'Nos conocimos',
      'description': 'Nuestras miradas se cruzaron por primera vez en una reunión de amigos.',
    },
    {
      'date': 'Junio 2020',
      'title': 'Primera cita',
      'description': 'Una cena romántica que marcó el inicio de nuestra historia.',
    },
    {
      'date': 'Diciembre 2024',
      'title': 'La propuesta',
      'description': 'Bajo las estrellas, prometimos amarnos para siempre.',
    },
    {
      'date': 'Junio 2026',
      'title': '¡Nos casamos!',
      'description': 'El día más feliz de nuestras vidas.',
    },
  ];

  // ═══════════════════════════════════════════════════════════════════════════
  // COLORES Y ESTILO
  // Puedes cambiar estos colores para personalizar el tema
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const Color primaryColor = Color(0xFFB8860B);      // Dorado elegante
  static const Color secondaryColor = Color(0xFF2C3E50);    // Azul oscuro elegante
  static const Color backgroundColor = Color(0xFFFAF8F5);   // Crema suave
  static const Color accentColor = Color(0xFFD4AF37);       // Dorado claro
  static const Color textColor = Color(0xFF2C3E50);         // Texto principal
  static const Color textLightColor = Color(0xFF6B7280);    // Texto secundario

  // ═══════════════════════════════════════════════════════════════════════════
  // CONFIGURACIÓN ADICIONAL
  // ═══════════════════════════════════════════════════════════════════════════
  
  static const bool showCountdown = true;
  static const bool showLoveStory = true;
  static const bool showGallery = true;
  static const bool showRsvpForm = true;
  static const bool playBackgroundMusic = false;
  static const String backgroundMusicUrl = '';
}
