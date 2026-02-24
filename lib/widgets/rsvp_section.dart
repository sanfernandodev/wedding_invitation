import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:html' as html;
import '../config/wedding_config.dart';

class RsvpSection extends StatefulWidget {
  const RsvpSection({super.key});

  @override
  State<RsvpSection> createState() => _RsvpSectionState();
}

class _RsvpSectionState extends State<RsvpSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _guestsController = TextEditingController(text: '1');
  bool _isAttending = true;
  bool _isSubmitted = false;

  @override
  void dispose() {
    _nameController.dispose();
    _guestsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      decoration: BoxDecoration(
        color: WeddingConfig.secondaryColor,
      ),
      child: Column(
        children: [
          // Section title
          Text(
            'Confirma tu Asistencia',
            style: GoogleFonts.greatVibes(
              fontSize: isMobile ? 40 : 56,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 2,
            color: WeddingConfig.primaryColor,
          ),
          const SizedBox(height: 20),
          Text(
            WeddingConfig.rsvpMessage,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white.withOpacity(0.8),
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 50),
          // RSVP Form or Success message
          _isSubmitted ? _buildSuccessMessage(isMobile) : _buildRsvpForm(isMobile),
          if (WeddingConfig.showGiftRegistry) ...[
            const SizedBox(height: 80),
            _buildGiftRegistry(isMobile),
          ],
        ],
      ),
    );
  }

  Widget _buildSuccessMessage(bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: EdgeInsets.all(isMobile ? 32 : 48),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: WeddingConfig.primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: WeddingConfig.primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check,
              size: 40,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '¡Gracias por confirmar!',
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 28 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            _isAttending
                ? 'Estamos emocionados de que nos acompañes en este día tan especial.'
                : 'Lamentamos que no puedas acompañarnos, pero te tendremos presente.',
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 16 : 18,
              color: Colors.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRsvpForm(bool isMobile) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 500),
      padding: EdgeInsets.all(isMobile ? 28 : 40),
      decoration: BoxDecoration(
        color: WeddingConfig.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Name field
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nombre completo',
                labelStyle: GoogleFonts.cormorantGaramond(
                  color: WeddingConfig.textLightColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: WeddingConfig.primaryColor,
                    width: 2,
                  ),
                ),
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: WeddingConfig.primaryColor,
                ),
              ),
              style: GoogleFonts.cormorantGaramond(
                fontSize: 18,
                color: WeddingConfig.textColor,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingresa tu nombre';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            // Attendance toggle
            Row(
              children: [
                Expanded(
                  child: _buildToggleButton(
                    'Asistiré',
                    Icons.check_circle_outline,
                    _isAttending,
                    () => setState(() => _isAttending = true),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildToggleButton(
                    'No podré asistir',
                    Icons.cancel_outlined,
                    !_isAttending,
                    () => setState(() => _isAttending = false),
                  ),
                ),
              ],
            ),
            if (_isAttending) ...[
              const SizedBox(height: 20),
              // Number of guests
              TextFormField(
                controller: _guestsController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  labelText: 'Número de invitados',
                  labelStyle: GoogleFonts.cormorantGaramond(
                    color: WeddingConfig.textLightColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: WeddingConfig.primaryColor,
                      width: 2,
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.people_outline,
                    color: WeddingConfig.primaryColor,
                  ),
                ),
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 18,
                  color: WeddingConfig.textColor,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa el número de invitados';
                  }
                  final num = int.tryParse(value);
                  if (num == null || num < 1) {
                    return 'Ingresa un número válido';
                  }
                  return null;
                },
              ),
            ],
            const SizedBox(height: 32),
            // Submit button
            SizedBox(
              width: double.infinity,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _submitForm,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    decoration: BoxDecoration(
                      color: WeddingConfig.primaryColor,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: WeddingConfig.primaryColor.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'Confirmar Asistencia',
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // WhatsApp alternative
            Text(
              'o confirma por WhatsApp',
              style: GoogleFonts.cormorantGaramond(
                fontSize: 14,
                color: WeddingConfig.textLightColor,
              ),
            ),
            const SizedBox(height: 12),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: _openWhatsApp,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF25D366),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.chat,
                        color: Colors.white,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'WhatsApp',
                        style: GoogleFonts.cormorantGaramond(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, IconData icon, bool isSelected, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            color: isSelected
                ? WeddingConfig.primaryColor.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? WeddingConfig.primaryColor
                  : WeddingConfig.textLightColor.withOpacity(0.3),
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 20,
                color: isSelected
                    ? WeddingConfig.primaryColor
                    : WeddingConfig.textLightColor,
              ),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: 14,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? WeddingConfig.primaryColor
                      : WeddingConfig.textLightColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGiftRegistry(bool isMobile) {
    return Column(
      children: [
        // Divider
        Row(
          children: [
            Expanded(
              child: Container(
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Icon(
                Icons.card_giftcard,
                color: WeddingConfig.primaryColor,
                size: 28,
              ),
            ),
            Expanded(
              child: Container(
                height: 1,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40),
        // Gift registry title
        Text(
          'Mesa de Regalos',
          style: GoogleFonts.greatVibes(
            fontSize: isMobile ? 36 : 48,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          WeddingConfig.giftRegistryText,
          textAlign: TextAlign.center,
          style: GoogleFonts.cormorantGaramond(
            fontSize: isMobile ? 18 : 22,
            color: Colors.white.withOpacity(0.9),
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(height: 30),
        // Bank info
        Container(
          constraints: const BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(isMobile ? 24 : 32),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: WeddingConfig.primaryColor.withOpacity(0.3),
            ),
          ),
          child: Column(
            children: [
              Icon(
                Icons.account_balance,
                color: WeddingConfig.primaryColor,
                size: 36,
              ),
              const SizedBox(height: 16),
              Text(
                WeddingConfig.bankInfo,
                textAlign: TextAlign.center,
                style: GoogleFonts.cormorantGaramond(
                  fontSize: isMobile ? 16 : 18,
                  color: Colors.white.withOpacity(0.9),
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 16),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: '123-456-789'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Número de cuenta copiado',
                          style: GoogleFonts.cormorantGaramond(),
                        ),
                        backgroundColor: WeddingConfig.primaryColor,
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: WeddingConfig.primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.copy,
                          size: 16,
                          color: WeddingConfig.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Copiar número',
                          style: GoogleFonts.cormorantGaramond(
                            fontSize: 14,
                            color: WeddingConfig.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // In a real app, you'd send this to a backend
      // For now, we'll just show success and open WhatsApp with the confirmation
      final message = _isAttending
          ? 'Hola! Soy ${_nameController.text} y confirmo mi asistencia a la boda con ${_guestsController.text} persona(s).'
          : 'Hola! Soy ${_nameController.text}, lamentablemente no podré asistir a la boda.';
      
      setState(() => _isSubmitted = true);
      
      // Optionally open WhatsApp with the message
      final url = 'https://wa.me/${WeddingConfig.whatsappNumber}?text=${Uri.encodeComponent(message)}';
      html.window.open(url, '_blank');
    }
  }

  void _openWhatsApp() {
    final message = 'Hola! Me gustaría confirmar mi asistencia a la boda de ${WeddingConfig.groomName} y ${WeddingConfig.brideName}.';
    final url = 'https://wa.me/${WeddingConfig.whatsappNumber}?text=${Uri.encodeComponent(message)}';
    html.window.open(url, '_blank');
  }
}
