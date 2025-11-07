import 'package:flutter/material.dart';
import 'package:portfolio/widgets/custom_carousel_view.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "A versatile developer with experience across mobile apps, games, and full-stack web development.",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.6),
        ),
        const SizedBox(height: 30),

        // Programming Languages - 2 cards visible
        _buildSkillCategoryWithCarousel(context, "Programming Languages", [
          "Dart",
          "JavaScript",
          "Python",
          "C#",
          "GDScript",
        ], Colors.blue.shade400),

        const SizedBox(height: 30),

        // Frameworks & Technologies - 2 cards visible
        _buildSkillCategoryWithCarousel(context, "Frameworks & Technologies", [
          "Flutter",
          "Node.js",
          "Express.js",
          "React",
          "MERN Stack",
          "Socket.io",
        ], Colors.green.shade400),

        const SizedBox(height: 30),

        // Game Development - 2 cards visible
        _buildSkillCategoryWithCarousel(context, "Game Development", [
          "Unity",
          "Godot Engine",
          "2D/3D Development",
          "Game Physics",
          "Procedural Generation",
          "A* Pathfinding",
        ], Colors.purple.shade400),

        const SizedBox(height: 30),

        // Mobile & Web Development - 2 cards visible
        _buildSkillCategoryWithCarousel(context, "Mobile & Web Development", [
          "RESTful APIs",
          "Real-time Applications",
          "User Authentication",
          "UI/UX Design",
          "Responsive Design",
        ], Colors.orange.shade400),

        const SizedBox(height: 30),

        // Tools & Platforms - 2 cards visible
        _buildSkillCategoryWithCarousel(context, "Tools & Platforms", [
          "Git",
          "GitHub",
          "VS Code",
          "Android Studio",
          "Postman",
          "Shell Scripting",
        ], Colors.red.shade400),
      ],
    );
  }

  Widget _buildSkillCategoryWithCarousel(
    BuildContext context,
    String title,
    List<String> skills,
    Color primaryColor,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        CustomCarouselView(
          height: 150,
          cardsToShow: 2,
          children: skills
              .map((skill) => _buildSkillCard(context, skill, primaryColor))
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSkillCard(
    BuildContext context,
    String skill,
    Color primaryColor,
  ) {
    return Container(
      width: 120,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(_getSkillIcon(skill), color: primaryColor, size: 28),
          ),
          const SizedBox(height: 12),
          Text(
            skill,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  IconData _getSkillIcon(String skill) {
    switch (skill.toLowerCase()) {
      case 'dart':
      case 'flutter':
        return Icons.mobile_friendly;
      case 'javascript':
      case 'react':
      case 'node.js':
      case 'express.js':
      case 'mern stack':
        return Icons.code;
      case 'python':
        return Icons.psychology;
      case 'c#':
        return Icons.sports_esports;
      case 'gdscript':
      case 'unity':
      case 'godot engine':
      case '2d/3d development':
      case 'game physics':
      case 'procedural generation':
      case 'a* pathfinding':
        return Icons.videogame_asset;
      case 'restful apis':
      case 'real-time applications':
        return Icons.api;
      case 'user authentication':
        return Icons.security;
      case 'ui/ux design':
        return Icons.design_services;
      case 'responsive design':
        return Icons.design_services;
      case 'git':
      case 'github':
        return Icons.control_point;
      case 'vs code':
      case 'android studio':
        return Icons.developer_mode;
      case 'postman':
        return Icons.send;
      case 'shell scripting':
        return Icons.terminal;
      default:
        return Icons.star;
    }
  }
}
