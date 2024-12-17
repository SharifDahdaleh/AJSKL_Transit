import 'package:flutter/material.dart';

// sources for text input fields
// https://api.flutter.dev/flutter/material/TextField-class.html
// https://www.flutterbeads.com/flutter-textfield-widget-complete-guide/

// dropdown menus (https://api.flutter.dev/flutter/material/DropdownButton-class.html)
// https://flutter.dev/docs/cookbook/forms/dropdown

// gesture detector was also used at the end here
// https://api.flutter.dev/flutter/widgets/GestureDetector-class.html
// https://flutter.dev/docs/cookbook/gestures

class FavLocationClicked extends StatefulWidget {
  @override
  _FavLocationClickedState createState() => _FavLocationClickedState();
}

class _FavLocationClickedState extends State<FavLocationClicked> {
  String selectedTime = "Leave Now"; // Default dropdown value
  TextEditingController sourceController =
  TextEditingController(text: "Current Location");
  TextEditingController destinationController =
  TextEditingController(text: "Benedum Hall");

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
        title: Row(
          children: [
            Expanded(
              child: Text(
                "Routes",
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              icon: Icon(Icons.swap_vert, color: Colors.white),
              onPressed: () {
                // Swap the text fields
                setState(() {
                  String temp = sourceController.text;
                  sourceController.text = destinationController.text;
                  destinationController.text = temp;
                });
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            // Input fields for source and destination
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: sourceController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: "Source",
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(Icons.arrow_forward, color: Color(0xFF30B665)),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: destinationController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: "Destination",
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Dropdown and action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: selectedTime,
                  items: [
                    DropdownMenuItem(value: "Leave Now", child: Text("Leave Now")),
                    DropdownMenuItem(value: "In 10 Minutes", child: Text("In 10 Minutes")),
                    DropdownMenuItem(value: "In 15 Minutes", child: Text("In 15 Minutes")),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedTime = value!;
                    });
                  },
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  dropdownColor: Colors.white,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.refresh, color: Color(0xFF30B665)),
                      onPressed: () {
                        // Refresh action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.accessible, color: Color(0xFF30B665)),
                      onPressed: () {
                        // Accessibility action
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.mic, color: Color(0xFF30B665)),
                      onPressed: () {
                        // Microphone action
                      },
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),

            // Timeline routes with headers
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "ETA",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Bus Line",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
                Divider(thickness: 1),
                _buildRouteRow(context, "4:00 PM", "61B"),
                _buildRouteRow(context, "4:15 PM", "83"),
                _buildRouteRow(context, "4:30 PM", "67"),
                _buildRouteRow(context, "4:45 PM", "P3"),
              ],
            ),

            // Other options
            SizedBox(height: 20),
            Text(
              "Other Options",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildOtherOption("Uber", Colors.black),
            _buildOtherOption("Lyft", Colors.pink),
            _buildOtherOption("Walk", Colors.grey),
            _buildOtherOption("POGOH", Color(0xFF103A64)),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteRow(BuildContext context, String time, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              time,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Expanded(
            flex: 3,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/clickedOnLocation');
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color(0xFF30B665),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  route,
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOtherOption(String title, Color color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}