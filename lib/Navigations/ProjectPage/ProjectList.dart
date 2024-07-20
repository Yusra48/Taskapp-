import 'package:flutter/material.dart';
import 'package:flutter_application_1/Navigations/ProjectPage/PrrojectsViewModel.dart';


class ProjectList extends StatelessWidget {
  final List<Project> projects;

  ProjectList({required this.projects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: projects.length,
      itemBuilder: (context, index) {
        return ProjectTile(project: projects[index]);
      },
    );
  }
}

class ProjectTile extends StatelessWidget {
  final Project project;

  ProjectTile({required this.project});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Container(
      width: 90,
      height: 155,
      decoration: BoxDecoration(
        color: themeData.colorScheme.surface,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: themeData.dividerColor),
      ),
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: themeData.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: themeData.textTheme.titleMedium!.color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4.0),
            Text(
              project.category,
              style: themeData.textTheme.bodyMedium!.copyWith(
                fontSize: 20,
                color: themeData.textTheme.bodyMedium!.color,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(project.personIconUrl),
                      radius: 12,
                    ),
                    SizedBox(width: 2.0),
                    CircleAvatar(
                      backgroundImage: NetworkImage(project.personIconUrl),
                      radius: 12,
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Expanded(
                  child: Container(
                    height: 9,
                    width: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: themeData.colorScheme.onSurface.withOpacity(0.24),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: int.parse(project.progress.split('/')[0]) /
                            int.parse(project.progress.split('/')[1]),
                        backgroundColor: project.color.withOpacity(0.3),
                        color: project.color,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 2),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor:
                      project.color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(color: project.color, width: 2),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                ),
                child: Text(
                  project.progress,
                  style: themeData.textTheme.bodyMedium!.copyWith(
                    fontSize: 14,
                    color: themeData.textTheme.bodyMedium!.color
                        ?.withOpacity(0.54),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
