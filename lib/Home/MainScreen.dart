import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildProjectCard(colorScheme, textTheme),
                const SizedBox(width: 10),
                _buildAlternativeProjectCard(colorScheme, textTheme),
              ],
            ),
            const SizedBox(height: 16.0),
            _buildSectionTitle(
              title: 'In Progress',
              icon: Icons.arrow_forward_ios_rounded,
              colorScheme: colorScheme,
              textTheme: textTheme,
            ),
            const SizedBox(height: 16.0),
            const TaskList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle({
    required String title,
    required IconData icon,
    required ColorScheme colorScheme,
    required TextTheme textTheme,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Icon(
          icon,
          color: colorScheme.primary,
          size: 25,
        ),
      ],
    );
  }

  Widget _buildProjectCard(ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: 370,
      height: 200,
      decoration: BoxDecoration(
        color: colorScheme.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Application Design',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onPrimary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'UI Design Kit',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onPrimary.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                _buildCircleAvatar(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
                ),
                _buildCircleAvatar(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
                ),
                _buildCircleAvatar(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2024/06/13/05/31/men-8826710_640.jpg',
                ),
                const SizedBox(width: 10),
                _buildProgressInfo(colorScheme, textTheme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAlternativeProjectCard(
      ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      width: 370,
      height: 200,
      decoration: BoxDecoration(
        color: colorScheme.secondary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overlay Creative Project',
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSecondary,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Artistic Vision',
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSecondary.withOpacity(0.7),
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                _buildCircleAvatar(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
                ),
                _buildCircleAvatar(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
                ),
                _buildCircleAvatar(
                  imageUrl:
                      'https://cdn.pixabay.com/photo/2024/06/13/05/31/men-8826710_640.jpg',
                ),
                const SizedBox(width: 10),
                _buildProgressInfo(colorScheme, textTheme),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatar({required String imageUrl}) {
    return CircleAvatar(
      backgroundImage: NetworkImage(imageUrl),
      radius: 20,
    );
  }

  Widget _buildProgressInfo(ColorScheme colorScheme, TextTheme textTheme) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Progress',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                '50/80',
                style: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Container(
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: colorScheme.onSurface.withOpacity(0.2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: LinearProgressIndicator(
                value: 50 / 80,
                backgroundColor: colorScheme.onSurface.withOpacity(0.2),
                color: colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  final List<Task> tasks = const [
    Task('Create Detail Booking', 'Productivity Mobile App', '2 min ago', 0.6),
    Task('Revision Home Page', 'Banking Mobile App', '5 min ago', 0.7),
    Task('Working On Landing Page', 'Online Course', '7 min ago', 0.8),
  ];

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Column(
      children: tasks
          .map((task) => TaskTile(
              task: task, colorScheme: colorScheme, textTheme: textTheme))
          .toList(),
    );
  }
}

class Task {
  final String title;
  final String category;
  final String time;
  final double percentage;

  const Task(this.title, this.category, this.time, this.percentage);
}

class TaskTile extends StatelessWidget {
  final Task task;
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  const TaskTile({
    required this.task,
    required this.colorScheme,
    required this.textTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: colorScheme.outline),
      ),
      padding: const EdgeInsets.only(left: 15),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          task.title,
          style: textTheme.titleMedium?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.category,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              task.time,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.only(bottom: 40),
        trailing: SizedBox(
          width: 120,
          height: 100,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: task.percentage,
                strokeWidth: 7,
                valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
                backgroundColor: colorScheme.onSurface.withOpacity(0.2),
              ),
              Text(
                '${(task.percentage * 100).toInt()}%',
                style: textTheme.bodyMedium?.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
