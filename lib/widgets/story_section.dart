import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/wedding_config.dart';

class StorySection extends StatelessWidget {
  const StorySection({super.key});

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
      decoration: const BoxDecoration(
        color: WeddingConfig.backgroundColor,
      ),
      child: Column(
        children: [
          // Section title
          Text(
            'Nuestra Historia',
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
          // Timeline
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: WeddingConfig.loveStory.asMap().entries.map((entry) {
                final index = entry.key;
                final story = entry.value;
                final isLast = index == WeddingConfig.loveStory.length - 1;
                return _buildTimelineItem(
                  date: story['date']!,
                  title: story['title']!,
                  description: story['description']!,
                  isLast: isLast,
                  isMobile: isMobile,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    required String date,
    required String title,
    required String description,
    required bool isLast,
    required bool isMobile,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline line and dot
          SizedBox(
            width: 60,
            child: Column(
              children: [
                // Dot
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: WeddingConfig.backgroundColor,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: WeddingConfig.primaryColor,
                      width: 3,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: WeddingConfig.primaryColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                // Line
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: WeddingConfig.primaryColor.withOpacity(0.3),
                    ),
                  ),
              ],
            ),
          ),
          // Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: WeddingConfig.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      date,
                      style: GoogleFonts.cormorantGaramond(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: WeddingConfig.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Title
                  Text(
                    title,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: isMobile ? 24 : 28,
                      fontWeight: FontWeight.bold,
                      color: WeddingConfig.textColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Description
                  Text(
                    description,
                    style: GoogleFonts.cormorantGaramond(
                      fontSize: isMobile ? 16 : 18,
                      color: WeddingConfig.textLightColor,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
