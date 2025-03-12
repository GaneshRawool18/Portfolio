import 'package:flutter/material.dart';
import 'package:ganesh_portfolio/widgets/project_card.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ganesh_portfolio/view/desktop/project_detail_page.dart'; // Import the project detail page

class ProjectsDesktop extends StatefulWidget {
  @override
  _ProjectsDesktopState createState() => _ProjectsDesktopState();
}

class _ProjectsDesktopState extends State<ProjectsDesktop>
    with SingleTickerProviderStateMixin {
  int? hoveredIndex;
  late AnimationController _controller;

  final List<Map<String, String>> projects = [
    {
      "title": "Flutter App",
      "description": "A beautiful cross-platform app.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl":
          "https://github.com/GaneshRawool18/campusCloud", // ✅ GitHub Repo
    },
    {
      "title": "ToDoApp",
      "description": "An online shopping app.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl": "https://github.com/GaneshRawool18/ToDoApp",
    },
    {
      "title": "Portfolio Website",
      "description": "A personal portfolio built with Flutter.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl": "https://github.com/GaneshRawool18/campusCloud",
    },
    {
      "title": "Java Project",
      "description": "A core Java-based project with advanced features.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl": "https://github.com/GaneshRawool18/CaptchaApp",
    },
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 6),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// **Opens GitHub Repository**
  void _launchGitHub(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: screenHeight,
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.lerp(Colors.black, Colors.deepPurple.shade900,
                    _controller.value)!,
                Color.lerp(Colors.indigo.shade900, Colors.teal.shade900,
                    _controller.value)!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// **Title Section**
              FadeInUp(
                duration: Duration(milliseconds: 800),
                child: Text(
                  "Projects",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.035 > screenHeight * 0.05
                        ? screenHeight * 0.05
                        : screenWidth * 0.035, // Responsive font size
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              /// **Grid View of Projects**
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 60,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => hoveredIndex = index),
                      onExit: (_) => setState(() => hoveredIndex = null),
                      child: GestureDetector(
                        onTap: () {
                          /// **Navigate to Project Detail Page**
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProjectDetailPage(
                                title: projects[index]['title']!,
                                description: projects[index]['description']!,
                                imageUrl: projects[index]['imageUrl']!,
                                githubUrl: projects[index]['githubUrl']!,
                              ),
                            ),
                          );
                        },
                        child: BounceInUp(
                          duration: Duration(milliseconds: 600 + (index * 100)),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            transform: Matrix4.translationValues(
                                0, hoveredIndex == index ? -10 : 0, 0),
                            decoration: BoxDecoration(
                              boxShadow: hoveredIndex == index
                                  ? [
                                      BoxShadow(
                                        color:
                                            Colors.blueAccent.withOpacity(0.4),
                                        blurRadius: 20,
                                        spreadRadius: 5,
                                        offset: Offset(2, 4),
                                      ),
                                    ]
                                  : [],
                            ),
                            child: Column(
                              children: [
                                Expanded(
                                  child: ProjectCard(
                                    title: projects[index]['title']!,
                                    description: projects[index]
                                        ['description']!,
                                    imageUrl: projects[index]['imageUrl']!,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 3, horizontal: 15),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {
                                          _launchGitHub(
                                              projects[index]['githubUrl']!);
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.green,
                                          shadowColor: Colors.blue,
                                          padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.020,
                                            vertical: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.020,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        child: Text(
                                          "Navigate to GitHub",
                                          style: GoogleFonts.poppins(
                                            fontSize: screenWidth * 0.008,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      DefaultTextStyle(
                                        style: GoogleFonts.poppins(
                                          fontSize: screenWidth * 0.01,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white70,
                                        ),
                                        child: AnimatedTextKit(
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                              'Status: Completed',
                                              speed: const Duration(
                                                  milliseconds: 100),
                                            ),
                                          ],
                                          repeatForever: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.04),
            ],
          ),
        );
      },
    );
  }
}
