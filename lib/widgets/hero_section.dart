import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/wedding_config.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: screenHeight,
      ),
      decoration: BoxDecoration(
        color: WeddingConfig.backgroundColor,
        image: const DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1519741497674-611481863552?w=1920&q=80',
          ),
          fit: BoxFit.cover,
          opacity: 0.15,
        ),
      ),
      child: Stack(
        children: [
          // Decorative elements
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    WeddingConfig.backgroundColor,
                    WeddingConfig.backgroundColor.withOpacity(0),
                  ],
                ),
              ),
            ),
          ),
          // Floral decoration top left
          if (!isMobile)
            Positioned(
              top: -50,
              left: -50,
              child: Opacity(
                opacity: 0.1,
                child: Icon(
                  Icons.local_florist,
                  size: 300,
                  color: WeddingConfig.primaryColor,
                ),
              ),
            ),
          // Floral decoration bottom right
          if (!isMobile)
            Positioned(
              bottom: -50,
              right: -50,
              child: Transform.rotate(
                angle: 3.14,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Icons.local_florist,
                    size: 300,
                    color: WeddingConfig.primaryColor,
                  ),
                ),
              ),
            ),
          // Main content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 24 : 80,
                vertical: isMobile ? 60 : 80,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Ornament top
                  _buildOrnament(),
                  const SizedBox(height: 20),
                  // "Nuestra Boda" text
                  Text(
                    'Nuestra Boda',
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: isMobile ? 16 : 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 8,
                      color: WeddingConfig.primaryColor,
                    ),
                  ),
                  SizedBox(height: isMobile ? 30 : 40),
                  // Names
                  Text(
                    WeddingConfig.groomName,
                    style: GoogleFonts.greatVibes(
                      fontSize: isMobile ? 56 : 96,
                      color: WeddingConfig.textColor,
                      height: 0.9,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '&',
                      style: GoogleFonts.greatVibes(
                        fontSize: isMobile ? 40 : 60,
                        color: WeddingConfig.primaryColor,
                      ),
                    ),
                  ),
                  Text(
                    WeddingConfig.brideName,
                    style: GoogleFonts.greatVibes(
                      fontSize: isMobile ? 56 : 96,
                      color: WeddingConfig.textColor,
                      height: 0.9,
                    ),
                  ),
                  SizedBox(height: isMobile ? 30 : 50),
                  // Divider
                  Container(
                    width: isMobile ? 150 : 200,
                    height: 1,
                    color: WeddingConfig.primaryColor.withOpacity(0.5),
                  ),
                  SizedBox(height: isMobile ? 30 : 50),
                  // Date
                  Text(
                    WeddingConfig.weddingDateText,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: isMobile ? 24 : 32,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                      color: WeddingConfig.textColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Location
                  Text(
                    WeddingConfig.ceremonyCity,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: isMobile ? 16 : 20,
                      color: WeddingConfig.textLightColor,
                      letterSpacing: 2,
                    ),
                  ),
                  SizedBox(height: isMobile ? 40 : 60),
                  // Welcome message
                  Container(
                    constraints: BoxConstraints(maxWidth: isMobile ? 300 : 500),
                    child: Text(
                      WeddingConfig.welcomeMessage,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: isMobile ? 18 : 22,
                        fontStyle: FontStyle.italic,
                        color: WeddingConfig.textLightColor,
                        height: 1.8,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Ornament bottom
                  _buildOrnament(),
                  const SizedBox(height: 40),
                  // Scroll indicator
                  _buildScrollIndicator(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrnament() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                WeddingConfig.primaryColor,
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            Icons.favorite,
            size: 16,
            color: WeddingConfig.primaryColor,
          ),
        ),
        Container(
          width: 60,
          height: 1,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                WeddingConfig.primaryColor,
                Colors.transparent,
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScrollIndicator() {
    return Column(
      children: [
        Text(
          'Desliza para ver más',
          style: GoogleFonts.cormorantGaramond(
            fontSize: 14,
            color: WeddingConfig.textLightColor,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 12),
        Icon(
          Icons.keyboard_arrow_down,
          color: WeddingConfig.primaryColor,
          size: 30,
        ),
      ],
    );
  }
}
