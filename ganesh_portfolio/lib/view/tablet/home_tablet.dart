import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ganesh_portfolio/widgets/animated_button.dart';

class HomeTablet extends StatefulWidget {
  @override
  _HomeTabletState createState() => _HomeTabletState();
}

class _HomeTabletState extends State<HomeTablet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
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
            child: child,
          );
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.05,
          ),
          child: Column(
            children: [
              /// **Main Content (Text + Image Section)**
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// **Left Section - Text & Buttons**
                    Expanded(
                      child: FadeInLeft(
                        duration: Duration(milliseconds: 800),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi! I'm",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.03,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              "Ganesh Rawool",
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            DefaultTextStyle(
                              style: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
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
                            SizedBox(height: screenHeight * 0.03),
                            Row(
                              children: [
                                _socialIcon(
                                    FontAwesomeIcons.linkedin,
                                    'https://www.linkedin.com/in/ganesh-rawool-4287932a9/',
                                    Colors.blue),
                                SizedBox(width: 15),
                                _socialIcon(
                                    FontAwesomeIcons.github,
                                    'https://github.com/GaneshRawool18',
                                    Colors.white),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.03),
                            AnimatedButton(
                              text: "Download CV",
                              textStyle: GoogleFonts.poppins(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// **Right Section - Profile Image with Glow**
                    Expanded(
                      child: BounceInRight(
                        duration: Duration(milliseconds: 1200),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            /// **Circular Gradient Glow**
                            AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Container(
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
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 196, 14, 166)
                                            .withOpacity(0.6),
                                        blurRadius: 10,
                                        spreadRadius: 15,
                                        offset: Offset(-15, 20),
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(255, 9, 159, 179)
                                            .withOpacity(0.5),
                                        blurRadius: 10,
                                        spreadRadius: 10,
                                        offset: Offset(10, -30),
                                      ),
                                      BoxShadow(
                                        color: Color.fromARGB(255, 4, 65, 130)
                                            .withOpacity(0.4),
                                        blurRadius: 10,
                                        spreadRadius: 10,
                                        offset: Offset(-5, -20),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),

                            /// **Profile Image**
                            Container(
                              width: screenWidth * 0.35,
                              height: screenWidth * 0.35,
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
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// **Reusable Social Icon**
  Widget _socialIcon(IconData icon, String url, Color color) {
    return GestureDetector(
      onTap: () => _launchURL(url),
      child: Icon(icon, color: color, size: 35),
    );
  }
}
