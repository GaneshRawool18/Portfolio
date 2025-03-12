import 'package:flutter/material.dart';
import 'package:ganesh_portfolio/common/portfolio_page.dart';
import 'package:ganesh_portfolio/controller/portfolio_provider.dart';
import 'package:provider/provider.dart';
import 'package:ganesh_portfolio/controller/navigation_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        ChangeNotifierProvider(create: (context) => PortfolioProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: PortfolioPage(), // ✅ Uses single-page Portfolio
    );
  }
}
