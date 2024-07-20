import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Theme/ThemeProvider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyTask extends StatelessWidget {
  const MyTask({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final colorScheme = themeProvider.themeData.colorScheme;
    final textTheme = themeProvider.themeData.textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      appBar: AppBar(
        backgroundColor: colorScheme.surface,
        leading: _buildIconButton(
          icon: Icons.arrow_back_ios_new_rounded,
          onPressed: () => Navigator.pop(context),
          color: colorScheme.onSurface,
        ),
        title: Text(
          'Task Status',
          style: GoogleFonts.ubuntu(
            textStyle: textTheme.titleLarge?.copyWith(
              letterSpacing: 1,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        actions: [
          _buildIconButton(
            icon: Icons.move_up_rounded,
            onPressed: () {},
            color: colorScheme.onSurface,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomCircularProgressIndicator(percentage: 65),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Indicator(color: Colors.green, text: 'To Do'),
                const SizedBox(width: 20),
                Indicator(color: Colors.orange, text: 'In Progress'),
                const SizedBox(width: 20),
                Indicator(color: Colors.blue, text: 'Completed'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  TaskStatusCard(
                    title: 'Completed',
                    subtitle: '19 Tasks now · 18 Tasks Completed',
                    color: colorScheme.primary,
                  ),
                  TaskStatusCard(
                    title: 'In Progress',
                    subtitle: '2 Tasks now · 1 Started',
                    color: colorScheme.primary,
                  ),
                  TaskStatusCard(
                    title: 'To Do',
                    subtitle: '2 Tasks now · 1 Upcoming',
                    color: colorScheme.primary,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required VoidCallback onPressed,
    required Color color,
  }) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      padding: const EdgeInsets.all(8.0),
      iconSize: 24,
      constraints: const BoxConstraints(),
      splashRadius: 24,
      visualDensity: VisualDensity.compact,
      color: color,
    );
  }
}

class CustomCircularProgressIndicator extends StatelessWidget {
  final double percentage;

  const CustomCircularProgressIndicator({required this.percentage});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 170,
          height: 170,
          child: CircularProgressIndicator(
            value: percentage / 100,
            strokeWidth: 30,
            valueColor: AlwaysStoppedAnimation<Color>(colorScheme.primary),
            backgroundColor: colorScheme.secondary,
          ),
        ),
        Positioned(
          child: Text(
            '${percentage.toInt()}%',
            style: textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
        ),
        Positioned(
          bottom: 45,
          child: Text(
            'Complete',
            style: textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final Color color;
  final String text;

  const Indicator({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: textTheme.bodyLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class TaskStatusCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const TaskStatusCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: colorScheme.outline),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          title,
          style: textTheme.titleLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.7),
            fontSize: 14,
          ),
        ),
        trailing: Icon(Icons.more_vert, color: colorScheme.onSurface.withOpacity(0.7)),
      ),
    );
  }
}
