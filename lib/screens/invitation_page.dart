import 'package:flutter/material.dart';
import '../config/wedding_config.dart';
import '../widgets/hero_section.dart';
import '../widgets/countdown_section.dart';
import '../widgets/story_section.dart';
import '../widgets/events_section.dart';
import '../widgets/gallery_section.dart';
import '../widgets/rsvp_section.dart';
import '../widgets/footer_section.dart';

class InvitationPage extends StatelessWidget {
  const InvitationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeroSection(),
            if (WeddingConfig.showCountdown) const CountdownSection(),
            if (WeddingConfig.showLoveStory) const StorySection(),
            const EventsSection(),
            if (WeddingConfig.showGallery) const GallerySection(),
            if (WeddingConfig.showRsvpForm) const RsvpSection(),
            const FooterSection(),
          ],
        ),
      ),
    );
  }
}
