import 'package:adhicine_project/feature/centre_button/add_button_page.dart';
import 'package:adhicine_project/feature/home/views/homepage.dart';
import 'package:adhicine_project/feature/report/views/reportpage.dart';
import 'package:flutter/material.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({super.key});

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [HomePage(), const ReportPage()];

  void _onItemTapped(int index) {
    if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AddButtonPage()),
      );
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomNavbar(
        selectedIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class CustomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomNavbar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: BottomNavBarClipper(),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 1,
                  spreadRadius: 2,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildNavItem(Icons.home, "Home", 0),
                SizedBox(width: 80),
                _buildNavItem(Icons.bar_chart, "Report", 1),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          child: GestureDetector(
            onTap: () => onItemTapped(2),
            child: Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 2,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Center(
                child: Icon(Icons.add, color: Colors.white, size: 32),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 28,
            color:
                selectedIndex == index
                    ? Color.fromARGB(255, 115, 134, 242)
                    : Colors.grey,
          ),
          Text(
            label,
            style: TextStyle(
              color:
                  selectedIndex == index
                      ? Color.fromARGB(255, 115, 134, 242)
                      : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    double cutoutRadius = 30;
    double cutoutWidth = 70;

    Path path =
        Path()
          ..lineTo((width / 2) - (cutoutWidth / 2), 0)
          ..arcToPoint(
            Offset((width / 2) + (cutoutWidth / 2), 0),
            radius: Radius.circular(cutoutRadius),
            clockwise: false,
          )
          ..lineTo(width, 0)
          ..lineTo(width, height)
          ..lineTo(0, height)
          ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
