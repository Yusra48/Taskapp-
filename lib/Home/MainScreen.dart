import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
          style: GoogleFonts.ubuntu(
            textStyle: TextStyle(
            color: colorScheme.onSurface,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        ),
        Icon(
          icon,
          color:Colors.deepPurple,
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
        color: Colors.deepPurpleAccent,
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
             style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'UI Design Kit',
             style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
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
        color: Colors.teal[200],
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
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Artistic Vision',
             style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.grey[100],
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
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
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
              ),
              Text(
                '50/80',
               style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
              )
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
                color: Colors.white,
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
         style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.grey[800],
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.category,
              style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            ),
            const SizedBox(height: 4.0),
            Text(
              task.time,
             style: GoogleFonts.ubuntu(
                textStyle: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            ),
          ],
        ),
        contentPadding: const EdgeInsets.only(bottom: 40),
        trailing: SizedBox(
          width: 120,
          height: 120,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircularProgressIndicator(
                value: task.percentage,
                strokeWidth: 7,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
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
