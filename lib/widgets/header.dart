import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/profile.png'), //profile picture
        ),
        const SizedBox(height: 15),
        Text(
          "Vibhab Timsina",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          "Full-Stack Developer & Game Programmer with experience in Flutter, Unity, and the MERN stack. I want to build everything from mobile apps to 3D games.",
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(color: Colors.black87, height: 1.5),
        ),
      ],
    );
  }
}
