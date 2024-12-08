import 'package:flutter/material.dart';
import 'hidden_ar.dart';

// since the AR camera is no longer a requirement
// I just made a quick little screen as a placeholder
// for when the camera button is clicked
class ARCamera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF30B665),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "AR Camera",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center( // Centers both text and image
        child: Column(
          mainAxisSize: MainAxisSize.min, // Centers content vertically
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HiddenAR()),
                );
              },
              child: Text(
                "This is no longer needed!",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            Image.asset(
              'assets/images/rbs.png',
              width: 450,
              height: 450,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}