import 'package:flutter/material.dart';
import 'package:ganesh_portfolio/controller/email_api.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

class ContactTablet extends StatefulWidget {
  @override
  _ContactTabletState createState() => _ContactTabletState();
}

class _ContactTabletState extends State<ContactTablet>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

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

  Future<void> _sendMessage() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String subject = subjectController.text.trim();
    String message = messageController.text.trim();

    if (name.isEmpty || email.isEmpty || subject.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('All fields are required!',
              style: GoogleFonts.poppins(fontSize: 16)),
        ),
      );
      return;
    }

    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Enter a valid email address!',
              style: GoogleFonts.poppins(fontSize: 16)),
        ),
      );
      return;
    }

    await ApiService.sendEmailJS(email, subject, message, name);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Email Sent Successfully!', style: GoogleFonts.poppins()),
        backgroundColor: Colors.blueGrey,
      ),
    );

    nameController.clear();
    emailController.clear();
    subjectController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.03,
            ),
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
            child: Center(
              child: Column(
                children: [
                  /// **Title Section**
                  FadeInUp(
                    duration: Duration(milliseconds: 800),
                    child: Column(
                      children: [
                        Text(
                          "Let's Connect!",
                          style: GoogleFonts.poppins(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.015),
                        Text(
                          "Feel free to reach out for collaboration or queries.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.025,
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  /// **Grid Layout**
                  Expanded(
                    child: Row(
                      children: [
                        /// **Left Section: Contact Information**
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _contactItem(
                                  Icons.email,
                                  "ganeshrawool@gmail.com",
                                  'mailto:ganeshrawool@gmail.com?subject=Inquiry'),
                              _contactItem(Icons.phone, "+91 9359169802",
                                  'tel:+919359169802'),
                              _contactItem(FontAwesomeIcons.whatsapp,
                                  "WhatsApp", 'https://wa.me/919359169802'),
                              SizedBox(height: screenHeight * 0.03),
                              _socialIconsRow(),
                            ],
                          ),
                        ),

                        SizedBox(width: screenWidth * 0.05),

                        /// **Right Section: Contact Form**
                        Expanded(
                          flex: 2,
                          child: FadeInRight(
                            duration: Duration(milliseconds: 100),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _animatedTextField("Your Name", nameController),
                                _animatedTextField(
                                    "Your Email", emailController),
                                _animatedTextField(
                                    "Subject", subjectController),
                                _animatedTextField("Message", messageController,
                                    maxLines: 4),
                                SizedBox(height: screenHeight * 0.03),

                                /// **Send Button**
                                _gradientButton(
                                    "Send Message",
                                    Color.fromARGB(255, 3, 141, 35),
                                    _sendMessage),
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
      },
    );
  }

  /// **Reusable Contact Item**
  Widget _contactItem(IconData icon, String text, String url) {
    return Row(
      children: [
        IconButton(
          icon: Icon(icon, color: Colors.blue),
          onPressed: () => _launchURL(url),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  /// **Animated Text Field**
  Widget _animatedTextField(String hint, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  /// **Social Media Icons**
  Widget _socialIconsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _socialIcon(FontAwesomeIcons.instagram, 'https://www.instagram.com/'),
        SizedBox(width: 15),
        _socialIcon(FontAwesomeIcons.twitter, 'https://www.twitter.com/'),
        SizedBox(width: 15),
        _socialIcon(FontAwesomeIcons.whatsapp, 'https://wa.me/919359169802'),
      ],
    );
  }

  /// **Reusable Social Icon**
  Widget _socialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: Colors.white, size: 28),
      onPressed: () => _launchURL(url),
    );
  }

  /// **Reusable Gradient Button**
  Widget _gradientButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      child: Text(
        text,
        style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
