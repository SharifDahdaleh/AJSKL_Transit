// import 'package:flutter/material.dart';
//import 'assets/screens/clicked_on_location.dart';
//import 'assets/screens/clicked_on_stop.dart';
//import 'assets/screens/fav_location_clicked.dart';
//import 'assets/screens/home_page.dart';
//import 'assets/screens/nearby_lines.dart';
//import 'assets/screens/settings.dart';
//import 'assets/screens/ticket.dart';
//import 'assets/screens/where_to.dart';

//void main() {
  //runApp(MyApp());
//}

//class MyApp extends StatelessWidget {
  //@override
  //Widget build(BuildContext context) {
    //return MaterialApp(
      //debugShowCheckedModeBanner: false,
      //initialRoute: '/',
      //routes: {
        //'/': (context) => HomePage(),
        //'/clickedOnLocation': (context) => ClickedOnLocation(),
        //'/clickedOnStop': (context) => ClickedOnStop(),
        //'/favLocationClicked': (context) => FavLocationClicked(),
        //'/nearbyLines': (context) => NearbyLines(),
        //'/settings': (context) => SettingsPage(),
        //'/ticket': (context) => TicketPage(),
        //'/whereTo': (context) => WhereTo(),
      //},
    //);
//}
//}



// old code for main

/*
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Namer App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
          Text('Account'),
          TextButton(
            onPressed: (){
              print("Personal Information Pressed");
            },
            child:Text("Personal Information") ,
          ),
          TextButton(
            onPressed: () {
              print("My Tickets pressed");
            },
            child: Text("My Tickets"),
          ),
          TextButton(
            onPressed: () {
              print("Notifications pressed");
            },
            child: Text("Notifications"),
          ),
          TextButton(
            onPressed: () {
              print("Activity Center pressed");
            },
            child: Text("Activity Center"),
          ),

        ],
      ),
    );
  }
}
*/

