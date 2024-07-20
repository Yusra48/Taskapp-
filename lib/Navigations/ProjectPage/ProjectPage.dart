import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/ButtonGroup.dart';
import 'package:flutter_application_1/Navigations/ProjectPage/PrrojectsViewModel.dart';
import 'package:stacked/stacked.dart';
import 'ProjectList.dart';  

class ProjectsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProjectsViewModel>.reactive(
      viewModelBuilder: () => ProjectsViewModel(),
      builder: (context, model, child) {
        final themeData = Theme.of(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                size: 30,
                color: themeData.iconTheme.color,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Projects',
              style: themeData.textTheme.titleLarge!.copyWith(
                letterSpacing: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                  },
                ),
              ),
            ],
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search, color: themeData.iconTheme.color),
                    hintStyle: themeData.textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: themeData.dividerColor),
                    ),
                  ),
                  onChanged: (value) => model.search(value),
                ),
              ),
              SizedBox(height: 5),
              ButtonGroup(),
              SizedBox(height: 10),
              Expanded(
                child: ProjectList(
                  projects: model.projects,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
