import 'package:portfolio/models/project.dart';

final List<Project> projectList = [
  Project(
    title: 'Web E Commerce',
    description:
        'An ecommerce web app made primarily to integrate eSewa payment integration. Learned a lot about the standard of backend coding on Node.js/Express.js',
    link: 'https://github.com/Vibhab-T/ecom-front-and-back',
    images: [
      'assets/store1.png',
      'assets/store2.png',
      'assets/store3.png',
      'assets/store4.png',
    ],
    tags: ["Node.js", "eSewa Payment", "REST Apis", "HTML/CSS/JS"],
  ),
  Project(
    title: "Wave Function Collapse: Map Generator",
    description:
        "A procedural map generation algorithm’s framework for Unity. Uses tile-based Wave Function Collapse to generate coherent and valid maps. Built for a college project.",
    link: "https://github.com/Vibhab-T/wfc-procgen-a-star",
    images: ["assets/WFC.png", "assets/wfc2.png", "assets/wfc3.png"],
    tags: ["ProcGen", "Unity/C#", "A* Pathdfinding"],
  ),
  Project(
    title: "Flutter E-Commerce",
    description:
        "An ecommerce app, made in flutter, to showcase a typical ecommerce design with working cart using state management",
    link: "https://github.com/Vibhab-T/buy-dune-books",
    images: [
      "assets/dune.png",
      "assets/dune2.png",
      "assets/dune3.png",
      "assets/dune4.png",
      "assets/dune5.png",
    ],
    tags: ["Ecommerce", "Flutter", "State Management"],
  ),
  Project(
    title: "MERN Chat App",
    description:
        "A real-time chatting app made with the MERN stack. Includes user authentication, login, and real-time chatting via socket.io.",
    link: "https://github.com/Vibhab-T/express-chat",
    images: ["assets/chat.png", "assets/chat3.png", "assets/chat4.png"],
    tags: ["MERN", "Socket.io", "Real Time"],
  ),
  Project(
    title: "Little Knight: 2D Platformer",
    description: "A 2D platformer game made in the Godot engine.",
    link: "https://github.com/Vibhab-T/little-knight",
    images: ["assets/lk.png", "assets/lk2.png", "assets/lk3.png"],
    tags: ["Godot", "2D", "Platformer"],
  ),
  Project(
    title: "3D-Arena-Royale",
    description:
        "A 3D battle royale-type game made in the Godot engine with player movement, shooting, and arena logic.",
    link: "https://github.com/Vibhab-T/3D-Arena-Royale",
    images: ["assets/ar.png", "assets/ar2.png", "assets/ar3.png"],
    tags: ["Godot", "3D", "Platformer/Royale"],
  ),
  Project(
    title: "Flutter YT Downloader",
    description:
        "A Flutter app that downloads YouTube audio locally — made because I didn’t want to pay for Spotify.",
    link: "https://github.com/Vibhab-T/Stream",
    images: ["assets/stream.png", "assets/stream2.png", "assets/stream3.png"],
    tags: ["Flutter", "Express", "Shell commands"],
  ),
  Project(
    title: "Unity Race Manager",
    description:
        "A prototype for a racing game with car controls, checkpoints, timers, and position tracking logic.",
    link: "https://github.com/Vibhab-T/unity-race-manager",
    images: ["assets/urm.png", "assets/urm2.png", "assets/urm3.png"],
    tags: ["Unity", "3D", "Code Snippet"],
  ),
  Project(
    title: "Squash!",
    description: "A 3D game made following the Godot tutorial documentation.",
    link: "https://github.com/Vibhab-T/gd-docs",
    images: ["assets/squash.png", "assets/squash2.png"],
    tags: ["Godot", "3D"],
  ),
];
