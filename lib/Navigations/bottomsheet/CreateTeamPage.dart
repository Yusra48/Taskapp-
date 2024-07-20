import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTeamPage extends StatefulWidget {
  @override
  _CreateTeamPageState createState() => _CreateTeamPageState();
}

class _CreateTeamPageState extends State<CreateTeamPage> {
  final _formKey = GlobalKey<FormState>();
  final _teamNameController = TextEditingController();
  String _selectedType = 'Private';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _buildBackButton(),
        title: _buildAppBarTitle(),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildLogoSection(),
              SizedBox(height: 20),
              _buildTeamNameField(),
              SizedBox(height: 25),
              _buildTeamMembersRow(),
              SizedBox(height: 25),
              _buildTypeSelection(),
              SizedBox(height: 40),
              _buildCreateTeamButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey[50]!),
      ),
      child: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }

  Widget _buildAppBarTitle() {
    return Text(
      'Create Team',
      style: GoogleFonts.ubuntu(
        textStyle: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildLogoSection() {
    return Column(
      children: [
        Center(
          child: GestureDetector(
            onTap: () {
            },
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.grey[200],
              child: Icon(
                Icons.add_a_photo,
                size: 40,
                color: Colors.grey[700],
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Upload logo file',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        Text(
          'Your logo will be published always',
          style: TextStyle(fontSize: 15, color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildTeamNameField() {
    return TextFormField(
      controller: _teamNameController,
      decoration: InputDecoration(
        labelText: 'Team Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a team name';
        }
        return null;
      },
    );
  }

  Widget _buildTeamMembersRow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Team Members',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
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
              icon: Icon(Icons.add_circle_outline),
              onPressed: () {
              },
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

  Widget _buildTypeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Type',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildChoiceChip('Private'),
            _buildChoiceChip('Public'),
            _buildChoiceChip('Secret'),
          ],
        ),
      ],
    );
  }

  Widget _buildChoiceChip(String label) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      selected: _selectedType == label,
      onSelected: (bool selected) {
        setState(() {
          _selectedType = label;
        });
      },
    );
  }

  Widget _buildCreateTeamButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xAE7A3AE0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 90),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
        }
      },
      child: Text(
        'Create Team',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
