import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Current selected index

  String fruit = 'apple';

  @override
  void initState() {
    super.initState();
    print(fruit);
  }

  // List of pages (replace these with your actual widgets)
  final List<Widget> _pages = [
    Center(child: Text('Home', style: TextStyle(fontSize: 22))),
    Center(child: Text('Search', style: TextStyle(fontSize: 22))),
    Center(child: Text('Back', style: TextStyle(fontSize: 22))),
  ];

  // Function to handle navigation
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Page',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // wrap content vertically
          children: [
            Text(
              'Fruit: $fruit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                print('Button pressed!');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$fruit')),
                );
              },
              child: const Text('Click Me!'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Current selected index
        onTap: _onItemTapped, // Function to handle navigation
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back_outlined),
            label: 'Back',
          ),
        ],
        selectedItemColor: Colors.purple, // Active item color
        unselectedItemColor: Colors.grey, // Inactive item color
        showUnselectedLabels: true, // Show labels for unselected items
      ),
    );
  }
}
