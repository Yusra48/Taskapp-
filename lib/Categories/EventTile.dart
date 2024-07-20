import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_1/Models/Eventmodel.dart';

class EventTile extends StatelessWidget {
  final Event event;

  const EventTile({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final colorScheme = themeData.colorScheme;
    final textTheme = themeData.textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
        width: 50,
        height: 110,
        decoration: BoxDecoration(
          color: _getColorFromHex(event.color, colorScheme),
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: colorScheme.shadow.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: GoogleFonts.bonaNova(
                textStyle: textTheme.titleLarge?.copyWith(
                  color: colorScheme.onPrimary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 5),
            _buildParticipantsRow(colorScheme, textTheme),
          ],
        ),
      ),
    );
  }

  Widget _buildParticipantsRow(ColorScheme colorScheme, TextTheme textTheme) {
    if (event.participants.isEmpty) {
      return _buildNoParticipantsRow(colorScheme, textTheme);
    }

    List<Widget> participantWidgets = _buildParticipantAvatars(colorScheme);
    if (event.participants.length > 3) {
      participantWidgets.add(_buildMoreParticipantsAvatar(colorScheme));
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(children: participantWidgets),
        Text(
          event.time,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.6),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildNoParticipantsRow(ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: colorScheme.onSurface.withOpacity(0.2),
              radius: 18,
              child: Icon(Icons.person, color: colorScheme.onSurface, size: 16),
            ),
            const SizedBox(width: 8),
            Text(
              'No participants',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withOpacity(0.7),
              ),
            ),
          ],
        ),
        Text(
          event.time,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurface.withOpacity(0.6),
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  List<Widget> _buildParticipantAvatars(ColorScheme colorScheme) {
    return event.participants
        .take(3) 
        .map((participantUrl) => Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(participantUrl),
                radius: 18,
                backgroundColor: Colors.transparent,
                onBackgroundImageError: (_, __) => Icon(
                  Icons.person,
                  color: colorScheme.onSurface,
                  size: 16,
                ),
              ),
            ))
        .toList();
  }

  Widget _buildMoreParticipantsAvatar(ColorScheme colorScheme) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        backgroundColor: colorScheme.onSurface.withOpacity(0.2),
        radius: 18,
        child: Text(
          '+${event.participants.length - 3}',
          style: TextStyle(color: colorScheme.onSurface, fontSize: 12),
        ),
      ),
    );
  }

  Color _getColorFromHex(String hexColor, ColorScheme colorScheme) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    try {
      return Color(int.parse(hexColor, radix: 16));
    } catch (e) {
      print('Error parsing color: $e');
      return colorScheme.surface; 
    }
  }
}
