import 'package:flutter/material.dart';
import '../widgets/app_draw.dart';
import '../screens/categorie_screen.dart';
import '../screens/favorite_screen.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _screen = [
    {
      'Screen': CategorieScreen(),
      'Title': 'تصنيفات الرحلات',
    },
    {
      'Screen': FavoriteScreen(),
      'Title': 'الرحلات المفضلة',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screen[_selectedScreenIndex]['Title'] as String,
          style:
              TextStyle(fontSize: 25, color: Colors.white, fontFamily: 'Amiri'),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      drawer: AppDraw(),
      body: _screen[_selectedScreenIndex]['Screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Colors.yellow,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          )
        ],
      ),
    );
  }
}
