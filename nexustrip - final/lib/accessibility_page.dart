import 'package:flutter/material.dart';

class AccessibilityPage extends StatefulWidget {
  @override
  _AccessibilityPageState createState() => _AccessibilityPageState();
}

class _AccessibilityPageState extends State<AccessibilityPage> {
  // Toggle states for accessibility options
  bool _voiceCommandsEnabled = false;
  bool _textToSpeechEnabled = false;
  bool _screenMagnificationEnabled = false;
  bool _highContrastModeEnabled = false;
  bool _largeTextEnabled = false;
  bool _soundNotificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accessibility Settings"),
        backgroundColor: Color(0xFF30B665),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _buildToggleOption(
            title: "Voice Commands",
            subtitle: "Enable hands-free control with voice commands.",
            value: _voiceCommandsEnabled,
            onChanged: (bool value) {
              setState(() {
                _voiceCommandsEnabled = value;
              });
            },
          ),
          _buildToggleOption(
            title: "Text-to-Speech",
            subtitle: "Enable text-to-speech for content on the screen.",
            value: _textToSpeechEnabled,
            onChanged: (bool value) {
              setState(() {
                _textToSpeechEnabled = value;
              });
            },
          ),
          _buildToggleOption(
            title: "Screen Magnification",
            subtitle: "Zoom in on the screen for better readability.",
            value: _screenMagnificationEnabled,
            onChanged: (bool value) {
              setState(() {
                _screenMagnificationEnabled = value;
              });
            },
          ),
          _buildToggleOption(
            title: "High Contrast Mode",
            subtitle: "Increase contrast for better visibility.",
            value: _highContrastModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _highContrastModeEnabled = value;
              });
            },
          ),
          _buildToggleOption(
            title: "Large Text",
            subtitle: "Increase text size for better readability.",
            value: _largeTextEnabled,
            onChanged: (bool value) {
              setState(() {
                _largeTextEnabled = value;
              });
            },
          ),
          _buildToggleOption(
            title: "Sound Notifications",
            subtitle: "Enable sound for notifications and alerts.",
            value: _soundNotificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _soundNotificationsEnabled = value;
              });
            },
          ),
        ],
      ),
    );
  }

  // Helper widget for toggles
  Widget _buildToggleOption({
    required String title,
    required String subtitle,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: SwitchListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        value: value,
        onChanged: onChanged,
        activeColor: Color(0xFF30B665),
      ),
    );
  }
}
