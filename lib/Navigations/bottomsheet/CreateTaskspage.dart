import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey[50]!)),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            )),
        title: Text(
          'Add Task',
          style: GoogleFonts.ubuntu(
            textStyle: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField('Task Name', false),
            const SizedBox(height: 20),
            _buildTeamMembersRow(),
            const SizedBox(height: 20),
            _buildTextField('Date', true),
            const SizedBox(height: 25),
            _buildTimePickersRow(),
            const SizedBox(height: 20),
            _buildBoardChipsRow(),
            const SizedBox(height: 40),
            _buildSaveButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, bool readOnly) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
      readOnly: readOnly,
      onTap: readOnly ? () {} : null,
    );
  }

  Widget _buildTeamMembersRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Team Member',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildTeamMemberAvatar(
              'https://cdn.pixabay.com/photo/2024/05/12/16/13/ai-generated-8757269_640.png',
            ),
            _buildTeamMemberAvatar(
              'https://cdn.pixabay.com/photo/2024/07/09/13/48/beautiful-girl-8883604_640.jpg',
            ),
            _buildTeamMemberAvatar(
              'https://cdn.pixabay.com/photo/2023/11/19/18/35/boy-8399526_640.jpg',
            ),
            _buildTeamMemberAvatar(
              'https://cdn.pixabay.com/photo/2024/06/25/13/12/woman-8852672_640.jpg',
            ),
            IconButton(
              icon: const Icon(Icons.add_circle_outline),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTeamMemberAvatar(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
        radius: 20,
      ),
    );
  }

  Widget _buildTimePickersRow() {
    return Row(
      children: [
        Expanded(child: _buildTextField('Start Time', true)),
        const SizedBox(width: 16),
        Expanded(child: _buildTextField('End Time', true)),
      ],
    );
  }

  Widget _buildBoardChipsRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Board',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildChoiceChip('Urgent', false),
            _buildChoiceChip('Running', true),
            _buildChoiceChip('Ongoing', false),
          ],
        ),
      ],
    );
  }

  Widget _buildChoiceChip(String label, bool selected) {
    return ChoiceChip(
      label: Text(label,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
      selected: selected,
      onSelected: (bool selected) {},
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xAE7A3AE0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 90),
      ),
      onPressed: () {},
      child: const Text(
        'Save',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
