import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:animate_do/animate_do.dart';

/// **Contact Mobile View**
class ContactMobile extends StatefulWidget {
  @override
  _ContactMobileState createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile>
    with SingleTickerProviderStateMixin {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController messageController = TextEditingController();
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
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch $url');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Could not open link', style: GoogleFonts.poppins())),
    );
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

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Message Sent Successfully!', style: GoogleFonts.poppins()),
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

    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
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
            child: child,
          );
        },
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FadeInUp(
                  duration: Duration(milliseconds: 800),
                  child: Text(
                    "Let's Connect!",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                _contactItem(Icons.email, "ganeshrawool@gmail.com",
                    'mailto:ganeshrawool@gmail.com?subject=Inquiry'),
                _contactItem(
                    Icons.phone, "+91 9359169802", 'tel:+919359169802'),
                _contactItem(FontAwesomeIcons.whatsapp, "WhatsApp",
                    'https://wa.me/919359169802'),
                SizedBox(height: screenHeight * 0.03),
                _animatedTextField("Your Name", nameController),
                _animatedTextField("Your Email", emailController),
                _animatedTextField("Subject", subjectController),
                _animatedTextField("Message", messageController, maxLines: 5),
                SizedBox(height: screenHeight * 0.03),
                ElevatedButton(
                  onPressed: _sendMessage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple.shade900,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Send Message",
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _socialIcon(FontAwesomeIcons.linkedin,
                        'https://www.linkedin.com/in/ganesh-rawool-4287932a9/'),
                    _socialIcon(FontAwesomeIcons.github,
                        'https://github.com/GaneshRawool18'),
                    // _socialIcon(FontAwesomeIcons.gitlab, 'https://gitlab.com/'),
                    _socialIcon(FontAwesomeIcons.instagram,
                        'https://www.instagram.com/'),
                    _socialIcon(
                        FontAwesomeIcons.twitter, 'https://www.twitter.com/'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
        )
      ],
    );
  }

  /// **Reusable Animated Text Field**
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

  /// **Reusable Social Icon**
  Widget _socialIcon(IconData icon, String url) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 30),
        onPressed: () => _launchURL(url),
      ),
    );
  }
}
