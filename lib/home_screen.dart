import 'package:flutter/material.dart';
import 'package:joy_p/event_calendar.dart';
import 'package:joy_p/navigation_button.dart';
import 'package:joy_p/main.dart';

//HomeScreen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _mainContents = [
    Container(
      alignment: Alignment.center,
      child: const NavigationButton(
          displayLabel: "Create Event",
          iconType: Icons.event,
          screenWidget: EventClendar()),
    ),
    Container(
      decoration: const BoxDecoration(
          gradient: RadialGradient(colors: [
        Color.fromARGB(255, 146, 145, 145),
        Color.fromARGB(255, 192, 190, 190),
        Color.fromARGB(255, 223, 221, 221),
      ], center: Alignment.center, radius: 1)),
      alignment: Alignment.center,
      child: const Text(
        'Lobby',
        style: TextStyle(fontSize: 40, color: Colors.white),
      ),
    ),
    // Content for Settings tab
    Container(
      alignment: Alignment.center,
      child: const NavigationButton(
          displayLabel: "Logout",
          iconType: Icons.logout,
          screenWidget: MyApp()),
    ),
  ];

  // The index of the selected tab
  // In the beginning, the Home tab is selected
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 140, 61, 185),
        title: const Text(
          'JoyP',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'CaveatBold',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      // Show the bottom tab bar if screen width < 640
      bottomNavigationBar: MediaQuery.of(context).size.width < 640
          ? BottomNavigationBar(
              currentIndex: _selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Color.fromARGB(255, 140, 61, 185),
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
                  //BottomNavigationBarItem(
                  //    icon: Icon(Icons.event), label: 'Events'),
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
                color: Color.fromARGB(255, 140, 61, 185),
              ),
              selectedIconTheme: const IconThemeData(
                  size: 30, color: Color.fromARGB(255, 140, 61, 185)),

              unselectedLabelTextStyle: const TextStyle(),
              // navigation rail items
              destinations: const [
                NavigationRailDestination(
                    icon: Icon(Icons.home), label: Text('Home')),
                //NavigationRailDestination(
                //    icon: Icon(Icons.event), label: Text('Events')),
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
