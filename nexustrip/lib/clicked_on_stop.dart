import 'package:flutter/material.dart';

class ClickedOnStop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Section
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                // Background map image
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/map_background.png', // Replace with your map background asset
                    fit: BoxFit.cover,
                  ),
                ),
                // Overlay content
                Column(
                  children: [
                    SizedBox(height: 20),
                    // Back button and search bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          // Circular back button
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Color(0xFF30B665),
                              ),
                            ),
                          ),
                          SizedBox(width: 10),
                          // Search bar
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  hintText: "Your Location",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.all(15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Line details
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildLineBox(context, "54D", "5 MINUTES AWAY"),
                _buildLineBox(context, "93", "8 MINUTES AWAY"),
                _buildLineBox(context, "71A", "14 MINUTES AWAY"),
                _buildLineBox(context, "71C", "16 MINUTES AWAY"),
                _buildLineBox(context, "75", "27 MINUTES AWAY"),
              ],
            ),
          ),

          // Bottom button
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/whereTo');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  color: Color(0xFF30B665),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Not seeing what you need?\nTry checking another location!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineBox(BuildContext context, String line, String time) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/clickedOnLocation');
      },
      child: Container(
        color: Color(0xFF30B665),
        margin: EdgeInsets.only(bottom: 1), // Divider between lines
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    line,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.accessible, color: Colors.white),
                ],
              ),
              Text(
                time,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}