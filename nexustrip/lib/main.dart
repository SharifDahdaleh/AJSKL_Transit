import 'package:flutter/material.dart';
import 'clicked_on_location.dart';
import 'clicked_on_stop.dart';
import 'fav_location_clicked.dart';
import 'nearby_lines.dart';
import 'settings.dart';
import 'ticket.dart';
import 'where_to.dart';
import 'ar_camera.dart';
import 'my_tickets.dart';

// got the code for icon buttons for the project from here
// https://api.flutter.dev/flutter/material/IconButton-class.html
// flutter documentation was a lot in general
// https://docs.flutter.dev/
// also used the notes + google docs info provided
// by griffin and dmitriy from class
// (Flutter Introduction Tutorial, Intro to Flutter and Dart, Multi-screen apps with Flutter)

void main() {
  runApp(MyApp());
}

//routing for app navigation
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/clickedOnLocation': (context) => ClickedOnLocation(),
        '/clickedOnStop': (context) => ClickedOnStop(),
        '/favLocationClicked': (context) => FavLocationClicked(),
        '/nearbyLines': (context) => NearbyLines(),
        '/settings': (context) => SettingsPage(),
        '/ticket': (context) => TicketPage(),
        '/whereTo': (context) => WhereTo(),
        '/arCamera': (context) => ARCamera(),
        '/myTickets': (context) => MyTickets(),
      },
    );
  }
}

// home page class
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header with icons and logo
          Container(
            color: Color(0xFF30B665),
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt, size: 40, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/arCamera'); // Navigate to AR Camera
                  },
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/icons/logo.png',
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 10),
                    Text(
                      "NexusTrip",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.settings, size: 40, color: Colors.white),
                  onPressed: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),

          // Where To button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/whereTo');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF30B665),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.search, size: 30, color: Colors.white),
                  SizedBox(width: 10),
                  Text(
                    "Where To?",
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),

          // Favorite Locations section
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Favorite Locations",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                _buildFavoriteTile(
                  context,
                  "Home",
                  isGreen: true,
                ),
                _buildFavoriteTile(
                  context,
                  "Benedum Hall",
                  isGreen: false,
                ),
                _buildFavoriteTile(
                  context,
                  "Chipotle",
                  isGreen: true,
                ),
                _buildFavoriteTile(
                  context,
                  "Posvar Hall",
                  isGreen: false,
                ),
                _buildFavoriteTile(
                  context,
                  "Cathedral of Learning",
                  isGreen: true,
                ),
                GestureDetector(
                  onTap: () {
                    // Action for adding a favorite location
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Click here to add a favorite location",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Spacer(),

          // Footer with Nearby Lines button and Ticket icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.confirmation_num,
                    size: 50,
                    color: Color(0xFF30B665),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/ticket');
                  },
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/nearbyLines');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF30B665),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Click to see nearby lines!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper to build favorite tiles
  Widget _buildFavoriteTile(BuildContext context, String title,
      {required bool isGreen}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/favLocationClicked');
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: isGreen ? Color(0xFF30B665) : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Icon(Icons.star, size: 30, color: Colors.black),
                Icon(Icons.star, size: 25, color: Colors.yellow),
              ],
            ),
          ],
        ),
      ),
    );
  }
}