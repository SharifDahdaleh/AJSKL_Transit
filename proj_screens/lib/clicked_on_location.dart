import 'package:flutter/material.dart';

class ClickedOnLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/screens/clicked_on_location.png',
              fit: BoxFit.cover,
            ),
          ),
          // Back button
          Positioned(
            top: 20, // Adjust the position as needed
            left: 10,
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
