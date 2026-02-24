import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/wedding_config.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: WeddingConfig.backgroundColor,
      ),
      child: Column(
        children: [
          // Parents section
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: isMobile ? 60 : 80,
            ),
            child: Column(
              children: [
                Text(
                  'Con la bendición de nuestros padres',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 20 : 24,
                    fontStyle: FontStyle.italic,
                    color: WeddingConfig.textLightColor,
                  ),
                ),
                const SizedBox(height: 40),
                isMobile
                    ? Column(
                        children: [
                          _buildParentsCard(
                            'Padres del Novio',
                            WeddingConfig.groomFather,
                            WeddingConfig.groomMother,
                            isMobile,
                          ),
                          const SizedBox(height: 32),
                          _buildParentsCard(
                            'Padres de la Novia',
                            WeddingConfig.brideFather,
                            WeddingConfig.brideMother,
                            isMobile,
                          ),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: _buildParentsCard(
                              'Padres del Novio',
                              WeddingConfig.groomFather,
                              WeddingConfig.groomMother,
                              isMobile,
                            ),
                          ),
                          const SizedBox(width: 60),
                          // Center ornament
                          Column(
                            children: [
                              const SizedBox(height: 30),
                              Icon(
                                Icons.favorite,
                                color: WeddingConfig.primaryColor,
                                size: 32,
                              ),
                            ],
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            child: _buildParentsCard(
                              'Padres de la Novia',
                              WeddingConfig.brideFather,
                              WeddingConfig.brideMother,
                              isMobile,
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          ),
          // Quote section
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 32 : 120,
              vertical: isMobile ? 40 : 60,
            ),
            color: WeddingConfig.primaryColor.withOpacity(0.05),
            child: Column(
              children: [
                Icon(
                  Icons.format_quote,
                  color: WeddingConfig.primaryColor,
                  size: 40,
                ),
                const SizedBox(height: 20),
                Text(
                  '"El amor es paciente, es bondadoso. El amor no es envidioso ni jactancioso ni orgulloso."',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 20 : 26,
                    fontStyle: FontStyle.italic,
                    color: WeddingConfig.textColor,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '1 Corintios 13:4',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 14 : 16,
                    fontWeight: FontWeight.w600,
                    color: WeddingConfig.primaryColor,
                  ),
                ),
              ],
            ),
          ),
          // Final footer
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 80,
              vertical: 32,
            ),
            color: WeddingConfig.secondaryColor,
            child: Column(
              children: [
                Text(
                  '${WeddingConfig.groomName} & ${WeddingConfig.brideName}',
                  style: GoogleFonts.greatVibes(
                    fontSize: isMobile ? 32 : 40,
                    color: WeddingConfig.primaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  WeddingConfig.weddingDateText,
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 14 : 16,
                    color: Colors.white.withOpacity(0.7),
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  width: 60,
                  height: 1,
                  color: WeddingConfig.primaryColor.withOpacity(0.5),
                ),
                const SizedBox(height: 24),
                Text(
                  '#${WeddingConfig.groomName}Y${WeddingConfig.brideName}2026',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: isMobile ? 14 : 16,
                    color: WeddingConfig.primaryColor,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Hecho con ❤️',
                  style: GoogleFonts.cormorantGaramond(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParentsCard(String title, String father, String mother, bool isMobile) {
    return Column(
      children: [
        Text(
          title,
          style: GoogleFonts.cormorantGaramond(
            fontSize: isMobile ? 14 : 16,
            color: WeddingConfig.primaryColor,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          father,
          style: GoogleFonts.cormorantGaramond(
            fontSize: isMobile ? 22 : 26,
            fontWeight: FontWeight.w600,
            color: WeddingConfig.textColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          '&',
          style: GoogleFonts.greatVibes(
            fontSize: isMobile ? 24 : 28,
            color: WeddingConfig.primaryColor,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          mother,
          style: GoogleFonts.cormorantGaramond(
            fontSize: isMobile ? 22 : 26,
            fontWeight: FontWeight.w600,
            color: WeddingConfig.textColor,
          ),
        ),
      ],
    );
  }
}
