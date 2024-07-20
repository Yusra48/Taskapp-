

class Event {
  final String title;
  final String time;
  final List<String> participants;
  final String color;

  Event({
    required this.title,
    required this.time,
    required this.participants,
    required this.color,
  });

  factory Event.fromDocument(Map<String, dynamic> doc) {
    return Event(
      title: doc['title'] ?? '',
      time: doc['time'] ?? '',
      participants: List<String>.from(doc['participants'] ?? []),
      color: doc['color'] ?? '',
    );
  }
}
