import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutTablet extends StatefulWidget {
  @override
  _AboutTabletState createState() => _AboutTabletState();
}

class _AboutTabletState extends State<AboutTablet> {
  int selectedIndex = 0;

  final List<String> tabs = [
    "Experience",
    "Education",
    "Skills",
    "Programming Languages"
  ];

  final List<List<String>> tabContent = [
    [
      "Dec 2024 - Continue",
      "Flutter Intern at Incubator By Core2Web",
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
            horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// **Profile & About Info**
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// **Left Section - Profile Image**
                  Expanded(
                    flex: 1,
                    child: FadeInLeft(
                      duration: Duration(milliseconds: 800),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: screenWidth * 0.35,
                                height: screenWidth * 0.35,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: RadialGradient(
                                    colors: [
                                      Colors.deepPurple.shade800
                                          .withOpacity(0.5),
                                      Colors.blue.shade900.withOpacity(0.3),
                                      Colors.teal.shade700.withOpacity(0.2),
                                      Colors.transparent,
                                    ],
                                    center: Alignment(-0.2, -0.5),
                                    focal: Alignment(0.5, 0.3),
                                    stops: [0.2, 0.5, 0.8, 1.0],
                                  ),
                                ),
                              ),

                              /// **Profile Image**
                              Container(
                                width: screenWidth * 0.26,
                                height: screenWidth * 0.26,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.5),
                                    width: 3,
                                  ),
                                ),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/Ganesh_image.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.03),

                  /// **Right Section - All Text Content**
                  Expanded(
                    flex: 2,
                    child: FadeInRight(
                      duration: Duration(milliseconds: 800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "About Me",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            "Ganesh Rawool",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),

                          /// **Animated Flutter Developer Text**
                          DefaultTextStyle(
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.028,
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
                          Text(
                            "I am an experienced Flutter developer specializing in building responsive, scalable, and cross-platform applications. "
                            "My expertise includes creating fluid UI/UX experiences and optimizing performance.",
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.018,
                              color: Colors.white60,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(tabs.length, (index) {
        return GestureDetector(
          onTap: () => setState(() => selectedIndex = index),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text(
                  tabs[index],
                  style: GoogleFonts.poppins(
                    fontSize: MediaQuery.of(context).size.width * 0.02,
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
                  width: selectedIndex == index ? 50 : 0,
                  color: Colors.orangeAccent,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  /// **Dynamic Content Section Below Tabs with Scalable Text**
  Widget _aboutSection(List<String> points) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points
            .map(
              (point) => Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  point,
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.018, // Scalable text size
                    fontWeight: FontWeight.w500,
                    color: point.contains("•")
                        ? Colors.white70
                        : Colors.orangeAccent,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
