import 'package:flutter/material.dart';
import 'package:portfolio/models/contact_item.dart';
import 'package:portfolio/widgets/custom_carousel_view.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key});

  void _launchEmail() async {
    final url = Uri.parse(
      'mailto:vibhabtimsina86@gmail.com?subject=Portfolio%20Contact&body=Hello%20Vibhab,',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _showLaunchError();
    }
  }

  void _launchLinkedIn() async {
    final url = Uri.parse(
      'https://www.linkedin.com/in/vibhab-timsina-a83488238/',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _showLaunchError();
    }
  }

  void _launchGitHub() async {
    final url = Uri.parse('https://github.com/Vibhab-T');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _showLaunchError();
    }
  }

  void _launchPhone() async {
    final url = Uri.parse('tel:+9779860910899');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      _showLaunchError();
    }
  }

  void _showLaunchError() {
    print('Could not launch URL');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "I'm always open to discussing new opportunities, interesting projects, or just having a chat about technology and game development.",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(height: 1.6),
        ),

        const SizedBox(height: 30),

        // Contact Cards Carousel - 2 cards visible
        CustomCarouselView(
          height: 180,
          cardsToShow: 2,
          children: contactItems
              .map((contact) => _buildContactCard(context, contact))
              .toList(),
        ),

        const SizedBox(height: 30),

        // Quick Response Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.bolt,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Quick Response",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                "I typically respond to emails within 24 hours. For urgent matters, feel free to connect with me on LinkedIn for a faster response.",
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 25),

        // What I'm Interested In
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What I'm Looking For",
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  label: const Text("Flutter Development"),
                  backgroundColor: Colors.green.shade50,
                ),
                Chip(
                  label: const Text("Game Development"),
                  backgroundColor: Colors.purple.shade50,
                ),
                Chip(
                  label: const Text("Internships"),
                  backgroundColor: Colors.red.shade50,
                ),
                Chip(
                  label: const Text("Freelance Work"),
                  backgroundColor: Colors.teal.shade50,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildContactCard(BuildContext context, ContactItem contact) {
    return GestureDetector(
      onTap: contact.onTap,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: contact.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(contact.icon, color: contact.color, size: 28),
              ),
              const SizedBox(height: 4),
              Text(
                contact.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                contact.subtitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.black54,
                  height: 1.4,
                ),
              ),
              Row(
                children: [
                  Text(
                    "Tap to connect",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward,
                    size: 12,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<ContactItem> get contactItems {
    return [
      ContactItem(
        icon: Icons.email,
        title: "Email",
        subtitle: "vtimsina86@gmail.com",
        color: Colors.red.shade400,
        onTap: _launchEmail,
      ),
      ContactItem(
        icon: Icons.code,
        title: "GitHub",
        subtitle: "github.com/Vibhab-T",
        color: Colors.grey.shade800,
        onTap: _launchGitHub,
      ),
      ContactItem(
        icon: Icons.work,
        title: "LinkedIn",
        subtitle: "linkedin.com/in/vibhab-timsina",
        color: Colors.blue.shade700,
        onTap: _launchLinkedIn,
      ),
      ContactItem(
        icon: Icons.phone,
        title: "Phone",
        subtitle: "+977 986-0910899",
        color: Colors.green.shade600,
        onTap: _launchPhone,
      ),
    ];
  }
}
