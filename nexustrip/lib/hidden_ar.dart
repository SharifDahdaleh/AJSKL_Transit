import 'package:flutter/material.dart';

//Hi Dmitriy!! :)
class HiddenAR extends StatelessWidget {
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
          "Hidden Screen!!!",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Image.asset(
          'assets/easter_egg.jpg',
          width: 500,
          height: 500,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
