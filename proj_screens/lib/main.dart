import 'package:flutter/material.dart';
import 'clicked_on_location.dart';
import 'clicked_on_stop.dart';
import 'fav_location_clicked.dart';
import 'home_page.dart';
import 'nearby_lines.dart';
import 'settings.dart';
import 'ticket.dart';
import 'where_to.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => MenuPage(), // The new menu page
        '/clickedOnLocation': (context) => ClickedOnLocation(),
        '/clickedOnStop': (context) => ClickedOnStop(),
        '/favLocationClicked': (context) => FavLocationClicked(),
        '/homePage': (context) => HomePage(),
        '/nearbyLines': (context) => NearbyLines(),
        '/settings': (context) => SettingsPage(),
        '/ticket': (context) => TicketPage(),
        '/whereTo': (context) => WhereTo(),
      },
    );
  }
}

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poverty Menu!'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Clicked On Location'),
            onTap: () => Navigator.pushNamed(context, '/clickedOnLocation'),
          ),
          ListTile(
            title: Text('Clicked On Stop'),
            onTap: () => Navigator.pushNamed(context, '/clickedOnStop'),
          ),
          ListTile(
            title: Text('Favorite Location Clicked'),
            onTap: () => Navigator.pushNamed(context, '/favLocationClicked'),
          ),
          ListTile(
            title: Text('Home Page'),
            onTap: () => Navigator.pushNamed(context, '/homePage'),
          ),
          ListTile(
            title: Text('Nearby Lines'),
            onTap: () => Navigator.pushNamed(context, '/nearbyLines'),
          ),
          ListTile(
            title: Text('Settings'),
            onTap: () => Navigator.pushNamed(context, '/settings'),
          ),
          ListTile(
            title: Text('Ticket Page'),
            onTap: () => Navigator.pushNamed(context, '/ticket'),
          ),
          ListTile(
            title: Text('Where To'),
            onTap: () => Navigator.pushNamed(context, '/whereTo'),
          ),
        ],
      ),
    );
  }
}
