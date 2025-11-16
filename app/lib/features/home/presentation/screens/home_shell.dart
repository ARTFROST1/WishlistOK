import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends StatefulWidget {
  final Widget child;
  
  const HomeShell({super.key, required this.child});

  @override
  State<HomeShell> createState() => _HomeShellState();
}

class _HomeShellState extends State<HomeShell> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/feed');
        break;
      case 2:
        context.go('/add');
        break;
      case 3:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Update selected index based on current location
    final location = GoRouterState.of(context).uri.path;
    if (location == '/') {
      _selectedIndex = 0;
    } else if (location.startsWith('/feed')) {
      _selectedIndex = 1;
    } else if (location.startsWith('/add')) {
      _selectedIndex = 2;
    } else if (location.startsWith('/profile')) {
      _selectedIndex = 3;
    }

    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_outlined),
            activeIcon: Icon(Icons.list_alt),
            label: 'Lists',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore_outlined),
            activeIcon: Icon(Icons.explore),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            activeIcon: Icon(Icons.add_circle),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
