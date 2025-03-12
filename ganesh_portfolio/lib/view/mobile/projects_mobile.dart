import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:ganesh_portfolio/widgets/project_card.dart';
import 'package:url_launcher/url_launcher.dart';

/// **Projects Mobile View**
class ProjectsMobile extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      "title": "Flutter App",
      "description": "A beautiful cross-platform app.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl": "https://github.com/GaneshRawool18/campusCloud",
    },
    {
      "title": "ToDoApp",
      "description": "A simple yet powerful To-Do application.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl": "https://github.com/GaneshRawool18/ToDoApp",
    },
  ];

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

    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInUp(
                duration: Duration(milliseconds: 800),
                child: Text(
                  "Projects",
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.08,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Expanded(
                child: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return FadeInUp(
                      duration: Duration(milliseconds: 600 + (index * 100)),
                      child: Column(
                        children: [
                          ProjectCard(
                            title: projects[index]['title']!,
                            description: projects[index]['description']!,
                            imageUrl: projects[index]['imageUrl']!,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () =>
                                _launchGitHub(projects[index]['githubUrl']!),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purple.shade900,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              "View on GitHub",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
