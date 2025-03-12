import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:ganesh_portfolio/controller/navigation_provider.dart';

class NavBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "title": "Home",
      "gradient": [Colors.blue, Colors.cyan]
    },
    {
      "title": "About",
      "gradient": [Colors.purple, Colors.pink]
    },
    {
      "title": "Projects",
      "gradient": [Colors.orange, Colors.red]
    },
    {
      "title": "Contact",
      "gradient": [Colors.green, Colors.teal]
    },
  ];

  @override
  Widget build(BuildContext context) {
    var navigationProvider =
        Provider.of<NavigationProvider>(context, listen: false);

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Portfolio",
        style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.orangeAccent),
      ),
      actions: List.generate(menuItems.length, (index) {
        return _navButton(
          context,
          menuItems[index]["title"],
          menuItems[index]["gradient"],
          () => navigationProvider.scrollToSection(index, context),
        );
      }),
    );
  }

  /// **Navigation Button with Gradient Effect**
  Widget _navButton(BuildContext context, String title,
      List<Color> gradientColors, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: gradientColors.first.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 2,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
