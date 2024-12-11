import 'package:flutter/material.dart';

void main() {
  runApp(AdminDashboardApp());
}

class AdminDashboardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 1; // Default to Home Tab

  final List<Widget> _pages = [
    Center(child: Text('Attendance Stats Page')), // Placeholder for Attendance Stats
    HomeScreen(),
    Center(child: Text('Manual Attendance Page')), // Placeholder for Manual Attendance
    Center(child: Text('More Options Page')), // Placeholder for More Options
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      drawer: NavigationDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
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
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, Aman',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Manager Name: Aman Singhania'),
                    Text('Employee ID: MDH4576'),
                    Text('Branch Name: Pune'),
                    Text('Mobile No.: 9900xxxxxx'),
                    Text('Email ID: aman.s@qubenav.in'),
                    Text('Address: Shivajinagar, Pune'),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('6/12/2024'),
                        Text('Check In: 9:00'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Check Out:'),
                        Text('-'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            GridView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              children: [
                _buildStatCard('Employees Checked In', '147', '12% from yesterday'),
                _buildStatCard('Working Offsite', '23', '4 locations'),
                _buildStatCard('Late Check-ins', '8', 'Avg. 15 mins late'),
                _buildStatCard('Working Hours Today', '892', 'Total team hours'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String subtitle) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'QubeNav',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('My Attendance'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Monthly Stats'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text('Manage Employees'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text('Employee Attendance'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeAttendancePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Branch Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.report),
            title: Text('Reports'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.privacy_tip),
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class EmployeeAttendancePage extends StatefulWidget {
  @override
  _EmployeeAttendancePageState createState() => _EmployeeAttendancePageState();
}

class _EmployeeAttendancePageState extends State<EmployeeAttendancePage> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> employees = [
    {'name': 'Mr.Angelo', 'checkIn': '9:00 AM', 'status': 'On Time'},
    {'name': 'Max Payne', 'checkIn': '9:15 AM', 'status': 'Late'},
    {'name': 'Arthur Morgan', 'checkIn': '8:45 AM', 'status': 'On Time'},
    {'name': 'Arushi Pragya', 'checkIn': '9:30 AM', 'status': 'Late'},
    {'name': 'Pranali Habib', 'checkIn': '9:15 AM', 'status': 'Late'},
    {'name': 'Harshada Borse', 'checkIn': '9:45 AM', 'status': 'Late'},
    {'name': 'Ojas Deshpande', 'checkIn': '9:30 AM', 'status': 'Late'},
    {'name': 'Sarvesh Deshmukh', 'checkIn': '9:00 AM', 'status': 'On Time'},
    {'name': 'Megh Gaidhani', 'checkIn': '9:15 AM', 'status': 'Late'},

  ];
  late List<Map<String, String>> filteredEmployees;

  @override
  void initState() {
    super.initState();
    filteredEmployees = List.from(employees);
  }

  void _filterEmployees(String query) {
    setState(() {
      filteredEmployees = employees
          .where((employee) => employee['name']!
          .toLowerCase()
          .contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Attendance'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Employee',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _filterEmployees,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEmployees.length,
              itemBuilder: (context, index) {
                final employee = filteredEmployees[index];
                return _buildEmployeeCard(
                  employee['name']!,
                  employee['checkIn']!,
                  employee['status']!,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmployeeCard(String name, String checkIn, String status) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(bottom: 16.0, left: 16.0, right: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(checkIn),
            Text(status),
          ],
        ),
      ),
    );
  }
}