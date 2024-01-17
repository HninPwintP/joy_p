import 'package:flutter/material.dart';
import 'package:joy_p/event_calendar.dart';
import 'package:joy_p/navigation_button.dart';
import 'package:joy_p/index_screen.dart';

//HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _mainContents = [
    Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      alignment: Alignment.center,
      child: const Text(
        'Home',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    ),
    Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      alignment: Alignment.center,
      child: const EventClendar(),
    ),
    // Content for Favorites tab
    Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      alignment: Alignment.center,
      child: const Text(
        'Lobby',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    ),
    // Content for Settings tab
    Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      alignment: Alignment.center,
      child: const NavigationButton(displayLabel: "Logout", iconType: Icons.logout, screenWidget: IndexScreen()),
    ),
  ];

  // The index of the selected tab
  // In the beginning, the Home tab is selected
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JoyP'),
        automaticallyImplyLeading: false,
      ),
      // Show the bottom tab bar if screen width < 640
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.lightGreen,
              // called when one tab is selected
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              // bottom tab items
              items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.event), label: 'Events'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.group), label: 'Lobby'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: 'Settings'),
                ])
          : null,
      body: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Show the navigaiton rail if screen width >= 640
          if (MediaQuery.of(context).size.width >= 640)
            NavigationRail(
              minWidth: 55.0,
              selectedIndex: _selectedIndex,
              // Called when one tab is selected
              onDestinationSelected: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              labelType: NavigationRailLabelType.all,
              selectedLabelTextStyle: const TextStyle(
                color: Colors.blueGrey,
              ),
              leading: Column(
                children: const [
                  SizedBox(
                    height: 8,
                  ),
                  CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person),
                  ),
                ],
              ),
              unselectedLabelTextStyle: const TextStyle(),
              // navigation rail items
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                NavigationRailDestination(
                    icon: Icon(Icons.event), label: Text('Events')),
                NavigationRailDestination(
                    icon: Icon(Icons.group), label: Text('Lobby')),
                NavigationRailDestination(
                    icon: Icon(Icons.settings), label: Text('Settings')),
              ],
            ),

          // Main content
          // This part is always shown
          // You will see it on both small and wide screen
          Expanded(child: _mainContents[_selectedIndex]),
        ],
      ),
    );
  }
}
