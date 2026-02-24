import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'config/wedding_config.dart';
import 'screens/invitation_page.dart';

void main() {
  runApp(const WeddingInvitationApp());
}

class WeddingInvitationApp extends StatelessWidget {
  const WeddingInvitationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '${WeddingConfig.groomName} & ${WeddingConfig.brideName}',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          primary: WeddingConfig.primaryColor,
          secondary: WeddingConfig.secondaryColor,
          surface: WeddingConfig.backgroundColor,
        ),
        textTheme: GoogleFonts.cormorantGaramondTextTheme().copyWith(
          displayLarge: GoogleFonts.greatVibes(
            fontSize: 72,
            color: WeddingConfig.textColor,
          ),
          displayMedium: GoogleFonts.cormorantGaramond(
            fontSize: 48,
            fontWeight: FontWeight.w600,
            color: WeddingConfig.textColor,
          ),
          bodyLarge: GoogleFonts.cormorantGaramond(
            fontSize: 20,
            color: WeddingConfig.textColor,
          ),
        ),
        scaffoldBackgroundColor: WeddingConfig.backgroundColor,
      ),
      home: const InvitationPage(),
    );
  }
}
