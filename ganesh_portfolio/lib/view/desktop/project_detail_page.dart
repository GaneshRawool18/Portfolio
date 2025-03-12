import 'package:flutter/material.dart';

class ProjectDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String githubUrl;

  ProjectDetailPage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.githubUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageUrl, width: 300),
            Text(description),
          ],
        ),
      ),
    );
  }
}
