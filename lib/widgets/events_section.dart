import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../config/wedding_config.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

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
        color: WeddingConfig.secondaryColor.withOpacity(0.05),
      ),
      child: Column(
        children: [
          // Section title
          Text(
            'Ceremonia & Recepción',
            style: GoogleFonts.greatVibes(
              fontSize: isMobile ? 40 : 56,
              color: WeddingConfig.textColor,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: 80,
            height: 2,
            color: WeddingConfig.primaryColor,
          ),
          const SizedBox(height: 60),
          // Events grid
          isMobile
              ? Column(
                  children: [
                    _buildEventCard(
                      icon: Icons.church,
                      title: 'Ceremonia Religiosa',
                      time: WeddingConfig.ceremonyTime,
                      venue: WeddingConfig.ceremonyVenue,
                      address: WeddingConfig.ceremonyAddress,
                      city: WeddingConfig.ceremonyCity,
                      mapsUrl: WeddingConfig.ceremonyMapsUrl,
                      isMobile: isMobile,
                    ),
                    const SizedBox(height: 32),
                    _buildEventCard(
                      icon: Icons.celebration,
                      title: 'Recepción',
                      time: WeddingConfig.receptionTime,
                      venue: WeddingConfig.receptionVenue,
                      address: WeddingConfig.receptionAddress,
                      city: WeddingConfig.receptionCity,
                      mapsUrl: WeddingConfig.receptionMapsUrl,
                      isMobile: isMobile,
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: _buildEventCard(
                        icon: Icons.church,
                        title: 'Ceremonia Religiosa',
                        time: WeddingConfig.ceremonyTime,
                        venue: WeddingConfig.ceremonyVenue,
                        address: WeddingConfig.ceremonyAddress,
                        city: WeddingConfig.ceremonyCity,
                        mapsUrl: WeddingConfig.ceremonyMapsUrl,
                        isMobile: isMobile,
                      ),
                    ),
                    const SizedBox(width: 40),
                    Expanded(
                      child: _buildEventCard(
                        icon: Icons.celebration,
                        title: 'Recepción',
                        time: WeddingConfig.receptionTime,
                        venue: WeddingConfig.receptionVenue,
                        address: WeddingConfig.receptionAddress,
                        city: WeddingConfig.receptionCity,
                        mapsUrl: WeddingConfig.receptionMapsUrl,
                        isMobile: isMobile,
                      ),
                    ),
                  ],
                ),
          const SizedBox(height: 60),
          // Dress code
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 24 : 48,
              vertical: isMobile ? 20 : 32,
            ),
            decoration: BoxDecoration(
              color: WeddingConfig.backgroundColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: WeddingConfig.primaryColor.withOpacity(0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.checkroom,
                  color: WeddingConfig.primaryColor,
                  size: isMobile ? 28 : 36,
                ),
                SizedBox(width: isMobile ? 16 : 24),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Código de Vestimenta',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: isMobile ? 14 : 16,
                        color: WeddingConfig.textLightColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      WeddingConfig.dressCode,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: isMobile ? 20 : 24,
                        fontWeight: FontWeight.bold,
                        color: WeddingConfig.textColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required IconData icon,
    required String title,
    required String time,
    required String venue,
    required String address,
    required String city,
    required String mapsUrl,
    required bool isMobile,
  }) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 28 : 40),
      decoration: BoxDecoration(
        color: WeddingConfig.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          // Icon
          Container(
            width: isMobile ? 70 : 90,
            height: isMobile ? 70 : 90,
            decoration: BoxDecoration(
              color: WeddingConfig.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: isMobile ? 32 : 40,
              color: WeddingConfig.primaryColor,
            ),
          ),
          const SizedBox(height: 24),
          // Title
          Text(
            title,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: WeddingConfig.textColor,
            ),
          ),
          const SizedBox(height: 16),
          // Time
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: BoxDecoration(
              color: WeddingConfig.primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              time,
              style: GoogleFonts.cormorantGaramond(
                fontSize: isMobile ? 16 : 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Venue
          Text(
            venue,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 20 : 22,
              fontWeight: FontWeight.w600,
              color: WeddingConfig.textColor,
            ),
          ),
          const SizedBox(height: 8),
          // Address
          Text(
            address,
            textAlign: TextAlign.center,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 14 : 16,
              color: WeddingConfig.textLightColor,
            ),
          ),
          Text(
            city,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 14 : 16,
              color: WeddingConfig.textLightColor,
            ),
          ),
          const SizedBox(height: 24),
          // Map button
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _openMaps(mapsUrl),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: WeddingConfig.primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 18,
                      color: WeddingConfig.primaryColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Ver en Mapa',
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
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
    );
  }

  void _openMaps(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
