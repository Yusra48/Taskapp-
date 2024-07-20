import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Categories/EventTile.dart';
import 'package:flutter_application_1/Models/Eventmodel.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class TodayTasksPage extends StatefulWidget {
  const TodayTasksPage({super.key});

  @override
  State<TodayTasksPage> createState() => _TodayTasksPageState();
}

class _TodayTasksPageState extends State<TodayTasksPage> {
  DateTime _selectedDay = DateTime.now();
  bool _isCalendarVisible = false;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    _initializeSchedule();
  }

  Future<void> _initializeSchedule() async {
    final collectionRef = _firestore.collection('schedule');

    final docs = [
      {
        'title': 'Meeting with team',
        'time': '10:00 AM - 11:00 Am',
        'color': '#FF5733',
        'participants': [
          'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
          'https://cdn.pixabay.com/photo/2024/06/13/05/31/men-8826710_640.jpg'
        ]
      },
      {
        'title': 'Project deadline',
        'time': '5:40 PM - 8:40AM ',
        'color': '#33FF57',
        'participants': [
          'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
          'https://cdn.pixabay.com/photo/2024/06/25/13/12/woman-8852672_640.jpg'
        ]
      },
      {
        'title': 'Lunch with Team',
        'time': '2:20 PM - 3:20 PM',
        'color': '#3357FF',
        'participants': [
          'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
          'https://cdn.pixabay.com/photo/2024/06/13/05/31/men-8826710_640.jpg',
          'https://cdn.pixabay.com/photo/2019/08/11/11/28/man-4398724_640.jpg',
          'https://cdn.pixabay.com/photo/2024/05/12/16/13/ai-generated-8757269_640.png',
        ]
      }
    ];

    try {
      for (int i = 0; i < docs.length; i++) {
        await collectionRef.doc('doc_$i').set(docs[i]);
      }
      print('Documents added successfully!');
    } catch (e) {
      print('Failed to add documents: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(),
        title: _buildAppBarTitle(),
        actions: [_buildCreateButton()],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDateRow(),
            const SizedBox(height: 10),
            _buildTaskCount(),
            const SizedBox(height: 10),
            _buildDatePickerWidget(),
            const SizedBox(height: 10),
            Expanded(child: _buildSchedulePage()),
          ],
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    );
  }

  Widget _buildCreateButton() {
    return IconButton(
      icon: const Icon(Icons.create, color: Colors.black),
      onPressed: () {},
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Today Task',
      style: GoogleFonts.ubuntu(
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildDateRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${DateFormat('MMMM d').format(_selectedDay)} ✍️',
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        _buildCalendarToggleButton(),
      ],
    );
  }

  Widget _buildCalendarToggleButton() {
    return Container(
      decoration: BoxDecoration(
        color: _isCalendarVisible ? Colors.deepPurpleAccent : Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey),
      ),
      child: IconButton(
        icon: Icon(
          Icons.calendar_today,
          color: _isCalendarVisible ? Colors.white : Colors.black,
        ),
        onPressed: () {
          setState(() {
            _isCalendarVisible = !_isCalendarVisible;
          });
        },
      ),
    );
  }

  Widget _buildTaskCount() {
    return Text(
      '15 tasks Today',
      style: GoogleFonts.ubuntu(
        textStyle: const TextStyle(
          fontSize: 20,
          color: Colors.grey,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildDatePickerWidget() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          DateTime date = DateTime.now().add(Duration(days: index - 3));
          bool isSelected = date.day == _selectedDay.day &&
              date.month == _selectedDay.month &&
              date.year == _selectedDay.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDay = date;
              });
            },
            child: Container(
              width: 60,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color:
                    isSelected ? Colors.deepPurpleAccent : Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey[50]!),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    DateFormat('EEE').format(date),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSchedulePage() {
    return FutureBuilder<List<Event>>(
      future: _loadEvents(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator(color: Colors.deepPurpleAccent,));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('No events found.'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final event = snapshot.data![index];
              return Padding(padding: EdgeInsets.only(left: 60),
              child: EventTile(event: event),
              );
            },
          );
        }
      },
    );
  }

  Future<List<Event>> _loadEvents() async {
    try {
      final querySnapshot = await _firestore.collection('schedule').get();
      if (querySnapshot.docs.isEmpty) {
        print('No events found in the collection.');
        return [];
      }

      return querySnapshot.docs
          .map((doc) {
            try {
              return Event.fromDocument(doc.data() as Map<String, dynamic>);
            } catch (e) {
              print('Error processing document ${doc.id}: $e');
              return null;
            }
          })
          .whereType<Event>()
          .toList();
    } on FirebaseException catch (e) {
      print('Firebase error loading events: ${e.message}');
      return [];
    } catch (e) {
      print('Unknown error loading events: ${e.toString()}');
      return [];
    }
  }
}
