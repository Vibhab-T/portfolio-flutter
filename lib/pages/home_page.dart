import 'package:flutter/material.dart';
import 'package:portfolio/data/project_data.dart';
import 'package:portfolio/widgets/contacts_section.dart';
import 'package:portfolio/widgets/custom_carousel_view.dart';
import 'package:portfolio/widgets/header.dart';
import 'package:portfolio/widgets/project_card.dart';
import 'package:portfolio/widgets/skill_section.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const HomePage({
    super.key,
    this.isDarkMode = false,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  //String _activeSection = 'home';

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_updateActiveSection);
  }

  void _updateActiveSection() {
    // You can implement scroll-based section detection here
  }

  // void _scrollToSection(String section) {
  //   setState(() => _activeSection = section);
  // }

  void _openCV() async {
    final url = Uri.parse("assets/cv.pdf");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: Theme.of(context).brightness == Brightness.dark
                  ? [const Color(0xFF0C2340), const Color(0xFF1E3A5F)]
                  : [const Color(0xFFFAFAFA), const Color(0xFFDBEAFE)],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Section
                const Header(),
                const SizedBox(height: 60),

                // Projects Section Card
                _buildSectionCard(
                  context,
                  title: "Projects",
                  child: Column(
                    children: [
                      CustomCarouselView(
                        height: 300,
                        cardsToShow: 1,
                        children: projectList
                            .map((project) => ProjectCard(project: project))
                            .toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 60),

                // Skills Section Card
                _buildSectionCard(
                  context,
                  title: "Skills & Technologies",
                  child: const SkillsSection(),
                ),
                const SizedBox(height: 60),

                // Contact Section Card
                _buildSectionCard(
                  context,
                  title: "Get In Touch",
                  child: ContactSection(),
                ),
                const SizedBox(height: 60),

                // CV Download Button
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

                // Footer
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
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context, {
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1E3A5F)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF3B82F6).withOpacity(0.2)
              : const Color(0xFFDBEAFE),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF3B82F6).withOpacity(
              Theme.of(context).brightness == Brightness.dark ? 0.15 : 0.08,
            ),
            blurRadius: 20,
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 24),
          child,
        ],
      ),
    );
  }
}
