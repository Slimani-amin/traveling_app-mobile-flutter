import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class AppDraw extends StatelessWidget {
  const AppDraw({super.key});

  Widget buldListTile(String title, IconData icon, VoidCallback onTapLink) {
    return ListTile(
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(title,
          style: TextStyle(
            fontSize: 24,
            fontFamily: 'ElMessiri',
            fontWeight: FontWeight.bold,
          )),
      onTap: onTapLink,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.only(top: 40),
            alignment: Alignment.center,
            color: Colors.yellow,
            child: Text('دليلك السياحي',
                style: Theme.of(context).textTheme.headlineMedium),
          ),
          SizedBox(height: 20),
          buldListTile('الرحلات', Icons.card_travel, () {
            Navigator.pushReplacementNamed(context, '/');
          }),
          buldListTile('الفلترة', Icons.filter, () {
            Navigator.pushReplacementNamed(context, FiltersScreen.ScreenRoute);
          })
        ],
      ),
    );
  }
}
