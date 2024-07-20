import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProjectsViewModel extends BaseViewModel {
  List<Project> _projects = [
    Project(
      'Unity Dashboard ☺️',
      'Design',
      '10/20',
      Colors.green,
      'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
      'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
    ),
    Project(
      'Instagram Shots ✍️',
      'Marketing',
      '20/50',
      Colors.orange,
      'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
      'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
    ),
    Project(
      'Cubbles 🤓',
      'Design',
      '30/60',
      Colors.blue,
      'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
      'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
    ),
    Project(
      'Ui8 Platform 🥺',
      'Design',
      '20/20',
      Colors.pink,
      'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
      'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
    ),
  ];

  List<Project> _filteredProjects = [];

  ProjectsViewModel() {
    _filteredProjects = _projects;
  }

  List<Project> get projects => _filteredProjects;

  void search(String query) {
    if (query.isEmpty) {
      _filteredProjects = _projects;
    } else {
      _filteredProjects = _projects
          .where((project) => project.title.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}

class Project {
  final String title;
  final String category;
  final String progress;
  final Color color;
  final String iconUrl;
  final String personIconUrl;

  Project(this.title, this.category, this.progress, this.color, this.iconUrl, this.personIconUrl);
}
