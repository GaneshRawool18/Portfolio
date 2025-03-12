import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ganesh_portfolio/common/nav_bar.dart';
import 'package:ganesh_portfolio/controller/navigation_provider.dart';
import 'package:ganesh_portfolio/widgets/responsive_layout.dart';
import 'package:ganesh_portfolio/view/desktop/home_desktop.dart';
import 'package:ganesh_portfolio/view/desktop/about_desktop.dart';
import 'package:ganesh_portfolio/view/desktop/projects_desktop.dart';
import 'package:ganesh_portfolio/view/desktop/contact_desktop.dart';
import 'package:ganesh_portfolio/view/mobile/home_mobile.dart';
import 'package:ganesh_portfolio/view/mobile/about_mobile.dart';
import 'package:ganesh_portfolio/view/mobile/projects_mobile.dart';
import 'package:ganesh_portfolio/view/mobile/contact_mobile.dart';
import 'package:ganesh_portfolio/view/tablet/home_tablet.dart';
import 'package:ganesh_portfolio/view/tablet/about_tablet.dart';
import 'package:ganesh_portfolio/view/tablet/projects_tablet.dart';
import 'package:ganesh_portfolio/view/tablet/contact_tablet.dart';

class PortfolioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var navigationProvider = Provider.of<NavigationProvider>(context);

    return Scaffold(
      body: Column(
        children: [
          /// **Navbar**
          NavBar(),

          /// **Scrollable Content**
          Expanded(
            child: SingleChildScrollView(
              controller: navigationProvider
                  .scrollController, // ✅ Uses Provider's scroll controller
              child: Column(
                children: [
                  _buildSection(
                      context,
                      ResponsiveLayout(
                        mobileScreen: HomeMobile(),
                        tabletScreen: HomeTablet(),
                        desktopScreen: HomeDesktop(),
                      )),
                  _buildSection(
                      context,
                      ResponsiveLayout(
                        mobileScreen: AboutMobile(),
                        tabletScreen: AboutTablet(),
                        desktopScreen: AboutDesktop(),
                      )),
                  _buildSection(
                      context,
                      ResponsiveLayout(
                        mobileScreen: ProjectsMobile(),
                        tabletScreen: ProjectsTablet(),
                        desktopScreen: ProjectsDesktop(),
                      )),
                  _buildSection(
                      context,
                      ResponsiveLayout(
                        mobileScreen: ContactMobile(),
                        tabletScreen: ContactTablet(),
                        desktopScreen: ContactDesktop(),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// **Reusable Section Builder**
  Widget _buildSection(BuildContext context, Widget child) {
    return Container(
      height: MediaQuery.of(context).size.height, // ✅ Uses the parent's context
      child: child,
    );
  }
}
