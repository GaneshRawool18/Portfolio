import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutMobile extends StatefulWidget {
  @override
  _AboutMobileState createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  int selectedIndex = 0;

  final List<String> tabs = ["Experience", "Education", "Skills", "Languages"];

  final List<List<String>> tabContent = [
    [
      "Dec 2024 - Continue",
      "Flutter Intern at Incubator System",
      "• Worked on real-world Flutter applications",
      "• Focused on UI/UX & state management",
    ],
    [
      "• B.Sc in Computer Science",
      "• Passionate about UI/UX & mobile development",
      "• Continuous learning through online courses",
    ],
    [
      "• Flutter, Dart, Firebase",
      "• REST APIs, State Management (Provider, Riverpod)",
      "• UI/UX, Animations, Performance Optimization",
      "• Agile development & Git version control",
    ],
    [
      "• Dart",
      "• Java",
      "• Python",
      "• C++",
      "• JavaScript",
    ],
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03, vertical: screenHeight * 0.03),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.deepPurple.shade900,
              Colors.indigo.shade900,
              Colors.teal.shade900,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// **Profile Image**
            CircleAvatar(
              radius: screenWidth * 0.23,
              backgroundImage: AssetImage("assets/images/Ganesh_image.png"),
            ),

            SizedBox(height: screenHeight * 0.02),

            /// **Name**
            Text(
              "Ganesh Rawool",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            SizedBox(height: screenHeight * 0.005),

            /// **Animated Flutter Developer Text**
            DefaultTextStyle(
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Flutter Developer',
                    speed: Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
              ),
            ),

            SizedBox(height: screenHeight * 0.02),

            /// **About Description**
            Text(
              "I am an experienced Flutter developer specializing in cross-platform applications. "
              "I focus on UI/UX, animations, and scalable architecture.",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.03,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: screenHeight * 0.02),

            /// **Tabs Below the Description**
            _tabSelection(),

            SizedBox(height: screenHeight * 0.02),

            /// **Content of Selected Tab**
            _aboutSection(tabContent[selectedIndex]),
          ],
        ),
      ),
    );
  }

  /// **Tab Selection Widget with Underline Animation**
  Widget _tabSelection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(tabs.length, (index) {
          return GestureDetector(
            onTap: () => setState(() => selectedIndex = index),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Text(
                    tabs[index],
                    style: GoogleFonts.poppins(
                      fontSize: MediaQuery.of(context).size.width * 0.028,
                      fontWeight: FontWeight.bold,
                      color: selectedIndex == index
                          ? Colors.orangeAccent
                          : Colors.white,
                    ),
                  ),
                  SizedBox(height: 3),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 2,
                    width: selectedIndex == index ? 40 : 0,
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  /// **Dynamic Content Section Below Tabs**
  Widget _aboutSection(List<String> points) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points
            .map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  point,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.023, // Scalable text size
                    fontWeight: FontWeight.w500,
                    color: point.contains("•")
                        ? Colors.white70
                        : Colors.orangeAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
