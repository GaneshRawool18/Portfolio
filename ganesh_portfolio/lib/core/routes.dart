import 'package:flutter/material.dart';
import 'package:ganesh_portfolio/view/desktop/about_desktop.dart';
import 'package:ganesh_portfolio/view/desktop/contact_desktop.dart';
import 'package:ganesh_portfolio/view/desktop/projects_desktop.dart';
import 'package:ganesh_portfolio/view/mobile/about_mobile.dart';
import 'package:ganesh_portfolio/view/mobile/contact_mobile.dart';
import 'package:ganesh_portfolio/view/mobile/projects_mobile.dart';
import 'package:ganesh_portfolio/view/tablet/about_tablet.dart';
import 'package:ganesh_portfolio/view/tablet/contact_tablet.dart';
import 'package:ganesh_portfolio/view/tablet/projects_tablet.dart';

import '../widgets/responsive_layout.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      "/about": (context) => ResponsiveLayout(
            mobileScreen: AboutMobile(),
            tabletScreen: AboutTablet(),
            desktopScreen: AboutDesktop(),
          ),
      "/projects": (context) => ResponsiveLayout(
            mobileScreen: ProjectsMobile(),
            tabletScreen: ProjectsTablet(),
            desktopScreen: ProjectsDesktop(),
          ),
      "/contact": (context) => ResponsiveLayout(
            mobileScreen: ContactMobile(),
            tabletScreen: ContactTablet(),
            desktopScreen: ContactDesktop(),
          ),
    };
  }
}
