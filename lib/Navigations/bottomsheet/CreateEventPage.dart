import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CreateEventPage extends StatefulWidget {
  const CreateEventPage({super.key});

  @override
  _CreateEventPageState createState() => _CreateEventPageState();
}

class _CreateEventPageState extends State<CreateEventPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  bool _isCalendarVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(),
        title: _buildAppBarTitle(),
        actions: [_buildCreateButton()],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDateRow(),
              const SizedBox(height: 3),
              _buildTaskCount(),
              const SizedBox(height: 10),
              _buildDatePickerWidget(),
              const SizedBox(height: 16),
              if (_isCalendarVisible) _buildCalendar(),
            ],
          ),
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
      'Monthly Task',
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
        Container(
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
        ),
      ],
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

  Widget _buildCalendar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: TableCalendar(
          firstDay: DateTime.utc(2020, 1, 1),
          lastDay: DateTime.utc(2030, 1, 1),
          focusedDay: _focusedDay,
          selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
            titleTextStyle: GoogleFonts.ubuntu(
              textStyle: const TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.purple,
              shape: BoxShape.circle,
            ),
            todayTextStyle: const TextStyle(color: Colors.white),
            selectedTextStyle: const TextStyle(color: Colors.white),
          ),
          calendarBuilders: CalendarBuilders(
            headerTitleBuilder: (context, day) {
              return Center(
                child: Text(
                  DateFormat('MMMM d, yyyy').format(_selectedDay),
                  style: GoogleFonts.ubuntu(
                    textStyle: const TextStyle(
                      fontSize: 25,
                      letterSpacing: 1,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerWidget() {
    DateTime selectedDate = DateTime.now();
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (context, index) {
          DateTime date = DateTime.now().add(Duration(days: index - 3));
          bool isSelected = date.day == selectedDate.day &&
              date.month == selectedDate.month &&
              date.year == selectedDate.year;

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedDate = date;
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
}
