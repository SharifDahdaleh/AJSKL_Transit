import 'package:flutter/material.dart';

class ClickedOnLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Section
          Stack(
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
                  // Back button and route bar
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
                        // Route bar
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Your Location",
                                  style: TextStyle(color: Colors.black),
                                ),
                                Icon(Icons.arrow_forward, color: Colors.black),
                                Text(
                                  "1234 Address Street",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 200), // Space for the map
                ],
              ),
            ],
          ),

          // Line details section
          Container(
            color: Color(0xFF30B665),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "54D",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(Icons.accessible, color: Colors.white),
                    ],
                  ),
                  Text(
                    "11:28 am - 11:47 pm",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Expanded trip details
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildStopBox("5th Ave / Atwood St", "Board your stop at 11:28 am", true),
                _buildVerticalLine(),
                _buildStopBox("5th Ave / Boyd St", "Arrive at your stop at 11:47 am", true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStopBox(String stop, String details, bool accessible) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20), // Increase spacing
      padding: EdgeInsets.all(20), // Add padding for prominence
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            stop,
            style: TextStyle(
              fontSize: 32, // Larger font size for stop name
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            details,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.black), // Increase detail text size
          ),
          if (accessible) ...[
            SizedBox(height: 10),
            Text(
              "This Stop is Wheelchair Accessible",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildVerticalLine() {
    return Container(
      width: 2,
      height: 60,
      color: Colors.black,
    );
  }
}