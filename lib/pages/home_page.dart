import 'package:flutter/material.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:portfolio/widgets/contacts_section.dart';
import 'package:portfolio/widgets/custom_carousel_view.dart';
import 'package:portfolio/widgets/header.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/skill_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _openCV() async {
    final url = Uri.parse("");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(),
            const SizedBox(height: 30),
            Text(
              "Projects",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),

            // Projects Carousel - 1 card visible
            CustomCarouselView(
              height: 300,
              cardsToShow: 1,
              children: projectList
                  .map((project) => ProjectCard(project: project))
                  .toList(),
            ),

            const SizedBox(height: 40),

            const SkillsSection(),

            const SizedBox(height: 40),

            ContactSection(),

            const SizedBox(height: 40),

            // CV download button
            Center(
              child: ElevatedButton.icon(
                onPressed: _openCV,
                icon: const Icon(Icons.download),
                label: const Text("Download CV"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 15,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),

            Center(
              child: Text(
                "Made With Flutter",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
