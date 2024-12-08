import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Code for the header with back button and title
          Container(
            color: Color(0xFF30B665),
            padding: EdgeInsets.only(top: 40, bottom: 20, left: 10, right: 10),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                SizedBox(width: 10),
                Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Settings list
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                // Account Section
                _buildSectionHeader("Account", Icons.person),
                _buildListTile("Personal Information"),
                _buildListTileWithNavigation(
                  context,
                  "My Tickets",
                      () => Navigator.pushNamed(context, '/myTickets'),
                ),
                _buildListTile("Notifications"),
                _buildListTile("Activity Center"),
                Divider(),

                // Security & Permissions Section
                _buildSectionHeader("Security & Permissions", Icons.lock),
                _buildListTile("Security Alerts"),
                _buildListTile("Manage Device"),
                _buildListTile("Apps and Services Permissions"),
                Divider(),

                // Content & Display Section
                _buildSectionHeader("Content & Display", Icons.settings_display),
                _buildListTile("Accessibility"),
                _buildListTile("Language"),
                _buildListTile("Ads"),
                _buildListTile("Dark Mode"),
                Divider(),

                // Help & Support Section
                _buildSectionHeader("Help & Support", Icons.help),
                _buildListTile("Contact Us & Feedback"),
                _buildListTile("About"),
                _buildListTile("Report"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // function to build section headers
  Widget _buildSectionHeader(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF30B665)),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF30B665),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  // function to build the individual list tiles
  Widget _buildListTile(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
      ),
    );
  }

  // function to build list tiles with navigation
  Widget _buildListTileWithNavigation(
      BuildContext context, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
