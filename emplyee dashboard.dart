import 'package:flutter/material.dart';
import 'attendance_screen.dart';  // Import the attendance screen page
import 'monthly_stats.dart';  // Import the monthly stats screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 1; // To track the selected tab index

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    // Handle navigation for the bottom navigation bar
    if (index == 0) {
      // Dummy navigation, just stay in the current page for now
      Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
    } else if (index == 2) {
      // Dummy navigation, just stay in the current page for now
      Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
    } else if (index == 3) {
      // Dummy navigation, just stay in the current page for now
      Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
    } else if (index == 1) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => AttendanceScreen())); // Navigate to AttendanceScreen
    } else if (index == 4) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => MonthlyStatsScreen())); // Navigate to MonthlyStatsScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue.shade900),
              child: Text(
                'QubeNav',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text('Attendance'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => AttendanceScreen())); // Navigate here
              },
            ),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text('Assigned Task'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Monthly Stats'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => MonthlyStatsScreen())); // Navigate to MonthlyStatsScreen
              },
            ),
            ListTile(
              leading: Icon(Icons.check_circle),
              title: Text('Manual Attendance'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page),
              title: Text('Request Leave'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text('Privacy Policy'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text('Help'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => DummyPage()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Light background color
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Harshada',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
              SizedBox(height: 16),
              buildInfoCard(),
              SizedBox(height: 16),
              buildAttendanceCard(),
              SizedBox(height: 16),
              buildOffsiteWorkCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Attendance Stats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Manual Attendance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
      ),
    );
  }

  Widget buildInfoCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 30, color: Colors.white),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Employee Name: Harshada Borse',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Employee ID: EDH4576'),
                  Text('Branch name: Pune'),
                  Text('Mobile No.: 99999xxxxx'),
                  Text('Email ID: harshada@qubenav.com'),
                  Text('Address: Shivajinagar, Pune'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAttendanceCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '6/12/2024',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.login, color: Colors.green),
                    SizedBox(width: 8),
                    Text('Check in: 9:00'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.logout, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Check out: -'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildOffsiteWorkCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Offsite Work',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 8),
            Text('Location: Delhi'),
            Text('Dates: 20/12/2024 - 24/12/2024'),
          ],
        ),
      ),
    );
  }
}

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dummy Page"),
      ),
      body: Center(
        child: Text("This is a dummy page."),
      ),
    );
  }
}
