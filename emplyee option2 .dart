import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MonthlyStatsScreen(),
    );
  }
}

class MonthlyStatsScreen extends StatefulWidget {
  @override
  _MonthlyStatsScreenState createState() => _MonthlyStatsScreenState();
}

class _MonthlyStatsScreenState extends State<MonthlyStatsScreen> {
  String selectedMonth = 'January';
  final months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'October', 'November', 'December'
  ];

  int _currentIndex = 1;

  int _selectedDay = 0; // Initialize with default value (e.g., 0 or the first day of the month)
  bool _showAttendanceDetails = false;

  List<DateTime> _generateDaysInMonth(DateTime month) {
    final lastDay = DateTime(month.year, month.month + 1, 0);
    return List.generate(
        lastDay.day, (index) => DateTime(month.year, month.month, index + 1));
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _generateDaysInMonth(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text("Monthly Stats", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey[100],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop(); // This line makes the back button work
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Working Hours",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatCard(title: "My Total Hours", value: "42.5", subtitle: "This month"),
                _StatCard(title: "My Daily Average", value: "8.5", subtitle: "+5.2% vs last month"),
                _StatCard(title: "My Overtime", value: "4.0", subtitle: "This month"),
              ],
            ),
            SizedBox(height: 24),
            Text(
              "Select Month",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            DropdownButton<String>(
              value: selectedMonth,
              items: months.map((String month) {
                return DropdownMenuItem<String>(value: month, child: Text(month));
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedMonth = newValue!;
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              "This Month",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 16),
            Expanded(
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: 12,
                  barGroups: [
                    _buildBarData(0, 8 + 2),
                    _buildBarData(1, 7 + 1),
                    _buildBarData(2, 9 + 3),
                    _buildBarData(3, 8 + 2),
                    _buildBarData(4, 7.5 + 1.5),
                    _buildBarData(5, 6 + 0),
                    _buildBarData(6, 8 + 1),
                  ],
                  borderData: FlBorderData(show: false),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('Mon');
                            case 1:
                              return Text('Tue');
                            case 2:
                              return Text('Wed');
                            case 3:
                              return Text('Thu');
                            case 4:
                              return Text('Fri');
                            case 5:
                              return Text('Sat');
                            case 6:
                              return Text('Sun');
                            default:
                              return Text('');
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        backgroundColor: Colors.white,
        elevation: 10,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
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

  BarChartGroupData _buildBarData(int x, double totalHours) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: totalHours, color: Colors.blue, width: 12),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  _StatCard({required this.title, required this.value, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}
