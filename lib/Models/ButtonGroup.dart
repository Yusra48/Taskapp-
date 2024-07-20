import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {
  @override
  _ButtonGroupState createState() => _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {
  String _selectedButton = 'Favourites';

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final Color primaryColor = themeData.colorScheme.primary;
    final Color onPrimaryColor = themeData.colorScheme.onPrimary;
    final Color buttonBorderColor = themeData.colorScheme.outline;
    final Color buttonTextColor = themeData.textTheme.labelLarge?.color ?? Colors.black;

    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _buildButton('Favourites', primaryColor, onPrimaryColor, buttonBorderColor, buttonTextColor),
          SizedBox(width: 15),
          _buildButton('Recents', primaryColor, onPrimaryColor, buttonBorderColor, buttonTextColor),
          SizedBox(width: 15),
          _buildButton('All', primaryColor, onPrimaryColor, buttonBorderColor, buttonTextColor),
          SizedBox(width: 75),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: themeData.colorScheme.background,
              border: Border.all(color: buttonBorderColor),
            ),
            child: Icon(CupertinoIcons.qrcode, color: themeData.iconTheme.color, size: 30),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(
    String buttonText,
    Color primaryColor,
    Color onPrimaryColor,
    Color borderColor,
    Color textColor
  ) {
    bool isSelected = _selectedButton == buttonText;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? onPrimaryColor : textColor,
        backgroundColor: isSelected ? primaryColor : primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(
            color: isSelected ? primaryColor : borderColor,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      ),
      onPressed: () {
        setState(() {
          _selectedButton = buttonText;
        });
      },
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
