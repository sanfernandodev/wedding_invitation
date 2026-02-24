import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../config/wedding_config.dart';

class CountdownSection extends StatefulWidget {
  const CountdownSection({super.key});

  @override
  State<CountdownSection> createState() => _CountdownSectionState();
}

class _CountdownSectionState extends State<CountdownSection> {
  late Timer _timer;
  Duration _timeRemaining = Duration.zero;

  @override
  void initState() {
    super.initState();
    _calculateTimeRemaining();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _calculateTimeRemaining();
    });
  }

  void _calculateTimeRemaining() {
    final now = DateTime.now();
    final difference = WeddingConfig.weddingDate.difference(now);
    if (mounted) {
      setState(() {
        _timeRemaining = difference.isNegative ? Duration.zero : difference;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    final days = _timeRemaining.inDays;
    final hours = _timeRemaining.inHours % 24;
    final minutes = _timeRemaining.inMinutes % 60;
    final seconds = _timeRemaining.inSeconds % 60;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 80,
      ),
      decoration: BoxDecoration(
        color: WeddingConfig.secondaryColor,
      ),
      child: Column(
        children: [
          Text(
            'Faltan',
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 20 : 24,
              color: Colors.white.withOpacity(0.8),
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: isMobile ? 16 : 40,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: [
              _buildCountdownItem(days.toString().padLeft(2, '0'), 'Días', isMobile),
              _buildCountdownItem(hours.toString().padLeft(2, '0'), 'Horas', isMobile),
              _buildCountdownItem(minutes.toString().padLeft(2, '0'), 'Minutos', isMobile),
              _buildCountdownItem(seconds.toString().padLeft(2, '0'), 'Segundos', isMobile),
            ],
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            decoration: BoxDecoration(
              border: Border.all(
                color: WeddingConfig.primaryColor.withOpacity(0.5),
              ),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              '${WeddingConfig.weddingDateText} • ${WeddingConfig.ceremonyTime}',
              style: GoogleFonts.cormorantGaramond(
                fontSize: isMobile ? 16 : 18,
                color: WeddingConfig.primaryColor,
                letterSpacing: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCountdownItem(String value, String label, bool isMobile) {
    return Container(
      width: isMobile ? 70 : 100,
      padding: EdgeInsets.symmetric(vertical: isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: WeddingConfig.primaryColor.withOpacity(0.3),
        ),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 36 : 48,
              fontWeight: FontWeight.bold,
              color: WeddingConfig.primaryColor,
              height: 1,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: GoogleFonts.cormorantGaramond(
              fontSize: isMobile ? 12 : 14,
              color: Colors.white.withOpacity(0.7),
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
