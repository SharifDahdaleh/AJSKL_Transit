import 'package:flutter/material.dart';

// initially was going to use the google maps api
// but for some reason the map wouldnt display
// even after following the directions in the tutorial
// and generating an API key, so a static image was used as placeholder

class WhereTo extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background map
          Positioned.fill(
            child: Image.asset(
              'assets/images/map_background.png', // Replace with your map background asset
              fit: BoxFit.cover,
            ),
          ),
          // Overlay UI
          Column(
            children: [
              SizedBox(height: 20),
              // Top section with circular back button and search bar
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
                          color: Color(0xFF30B665),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: searchController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.white),
                            hintText: "Enter a Line or Destination",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(15),
                          ),
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              Navigator.pushNamed(context, '/clickedOnStop');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    // Pins overlay
                    for (var pin in _getPins())
                      Positioned(
                        left: pin['x'],
                        top: pin['y'],
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/clickedOnStop');
                          },
                          child: Icon(
                            Icons.location_on,
                            color: Colors.blue,
                            size: 40,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              // Interactive bottom bar
              Container(
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Action for clicking "Click on a Stop for More Info"
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        decoration: BoxDecoration(
                          color: Color(0xFF30B665),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Click on a Stop for More Info",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Map<String, double>> _getPins() {
    // adjusted pins data to match bus stop locations on bg image
    return [
      {'x': 85.0, 'y': 0.0},
      {'x': -10.0, 'y': 190.0},
      {'x': 380.0, 'y': 260.0},
      {'x': 180.0, 'y': 400.0},
    ];
  }
}