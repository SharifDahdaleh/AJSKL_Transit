import 'package:flutter/material.dart';

class NearbyLines extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Map background
          Positioned.fill(
            child: Image.asset(
              'assets/images/map_background.png', // Replace with your map image path
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              // Green Header
              Container(
                color: Color(0xFF30B665),
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Back button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    ),
                    // Camera icon
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/arCamera'); // Navigates to AR Camera screen
                      },
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 30),
                    ),
                    // Settings icon
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/settings');
                      },
                      child: Icon(Icons.settings, color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
              // Map Section
              Expanded(
                child: Container(
                  color: Colors.transparent, // Allows the map to fill this space
                ),
              ),
              // Bus Lines Section
              Container(
                height: 250, // Adjust this height as needed
                child: ListView.builder(
                  itemCount: _getLines().length,
                  itemBuilder: (context, index) {
                    final line = _getLines()[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/nearbyLines2'); // Navigates to NearbyLines2
                      },
                      child: _buildLineBox(
                        context,
                        line['line']!,
                        line['time']!,
                        line['destination']!,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLineBox(BuildContext context, String line, String time, String destination) {
    return Container(
      color: Color(0xFF30B665),
      margin: EdgeInsets.only(bottom: 1),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top row with line and time
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  line,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            // Bottom row with destination
            Text(
              destination,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Map<String, String>> _getLines() {
    return [
      {
        'line': '61A - Outbound Braddock',
        'time': 'Arriving Now',
        'destination': 'Forbes/Bellefield',
      },
      {
        'line': '71B - Outbound Highland Park',
        'time': 'Arriving Now',
        'destination': 'Fifth/Bellefield',
      },
      {
        'line': '69 - Outbound Trafford',
        'time': 'Arriving in 4 Min',
        'destination': 'Forbes/Bellefield',
      },
      {
        'line': '61D - Outbound Waterfront',
        'time': 'Arriving in 8 Min',
        'destination': 'Forbes/Bellefield',
      },
    ];
  }
}