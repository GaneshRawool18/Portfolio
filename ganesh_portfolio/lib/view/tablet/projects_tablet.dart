import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsTablet extends StatelessWidget {
  final List<Map<String, String>> projects = [
    {
      "title": "Flutter App",
      "description": "A beautiful cross-platform app.",
      "imageUrl": "assets/images/developer.png",
      "githubUrl": "https://github.com/GaneshRawool18/campusCloud",
    },
    {
      "title": "ToDo App",
      "description": "Task Management App",
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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade900, Colors.indigo.shade900],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Projects",
              style: GoogleFonts.poppins(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: screenHeight * 0.03),

            // Grid Layout for Better UI
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.symmetric(vertical: 10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two projects per row for tablet view
                  crossAxisSpacing: screenWidth * 0.04,
                  mainAxisSpacing: screenHeight * 0.03,
                  childAspectRatio:
                      1.2, // Adjusting aspect ratio for better spacing
                ),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  return _projectCard(
                    projects[index]["title"]!,
                    projects[index]["description"]!,
                    projects[index]["imageUrl"]!,
                    projects[index]["githubUrl"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// **Reusable Project Card**
  Widget _projectCard(
      String title, String description, String imageUrl, String githubUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imageUrl, width: 80, height: 80),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            description,
            style: GoogleFonts.poppins(fontSize: 14, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () => _launchGitHub(githubUrl),
            icon: Icon(Icons.code, size: 20, color: Colors.white),
            label: Text("GitHub",
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orangeAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
          ),
        ],
      ),
    );
  }
}
