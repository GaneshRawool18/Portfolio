import 'package:flutter/material.dart';
import 'package:ganesh_portfolio/model/project_model.dart';

class PortfolioProvider extends ChangeNotifier {
  String name = "Ganesh Rawool";
  String title = "Flutter Developer";
  String bio =
      "Passionate about Flutter and UI/UX design. Building modern mobile and web apps.";

  // List of projects
  final List<Project> _projects = [
    Project(
        title: "Java", status: "Completed", imageUrl: "assets/images/java.png"),
    Project(
        title: "Flutter",
        status: "Completed",
        imageUrl: "assets/images/flutter.png"),
    Project(
        title: "Spring Boot",
        status: "Learning",
        imageUrl: "assets/images/spring.png"),
  ];

  List<Project> get projects => _projects;

  // Function to add a new project
  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }
}
